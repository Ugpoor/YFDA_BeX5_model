import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.common.SystemUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ActivityInstance;
import com.justep.system.process.ProcessInstance;
import com.justep.system.process.Task;
import com.justep.system.process.TaskDB;
import com.justep.system.process.TaskStatus;
import com.justep.util.Utils;


public class TaskGanttEngine {
	//{"tasks": [], "selectedRow":0,"canWrite":true,"canWriteOnParent":true}
	public static JSONObject getTaskGantt(String task){
		JSONObject result = new JSONObject();
		JSONArray tasks = new JSONArray();
		result.put("tasks", tasks);

		for (String flowTask : getFlowTasks(task)){
			processPI(flowTask, tasks);
		}
		
		result.put("selectedRow", 0);
		result.put("canWrite", false);
		result.put("canWriteOnParent", false);
		return result;
	}
	
	private static List<String> getFlowTasks(String task){
		List<String> result = new ArrayList<String>();
		if (SystemUtils.isEmptyString(task)){
			String query = "select t from SA_Task t where t.sKindID='tkProcessInstance' " +
					"and (t.sStatusID='" + TaskStatus.READY + "' or t.sStatusID='" + TaskStatus.EXECUTING + "' or t.sStatusID='" + TaskStatus.SLEEPING + "') order by t.sCreateTime desc";
			
			Table table = KSQL.select(query, null, "/system/data", null);
			Iterator<Row> it = table.iterator();
			while (it.hasNext()){
				Row r = it.next();
				result.add(r.getString("t"));
			}
		}else{
			result.add(task);
		}
		return result;
	}
	
	private static void processPI(String flowTask, JSONArray tasks){
		ProcessInstance pi = TaskDB.loadPIByTask(flowTask);
		tasks.add(processTask(pi.getTask()));
		List<ActivityInstance> ais = new ArrayList<ActivityInstance>();
		for (ActivityInstance rootAI : pi.getRootAIs()){
			getAIs(rootAI, ais);
		}
		
		
		List<JSONObject> curTasks = new ArrayList<JSONObject>();
		Map<String, List<String>> allDepends = new HashMap<String, List<String>>();
		List<String> ids = new ArrayList<String>();
		for (ActivityInstance ai : ais){
			if (isManualAI(ai)){
				List<String> depends = new ArrayList<String>();
				getDepends(ai, depends, true);
				String dependsStr = "";
				for (String depend : depends){
					if (SystemUtils.isNotEmptyString(dependsStr)) dependsStr += ",";
					dependsStr += depend;
				}
				allDepends.put(ai.getTask().getId(), depends);
				curTasks.add(processTask(ai.getTask()));
				ids.add(ai.getTask().getId());
				for (Task child : ai.getTask().getChildren()){
					curTasks.add(processTask(child));
					ids.add(child.getId());
				}
			}
		}
		
		long startIndex = tasks.size() + 1;
		for (JSONObject task : curTasks){
			String id = task.getString("id");
			List<String> depends = allDepends.get(id);
			String dependsValue = "";
			for (String depend : depends){
				long index = startIndex + ids.indexOf(depend);
				if (SystemUtils.isNotEmptyString(dependsValue)) dependsValue += ",";
				dependsValue += index;
			}
			task.put("depends", dependsValue);
		}
		
		tasks.addAll(curTasks);
	}
	
	
	
	private static boolean isManualAI(ActivityInstance ai){
		Task task = ai.getTask();
		if (Utils.isNotEmptyString(task.getExecutorFID()) || !task.getChildren().isEmpty()){
			return true;
		}else{
			return false;
		}
	}
	
	
	private static void getAIs(ActivityInstance ai, List<ActivityInstance> ais){
		if (!ais.contains(ai)){
			ais.add(ai);
		}
		for (ActivityInstance next : ai.getNextAIs2()){
			getAIs(next, ais);
		}
	}
	
	private static void getDepends(ActivityInstance ai, List<String> depends, boolean isEntry){
		if (isManualAI(ai) && !isEntry){
			String aiId = ai.getTask().getId();
			if (!depends.contains(aiId))
				depends.add(aiId);
		}else{
			for (ActivityInstance prev : ai.getPrevAIs()){
				getDepends(prev, depends, false);
			}
		}
	}
	
	
	
	private static JSONObject processTask(Task task){
		JSONObject result = new JSONObject();
		result.put("id", task.getId());
		result.put("name", task.getName());
		result.put("code", "");
		int level = getLevel(task);
		result.put("level", level);
		String status = getStatus(task.getStatus());
		result.put("status", status);
		result.put("canWrite", false);
		java.sql.Timestamp startTime = (java.sql.Timestamp)task.getCreateTime();
		Integer duration = (Integer)task.getRelationValue("sEIField41"); //单位是秒
		if (duration == null){
			duration = (int)(System.currentTimeMillis()-startTime.getTime())/1000; //默认用当前时间
 		}
		java.sql.Timestamp finishTime = new java.sql.Timestamp(startTime.getTime() + duration*1000);
		
		
		System.out.println(finishTime + ", " + startTime + ", " + duration*1.0/(60*60*24));
		System.out.println("id: " + task.getId());
		System.out.println("start: " + startTime.getTime());
		System.out.println("end: " + finishTime.getTime());
		result.put("start", startTime.getTime());
		result.put("end", finishTime.getTime());
		result.put("duration", duration*1.0/(60*60*24));
		result.put("startIsMilestone", false);
		result.put("endIsMilestone", false);
		result.put("collapsed", false);
		result.put("assigs", new JSONArray());
		result.put("hasChild", !task.getChildren().isEmpty());
		
		
		long progress = 100;
		if (status.equals("STATUS_ACTIVE")){
			long used = (System.currentTimeMillis()-startTime.getTime())/1000; //单位秒
			progress = used * 100 /duration;
			
			Integer warningTime = (Integer)task.getRelationValue("sEIField42");
			if (warningTime == null) warningTime = 30;
			if (progress >= warningTime){
				result.put("status", "STATUS_SUSPENDED");
			}
		}
		result.put("progress", progress);
		return result;
	}
	
	private static int getLevel(Task task){
		int level = -1;
		while (task != null){
			level ++;
			task = task.getParent();
		}
		
		return level;
	}
	
	//STATUS_ACTIVE, STATUS_DONE, STATUS_FAILED, STATUS_SUSPENDED, STATUS_UNDEFINED.
	private static String getStatus(String status){
		if (TaskStatus.EXECUTING.equals(status) || TaskStatus.READY.equals(status)){
			return "STATUS_ACTIVE";
		}else if (TaskStatus.FINISHED.equals(status) || TaskStatus.CANCELED.equals(status) 
				|| TaskStatus.RETURNED.equals(status) || TaskStatus.ABORTED.equals(status)
				|| TaskStatus.TRANSMITED.equals(status)){
			return "STATUS_DONE";
		}else if (TaskStatus.SUSPEND.equals(status) || TaskStatus.SLEEPING.equals(status)){
			return "STATUS_SUSPENDED";
		}else {
			return "STATUS_UNDEFINED";
		}
	}
}
