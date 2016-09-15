import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.justep.message.SystemMessages;
import com.justep.system.context.ContextHelper;
import com.justep.system.opm.OrgNode;
import com.justep.system.opm.OrgUnit;
import com.justep.system.opm.OrgUtils;
import com.justep.system.opm.Person;
import com.justep.system.process.ProcessUtils;
import com.justep.util.Utils;


public class OrgFn {
	public static List<OrgUnit> removeOrgUnitByFID(List<OrgUnit> container, String fid){
		List<OrgUnit> result = new ArrayList<OrgUnit>();
		for (OrgUnit unit : container){
			if (!unit.getFID().equals(fid)){
				result.add(unit);
			}
		}
		
		return result;
	}
	
	public static String defaultEncryptPassword(){
		return OrgUtils.getDefauletEncryptPassword();
	}
	
	public static boolean orgUnitsEq(List<OrgUnit> items1, List<OrgUnit> items2){
		return OrgUtils.orgUnitsEq(items1, items2);
	}
	
	//原来的: inOrgUnitCons
	public static boolean inOrgUnits(String fid, List<OrgUnit> items) {
		return OrgUtils.inOrgUnits(fid, items);
	}

	//原来的: orgUnitConsAnd
	public static List<OrgUnit> orgUnitsAnd(List<OrgUnit> items1, List<OrgUnit> items2) {
		return OrgUtils.orgUnitsAnd(items1, items2);
	}

	//原来的: orgUnitConsOR
	public static List<OrgUnit> orgUnitsOr(List<OrgUnit> items1, List<OrgUnit> items2) {
		return OrgUtils.orgUnitsOr(items1, items2);
	}
	
	public static List<OrgUnit> orgUnitsSub(List<OrgUnit> items1, List<OrgUnit> items2){
		return OrgUtils.orgUnitsSub(items1, items2);
	}


	//原来的: orgUnitConsByIndex
	public static List<OrgUnit> orgUnitsByIndex(List<OrgUnit> items, int index) {
		return OrgUtils.orgUnitsByIndex(items, index);
	}

	//原来的: getOrgUnitConsFIDString
	public static String firstOrgUnitFID(List<OrgUnit> items) {
		return OrgUtils.firstOrgUnitFID(items);
	}

	//原来的: getOrgUnitConsFNameString
	public static String firstOrgUnitFName(List<OrgUnit> items) {
		return OrgUtils.firstOrgUnitFName(items);
	}

	
	public static List<OrgUnit> orgUnitsByKind(List<OrgUnit> items, String kind) {
		return OrgUtils.orgUnitsByKind(items, kind);
	}
	
	//原来的: orgUnitConsToOrgCons
	public static List<OrgUnit> orgUnitsToOrgs(List<OrgUnit> items) {
		return OrgUtils.orgUnitsToOrgs(items);
	}


	public static List<OrgUnit> orgUnitsToPoss(List<OrgUnit> items) {
		return OrgUtils.orgUnitsToPoss(items);
	}
	
	//原来的: orgUnitConsToDeptCons
	public static List<OrgUnit> orgUnitsToDepts(List<OrgUnit> items) {
		return OrgUtils.orgUnitsToDepts(items);
	}

	//原来的: orgUnitConsToOgnCons
	public static List<OrgUnit> orgUnitsToOgns(List<OrgUnit> items) {
		return OrgUtils.orgUnitsToOgns(items);
	}

	//原来的: distinctOrgUnitCons
	public static List<OrgUnit> distinctOrgUnitsByFID(List<OrgUnit> items) {
		return OrgUtils.distinctOrgUnitsByFID(items);
	}
	

	//原来的: distinctIDOrgUnitCons
	public static List<OrgUnit> distinctOrgUnitsByID(List<OrgUnit> items) {
		return OrgUtils.distinctOrgUnitsByID(items);
	}


	public static List<OrgUnit> findOrgUnitsByID(Object ids) {
		return OrgUtils.findOrgUnitsByID(ids);
	}

	public static List<OrgUnit> findOrgUnitsByFID(Object fids) {
		return OrgUtils.findOrgUnitsByFID(fids);
	}
	
	public static List<OrgUnit> findOrgUnitsByCode(Object codes){
		return OrgUtils.findOrgUnitsByCode(codes);
	}


