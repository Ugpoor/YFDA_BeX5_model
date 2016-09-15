import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.justep.model.Action;
import com.justep.model.ActionParam;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.BizData;
import com.justep.system.data.ColumnTypes;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;
import com.justep.system.opm.OrgConstants;
import com.justep.system.opm.api.DataPolicy;
import com.justep.system.opm.api.OpmUtils;
import com.justep.system.opm.api.PermissionHelper;
import com.justep.system.opm.api.PermissionKind;
import com.justep.system.opm.api.Role;
import com.justep.system.opm.api.RoleHelper;
import com.justep.util.Utils;

public class RoleProcedure {
	public static Table queryOPRole(String concept, String select, String from,	String aggregate, String dataModel, String fnModel, String condition, List<DataPermission> range, 
			Boolean distinct,	String idColumn, String filter, Integer limit, Integer offset, String columns, String orderBy, String aggregateColumns, Map<String, Object> variables, Boolean managed) {
		managed = managed == null ? false : managed;
		if (managed) {
			List<String> roleIDs = RoleHelper.getManagedRoles();
			String managedCondition = OpmUtils.getMultiValuesEqualCondition("SA_OPRole", roleIDs.toArray());
			condition = OpmUtils.joinCondition("and", condition, managedCondition);
		}
		return BizData.query(concept, idColumn, select, from, condition, range,	filter, distinct, offset, limit, columns, orderBy, aggregate, aggregateColumns, variables, dataModel, fnModel);
	}

	public static int saveOPRole(List<DataPermission> insertRange, List<DataPermission> deleteRange, List<DataPermission> updateRange, String concept, String dataModel, String fnModel, String readOnly, String notNull, Table table, List<String> parentIDs) {
		if (table.size() == 1 && parentIDs != null) {
			if (table.iterator(ModifyState.NEW).hasNext()) {
				Row row = table.iterator(ModifyState.NEW).next();
				Role role = RoleHelper.getRoleByRow(row);
				RoleHelper.appendRole(role.getId(), role.getCode(),	role.getName(), role.getRoleKind(), role.getCatalog(), role.getExtValues(), parentIDs);
				return 1;
			} else if (table.iterator(ModifyState.EDIT).hasNext()) {
				Row row = table.iterator(ModifyState.EDIT).next();
				Role role = RoleHelper.getRoleByRow(row);
				RoleHelper.updateRole(role.getId(), role.getVersion(), role.getCode(), role.getName(), role.getRoleKind(), role.getCatalog(), role.getExtValues(), parentIDs);
				return 1;
			}
		}
		throw new RuntimeException("不支持的操作！");
	}

