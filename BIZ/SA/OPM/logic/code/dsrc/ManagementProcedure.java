import java.util.List;
import java.util.Map;

import com.justep.system.opm.api.ManagementHelper;

public class ManagementProcedure {
	public static void appendManagements(String manageTypeID, String orgID,
			List<String> manageOrgIDs) {
		ManagementHelper.appendManagements(manageTypeID, orgID, manageOrgIDs);
	}

	public static void deleteManagements(Map<String, Integer> managements) {
		ManagementHelper.deleteManagements(managements);
	}

}