	//原来的: locatePersonMember
	public static List<OrgUnit> findPersonMembersByID(String orgIDorFID, String personID) {
		return OrgUtils.findPersonMembersByID(orgIDorFID, personID);
	}

	//原来的: locatePersonMemberByCode
	public static List<OrgUnit> findPersonMembersByCode(String orgIDorFID, String personCode) {
		return OrgUtils.findPersonMembersByCode(orgIDorFID, personCode);
	}

	//原来的: locateOnePersonMember
	public static List<OrgUnit> findOnePersonMemberByID(String orgIDorFID, String personID) {
		return OrgUtils.findOnePersonMemberByID(orgIDorFID, personID);
	}

	//原来的: locatePersonMembers
	public static List<OrgUnit> findPersonMembersByIDList(List<List<String>> orgIDandPersonID) {
		return OrgUtils.findPersonMembersByIDList(orgIDandPersonID);
	}

	//原来的: locatePersonMembersByCode
	public static List<OrgUnit> findPersonMembersByCodeList(List<List<String>> orgIDOrPersonCode) {
		return OrgUtils.findPersonMembersByCodeList(orgIDOrPersonCode);
	}

	//原来的: getOrgUnitChildren
	public static List<OrgUnit> findOrgChildren(Object org, String childCondition, Map<String, Object> params, boolean includeSelf,
			boolean includeAllChildren) {
		return OrgUtils.findOrgChildren(org, childCondition, params, includeSelf, includeAllChildren);
	}

	public static List<OrgUnit> findOrgChildren2(Object org, String childCondition, Map<String, Object> params, boolean includeSelf,
			boolean includeAllChildren, boolean includePersonMember) {
		return OrgUtils.findOrgChildren2(org, childCondition, params, includeSelf, includeAllChildren, includePersonMember);
	}
	

	//原来的: getOrgUnitChildrenByLevel
	public static List<OrgUnit> findOrgChildrenByLevel(Object org, int index, String operation, boolean includeSelf,
			boolean includeAllChildren) {
		return OrgUtils.findOrgChildrenByLevel(org, index, operation, includeSelf, includeAllChildren);
	}

	//原来的: getOrgUnitChildrenByCode
	public static List<OrgUnit> findOrgChildrenByCode(Object org, String code, boolean includeSelf, boolean includeAllChildren) {
		return OrgUtils.findOrgChildrenByCode(org, code, includeSelf, includeAllChildren);
	}

	//原来的: getOrgUnitParent
	public static List<OrgUnit> findOrgParents(Object org, String parentCondition, Map<String, Object> params, boolean includeSelf,
			boolean includeAllParent) {
		return OrgUtils.findOrgParents(org, parentCondition, params, includeSelf, includeAllParent);
	}

	//原来的: getOrgUnitParentByLevel
	public static List<OrgUnit> findOrgParentsByLevel(Object org, int index, String operation, boolean includeSelf, boolean includeAllChildren) {
		return OrgUtils.findOrgParentsByLevel(org, index, operation, includeSelf, includeAllChildren);
	}

	//原来的: getOrgUnitParentByCode
	public static List<OrgUnit> findOrgParentsByCode(Object org, String code, boolean includeSelf, boolean includeAllChildren) {
		return OrgUtils.findOrgParentsByCode(org, code, includeSelf, includeAllChildren);
	}

	//原来的: getPersonMember
	public static List<OrgUnit> findPersonMembersInOrg(Object org, boolean includeAllChildren) {
		return OrgUtils.findPersonMembersInOrg(org, includeAllChildren);
	}



	//原来的: getOrgUnitManager=getOrgManager
	public static List<OrgUnit> findManagers(Object org, String managerType, boolean includeAllParent, Object inOrg) {
		return OrgUtils.findManagers(org, managerType, includeAllParent, inOrg);
	}

	//原来的: getManagerOfCurrentDept
	public static List<OrgUnit> findManagersOfCurrentDept(boolean includeAllParent) {
		return OrgUtils.findManagersOfCurrentDept(includeAllParent);
	}

	//原来的: getOrgUnitUnderling=getOrgUnderling
	public static List<OrgUnit> findSubordinations(Object org, String managerType, Object inOrg, boolean isPersonMember) {
		return OrgUtils.findSubordinations(org, managerType, inOrg, isPersonMember);
	}

