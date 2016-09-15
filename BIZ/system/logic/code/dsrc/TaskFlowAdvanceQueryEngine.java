import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.justep.common.SystemUtils;
import com.justep.message.SystemMessages;
import com.justep.model.AdvanceRule;
import com.justep.model.Place;
import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.process.ActivityInstance;
import com.justep.system.process.AdvanceProcessQueryEngine;
import com.justep.system.process.ExpressEngine;
import com.justep.system.process.ProcessContext;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessControlItem;
import com.justep.system.process.ProcessInstance;
import com.justep.system.process.ProcessQueryEngine;
import com.justep.system.process.ProcessRuleEngine;
import com.justep.system.process.RunnableActivity;
import com.justep.system.process.Task;
import com.justep.system.process.TaskExecuteMode;
import com.justep.system.process.TaskStatus;
import com.justep.system.process.TemplateHelper;
import com.justep.system.util.BizSystemException;
import com.justep.system.util.CommonUtils;


public class TaskFlowAdvanceQueryEngine extends ProcessQueryEngine{
	public TaskFlowAdvanceQueryEngine(ProcessContext context) {
		super(context);
	}
	
	public void execute() {
		this.getProcessContext().getTask().checkActivation();

		ProcessControl control = this.getProcessContext().getProcessControl();
		ActivityInstance ai = this.getProcessContext().getAI();

		AdvanceRule rule = ProcessRuleEngine.getAdvanceRule(ai);
		doExecute(ai, rule, control);

		ProcessInstance pi = this.getProcessContext().getPI();
		if (pi.isAllAIFinished(true)) {
			pi.finish();
		}

		//当前环节已经结束，但没有后续环节，且流程结束，表示没有找到后续环节，有问题
		if (control.isStatusActivityFinish() && !control.hasFlowTo() && pi.isAllAIFinished(true)){
			throw BizSystemException.create(SystemMessages.MUST_HAS_NEXT_ACTIVITY);
		}
		
		if (control.hasFlowTo() || control.isStatusActivityFinish()) {
			makeFlowOut(rule, ai);
			makeNotice(ai);
			makeProcessNotice(pi, ai.getTemplate().getEnd());
		}
	}
	
	private boolean isIgnoreExecuteMode(ActivityInstance ai, AdvanceRule rule){
		String expr = rule.getIgnoreExecuteMode();
		boolean result = false;
		if (SystemUtils.isNotEmptyString(expr)){
			expr = expr.trim();
			if ("true".equals(expr)){
				result = true;
			}else if ("false".equals(expr)){
				result = false;
			}else{
				Map<String, Object> params = new HashMap<String, Object>();
				params.putAll(ai.getVariables());
				result = ExpressEngine.calculateBoolean(expr, params, false, ai.getActivity().getModel());
			}
		}
		return result;
	}


	private void doExecute(ActivityInstance ai, AdvanceRule rule, ProcessControl control) {
		String exeucteMode = isIgnoreExecuteMode(ai, rule) ? TaskExecuteMode.PREEMPT : null;
		this.getProcessContext().getTask().execute(exeucteMode, null, ai.getTask());
		
		
		//TODO 此处可以添加主办和协办的逻辑
		

		if (ai.activation()) {
			//环节无法结束
			control.setStatusToExecutorFinish();

		} else {
			if (rule.isTaskWait() && AdvanceProcessQueryEngine.waitTask(ai, rule.getForkActivity())) {
				control.setStatusToTaskFinish();
			} else {
				doFlowOut2(ai);
			}
		}

		if (!control.hasFlowTo() && control.isStatusNone()) {
			control.setStatusToActivityFinish();
		}
	}
	
	private void doFlowOut2(ActivityInstance ai){
		List<ActivityInstance> ais = new ArrayList<ActivityInstance>();
		getDestAIs(ai, ais);
		if (ais.size() == 0){
			//流程结束，没有考虑主办不等待协办的情况
			if (ai.getPI().isAllAIFinished(true)){
				String id = CommonUtils.createGUID();
				Place end = ai.getTemplate().getEnd();
				makeFlowEnd(end, id);
				RunnableActivity ra = new RunnableActivity(end.getName(), "true", "false", end.getLabel(ContextHelper.getOperator().getLanguage()), id);
				ProcessControl control = this.getProcessControl();
				control.setRunableActivity(ra);
			}
			
		}else if (ais.size() == 1){
			ProcessControl control = this.getProcessControl();
			String activityId = CommonUtils.createGUID();
			RunnableActivity ra = new RunnableActivity(ais.get(0).getActivityID(), "true", "false", ais.get(0).getActivityLabel(), activityId);
			control.setRunableActivity(ra);
			makeTo(ais.get(0), activityId);
			
		} else {
			ProcessControl control = this.getProcessControl();
			RunnableActivity and = new RunnableActivity(RunnableActivity.AND, null, null, null, null);
			control.setRunableActivity(and);
			for (ActivityInstance item : ais){
				
				String activityId = CommonUtils.createGUID();
				RunnableActivity ra = new RunnableActivity(item.getActivityID(), "true", "false", item.getActivityLabel(), activityId);
				and.addChild(ra);
				makeTo(item, activityId);
			}
		}
	}
	
	private void makeTo(ActivityInstance ai, String activityId) {
		List<String> statuses = new ArrayList<String>();
		for (Task task : ai.getTask().getChildren()){
			if (TaskStatus.REMAIN.equals(task.getStatus())){
				statuses.add(TaskStatus.REMAIN);
			}
		}
		
		Task aiTask = ai.getTask();
		ProcessControlItem item = this.createProcessControlItemWithTask(aiTask, statuses, activityId);
		
		item.getTask().setId(aiTask.getId());
		item.getTask().setName(item.getTask().getName());
		item.getTask().setCURL(TemplateHelper.getURL(ActionUtils.getRequestContext().getActionContext().getActivity()));
		item.getTask().setData1(this.getProcessContext().getTask().getData1());
		item.getTask().setData2(this.getProcessContext().getTask().getData2());
		item.getTask().setData3(this.getProcessContext().getTask().getData3());
		item.getTask().setData4(this.getProcessContext().getTask().getData4());

		item.getTask().clearCreator();
		item.getTask().clearTime();
		
		this.getProcessControl().addFlowTo(item);
	}

	
	
	private void getDestAIs(ActivityInstance ai, List<ActivityInstance> list){
		for (ActivityInstance next : ai.getNextAIs()){
			if (canActiveAI(next)){
				if (next.getActivity().isManual() && TaskStatus.REMAIN.equals(next.getTask().getStatus())){
					if (!list.contains(next)){
						list.add(next);				
					}
							
				}else{
					getDestAIs(next, list);
				}
			}
		}
	}
	
	private boolean canActiveAI(ActivityInstance ai){
		for (ActivityInstance pre : ai.getAllPrevAIs()){
			if (pre.activation()){
				return false;
			}
		}
		
		return true;
	}	
	
	
	
	private void makeFlowOut(AdvanceRule rule, ActivityInstance ai) {
		if (rule != null) {
			ProcessRuleEngine.advanceRuleToProcessControl(ai, rule, this.getProcessContext().getProcessControl());
		}
	}
	

}
