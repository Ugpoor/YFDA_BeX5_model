package com.justep.oa;

import java.util.HashMap;
import java.util.Iterator;

import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class OACommon {
	public static void updateSocial(Table table) {
	    String sProcess = ActionUtils.getRequestContext().getActionContext().getProcess().getFullName();
	    String sActivity = ActionUtils.getRequestContext().getActionContext().getActivity().getName();
	    String sPersonID = ContextHelper.getPerson().getID();

	    //新增记录时，需要把委托人信息写入社交信息表            
	    HashMap<String, Object> params = new HashMap<String, Object>();
	    params.put("sPersonID", sPersonID);
	    params.put("sPersonMemberID", ContextHelper.getPersonMember().getID());
	    params.put("sPersonName",ContextHelper.getPersonMember().getName());
	    params.put("sPersonFID",ContextHelper.getPersonMember().getFID()); 
	    params.put("sPersonFName",ContextHelper.getPersonMember().getFName()); 
	    params.put("sProcess",sProcess);
	    params.put("sActivity",sActivity);
	    params.put("sURL",ActionUtils.getRequestContext().getActionContext().getActivity().getFullName()+".a");
	    params.put("sCreateTime",CommonUtils.getCurrentDateTime());

	    String sConcept = (String)table.getProperties().get(Table.PROP_NAME_ROWID);
	    
	    Row row;    		
	    Iterator<Row> rows = table.iterator(com.justep.system.data.ModifyState.NEW );
	    while (rows.hasNext()){
	    	row = rows.next();
	    	String id = (String) row.getValue(sConcept);
	    	String ksql = "insert into SA_Social b "
          		+" (b,b.version,b.sData1,b.sName,b.sPersonID,b.sPersonName,b.sCreateTime,b.sProcess,b.sActivity,b.sURL,"
          		+" b.sOrgID,b.sOrgName,b.sOrgFID,b.sOrgFName,b.sCreatorID,b.sCreatorName,b.sCreatorFID,b.sCreatorFName,"
          		+" b.sGroupID,b.sGroupName,b.sTypeID,b.sTypeName,b.sMessageNumber,b.sActive,b.sValidState)"
	          	+" VALUES('"+com.justep.system.util.CommonUtils.createGUID()+"',0,'" + id + "','"+row.getValue("fName")
	          	+"',:sPersonID,:sPersonName,:sCreateTime,:sProcess,:sActivity,:sURL,"
	          	+":sPersonMemberID,:sPersonName,:sPersonFID,:sPersonFName,:sPersonID,:sPersonName,:sPersonFID,:sPersonFName,"
          		+"'C','委托人','RelativeOrg','相关人',0,0,1)";
	        KSQL.executeUpdate(ksql, params, "/system/data", null);
	    }        
	    //如果修改了记录，就调用增加其他人消息数action
	    rows = table.iterator(com.justep.system.data.ModifyState.EDIT );
	    while (rows.hasNext()){
	    	row = rows.next();
	    	String id = (String) row.getValue(sConcept);
	    	HashMap<String, Object> params2 = new HashMap<String, Object>();
	    	params2.put("data", id);
	    	ActionUtils.invokeAction(sProcess, sActivity, "updateMessageNumberAction", sPersonID, params2);
	    }        
	}

}