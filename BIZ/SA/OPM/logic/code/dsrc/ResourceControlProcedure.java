import java.util.*;

import com.justep.system.data.KSQL;
import com.justep.system.data.Table;
import com.justep.system.opm.OrgConstants;
import com.justep.system.util.CommonUtils;

public class ResourceControlProcedure {

	private static boolean existOrgResource(String orgFID, String resourceID, String typeID) {
		String selectSQL = "select rc from SA_ResourceControl rc where rc.sResourceID = :resourceID and rc.sTypeID = :typeID and rc.sOrgFID = :orgFID ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orgFID", orgFID);
		params.put("resourceID", resourceID);
		params.put("typeID", typeID);
		Table t = KSQL.select(selectSQL, params, OrgConstants.OPM_DATA_MODEL, null);
		return t.size() > 0;
	}
	
	private static void insertOrgResource(String orgFID, String orgFName, String resourceID, String typeID, String typeName) {
		String insertSQL = "insert into SA_ResourceControl rc (rc.version, rc, rc.sOrgID, rc.sOrgName, rc.sOrgFID, rc.sOrgFName, rc.sResourceID, rc.sTypeID, rc.sTypeName, rc.sCreatorID, rc.sCreatorName, rc.sCreatorFID, rc.sCreatorFName, rc.sCreateTime) " 
			+ "	values (0, :guid(), :orgID, :orgName, :orgFID, :orgFName, :resourceID, :typeID, :typeName, :currentPersonID(), :currentPersonName(), :currentPersonMemberID(), :currentPersonMemberFName(), :currentDateTime()) ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orgID", CommonUtils.getNameNoExtOfFile(orgFID));
		params.put("orgName", CommonUtils.getNameOfFile(orgFName));
		params.put("orgFID", orgFID);
		params.put("orgFName", orgFName);
		params.put("resourceID", resourceID);
		params.put("typeID", typeID);
		params.put("typeName", typeName);
		KSQL.executeUpdate(insertSQL, params, OrgConstants.OPM_DATA_MODEL, null);
	}
	
	private static void deleteOrgResource(String id) {
		String deleteSQL = "delete from SA_ResourceControl rc where rc = :id ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		KSQL.executeUpdate(deleteSQL, params, OrgConstants.OPM_DATA_MODEL, null);
	}
	
	public static void addOrgResource(Map<String, String> orgUnits, String resourceID, String typeID, String typeName) {
		for (String orgFID : orgUnits.keySet()) {
			if (!existOrgResource(orgFID, resourceID, typeID)) {
				String orgFName = orgUnits.get(orgFID);
				insertOrgResource(orgFID, orgFName, resourceID, typeID, typeName);
			}
		}
	}

	public static void removeOrgResource(List<String> ids) {
		for (String id : ids) {
			deleteOrgResource(id);
		}
	}
}