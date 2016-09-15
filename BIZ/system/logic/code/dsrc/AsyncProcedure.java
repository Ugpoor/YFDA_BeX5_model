import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.justep.common.SystemUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;


public class AsyncProcedure {
	public static void unRegisterTerminal(String type, String terminalID, String personID, String protocol){
		Map<String, Object> params = new HashMap<String, Object>();
		if (SystemUtils.isEmptyString(type))
			type = "mobile";
		if (SystemUtils.isEmptyString(terminalID))
			terminalID = "";	
		if (SystemUtils.isEmptyString(personID))
			personID = ContextHelper.getOperator().getID();
		if (SystemUtils.isEmptyString(protocol))
			protocol = "mqtt";

		String ksql = "delete from SA_Terminal t where t.sTypeID=:type " +
				"and t.sAccountNumber=:terminalID and t.sPersonID=:personID and t.sProtocol=:protocol";
		KSQL.executeUpdate(ksql, params, "/system/data", null);
	}
	
	
	public static void registerTerminal(String type, String terminalID, String personID, String protocol){
		if (SystemUtils.isEmptyString(type))
			type = "mobile";

		Map<String, Object> params = new HashMap<String, Object>();
		if (SystemUtils.isEmptyString(terminalID))
			terminalID = "";	
		if (SystemUtils.isEmptyString(personID))
			personID = ContextHelper.getOperator().getID();
		if (SystemUtils.isEmptyString(protocol))
			protocol = "mqtt";
		
		params.put("type", type);
		params.put("terminalID", terminalID);
		params.put("personID", personID);
		params.put("protocol", protocol);
	
		if (type.equals("mobile")){
			//删除当前设备关联的非当前用户
			String delete = "delete from SA_Terminal t where (t.sTypeID=:type " +
					"and t.sAccountNumber=:terminalID and t.sPersonID<>:personID)";
			
			//删除当前用户的其它设备
			delete += " or (t.sTypeID=:type and t.sPersonID=:personID and t.sAccountNumber<>:terminalID)";
			
			KSQL.executeUpdate(delete, params, "/system/data", null);
		}
		
		String query = "select t.sValidState from SA_Terminal t where t.sTypeID=:type " +
				"and t.sAccountNumber=:terminalID and t.sPersonID=:personID and t.sProtocol=:protocol";
		Table t = KSQL.select(query, params, "/system/data", null);
		Iterator<Row> it = t.iterator();
		if (it.hasNext()){
			Row r = it.next();
			int valid = r.getInt("sValidState");
			if (valid != 1){
				String ksql = "update SA_Terminal t set t.sValidState=1 where t.sTypeID=:type " +
				"and t.sAccountNumber=:terminalID and t.sPersonID=:personID and sProtocol=:protocol";
				KSQL.executeUpdate(ksql, params, "/system/data", null);
			}
		}else{
			String ksql = "insert into SA_Terminal t (t, t.sValidState, t.sTypeID, t.sAccountNumber, t.sPersonID, t.version, t.sIsDefault," +
					"t.sProtocol, t.sTypeName) values (:id, 1, :type, :terminalID, :personID, 0, 1, :protocol, :type)";
			params.put("id", CommonUtils.createGUID());
			KSQL.executeUpdate(ksql, params, "/system/data", null);
		}
	}
	/**
	 * 
	 * 	Map<String, Map<String, Object>>
	 * 		第一个Map的key: personID,
	 * 		第二个Map: 
	 * 			key="fids", value=List<String>
	 * 			key="terminals", value=List<Map<String, String>>
	 * 		第三个Map:
	 * 			key="sIsDefault", value=Boolean
	 * 			key="sTypeID", value=String, 值mobile, pad
	 * 			key="sAccountNumber" value=String
	 * 			key="sProtocol" value=String 
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Map<String, Object>> queryOrgInfoForPushManager(){
		Map<String, Map<String, Object>> result = new HashMap<String, Map<String, Object>>();
		String query = "select o.sFID, o.sPersonID from SA_OPOrg o where o.sValidState=1 and o.sOrgKindID='psm'";
		Table t = KSQL.select(query, new HashMap<String, Object>(), "/system/data", null);
		Iterator<Row> it = t.iterator();
		while (it.hasNext()){
			Row r = it.next();
			String fid = r.getString("sFID");
			String personID = r.getString("sPersonID");
			Map<String, Object> info = result.get(personID);
			if (info == null){
				info = new HashMap<String, Object>();
				result.put(personID, info);
			}
			
			List<String> fids = (List<String>)info.get("fids");
			if (fids == null){
				fids = new ArrayList<String>();
				info.put("fids", fids);
			}
			if (!fids.contains(fid)){
				fids.add(fid);	
			}
		}
		
		query = "select t.sPersonID, t.sTypeID, t.sAccountNumber, t.sProtocol, t.sIsDefault from SA_Terminal t where t.sValidState=1";
		t = KSQL.select(query, new HashMap<String, Object>(), "/system/data", null);
		it = t.iterator();
		while (it.hasNext()){
			Row r = it.next();
			String personID = r.getString("sPersonID");
			if (result.containsKey(personID)){
				Map<String, Object> info = result.get(personID);
				List<Map<String, Object>> terminals = (List<Map<String, Object>>)info.get("terminals");
				if (terminals == null){
					terminals = new ArrayList<Map<String, Object>>();
					info.put("terminals", terminals);
				}
				
				Map<String, Object> item = new HashMap<String, Object>();
				terminals.add(item);
				
				boolean isDefault = ((Integer)r.getValue("sIsDefault") == 1);
				item.put("sIsDefault", isDefault);
				String typeID = r.getString("sTypeID");
				if (typeID == null){
					typeID = "";
				}
				item.put("sTypeID", typeID);
				String accountNumber = r.getString("sAccountNumber");
				if (accountNumber == null){
					accountNumber = "";
				}
				item.put("sAccountNumber", accountNumber);
				String protocol = r.getString("sProtocol");
				if (protocol == null){
					protocol = "";
				}
				item.put("sProtocol", protocol);
			}
		}
		return result;
	}

}
