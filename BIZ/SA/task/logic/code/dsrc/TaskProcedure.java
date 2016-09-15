import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.justep.common.SystemUtils;
import com.justep.message.SystemMessages;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.Table;
import com.justep.system.process.TaskStatus;
import com.justep.system.util.BizSystemException;
import com.justep.util.Utils;


public class TaskProcedure {
	private static final String WAITING = "waiting";
	private static final String FINISHED = "finished";
	private static final String SUBMITED = "submited";
	
	public static Table taskQuery(String concept, String idColumn, String select, String from, String condition, List<DataPermission> range,
			String filter, Boolean distinct, int offset, int limit, String columns, String orderBy, String aggregate, String aggregateColumns,
			Map<String, Object> variables, String dataModel, String fnModel, String status, String org) {
		if (variables == null){
			variables = new HashMap<String, Object>();
		}
		String alias = concept;//from.substring(from.indexOf(" "));
		String customFilter = getCustomFilter(alias, status, org, concept, variables);
		if (Utils.isNotEmptyString(filter)){
			filter = "(" + filter + ") and (" + customFilter + ")";
		}else{
			filter = customFilter;
		}
		
		return BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
	}
	
	private static String getCustomFilter(String alias, String status, String org, String concept, Map<String, Object> vars){
		if (Utils.isEmptyString(status)){
			if ("SA_Task".equals(concept)){
				status = WAITING;	
			}else{
				status = WAITING + " " + SUBMITED + " " + FINISHED;
			}
			
		}
		
		/*
		if (status.contains(WAITING) && status.contains(SUBMITED)){
			//同时有待办和提交时, 只有待办生效
			status = status.replace(SUBMITED, "");
		}
		*/
		
		if (Utils.isEmptyString(org)){
			org = ContextHelper.getPerson().getID();
		}

				
		String result = "";
		if (status.contains(WAITING) || status.contains(FINISHED)){
			String waitingCondition = "(" + alias + ".sStatusID='" + TaskStatus.READY + "'" +
					" or " + alias + ".sStatusID='" + TaskStatus.EXECUTING + "')";
			
			String finishedCondition = "(" + alias + ".sStatusID='" + TaskStatus.FINISHED + "'" +
				" or " + alias + ".sStatusID='" + TaskStatus.RETURNED + "'" +
				" or " + alias + ".sStatusID='" + TaskStatus.ABORTED + "'" +
				" or " + alias + ".sStatusID='" + TaskStatus.TRANSMITED + "'" +
				" or " + alias + ".sStatusID='" + TaskStatus.CANCELED + "')";
			String executorCondition = getExecutorCondition(alias, org, concept.equals("SA_Task"), vars);
			if (SystemUtils.isNotEmptyString(result)) result += " or ";
			if (status.contains(WAITING) &&  !status.contains(FINISHED)){
				result += executorCondition + " and " + waitingCondition;
			}else if (!status.contains(WAITING) &&  status.contains(FINISHED)){
				result += executorCondition + " and " + finishedCondition;
			}else{
				result += executorCondition;
			}
		}
		
		
		if (status.contains(SUBMITED)){
			String creatorCondition = getCreatorCondition(alias, org, concept.equals("SA_Task"), vars);
			if (SystemUtils.isNotEmptyString(creatorCondition)){
				if (SystemUtils.isNotEmptyString(result)) result += " or ";
				result += creatorCondition;
			}
		}
		
		return result;
	}
	
	
	private static String getCreatorCondition(String alias, String org, boolean useAgentProcess, Map<String, Object> vars){
		String result = "";
		int i= 0;
		for (String item : org.split(",")){
			i++;
			if (Utils.isNotEmptyString(item)){
				if (item.contains("/")){
					//是组织
					if (SystemUtils.isNotEmptyString(result)) result += " or ";
					String var = "__cfid" + i;
					vars.put(var, item + "%");
					result += alias + ".sCreatorFID like :" + var;
				}else{
					//是人
					if (item.equals(ContextHelper.getPerson().getID())){
						String condition = TaskUtils.getCreatorCondition(alias, ContextHelper.getPerson().getPersonMembers(), useAgentProcess, vars);
						if (SystemUtils.isNotEmptyString(condition)){
							if (SystemUtils.isNotEmptyString(result)) result += " or ";
							result += condition;
						}

					}else{
						throw BizSystemException.create(SystemMessages.ORG_ID_IS_CUR_PERSON_ID2, org, ContextHelper.getPerson().getID());
					}
				}
			}
		}
		
		if (useAgentProcess){
			result = "(" + result + ") and " + alias + ".sExecutorFID like '/%' ";
		}
		
		return result;
	}
	
	private static String getExecutorCondition(String alias, String org, boolean useAgentProcess, Map<String, Object> vars){
		String result = "";
		int i=0;
		for (String item : org.split(",")){
			i++;
			if (Utils.isNotEmptyString(item)){
				if (item.contains("/")){
					//组织
					if (SystemUtils.isNotEmptyString(result)) result += " or ";
					String var = "__efid" + i;
					vars.put(var, item + "%");
					
					result += alias + ".sExecutorFID like :" + var;
					
				}else{
					//是人
					if (item.equals(ContextHelper.getPerson().getID())){
						String condition = TaskUtils.getExecutorCondition(alias, ContextHelper.getPerson().getPersonMembers(), useAgentProcess, vars);
						if (SystemUtils.isNotEmptyString(condition)){
							if (SystemUtils.isNotEmptyString(result)) result += " or ";
							result += condition;
						}
						
					}else{
						throw BizSystemException.create(SystemMessages.ORG_ID_IS_CUR_PERSON_ID2, org, ContextHelper.getPerson().getID());
					}
				}
			}
		}
		
		return result;
	}

	
	

}