	//原来的: getOrgUnitHasRoleByCode: getAllPersonHasRoleByCode(被替换成getOrgUnitHasRoleByCode)
	public static List<OrgUnit> findOrgUnitsHasRoleByCode(String roleCode, Object inOrg, boolean isPersonMember) {
		return OrgUtils.findOrgUnitsHasRoleByCode(roleCode, inOrg, isPersonMember);	
	}

	//原来的: getOrgUnitHasRole: getAllPersonHasRoleByID(被替换成getOrgUnitHasRole)
	public static List<OrgUnit> findOrgUnitsHasRole(String roleID, Object inOrg, boolean isPersonMember) {
		return OrgUtils.findOrgUnitsHasRole(roleID, inOrg, isPersonMember);	
	}

	//原来的: getCurrentOrgUnit=getCurrentOrgNode
	public static List<OrgUnit> currentPersonMember() {
		List<OrgUnit> result = new ArrayList<OrgUnit>();
		result.add(ContextHelper.getPersonMember());
		return result;
	}
	
	public static List<OrgUnit> currentPersonMember2(){
		if (ProcessUtils.isStartingProcess()){
			String executor = (String)ContextHelper.getActionContext().getParameter("executor");
			if (Utils.isNotEmptyString(executor)){
				return findOrgUnitsByFID(executor);
			}
		}
		
		return currentPersonMember();
	}

	public static String operatorID() {
		Person operator = ContextHelper.getOperator();
		Utils.check(Utils.isNotNull(operator), SystemMessages.class, SystemMessages.OPERATOR_NULL); 
		return operator.getID();
	}

	
	public static String operatorCode() {
		Person operator = ContextHelper.getOperator();
		Utils.check(Utils.isNotNull(operator), SystemMessages.class, SystemMessages.OPERATOR_NULL); 
		return operator.getCode();
	}

	public static String operatorName() {
		Person operator = ContextHelper.getOperator();
		Utils.check(Utils.isNotNull(operator), SystemMessages.class, SystemMessages.OPERATOR_NULL); 
		return operator.getName();
	}
	
	public static String currentPersonID() {
		Person psn = ContextHelper.getPerson();
		Utils.check(Utils.isNotNull(psn), SystemMessages.class, SystemMessages.CUR_PERSON_NULL); 
		return psn.getID();
	}

	public static String currentPersonName() {
		Person psn = ContextHelper.getPerson();
		Utils.check(Utils.isNotNull(psn), SystemMessages.class, SystemMessages.CUR_PERSON_NULL); 
		return psn.getName();
	}

	public static String currentPersonCode() {
		Person psn = ContextHelper.getPerson();
		Utils.check(Utils.isNotNull(psn), SystemMessages.class, SystemMessages.CUR_PERSON_NULL); 
		return psn.getCode();
	}

	public static String currentPersonMemberNameWithAgent(){
		return ContextHelper.getPersonMemberNameWithAgent();
	}
	
	public static String currentPersonMemberFNameWithAgent(){
		return ContextHelper.getPersonMemberFNameWithAgent();
	}
	

	public static String currentPersonMemberID() {
		OrgNode node = ContextHelper.getPersonMember();
		Utils.check(Utils.isNotNull(node), SystemMessages.class, SystemMessages.CUR_PSM_NULL); 
		return node.getID();
	}

	public static String currentPersonMemberName() {
		OrgNode node = ContextHelper.getPersonMember();
		return node.getName();
	}

	public static String currentPersonMemberCode() {
		OrgNode node = ContextHelper.getPersonMember();
		return node.getCode();
	}

	public static String currentPersonMemberFID() {
		OrgNode node = ContextHelper.getPersonMember();
		return node.getFID();
	}

	public static String currentPersonMemberFName() {
		OrgNode node = ContextHelper.getPersonMember();
		return node.getFName();
	}

	public static String currentOrgID() {
		OrgNode o = ContextHelper.getPersonMember().getOrg();
		if (Utils.isNotNull(o)) {
			return o.getID();
		} else
			return null;
	}

