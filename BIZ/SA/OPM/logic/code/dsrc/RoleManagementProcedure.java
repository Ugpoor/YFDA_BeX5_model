import java.util.*;

import com.justep.system.opm.api.RoleManagementHelper;

public class RoleManagementProcedure {

	public static void appendRoleManagements(String orgID, List<String> roleIDs) {
		RoleManagementHelper.appendRoleManagements(orgID, roleIDs);
	}

	public static void deleteRoleManagements(
			Map<String, Integer> roleManagements) {
		RoleManagementHelper.deleteRoleManagements(roleManagements);
	}
}