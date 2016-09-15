import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.BizData;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.opm.OrgConstants;
import com.justep.system.opm.api.AuthorizeHelper;
import com.justep.system.opm.api.DataPolicy;
import com.justep.system.opm.api.OpmUtils;
import com.justep.system.opm.api.RoleHelper;
import com.justep.util.Utils;

public class AuthorizationProcedure {
	public static Table queryOPAuthorizePermissionByOrg(String concept, String select, String from,
			String aggregate, String dataModel, String fnModel, String condition,
			List<DataPermission> range, Boolean distinct, String idColumn, String filter,
			Integer limit, Integer offset, String columns, String orderBy, String aggregateColumns,
			Map<String, Object> variables, String orgFID, Boolean includeInherited) {
		includeInherited = includeInherited == null ? false : includeInherited;

		if (Utils.isNotEmptyString(orgFID)) {
			StringBuffer ksql = new StringBuffer("select SA_OPAuthorize.sAuthorizeRoleID "
					+ "	from SA_OPAuthorize SA_OPAuthorize "
					+ "		join SA_OPRole SA_OPRole on SA_OPRole = SA_OPAuthorize.sAuthorizeRoleID "
					+ "	where SA_OPRole.sValidState = 1 ");
			if (includeInherited)
				ksql.append(String.format(" and (%s) ", OpmUtils.createParentPathFilter("SA_OPAuthorize.sOrgFID", orgFID)));
			else
				ksql.append(String.format(" and (SA_OPAuthorize.sOrgFID = '%s') ", orgFID));
			Table table = KSQL.select(ksql.toString(), null, OrgConstants.OPM_DATA_MODEL, null);
			Set<String> roleIDs = new HashSet<String>();
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row row = rows.next();
				roleIDs.add(row.getString("sAuthorizeRoleID"));
			}
			roleIDs = RoleHelper.getRolesParents(roleIDs, true, true, true);
			String roleCondition = OpmUtils.getMultiValuesEqualCondition("SA_OPPermission.sPermissionRoleID", roleIDs.toArray());
			condition = OpmUtils.joinCondition("and", condition, roleCondition);
		} else
			condition = "1=0";

		Table table = BizData.query(concept, idColumn, select, from, condition, range, filter, distinct,
				offset, limit, columns, orderBy, aggregate, aggregateColumns, variables, dataModel,
				fnModel);
		if (table.getColumnNames().contains("actionsLabel")) {
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row row = rows.next();
				String sActions = row.getString("sActions");
				if (Utils.isNotEmptyString(sActions)) {
					DataPolicy dataPolicy = DataPolicy.fromString(sActions);
					row.setString("actionsLabel", dataPolicy.getLabel());
				}
			}
		}
		return table;
	}

	public static void appendAuthorizes(List<String> orgIDs, List<String> roleIDs) {
		for (int i = 0; i < orgIDs.size(); i++)
			AuthorizeHelper.appendAuthorize(orgIDs.get(i), roleIDs.get(i), null);
	}

	public static void deleteAuthorizes(Map<String, Integer> authorizes) {
		AuthorizeHelper.deleteAuthorizes(authorizes);
	}
	
	public static Table queryOPAuthorizeByRole(String concept,String idColumn,String select,String from,String condition,List<DataPermission> range,String filter,Boolean distinct,Integer offset,Integer limit,String columns,String orderBy,String aggregate,String aggregateColumns,Map<String, Object> variables,String dataModel,String fnModel,String roleID,Boolean includeRoleChildren,Boolean graded){
		String roleCondition = "";
		// 获取角色的子
		if (Utils.isNotEmptyString(roleID)) {
			Set<String> roleIDs;
			includeRoleChildren = includeRoleChildren == null ? false : includeRoleChildren;
			if (includeRoleChildren) {
				roleIDs = RoleHelper.getRoleChildren(roleID, true, true, true);
			} else {
				roleIDs = new HashSet<String>();
				roleIDs.add(roleID);
			}
			roleCondition = OpmUtils.arrayToString(roleIDs.toArray(), "(SA_OPAuthorize.sAuthorizeRoleID = '%s')", "or");
		}
		roleCondition = roleCondition.length() > 0 ? roleCondition : "1=0";
		condition = OpmUtils.joinCondition("and", condition, roleCondition);
		
		// 分级过滤
		graded = graded == null ? false : graded;
		if (graded) {
			List<String> orgFIDs = ContextHelper.getRootManagementFIDs("systemManagement");
			String orgCondition = OpmUtils.arrayToString(orgFIDs.toArray(), "(SA_OPOrg.sFID like '%s%%')", "or");
			orgCondition = orgCondition.length() > 0 ? orgCondition : "1=0";
			condition = OpmUtils.joinCondition("and", condition, orgCondition);
		}

		return BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
	}

	public static Table queryOrgByPermission(String concept,String idColumn,String select,String from,String condition,List<DataPermission> range,String filter,Boolean distinct,Integer offset,Integer limit,String columns,String orderBy,String aggregate,String aggregateColumns,Map<String, Object> variables,String dataModel,String fnModel,String process,String activity,Boolean graded){
		String roleCondition = "1=0";
		if (Utils.isNotEmptyString(process) && Utils.isNotEmptyString(activity)) {
			// 获得权限属于的角色
			Set<String> roleIDs = new HashSet<String>();
			
			String sqlGetRole = "select p.sPermissionRoleID from SA_OPPermission p where p.sProcess = :process and p.sActivity = :activity";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("process", process);
			params.put("activity", activity);
			Table table = KSQL.select(sqlGetRole, params, "/system/data", null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row row = rows.next();
				roleIDs.add(row.getString("sPermissionRoleID"));
			}
			// 获得角色的子角色
			roleIDs = RoleHelper.getRolesChildren(roleIDs, true, true, true);
			if (roleIDs.size() > 0) {
				roleCondition = OpmUtils.arrayToString(roleIDs.toArray(), "(SA_OPAuthorize.sAuthorizeRoleID = '%s')", "or");
			}
		}
		condition = OpmUtils.joinCondition("and", condition, roleCondition);

		// 分级过滤
		graded = graded == null ? false : graded;
		if (graded) {
			List<String> orgFIDs = ContextHelper.getRootManagementFIDs("systemManagement");
			String orgCondition = OpmUtils.arrayToString(orgFIDs.toArray(), "(SA_OPOrg.sFID like '%s%%')", "or");
			orgCondition = orgCondition.length() > 0 ? orgCondition : "1=0";
			condition = OpmUtils.joinCondition("and", condition, orgCondition);
		}

		return BizData.query(concept, idColumn, select, from, condition, range, filter, distinct, offset, limit, columns, orderBy, aggregate,
				aggregateColumns, variables, dataModel, fnModel);
	}
}