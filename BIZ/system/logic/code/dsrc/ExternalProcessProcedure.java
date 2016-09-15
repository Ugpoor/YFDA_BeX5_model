import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.justep.common.SystemUtils;
import com.justep.message.CommonMessages;
import com.justep.model.BackRule;
import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessUtils;
import com.justep.util.Utils;


public class ExternalProcessProcedure {
	public static ProcessControl startProcessQuery(String processFullName, Map<String, Object> relations, List<String> tokens, String executor, String creator){
		return ProcessUtils.startProcessQuery(processFullName, relations, tokens, executor, creator);
	}
	
	public static List<Map<String, String>> startProcess(String processFullName, Map<String, Object> relations, ProcessControl control, List<String> tokens, String executor, String creator) {
		return ProcessUtils.startProcess(processFullName, relations, control, tokens, executor, creator);
	}
	
	
	public static ProcessControl advanceProcessQuery(String task) {
		return ProcessUtils.advanceProcessQuery(task);
	}
	
	public static void advanceProcess(String task, ProcessControl control) {
		ProcessUtils.advanceProcess(task, control);
	}
	
	public static ProcessControl backProcessQuery(String task, String backRange) {
		if (SystemUtils.isNotEmptyString(backRange)){
			ContextHelper.getRequestContext().put(BackRule.BACK_RANGE, backRange);
		}
		return ProcessUtils.backProcessQuery(task);
	}
	
	public static void backProcess(String task, ProcessControl control) {
		ProcessUtils.backProcess(task, control);
	}
	
	public static ProcessControl abortProcessQuery(String task) {
		return ProcessUtils.abortProcessQuery(task);
	}
		
	public static void abortProcess(String task, ProcessControl control) {
		ProcessUtils.abortProcess(task, control);
	}

	public static ProcessControl suspendProcessQuery(String task) {
		return ProcessUtils.suspendProcessQuery(task);
	}
	
	public static void suspendProcess(String task, ProcessControl control) {
		ProcessUtils.suspendProcess(task, control);
	}

	public static ProcessControl transferTaskQuery(String task) {
		return ProcessUtils.transferTaskQuery(task);
	}
		
	public static void transferTask(String task, ProcessControl control) {
		ProcessUtils.transferTask(task, control);
	}
	
	public static ProcessControl specialProcessQuery(String task){
		return ProcessUtils.specialProcessQuery(task);
	}
	
	public static void specialProcess(String task , ProcessControl control){
		ProcessUtils.specialProcess(task, control);
	}

	public static void finishProcess(String task) {
		ProcessUtils.finishProcess(task);
	}
	
	public static void resumeProcess(String task) {
		ProcessUtils.resumeProcess(task);
	}
	
	public static void startCustomizedProcess(String task, String template) {
		ProcessUtils.startCustomizedProcess(task, template);
	}
	
	public static void cancelCustomizedProcess(String task){
		ProcessUtils.cancelCustomizedProcess(task);
	}
	
	public static Map<String, String> startCustomizedProcessQuery(String task){
		return ProcessUtils.startCustomizedProcessQuery(task);
	}
	
	public static void withdrawTask(String task){
		Utils.check(Utils.isNotEmptyString(task), CommonMessages.class, CommonMessages.PARAM_NULL1, "task");
		/*
		Set<String> names = new HashSet<String>();
		names.add("sProcess");
		names.add("sActivity");
		names.add("sCreatorFID");
		Map<String, Object> items = getTaskProperties(task, names);
		String process = (String)items.get("sProcess");
		if (Utils.isEmptyString(process)){
			throw new RuntimeException("任务“" + task + "“关联的流程不允许为空！");
		}
		String activity = (String)items.get("sActivity");
		if (Utils.isEmptyString(activity)){
			throw new RuntimeException("任务“" + task + "“关联的环节不允许为空！");
		}
		String executor = (String)items.get("sCreatorFID");
		*/
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("task", task);
		String process = ContextHelper.getActionContext().getProcess().getFullName();
		String activity = ContextHelper.getActionContext().getActivity().getName();
		String executor = ContextHelper.getActionContext().getExecutor();
		ActionUtils.invokeAction(process, activity, "withdrawTaskAction", executor, params);
	}
	
	/*
	private static Map<String, Object> getTaskProperties(String task, Set<String> names){
		Map<String, Object> result = new HashMap<String, Object>();
		if (Utils.isEmptyString(task) || (names==null) || names.isEmpty()){
			return result;
		}
		
		String columns = "";
		for (String name : names){
			if (Utils.isNotEmptyString(columns)){
				columns += ",";
			}
			
			columns += "t." + name;
		}
		String query = "select " + columns + " from SA_Task t where t='" + task + "'";
		Table table = KSQL.select(query, new HashMap<String, Object>(), ProcessUtils.CORE_MODEL, null);
		if (table.iterator().hasNext()) {
			Row r = table.iterator().next();
			for (String name : names){
				result.put(name, r.getValue(name));
			}
		}else{
			String message = "任务“" + task + "“不存在！";
			ModelException e = new ModelException(message);
			throw e;
		}
		
		return result;
	}
	*/
	
}
