import com.justep.license.LicenseChecker;
import com.justep.system.data.KSQL;

/**
	initGlobal: 第一次初始化系统模块的时候会调用；
	init: 每次添加新租户和第一次初始化系统的时候会调用；
	initModelGlobal: 创建应用模块表时，会针对应用模块下每个init模块调用，参数model就是当前的init模块；
	initModel: 初始化应用模块时，会针对应用模块下每个init模块调用，参数model就是当前的init模块；
 */
public class SystemInitProcedure {
	public static void init(){
		//System.out.println("............系统模块租户数据初始化............");
	}
	
	public static void initGlobal(){
		if (LicenseChecker.instance().getLicense().isClient()){
			String[] ksqls = new String[]{
					"insert into SA_OPPermission t  (t, t.sPermissionRoleID, t.sProcess, t.sActivityFName, t.sActivity, t.sActionsNames, t.sActions, t.sSemanticDP, t.sPermissionKind, t.sDescription, t.sSequence, t.sValidState, t.version)" +
					"values( 'SYS-OPM-000', 'RL-SYSTEM', '/SA/client/clientProcess', '/协同平台/租户管理/租户管理', 'mainActivity', null, null, null, 0, null, 1, 1, 0)",
						
					"insert into SA_OPPermission t  (t, t.sPermissionRoleID, t.sProcess, t.sActivityFName, t.sActivity, t.sActionsNames, t.sActions, t.sSemanticDP, t.sPermissionKind, t.sDescription, t.sSequence, t.sValidState, t.version)" +
					"values( 'SYS-OPM-001', 'RL-SYSTEM', '/SA/client/clientProcess', '/协同平台/租户管理/应用管理', 'appActivity', null, null, null, 0, null, 1, 1, 0)",
						
				};
				for (String ksql : ksqls){
					KSQL.executeUpdate(ksql, null, "/system/data", null);
				}
				/*
				String ksql = "insert into SA_OPPermission t  (t, t.sPermissionRoleID, t.sProcess, t.sActivityFName, t.sActivity, t.sActionsNames, t.sActions, t.sSemanticDP, t.sPermissionKind, t.sDescription, t.sSequence, t.sValidState, t.version)" +
						"values( 'SYS-OPM-00', 'RL-SYSTEM', '/SA/init/initProcess', '/协同平台/系统工具/应用库管理', 'appDbManagerActivity', null, null, null, 0, null, 1, 1, 0)";
						
				KSQL.executeUpdate(ksql, null, "/system/data", null);
				*/
		}
	}
}
