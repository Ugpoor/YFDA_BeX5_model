<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryOPRoleManagementAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_OPRoleManagement"/>  
    <private name="select" type="String" value="SA_OPRoleManagement.*,SA_OPRole.sName as roleName,SA_OPRole.sRoleKind as roleKind,SA_OPRole.sCatalog as roleCatalog,SA_OPRole.sParentRolesNames as roleParentRolesNames,SA_OPRole.sValidState as roleValidState"/>  
    <private name="from" type="String" value="SA_OPRoleManagement SA_OPRoleManagement  join SA_OPRole SA_OPRole on SA_OPRoleManagement.sRoleID = SA_OPRole"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="SA_OPRole.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPRoleManagement"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPRoleManagement.sOrgFName asc, SA_OPRole.sCatalog asc, SA_OPRole.sName asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询角色管理权限</label> 
  </action>  
  <action name="appendRoleManagementsAction" global="false" procedure="appendRoleManagementsProcedure">
    <label language="zh_CN">添加角色管理权限</label>  
    <public type="String" name="orgID" required="true"/>  
    <public type="List" name="roleIDs" required="true"/> 
  </action>  
  <action name="deleteRoleManagementsAction" global="false" procedure="deleteRoleManagementsProcedure">
    <label language="zh_CN">删除角色管理权限</label>  
    <public type="Map" name="roleManagements" required="true"/> 
  </action> 
</model>
