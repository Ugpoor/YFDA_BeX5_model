<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <action name="queryOPAuthorizeAction" global="false" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_OPAuthorize"/>  
    <private name="select" type="String" value="SA_OPAuthorize.*,SA_OPRole.sName as roleName,SA_OPRole.sCatalog as roleCatalog,SA_OPRole.sDescription as roleDescription,SA_OPRole.sParentRolesNames as roleParentRolesNames,SA_OPRole.sRoleKind as roleRoleKind"/>  
    <private name="from" type="String" value="SA_OPAuthorize SA_OPAuthorize  join SA_OPRole SA_OPRole on SA_OPAuthorize.sAuthorizeRoleID = SA_OPRole"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="SA_OPRole.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPAuthorize"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPAuthorize.sOrgFName asc,SA_OPRole.sCatalog asc, SA_OPRole.sName asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询授权</label> 
  </action>  
  <action name="queryOPAuthorizePermissionByOrgAction" global="false" procedure="queryOPAuthorizePermissionByOrgProcedure"> 
    <public name="concept" type="String" value="SA_OPPermission"/>  
    <private name="select" type="String" value="SA_OPPermission.*,SA_OPRole.sName as roleName,SA_OPRole.sCode as roleCode,'' as actionsLabel"/>  
    <private name="from" type="String" value="SA_OPPermission SA_OPPermission  join SA_OPRole SA_OPRole on SA_OPPermission.sPermissionRoleID = SA_OPRole"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="SA_OPPermission.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPPermission"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPRole.sName asc, SA_OPPermission.sActivityFName asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <public name="orgFID" type="String" value="" required="false"/>  
    <public name="includeInherited" type="Boolean" required="false"/>  
    <label language="zh_CN">按组织查询授权权限</label> 
  </action>  
  <action name="queryDistinctOPAuthorizePermissionByOrgAction" global="false"
    procedure="queryOPAuthorizePermissionByOrgProcedure"> 
    <public name="concept" type="String" value="SA_OPPermission"/>  
    <private name="select" type="String" value=" concat(SA_OPPermission.sProcess, SA_OPPermission.sActivity, SA_OPPermission.sActivityFName) as idColumn, SA_OPPermission.sProcess, SA_OPPermission.sActivity, SA_OPPermission.sActivityFName"/>  
    <private name="from" type="String" value="SA_OPPermission SA_OPPermission  join SA_OPRole SA_OPRole on SA_OPPermission.sPermissionRoleID  =  SA_OPRole"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="SA_OPPermission.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="true"/>  
    <public name="idColumn" type="String" value="idColumn"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPPermission.sActivityFName asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <public name="orgFID" type="String" value="" required="false"/>  
    <public name="includeInherited" type="Boolean" required="false"/>  
    <label language="zh_CN">按组织查询授权权限(distinct)</label> 
  </action>  
  <action name="appendAuthorizesAction" global="false" procedure="appendAuthorizesProcedure"> 
    <label language="zh_CN">添加授权</label>  
    <public type="List" name="orgIDs" required="true"/>  
    <public type="List" name="roleIDs" required="true"/> 
  </action>  
  <action name="deleteAuthorizesAction" global="false" procedure="deleteAuthorizesProcedure"> 
    <label language="zh_CN">删除授权</label>  
    <public type="Map" name="authorizes" required="true"/> 
  </action>  
  <action name="queryOPAuthorizeByRoleAction" global="false" procedure="queryOPAuthorizeByRoleProcedure"> 
    <label language="zh_CN">按角色查询授权组织</label>  
    <private name="concept" type="String" value="SA_OPAuthorize"/>  
    <public name="idColumn" type="String" value="SA_OPAuthorize"/>  
    <private name="select" type="String" value="SA_OPAuthorize.*,SA_OPOrg.sName as orgName,SA_OPOrg.sFName as orgFName,SA_OPOrg.sOrgKindID as orgKindID,SA_OPRole.sName as roleName,SA_OPRole.sDescription as roleDescription"/>  
    <private name="from" type="String" value="SA_OPAuthorize SA_OPAuthorize  join SA_OPOrg SA_OPOrg on SA_OPAuthorize.sOrgID = SA_OPOrg join SA_OPRole SA_OPRole on SA_OPAuthorize.sAuthorizeRoleID = SA_OPRole"/>  
    <protected name="condition" type="String" value="SA_OPOrg.sValidState = 1 AND SA_OPRole.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="distinct" type="Boolean"/>  
    <public name="offset" type="Integer"/>  
    <public name="limit" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPAuthorize.sAuthorizeRoleID asc, SA_OPOrg.sSequence asc"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <public type="String" name="roleID"/>  
    <public type="Boolean" name="includeRoleChildren"/>  
    <public type="Boolean" name="graded"/> 
  </action>  
  <action name="queryDistinctOPAuthorizeOrgByRoleAction" global="false" procedure="queryOPAuthorizeByRoleProcedure"> 
    <label language="zh_CN">按角色查询授权组织(distinct)</label>  
    <private name="concept" type="String" value="SA_OPOrg"/>  
    <public name="idColumn" type="String" value="SA_OPOrg"/>  
    <private name="select" type="String" value="SA_OPOrg,SA_OPOrg.sName as sName,SA_OPOrg.sCode as sCode,SA_OPOrg.sFName as sFName,SA_OPOrg.sOrgKindID as sOrgKindID,SA_OPOrg.sSequence as sSequence"/>  
    <private name="from" type="String" value="SA_OPOrg SA_OPOrg  join SA_OPAuthorize SA_OPAuthorize on SA_OPOrg.sFID LIKE concat(SA_OPAuthorize.sOrgFID, '%') join SA_OPRole SA_OPRole on SA_OPAuthorize.sAuthorizeRoleID = SA_OPRole"/>  
    <protected name="condition" type="String" value="SA_OPOrg.sValidState = 1 AND SA_OPRole.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="distinct" type="Boolean" value="true"/>  
    <public name="offset" type="Integer"/>  
    <public name="limit" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPOrg.sSequence asc"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <public type="String" name="roleID"/>  
    <public type="Boolean" name="includeRoleChildren"/>  
    <public type="Boolean" name="graded"/> 
  </action>  
  <action name="queryOrgByPermissionAction" global="false" procedure="queryOrgByPermissionProcedure"> 
    <label language="zh_CN">按权限查询授权组织</label>  
    <private name="concept" type="String" value="SA_OPOrg"/>  
    <public name="idColumn" type="String" value="combineID"/>  
    <private name="select" type="String" value="SA_OPOrg as orgID,SA_OPOrg.sName as orgName,SA_OPOrg.sCode as orgCode,SA_OPOrg.sFID as orgFID,SA_OPOrg.sFName as orgFName,SA_OPOrg.sFCode as orgFCode,SA_OPOrg.sOrgKindID as orgKindID,SA_OPOrg.sSequence as orgSequence,SA_OPRole.sName as roleName,SA_OPRole.sCode as roleCode,SA_OPRole.sRoleKind as roleKind,(concat(SA_OPOrg, SA_OPRole)) as combineID"/>  
    <private name="from" type="String" value="SA_OPOrg SA_OPOrg  join SA_OPAuthorize SA_OPAuthorize on SA_OPOrg.sFID LIKE concat(SA_OPAuthorize.sOrgFID, '%') join SA_OPRole SA_OPRole on SA_OPAuthorize.sAuthorizeRoleID = SA_OPRole"/>  
    <protected name="condition" type="String" value="SA_OPOrg.sValidState = 1 AND SA_OPRole.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="offset" type="Integer"/>  
    <public name="limit" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPRole.sName asc, SA_OPOrg.sSequence asc"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <public type="String" name="process" required="false"/> 
  	<public type="String" name="activity" required="false"/>
	<public type="Boolean" name="graded" required="false"/>
  </action>
</model>
