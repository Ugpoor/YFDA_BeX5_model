import com.justep.system.context.ContextHelper;
import com.justep.system.process.ProcessControl;
import com.justep.system.process.ProcessControlItem;

public class ModifyControlProcess {

	public static void bizActivity1AfterAdvanceQuery() {
		ProcessControl control = (ProcessControl)ContextHelper.getActionContext().getActionResult();
		
		//修改后续环节的信息
		for (ProcessControlItem to : control.getFlowTos()){
			//修改标题
			to.getTask().setName("modify:" + to.getTask().getName());
			
			//清空执行者和执行者范围
			to.clearExecutors();
			to.clearExecutorRange();
		
			//将当前的人员成员设置为执行者和执行者范围
			to.addExecutor(ContextHelper.getPersonMemberWithAgent());
			to.addExecutorRange(ContextHelper.getPersonMemberWithAgent());
		}
		
		//修改通知的信息
		for (ProcessControlItem notice : control.getNotices()){
			notice.getTask().setName("modify: " + notice.getTask().getName());
			
			notice.clearExecutors();
			notice.clearExecutorRange();
			
			notice.addExecutor(ContextHelper.getPersonMemberWithAgent());
			notice.addExecutorRange(ContextHelper.getPersonMemberWithAgent());
		}	
	}
}