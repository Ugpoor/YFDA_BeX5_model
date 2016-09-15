import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.justep.message.SystemMessages;
import com.justep.model.ModelUtils;
import com.justep.system.action.ActionUtils;
import com.justep.system.context.ActionContext;
import com.justep.system.opm.OrgUnit;
import com.justep.system.process.ActivityInstance;
import com.justep.system.process.PNEngineUtils;
import com.justep.system.process.ProcessConstants;
import com.justep.system.process.ProcessContext;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessControlItem;
import com.justep.system.process.Task;
import com.justep.system.process.TaskExecuteMode;
import com.justep.system.process.TaskKind;
import com.justep.system.process.TaskStatus;
import com.justep.system.util.BizSystemException;


public class TaskFlowAdvanceEngine{
	private ProcessContext context;
	
	public TaskFlowAdvanceEngine(ProcessContext context) {
		this.context = context;
	}
	
	public void execute(){
		Task current = context.getTask();
		current.checkActivation();

		ActivityInstance ai = context.getAI();
		ProcessControl control = context.getProcessControl();
		
		if (!control.getFlowTos().isEmpty()) {
			//还有不是强制的情况，先不考虑
			current.execute(TaskExecuteMode.PREEMPT, null, ai.getTask());
		} else {
			current.execute(null, null, ai.getTask());
		}

		if (!ai.activation()) {
			if (control.isStatusExecutorFinish()){
				throw BizSystemException.create(SystemMessages.TASK_EXECUTED);
			}
			
			flowOut2(ai, control);

			//剩余的通知
			if (!control.isNoticesExpanded()) {
				PNEngineUtils.createUnitNoticeTask(ai.getPI(), ai.getActivity(), context.getProcessControl(), context.getTask());
			}

			
			if (!control.isTaskFinish()) {
				current.setStatus(TaskStatus.EXECUTING);
				ai.getTask().setStatus(TaskStatus.EXECUTING);
				ai.setStatusToRun();
			}
			

			//流程结束: 调用流程结束动作
			if (ai.getPI().isAllAIFinished(true)) {
				//流程级别的通知: 自由流时会到这里
				if (!control.isNoticesExpanded()) {
					PNEngineUtils.createUnitNoticeTask(ai.getPI(), ai.getTemplate().getEnd(), context.getProcessControl(), context.getTask());
				}

				doFinishPIAction(current);
				ai.getPI().finish();
			}
		}
	}
	
	private void flowOut2(ActivityInstance ai, ProcessControl control){
		if (control.isStatusTaskFinish()) {
			ai.getTask().wait(null);
			return;
		}
		
		List<ActivityInstance> waiteds = PNEngineUtils.getWaitAIs(ai);
		waiteds.add(ai);
		
		for (ActivityInstance waited : waiteds){
			waited.setStatusToEnd();
			waited.getTask().setStatus(TaskStatus.FINISHED);
		}
		
		Set<ActivityInstance> nexts = ai.getAllNextAIs();
		for (ProcessControlItem item : control.getFlowTos()){
			String id = item.getTask().getId();
			for (ActivityInstance next : nexts){
				if (next.getTask().getId().equals(id)){
					item.setExpanded(true);
					next.setStatusToRun();
					next.getTask().setStatus(TaskStatus.READY);
					//next.getTask().loadFromMap(item.getTask().getRelations());
					for (String key : item.getTask().getRelations().keySet()){
						next.getTask().setRelationValue(key, item.getTask().getRelationValue(key));
					}

					List<Task> children = new ArrayList<Task>();
					children.addAll(next.getTask().getChildren());
					for (Task child : children){
						next.getTask().removeChild(child);	
					}
					
					List<OrgUnit> executors = item.getExecutors();
					if (executors.size() == 0){
						throw BizSystemException.create(SystemMessages.MUST_HAS_EXECUTOR);
					}else if (executors.size() == 1){
						next.getTask().orgUnitToExecutor(executors.get(0));
						
					}else {
						next.getTask().clearExecutor();
						
						
						int i = 0;
						for (OrgUnit executor : executors){
							Task child = new Task();
							next.getTask().assignRelationTo(child);
							child.orgUnitToExecutor(executor);
							
							child.setKind(TaskKind.EXECUTOR);
							child.setAI(null);
							child.setAIStatus(null);
							child.setVariable(null);
								
							child.setSequence(++i);
							
							
							
							next.getTask().addChild(child);
						}
						
						if (TaskExecuteMode.SEQUENTIAL.equals(next.getTask().getExecuteMode())){
							for (Task child : next.getTask().getChildren()){
								if (child.getSequence() > 1){
									child.setStatus(TaskStatus.SLEEPING);
								}
							}
						}
					}
					
					break;
				}
			}
		}
	}
	
	private void doFinishPIAction(Task task) {
		ActionContext context = ModelUtils.getRequestContext().getActionContext();
		String process = context.getProcess().getFullName();
		String activity = context.getActivity().getName();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(ProcessConstants.TASK_PARAMETER, task.getId());
		ActionUtils.invokeAction(process, activity, ProcessConstants.FINISH_PROCESS_ACTION, context.getExecutor(), params);
	}
	
	
}