	public static String currentOrgName() {
		OrgNode o = ContextHelper.getPersonMember().getOrg();
		if (Utils.isNotNull(o)) {
			return o.getName();
		} else
			return null;
	}

	public static String currentOrgCode() {
		OrgNode o = ContextHelper.getPersonMember().getOrg();
		if (Utils.isNotNull(o)) {
			return o.getCode();
		} else
			return null;
	}

	public static String currentOrgFID() {
		OrgNode o = ContextHelper.getPersonMember().getOrg();
		if (Utils.isNotNull(o)) {
			return o.getFID();
		} else
			return null;
	}

	public static String currentOrgFName() {
		OrgNode o = ContextHelper.getPersonMember().getOrg();
		if (Utils.isNotNull(o)) {
			return o.getFName();
		} else
			return null;
	}

	public static String currentPosID() {
		OrgNode o = ContextHelper.getPersonMember().getPos();
		if (Utils.isNotNull(o)) {
			return o.getID();
		} else
			return null;
	}

	public static String currentPosName() {
		OrgNode o = ContextHelper.getPersonMember().getPos();
		if (Utils.isNotNull(o)) {
			return o.getName();
		} else
			return null;
	}

	public static String currentPosCode() {
		OrgNode o = ContextHelper.getPersonMember().getPos();
		if (Utils.isNotNull(o)) {
			return o.getCode();
		} else
			return null;
	}

	public static String currentPosFID() {
		OrgNode o = ContextHelper.getPersonMember().getPos();
		if (Utils.isNotNull(o)) {
			return o.getFID();
		} else
			return null;
	}

	public static String currentPosFName() {
		OrgNode o = ContextHelper.getPersonMember().getPos();
		if (Utils.isNotNull(o)) {
			return o.getFName();
		} else
			return null;
	}

	public static String currentDeptID() {
		OrgNode o = ContextHelper.getPersonMember().getDept();
		if (Utils.isNotNull(o)) {
			return o.getID();
		} else
			return null;
	}

	public static String currentDeptName() {
		OrgNode o = ContextHelper.getPersonMember().getDept();
		if (Utils.isNotNull(o)) {
			return o.getName();
		} else
			return null;
	}

		
	
	public static String currentDeptCode() {
		OrgNode o = ContextHelper.getPersonMember().getDept();
		if (Utils.isNotNull(o)) {
			return o.getCode();
		} else
			return null;
	}

	public static String currentDeptFID() {
		OrgNode o = ContextHelper.getPersonMember().getDept();
		if (Utils.isNotNull(o)) {
			return o.getFID();
		} else
			return null;
	}

	public static String currentDeptFName() {
		OrgNode o = ContextHelper.getPersonMember().getDept();
		if (Utils.isNotNull(o)) {
			return o.getFName();
		} else
			return null;
	}

	public static String currentOgnID() {
		OrgNode o = ContextHelper.getPersonMember().getOgn();
		if (Utils.isNotNull(o)) {
			return o.getID();
		} else
			return null;
	}

	public static String currentOgnName() {
		OrgNode o = ContextHelper.getPersonMember().getOgn();
		if (Utils.isNotNull(o)) {
			return o.getName();
		} else
			return null;
	}

	public static String currentOgnCode() {
		OrgNode o = ContextHelper.getPersonMember().getOgn();
		if (Utils.isNotNull(o)) {
			return o.getCode();
		} else
			return null;
	}

	public static String currentOgnFID() {
		OrgNode o = ContextHelper.getPersonMember().getOgn();
		if (Utils.isNotNull(o)) {
			return o.getFID();
		} else
			return null;
	}

	public static String currentOgnFName() {
		OrgNode o = ContextHelper.getPersonMember().getOgn();
		if (Utils.isNotNull(o)) {
			return o.getFName();
		} else
			return null;
	}

	public static java.sql.Date loginDate() {
		return ContextHelper.getOperator().getLoginDate();
	}

	public static String currentLanguage() {
		return ContextHelper.getOperator().getLanguage();
	}
	
	public static List<String> orgUnitsToOrgFIDs(List<OrgUnit> items){
		return OrgUtils.orgUnitsToOrgFIDs(items);
	}

	public static String getOrgRealFName(String orgFID, String orgFName) {
		return OrgUtils.getRealFName(orgFID, orgFName);
	}
}
