<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <action name="queryOPRoleAction" global="false" procedure="queryOPRoleProcedure"> 
    <public name="concept" type="String" value="SA_OPRole"/>  
    <private name="select" type="String" value="SA_OPRole.*"/>  
    <private name="from" type="String" value="SA_OPRole SA_OPRole"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPRole"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPRole.sCatalog asc, SA_OPRole.sRoleKind desc, SA_OPRole.sName asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <public type="Boolean" required="false" name="managed"/>  
    <label language="zh_CN">查询角色</label> 
  </action>  
  <action name="createOPRoleAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_OPRole"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <label language="zh_CN">创建角色</label> 
  </action>  
  <action name="saveOPRoleAction" procedure="saveOPRoleProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_OPOrg"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <label language="zh_CN">保存角色</label>  
    <public type="List" required="false" name="parentIDs"/> 
  </action>  
  <action name="queryOPParentRoleAction" global="false" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_OPParentRole"/>  
    <private name="select" type="String" value="SA_OPParentRole.*,parent.sName as parentName"/>  
    <private name="from" type="String" value="SA_OPParentRole SA_OPParentRole join SA_OPRole parent on SA_OPParentRole.sParentRoleID = parent"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPParentRole"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询父角色</label> 
  </action>  
  <action name="createOPParentRoleAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_OPParentRole"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <label language="zh_CN">创建父角色</label> 
  </action>  
  <action name="queryOPPermissionByRoleAction" global="false" procedure="queryOPPermissionByRoleProcedure"> 
    <public name="concept" type="String" value="SA_OPPermission"/>  
    <private name="select" type="String" value="SA_OPPermission.*,SA_OPRole.sName as roleName,'' as actionsLabel,'' as actionPolicyNames"/>  
    <private name="from" type="String" value="SA_OPPermission SA_OPPermission  join SA_OPRole SA_OPRole on SA_OPPermission.sPermissionRoleID = SA_OPRole"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPPermission"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPPermission.sActivityFName asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <public type="String" name="roleID"/>  
    <public name="includeInherited" type="Boolean" value=""/>  
    <label language="zh_CN">按角色查询权限</label> 
  </action>  
  <action name="getProtectedActionsOfActivityAction" procedure="getProtectedActionsOfActivityProcedure"> 
    <public name="process" type="String"/>  
    <public name="activity" type="String"/>  
    <label language="zh_CN">获得保护的动作</label> 
  </action>  
  <action name="getPermissionParamsOfActivityAction" procedure="getPermissionParamsOfActivityProcedure"> 
    <public name="process" type="String"/>  
    <public name="activity" type="String"/>  
    <label language="zh_CN">获得权限参数</label> 
  </action>  
  <action name="enableRolesAction" global="false" procedure="enableRolesProcedure"> 
    <label language="zh_CN">启用角色</label>  
    <public type="Map" name="roles" required="true"/> 
  </action>  
  <action name="disableRolesAction" global="false" procedure="disableRolesProcedure"> 
    <label language="zh_CN">禁用角色</label>  
    <public type="Map" required="true" name="roles"/> 
  </action>  
  <action name="deleteRolesAction" global="false" procedure="deleteRolesProcedure"> 
    <label language="zh_CN">删除角色</label>  
    <public type="Map" name="roles" required="true"/> 
  </action>  
  <action name="assignFunPermissionsAction" global="false" procedure="assignFunPermissionsProcedure"> 
    <label language="zh_CN">分配功能权限</label>  
    <public type="String" name="roleID" required="true"/>  
    <public type="List" name="processes" required="true"/>  
    <public type="List" name="activities" required="true"/>  
    <public type="List" name="activitiesFNames" required="true"/> 
  </action>  
  <action name="deletePermissionsAction" global="false" procedure="deletePermissionsProcedure"> 
    <label language="zh_CN">删除权限</label>  
    <public type="Map" name="permissions" required="true"/> 
  </action>  
  <action name="getActionsPolicyAction" global="false" procedure="getActionsPolicyProcedure">
    <label language="zh_CN">获取动作策略</label>  
    <public type="String" name="permissionID"/> 
  </action> 
  <action name="setActionsPolicyAction" global="false" procedure="setActionsPolicyProcedure"> 
    <label language="zh_CN">设置动作策略</label>  
    <public type="String" name="permissionID" required="true"/>  
    <public type="Integer" name="permissionVersion" required="false"/>  
    <public type="Map" name="actions" required="true"/> 
  </action>  
  <action name="getDataPermissionAction" global="false" procedure="getDataPermissionProcedure">
    <label language="zh_CN">获取数据权限</label>  
    <public type="String" name="id" required="true"/> 
  </action>  
  <action name="appendDataPermission" global="false" procedure="appendDataPermissionProcedure">
    <label language="zh_CN">添加数据权限</label>  
    <public type="String" name="roleID" required="true"/>  
    <public type="String" name="process" required="true"/>  
    <public type="String" name="activity" required="true"/>  
    <public type="String" name="activityFName" required="true"/>  
    <public type="Table" name="dataPolicyTable" required="true"/> 
  </action>  
  <action name="updateDataPermission" global="false" procedure="updateDataPermissionProcedure">
    <label language="zh_CN">更新数据权限</label>  
    <public type="String" name="id" required="true"/>  
    <public type="Integer" name="version" required="false"/>  
    <public type="String" name="process" required="true"/>  
    <public type="String" name="activity" required="true"/>  
    <public type="String" name="activityFName" required="true"/>  
    <public type="Table" name="dataPolicyTable" required="true"/> 
  </action>  
  <action name="policyValuesStringToTableAction" global="false" procedure="policyValuesStringToTableProcedure">
    <public type="String" name="values" required="true"/> 
  </action>  
  <action name="policyValuesTableToStringAction" global="false" procedure="policyValuesTableToStringProcedure">
    <public type="Table" name="table" required="true"/> 
  </action>  
<action name="queryFunPermissionsByRoleAction" global="false" procedure="queryFunPermissionsByRoleProcedure"><label language="zh_CN">根据角色获取功能权限</label>
<public type="String" name="roleID"></public>
</action>
</model>
