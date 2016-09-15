import com.justep.system.opm.OrgUnit;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessControlItem;
import com.justep.system.process.ProcessEngine;

/**
 * @author hechengrong
 * 	当前只重写了流转查询和流转逻辑
 *
 */
public class TaskFlowEngine extends ProcessEngine{

	public TaskFlowEngine(String task, ProcessControl control) {
		super(task, control);
	}

	public void advanceQuery() {
		TaskFlowAdvanceQueryEngine engine = new TaskFlowAdvanceQueryEngine(this);
		engine.execute();
		
		//TODO 不记录历史选择的结果
	}

	
	public void advance() {
		TaskFlowAdvanceEngine engine = new TaskFlowAdvanceEngine(this);
		this.deleteTaskJoinProcessControlItem();
		engine.execute();
	}
	
	private void deleteTaskJoinProcessControlItem() {
		ProcessControl control = this.getProcessControl();
		for (ProcessControlItem item : control.getFlowTos()) {
			if (item.isTaskJoin()) {
				for (OrgUnit orgUnit : item.getExecutors()) {
					if (null != getTask().getActiveTaskInNext(orgUnit.getFID())) {
						item.removeExecutor(orgUnit);
						if (item.getExecutors().isEmpty()) {
							control.removeFlowTo2(item);
						}
					}
				}
			}
		}
	}
	
}
