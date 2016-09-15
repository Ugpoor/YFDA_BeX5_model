<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryOPRoleProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.queryOPRole"> 
    <parameter name="concept" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="range" type="List"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/>  
    <parameter name="managed" type="Boolean"/> 
  </procedure>  
  <procedure name="queryOPPermissionByRoleProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.queryOPPermissionByRole"> 
    <parameter name="concept" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="range" type="List"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/>  
    <parameter name="roleID" type="String"/>  
    <parameter name="includeInherited" type="Boolean"/> 
  </procedure>  
  <procedure name="getProtectedActionsOfActivityProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.getProtectedActionsOfActivity"> 
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/> 
  </procedure>  
  <procedure name="getPermissionParamsOfActivityProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.getPermissionParamsOfActivity"> 
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/> 
  </procedure>  
  <procedure name="saveOPRoleProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.saveOPRole"> 
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="table" type="Table"/>  
    <parameter name="parentIDs" type="List"/> 
  </procedure>  
  <procedure name="enableRolesProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.enableRoles"> 
    <parameter name="roles" type="Map"/> 
  </procedure>  
  <procedure name="disableRolesProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.disableRoles"> 
    <parameter name="roles" type="Map"/> 
  </procedure>  
  <procedure name="deleteRolesProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.deleteRoles"> 
    <parameter name="roles" type="Map"/> 
  </procedure>  
  <procedure name="assignFunPermissionsProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.assignFunPermissions"> 
    <parameter name="roleID" type="String"/>  
    <parameter name="processes" type="List"/>  
    <parameter name="activities" type="List"/>  
    <parameter name="activitiesFNames" type="List"/> 
  </procedure>  
  <procedure name="deletePermissionsProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.deletePermissions"> 
    <parameter name="permissions" type="Map"/> 
  </procedure>  
  <procedure name="getActionsPolicyProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.getActionsPolicy"> 
    <parameter name="permissionID" type="String"/> 
  </procedure>  
  <procedure name="setActionsPolicyProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.setActionsPolicy"> 
    <parameter name="permissionID" type="String"/>  
    <parameter name="permissionVersion" type="Integer"/>  
    <parameter name="actions" type="Map"/> 
  </procedure>  
  <procedure name="getDataPermissionProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.getDataPermission"> 
    <parameter name="id" type="String"/> 
  </procedure>  
  <procedure name="appendDataPermissionProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.appendDataPermission"> 
    <parameter name="roleID" type="String"/>  
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/>  
    <parameter name="activityFName" type="String"/>  
    <parameter name="dataPolicyTable" type="Table"/> 
  </procedure>  
  <procedure name="updateDataPermissionProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.updateDataPermission"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/>  
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/>  
    <parameter name="activityFName" type="String"/>  
    <parameter name="dataPolicyTable" type="Table"/> 
  </procedure>  
  <procedure name="policyValuesStringToTableProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.policyValuesStringToTable"> 
    <parameter name="values" type="String"/> 
  </procedure>  
  <procedure name="policyValuesTableToStringProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.policyValuesTableToString"> 
    <parameter name="table" type="Table"/> 
  </procedure>  
  <procedure name="queryFunPermissionsByRoleProcedure" code-model="/SA/OPM/logic/code" code="RoleProcedure.queryFunPermissionsByRole">
    <parameter name="roleID" type="String"/>
  </procedure>
</model>
