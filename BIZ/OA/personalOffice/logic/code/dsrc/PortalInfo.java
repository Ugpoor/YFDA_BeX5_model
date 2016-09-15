import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.justep.system.action.ActionUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class PortalInfo {


	public static Map<String, Object> evectionPortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "出差管理");
		result.put("fProcess", "/OA/personalOffice/process/evection/evectionProcess");
		result.put("fActivity", "mainActivity");
		result.put("fCount", 0);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 1);
		params.put("offset", 0);
		params.put("variables", new HashMap<String, Object>());
			
		//查询最新数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/evection/evectionProcess", "mainActivity", 
				"queryOA_Evection1AllAction", "*", params);
			
		if(data.size() > 0 ){
			Row row = data.iterator().next();
			result.put("fContent", row.getString("fCreator") + "：" + row.getString("fName"));
			result.put("fDate", row.getDateTime("fLastModifyTime"));
			result.put("fTag", row.getString("fApprove"));
			//获得所有未读数
			String sNum = data.getProperties().get("MsgNum").toString();
			result.put("fCount", Integer.parseInt(sNum));
		}
		//计算所有待审批数
		params.put("limit", -1);
		data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/evection/evectionProcess", "mainActivity", 
				"queryOA_EvectionOpAction", "*", params);
			
		if(data.size() > 0 ){
			data.getMetaData().setKeyColumn("sGroupID");
		    Collection<Row> rows = data.getRows("A");
		    if(rows.size() > 0)
		    	result.put("fSubLabel", rows.size() + "条待审批");
		}
		return result;
	}

	public static Map<String, Object> schedulePortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "日程管理");
		result.put("fProcess", "/OA/personalOffice/process/schedule/scheduleProcess");
		result.put("fActivity", "mainActivity");
		result.put("fCount", 0);

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		//查询今天的一条数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/schedule/scheduleProcess", "mainActivity", 
				"queryOA_ScheduleMonthAction", "*", params);
			
		if(data.size() > 0 ){
			data.getMetaData().setKeyColumn("fScheDay");
			String sCurrDate = CommonUtils.dateFormat(CommonUtils.getCurrentDate(),"yyyy-MM-dd");
		    Collection<Row> rows = data.getRows(sCurrDate);
		    for (Row row : rows){
		    	if(row.getString("fIsTitle").equals("0")){
		    		String sTimePeriod = row.getString("fTimePeriod");
		    		String sDate;
		    		int iPos = sTimePeriod.indexOf("-");
		    		if(iPos == 4){//有日期，有时间
		    			sDate = sTimePeriod.substring(0,16);
						result.put("fDate", CommonUtils.toDateTime(sDate+":00"));
		    		}else if(iPos == 5){//只有时间
		    			sDate = row.getString("fScheDay") + " " + sTimePeriod.substring(0,5);
		    			//sDate = sTimePeriod.substring(0,iPos);
						result.put("fDate", CommonUtils.toDateTime(sDate+":00"));
		    		}
					result.put("fContent", row.getString("fName") + "：" + row.getString("fTimePeriod"));
					break;
		    	}
		    }
		}

		//计算所有未确认日程数
		String ksql = "select count(OA_Schedule) as sMessageNumber from OA_Schedule OA_Schedule join SA_Social SA_Social"
	    	+ " on OA_Schedule = SA_Social.sData1 and SA_Social.sValidState = '1' and SA_Social.sTypeID = 'RelativeOrg'"
	    	+ " and (SA_Social.sESField01 is null) and SA_Social.sPersonID = :currentPersonID()";
		Table numTable = KSQL.select(ksql, null, "/OA/personalOffice/data", null);
		if(numTable.size() > 0 ){
			Row row = numTable.iterator().next();
			if(row.getValue("sMessageNumber") != null){
				Object o = row.getValue("sMessageNumber");
				String s = o.toString();
				if(!s.equals("0"))
					result.put("fSubLabel", "有" + s + "个未确认日程");
			}
		}
		return result;
	}

	public static Map<String, Object> tasksAssignedPortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "工作交办");
		result.put("fProcess", "/OA/personalOffice/process/tasksAssigned/tasksAssignedProcess");
		result.put("fActivity", "mainActivity");

		HashMap<String, Object> params = new HashMap<String, Object>();
		//params.put("columns", "OA_Evection,OA_Evection.fCreator,OA_Evection.fName,OA_Evection.fApprove,SA_Social.sCreateTime");
		params.put("limit", 1);
		params.put("offset", 0);
		//params.put("orderBy", " OA_TasksAssigned.fLastModifyTime DESC");
		params.put("variables", new HashMap<String, Object>());
			
		//查询最新数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/tasksAssigned/tasksAssignedProcess", "mainActivity", 
				"queryOA_TasksAssignedAllAction", "*", params);
			
		if(data.size() > 0 ){
			Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
			Row row = data.iterator().next();
			result.put("fContent", row.getString("fName") + "：" + row.getString("fContent"));
			result.put("fDate", row.getDateTime("fLastModifyTime"));
		}
		
		//计算所有未完成数
		data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/tasksAssigned/tasksAssignedProcess", "mainActivity", 
				"queryOA_TasksAssignedOpAction", "*", params);
			
		if(data.size() > 0 ){
			Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
			result.put("fSubLabel", size + "条未完成");
		}
		
		//计算所有未读数
		String ksql = "select sum(SA_Social.sMessageNumber) as sMessageNumber from OA_TasksAssigned OA_TasksAssigned "
				+ " join (select  SA_Social.sData1, MIN(SA_Social.sGroupID) as sGroupID from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1) SA_SocialOne on OA_TasksAssigned = SA_SocialOne.sData1"
				+ " join SA_Social SA_Social on OA_TasksAssigned = SA_Social.sData1 AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = SA_SocialOne.sGroupID";
		Table numTable = KSQL.select(ksql, null, "/OA/personalOffice/data", null);
		if(numTable.size() > 0 ){
			Row row = numTable.iterator().next();
			if(row.getValue("sMessageNumber") == null)
				result.put("fCount", 0);
			else{
				Object o = row.getValue("sMessageNumber");
				String s = o.toString();
				result.put("fCount",  Integer.parseInt(s));
			}
		}
		return result;
	}

	public static Map<String, Object> leavePortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "请假管理");
		result.put("fProcess", "/OA/personalOffice/process/leaveApply/leaveApplyProcess");
		result.put("fActivity", "listActivity");
		result.put("fCount", 0);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 1);
		params.put("offset", 0);
		params.put("variables", new HashMap<String, Object>());
			
		//查询最新数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/leaveApply/leaveApplyProcess", "listActivity", 
				"queryOA_LeaveApply1AllAction", "*", params);
			
		if(data.size() > 0 ){
			Row row = data.iterator().next();
			result.put("fContent", row.getString("fCreator") + "：" + row.getString("fContent"));
			result.put("fDate", row.getDateTime("sCreateTime"));
			result.put("fTag", row.getString("fApprove"));
		}
		//计算所有待审批数
		data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/leaveApply/leaveApplyProcess", "listActivity", 
				"queryOA_LeaveApplyExAction", "*", params);
			
		if(data.size() > 0 ){
			Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
			result.put("fSubLabel", size + "条待审批");
		}
		return result;
	}
}