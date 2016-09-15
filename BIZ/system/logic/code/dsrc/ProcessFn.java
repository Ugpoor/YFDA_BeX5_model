import java.util.List;

import com.justep.system.action.ActionUtils;
import com.justep.system.opm.OrgUnit;
import com.justep.system.opm.OrgUtils;
import com.justep.system.process.ProcessUtils;




public class ProcessFn {
	
	public static Integer currentTaskExecutorNumber(){
		return ProcessUtils.currentTaskExecutorNumber();
	}
	
	public static Integer currentTaskExecutorFinishedNumber(){
		return ProcessUtils.currentTaskExecutorFinishedNumber();
	}

	public static List<OrgUnit> findOrgUnitsHasCActivity(Object inOrg, boolean isPersonMember) {
		return ProcessUtils.findOrgUnitsHasCActivity(inOrg, isPersonMember);
	}


	public static List<OrgUnit> findActivityExecutor(String activity) {
		return ProcessUtils.findActivityExecutor(activity);
	}
	
	public static String findActivityFirstExecutorFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityExecutor(activity));
	}
	
	public static String findActivityFirstExecutorName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityExecutor(activity));
	}


	public static List<OrgUnit> findActivityExecutorOrg(String activity) {
		return ProcessUtils.findActivityExecutorOrg(activity);
	}


	public static String findActivityFirstExecutorOrgFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityExecutorOrg(activity));
	}
	
	public static String findActivityFirstExecutorOrgFName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityExecutorOrg(activity));
	}
	

	
	public static List<OrgUnit> findActivityExecutorDept(String activity) {
		return ProcessUtils.findActivityExecutorDept(activity);
	}

	public static String findActivityFirstExecutorDeptFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityExecutorDept(activity));
	}

	public static String findActivityFirstExecutorDeptFName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityExecutorDept(activity));
	}

	public static List<OrgUnit> findActivityExecutorOgn(String activity) {
		return ProcessUtils.findActivityExecutorOgn(activity);
	}

	public static String findActivityFirstExecutorOgnFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityExecutorOgn(activity));
	}

	public static String findActivityFirstExecutorOgnFName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityExecutorOgn(activity));
	}

	public static List<OrgUnit> findActivityCreator(String activity) {
		return ProcessUtils.findActivityCreator(activity);
	}

	public static String findActivityFirstCreatorFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityCreator(activity));
	}

	public static String findActivityFirstCreatorFName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityCreator(activity));
	}

	public static List<OrgUnit> findActivityCreatorOrg(String activity) {
		return ProcessUtils.findActivityCreatorOrg(activity);
	}

	public static String findActivityFirstCreatorOrgFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityCreatorOrg(activity));
	}

	public static String findActivityFirstCreatorOrgFName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityCreatorOrg(activity));
	}

	public static List<OrgUnit> findActivityCreatorDept(String activity) {
		return ProcessUtils.findActivityCreatorDept(activity);
	}

	public static String findActivityFirstCreatorDeptFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityCreatorDept(activity));
	}

	public static String findActivityFirstCreatorDeptFName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityCreatorDept(activity));
	}

	public static List<OrgUnit> findActivityCreatorOgn(String activity) {
		return ProcessUtils.findActivityCreatorOgn(activity);
	}

	public static String findActivityFirstCreatorOgnFID(String activity) {
		return OrgUtils.firstOrgUnitFID(ProcessUtils.findActivityCreatorOgn(activity));
	}

	public static String findActivityFirstCreatorOgnFName(String activity) {
		return OrgUtils.firstOrgUnitFName(ProcessUtils.findActivityCreatorOgn(activity));
	}

	public static List<OrgUnit> findOrgUnitsHasActivity(String activity, Object inOrg, boolean isPersonMember) {
		String process = ProcessUtils.getProcessInProcessContext().getFullName2();
		return OrgUtils.findOrgUnitsHasActivity(process, activity, inOrg, isPersonMember);
	}

	
	
	public static List<OrgUnit> findOrgUnitsHasCActivityInAEDept(String activity, boolean isPersonMember) {
		return ProcessUtils.findOrgUnitsHasCActivityInAEDept(activity, isPersonMember);
	}

	public static List<OrgUnit> findOrgUnitsHasCActivityInAEOgn(String activity, boolean isPersonMember) {
		return ProcessUtils.findOrgUnitsHasCActivityInAEOgn(activity, isPersonMember);
	}

	public static List<OrgUnit> findOrgUnitsHasCActivityInACDept(String activity, boolean isPersonMember) {
		return ProcessUtils.findOrgUnitsHasCActivityInACDept(activity, isPersonMember);
	}

	public static List<OrgUnit> findOrgUnitsHasCActivityInACOgn(String activity, boolean isPersonMember) {
		return ProcessUtils.findOrgUnitsHasCActivityInACOgn(activity, isPersonMember);
	}
	
	public static Boolean isExecutingAction(String name){
		return ProcessUtils.isExecutingAction(name);
	}
	
	public static Boolean isProcessFinished(){
		return ProcessUtils.isProcessFinished();
	}
	
	public static Boolean isStartingProcess(){
		return ProcessUtils.isStartingProcess();
	}
	
	public static Boolean processFinishable(){
		return ProcessUtils.processFinishable();
	}
	
	public static Boolean isFlowTo(String name){
		return ProcessUtils.isFlowTo(name);
	}
	
	public static Boolean isFlowToEnd(){
		return ProcessUtils.isFlowToEnd();
	}
	
	
	public static String currentProcessLabel(){
		return ProcessUtils.getCurrentProcessLabel();
	}

	public static String currentActivityLabel(){
		return ProcessUtils.getCurrentActivityLabel();
	}
	
	
	public static String currentPIName(){
		return ProcessUtils.getPINameInProcessContext();
	}
	
	public static String getProcessData1(){
		return ProcessUtils.getProcessData1();
	}

	public static String getProcessData2(){
		return ProcessUtils.getProcessData2();
	}

	public static String getProcessData3(){
		return ProcessUtils.getProcessData3();
	}

	public static String getProcessData4(){
		return ProcessUtils.getProcessData4();
	}
	
	public static String currentProcess(){
		return ActionUtils.getRequestContext().getActionContext().getProcess().getFullName();
	}

	public static String currentActivity(){
		return ActionUtils.getRequestContext().getActionContext().getActivity().getFullName();
	}
	
	public static String currentProcessOfProcessContext(){
		return ProcessUtils.getProcessInProcessContext().getFullName();
	}

	public static String currentActivityOfProcessContext(){
		return ProcessUtils.getActivityInProcessContext().getFullName();
	}
	
	public static String currentProcessLabelOfProcessContext(){
		return ProcessUtils.getProcessLabelInProcessContext();
	}
	
	public static String currentActivityLabelOfProcessContext(){
		return ProcessUtils.getActivityLabelInProcessContext();
	}
	
	public static Boolean inputFromActivity(String activity){
		return ProcessUtils.inputFromActivity(activity);
	}
	
}