	public static Table queryOPPermissionByRole(String concept, String select, String from, String aggregate, String dataModel, String fnModel,	String condition, List<DataPermission> range, Boolean distinct,	
			String idColumn, String filter, Integer limit, Integer offset, String columns, String orderBy, String aggregateColumns,	Map<String, Object> variables, String roleID, Boolean includeInherited) {
		if (Utils.isNotEmptyString(roleID)) {
			includeInherited = includeInherited == null ? false	: includeInherited;
			String roleCondition = null;
			if (includeInherited) {
				Set<String> roleIDs = RoleHelper.getRoleParents(roleID, true, true, true);
				roleCondition = OpmUtils.getMultiValuesEqualCondition("SA_OPPermission.sPermissionRoleID", roleIDs.toArray());
			} else
				roleCondition = String.format("SA_OPPermission.sPermissionRoleID = '%s'", roleID);
			condition = OpmUtils.joinCondition("and", condition, roleCondition);
		} else
			condition = "1=0";
		Table table = BizData.query(concept, idColumn, select, from, condition,	range, filter, distinct, offset, limit, columns, orderBy, aggregate, aggregateColumns, variables, dataModel, fnModel);
		//table.addColumn("actionsLabel", "String");
		//table.addColumn("actionPolicyNames", "String");
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			String sActions = row.getString("sActions");
			if (Utils.isNotEmptyString(sActions)) {
				DataPolicy dataPolicy = DataPolicy.fromString(sActions);
				row.setString("actionsLabel", dataPolicy.getLabel());
				row.setString("actionPolicyNames", dataPolicy.getActionPolicyNames());
			}
		}
		return table;
	}

	public static Table getProtectedActionsOfActivity(String process, String activity) {
		Table table = TableUtils.createTable(null);
		table.addColumn("name", ColumnTypes.STRING);
		table.addColumn("label", ColumnTypes.STRING);

		Map<String, Action> actions;
		try {
			 actions = com.justep.model.ModelUtils.getProcess(process).getActivity(activity).getActions();
		} catch (Exception e) {
			throw new RuntimeException("模型读取失败！" + e.getMessage());
		}
		for (Action action : actions.values()) {
			if (action.isProtectedPermission()) {
				Row row = table.appendRow();
				String name = action.getName();
				String label = action.getLabel(ContextHelper.getOperator().getLanguage());
				row.setString("name", name);
				row.setString("label", Utils.isEmptyString(label) ? name : label);
			}
		}
		return table;
	}

	public static Table getPermissionParamsOfActivity(String process, String activity) {
		Table table = TableUtils.createTable(null);
		table.addColumn("action", ColumnTypes.STRING);
		table.addColumn("actionLabel", ColumnTypes.STRING);
		table.addColumn("param", ColumnTypes.STRING);
		table.addColumn("paramLabel", ColumnTypes.STRING);

		Map<String, Action> actions;
		try {
			 actions = com.justep.model.ModelUtils.getProcess(process).getActivity(activity).getActions();
		} catch (Exception e) {
			throw new RuntimeException("模型读取失败！" + e.getMessage());
		}
		for (Action action : actions.values()) {
			List<ActionParam> params = new ArrayList<ActionParam>();
			params = action.getPermissionParams();
			for (ActionParam param : params) {
				Row row = table.appendRow();
				String actionName = action.getName();
				String actionLabel = action.getLabel(ContextHelper.getOperator().getLanguage());
				String paramName = param.getName();
				// TODO param.getLabel
				String paramLabel = paramName;
				row.setString("action", actionName);
				row.setString("actionLabel", Utils.isEmptyString(actionLabel) ? actionName : actionLabel);
				row.setString("param", paramName);
				row.setString("paramLabel", Utils.isEmptyString(paramLabel) ? paramName	: paramLabel);
			}
		}
		return table;
	}

	public static void enableRoles(Map<String, Integer> roles) {
		RoleHelper.enableRoles(roles);
	}

	public static void disableRoles(Map<String, Integer> roles) {
		RoleHelper.disableRoles(roles);
	}

	public static void deleteRoles(Map<String, Integer> roles) {
		RoleHelper.deleteRoles(roles);
	}

	public static void assignFunPermissions(String roleID, List<String> processes, List<String> activities, List<String> activitiesFNames) {
		for (int i = 0; i < processes.size(); i++) {
			String process = processes.get(i);
			String activity = activities.get(i);
			String activityFName = activitiesFNames.get(i);
			PermissionHelper.appendFunPermission(roleID, process, activity,	activityFName);
		}
	}

	public static void deletePermissions(Map<String, Integer> permissions) {
		PermissionHelper.deletePermissions(permissions);
	}

	
	private static Row getPermissionByID(String id) {
		String ksql = "select SA_OPPermission.* from SA_OPPermission SA_OPPermission where SA_OPPermission = :id ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Table table = KSQL.select(ksql, params, OrgConstants.OPM_DATA_MODEL, null);
		Row row = table.iterator().hasNext() ? table.iterator().next() : null;
		if (row == null)
			throw new RuntimeException(String.format("无效的权限标识[%s]！", id));
		return row;
	}
	
	public static Map<String, Object> getActionsPolicy(String permissionID){
		Row row = getPermissionByID(permissionID);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("id", row.getString("SA_OPPermission"));
		result.put("version", row.getInteger("version"));

		String actionNames = "";
		String sActions = row.getString("sActions");
		if (Utils.isNotEmptyString(sActions)) {
			DataPolicy dataPolicy = DataPolicy.fromString(sActions);
			actionNames = dataPolicy.getActionPolicyNames();
		}
		result.put("actions", actionNames);
		
		String process = row.getString("sProcess");
		String activity = row.getString("sActivity");
		Table protectedActions = getProtectedActionsOfActivity(process, activity);
		result.put("protectedActionsTable", protectedActions);
		return result;
	}
	
	public static void setActionsPolicy(String permissionID, Integer permissionVersion, Map<String, String> actions) {
		PermissionHelper.setActionsPolicy(permissionID, permissionVersion, actions);
	}

	public static Map<String, Object> getDataPermission(String id) {
		Row row = getPermissionByID(id);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("id", row.getString("SA_OPPermission"));
		result.put("version", row.getInteger("version"));
		result.put("process", row.getString("sProcess"));
		result.put("activity", row.getString("sActivity"));
		result.put("activityFName", row.getString("sActivityFName"));
		String actions = row.getString("sActions");
		DataPolicy dataPolicy = DataPolicy.fromString(actions);
		result.put("dataPolicyTable", dataPolicy.toTable());
		return result;
	}

	public static String appendDataPermission(String roleID, String process, String activity, String activityFName, Table dataPolicyTable) {
		return PermissionHelper.appendDataPermission(roleID, process, activity, activityFName, dataPolicyTable);
	}

	public static void updateDataPermission(String id, Integer version,	String process, String activity, String activityFName, Table dataPolicyTable) {
		PermissionHelper.updateDataPermission(id, version, process, activity, activityFName, dataPolicyTable);
	}

	public static Table policyValuesStringToTable(String values){
		return DataPolicy.valuesStringToTable(values);
	}

	public static Map<String, String> policyValuesTableToString(Table table){
		return DataPolicy.valuesTableToString(table);
	}
	
	public static JSONArray queryFunPermissionsByRole(String roleID){
		JSONArray items = new JSONArray();
		String ksql = "select SA_OPPermission.sProcess, SA_OPPermission.sActivity, SA_OPPermission.sActivityFName "
				+ "	from SA_OPPermission SA_OPPermission "
				+ "	where SA_OPPermission.sPermissionRoleID = :roleID and SA_OPPermission.sPermissionKind = :permissionKind ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleID", roleID);
		params.put("permissionKind", PermissionKind.fun.toNumber());
		Table table = KSQL.select(ksql, params, OrgConstants.OPM_DATA_MODEL, null);
		Iterator<Row> it = table.iterator();
		while (it.hasNext()){
			Row r = it.next();
			JSONObject item = new JSONObject();
			item.put("process", r.getString("sProcess"));
			item.put("activity", r.getString("sActivity"));
			item.put("path", r.getString("sActivityFName"));
			items.add(item);
		}
		return items;
	}
}