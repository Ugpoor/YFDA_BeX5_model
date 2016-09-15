import com.justep.system.util.*;
import com.justep.system.process.*;
import com.justep.system.context.*;
import com.justep.system.opm.*;
import com.justep.system.data.*;
import com.justep.system.action.*;
import com.justep.model.*;

public class LeaveApplyProcess {

	public static void leaveApplyProcessAfterAdvance() {
		if (!ProcessUtils.isFlowToEnd()) {
			updateApprove("审批", true);
		}
	}
	
	public static void leaveApplyProcessAfterAbort() {
		updateApprove("已终止", false);
	}

	public static void leaveApplyProcessAfterFinish() {
		updateApprove("已审批", false);
	}

	public static void leaveApplyProcessAfterStart() {
		updateApprove("审批", true);
	}
	
	private static void updateApprove(String status, Boolean isAdvance){
		String fApprove = " ", sStatus;
		if (!ProcessUtils.isFlowToEnd() && isAdvance) {
			ProcessControl flowControl = (ProcessControl) ContextHelper.getActionContext().getParameter("control");
			for (ProcessControlItem to : flowControl.getFlowTos()) {
				for (OrgUnit ect : to.getExecutors()) {
					fApprove = fApprove	+ CommonUtils.getNameOfFile(ect.getFName()) + " ";
				}
			}
			fApprove= "待 " + fApprove + status;
			sStatus = status + "中";
		} else {
			sStatus = status;
			fApprove = ContextHelper.getPerson().getName()+" " + status;
		}

		String ksql = "update OA_LeaveApply a set a.fLastModifyTime = :currentDateTime(), a.fApprove='"
				+ fApprove + "',a.fStatus='" + sStatus+ "' where a = '"+ProcessUtils.getProcessData1()+"'";
		KSQL.executeUpdate(ksql, null, "/OA/personalOffice/data", null);
	}


	public static void leaveApplyProcessAfterBack() {
		updateApprove("已回退", false);
	}
}