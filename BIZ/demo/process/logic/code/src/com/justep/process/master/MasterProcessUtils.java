package com.justep.process.master;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.process.ActivityInstance;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessControlItem;
import com.justep.system.process.ProcessInstance;
import com.justep.system.process.ProcessUtils;
import com.justep.system.process.Task;
import com.justep.system.process.TaskDB;
import com.justep.system.process.TaskStatus;
import com.justep.system.util.CommonUtils;


public class MasterProcessUtils {
	/**
	 * 
	 * @param masterProcess 主流程路径 
	 * @param subPITask 子流程实例任务
	 * @param executorFID 主流程首环节的执行人
	 */
	public static void startMaster(String masterProcess, String subPITask, String executorFID){
		if (executorFID == null)
			executorFID = ContextHelper.getPersonMember().getFID();
		String sData1 = getData(subPITask);
		List<Map<String, String>> result = ProcessUtils.startProcess(masterProcess, null, sData1, executorFID, ContextHelper.getPersonMember().getFID());

		//假设主流程入口有且只有一个环节，且那个环节是单人处理
		
		String task = result.get(0).get("task");
		updateMasterSub(task, subPITask);
		
		//暂停主流程
		ProcessUtils.suspendProcess(task, null);
	}
	
	private static void updateMasterSub(String masterTask , String subPITask){
		//主流程的第一个环节的任务上，sESFiled01记录对应子流程实例任务
		String updateMaster = "update SA_Task t set t.sESField01='" + subPITask + "' where t='" + masterTask + "'";
		KSQL.executeUpdate(updateMaster, null, "/system/data", null);
		
		
		//子流程实例任务上, sData2记录对应主流程的环节任务
		String updateSub = "update SA_Task t set t.sData2='" + masterTask + "' where t='" + subPITask + "'";
		KSQL.executeUpdate(updateSub, null, "/system/data", null);
	}
	
	//获取子流程关联的业务数据
	private static String getData(String task){
		String query = "select t.sData1 from SA_Task t where t='" + task + "'";
		Table table = KSQL.select(query, null, "/system/data", null);
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
			Row r = it.next();
			 return r.getString("sData1");
		}
		
		throw new RuntimeException("获取子流程上的业务数据为空！");
	}
	
	/**
	 * @param subPITask 子流程实例任务
	 * 唤醒子流程对应的主流程环节任务，并对主流程进行流转
	 */
	public static void resumeMaster(String subPITask){
		String masterTask = getMasterTask(subPITask);
		ProcessUtils.resumeProcess(masterTask);

		//主流程流转到下一环节
		ProcessControl control = ProcessUtils.advanceProcessQuery(masterTask);
		for (ProcessControlItem item : control.getFlowTos()){
			if (!item.isEnd()){
				item.clearExecutors();
				item.addExecutor(ContextHelper.getPersonMember());
			}
		}
		ProcessUtils.advanceProcess(masterTask, control);
	}
	
	/**
	 * @param masterTask 主流程的环节任务
	 * @param process 子流程
	 */
	public static void startSubProcessInActivity(String masterTask, String process){
		String sData1 = getData(masterTask);
		List<Map<String, String>> result = ProcessUtils.startProcess(process, null, sData1, null);
		String task = result.get(0).get("task");
		String subPITask = getPITask(task);
		updateMasterSub(masterTask, subPITask);
		//暂停主流程
		ProcessUtils.suspendProcess(masterTask, null);		
	}
	
	private static String getPITask(String task){
		String query = "select t.sFlowID from SA_Task t where t='" + task + "'";
		Table table = KSQL.select(query, null, "/system/data", null);
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
			Row r = it.next();
			return r.getString("sFlowID");
		}
		
		throw new RuntimeException("启动子流程实例任务出错");
	}
	
	
	
	private static String getMasterTask(String subPITask){
		String query = "select t.sData2 from SA_Task t where t='" + subPITask + "'";
		Table table = KSQL.select(query, null, "/system/data", null);
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
			Row r = it.next();
			return r.getString("sData2");
		}
		
		throw new RuntimeException("获取子流程上的关联的主流程环节任务为空！");
	}
	
	/**
	 * @param subTask 子流程的环节任务
	 * 子流程的第一个环节回退：
	 * 	1. 将子流程的当前环节任务取消；
	 * 	2. 获取主流程的环节任务；
	 * 	3. 主流程回退到上一个环节: 
	 * 		上一个环节是"子流程模式"时，将环节任务设置为暂停，修改它关联的子流程实例的最后一个环节的任务为待办；		
	 */
	public static void backMasterProcess(String subTask){
		//终止当前子流程
		ProcessUtils.abortProcess(subTask, null);
		String subPITask = getPITask(subTask);
		
		
		
		//主流程回退到上一个环节
		String masterTask = getMasterTask(subPITask);
		
		ProcessUtils.resumeProcess(masterTask);
		
		List<Map<String, String>> result = ProcessUtils.backProcess(masterTask, null);

		String task = result.get(0).get("task");

		activeLastActivityInSubProcess(task);
		

		//暂停主流程
		ProcessUtils.suspendProcess(masterTask, null);		
	}
	
	//激活子流程的最后一个环节
	private static void activeLastActivityInSubProcess(String masterTask){
		String subPITask = getSubPITask(masterTask);
		ProcessInstance pi = TaskDB.loadPI(subPITask);
		
		//更新主流程环节任务与子流程实例的关系: 
		//TODO 会导致多个主流程的环节实例与同一个子流程实例对应，某种情况下会有问题
		updateMasterSub(masterTask, subPITask);		
		
		
		Task piTask = pi.getTask();
		piTask.setStatus(TaskStatus.READY);

		for (ActivityInstance ai : pi.getAIs()){
			if (ai.getNextAIs().isEmpty()){
				for (ActivityInstance cur : getLastManualAI(ai)){
					cur.getTask().setStatus(TaskStatus.READY);
					for (Task next : cur.getTask().getNexts()){
						cur.getTask().removeNext2(next);
					}
				}
			}
		}
		
		piTask.setLock(CommonUtils.createGUID());
		piTask.save();
	}
	
	//获取子流程最后的手工环节实例
	private static Set<ActivityInstance> getLastManualAI(ActivityInstance ai){
		Set<ActivityInstance> result = new HashSet<ActivityInstance>();
		if (ai.getActivity().isManual()){
			result.add(ai);
		}else{
			for (ActivityInstance prev : ai.getPrevAIs()){
				result.addAll(getLastManualAI(prev));
			}
		}
		return result;
	}
	
	
	
	
	//获取子流程任务
	private static String getSubPITask(String task){
		String query = "select t.sESField01 from SA_Task t where t='" + task + "'";
		Table table = KSQL.select(query, null, "/system/data", null);
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
			Row r = it.next();
			return r.getString("sESField01");
		}
		
		throw new RuntimeException("获取主流程环节上关联的子流程任务出错！");
	}
}
