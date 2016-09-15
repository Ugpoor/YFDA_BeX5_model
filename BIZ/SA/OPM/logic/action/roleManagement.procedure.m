<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="appendRoleManagementsProcedure" code-model="/SA/OPM/logic/code" code="RoleManagementProcedure.appendRoleManagements"> 
    <parameter name="orgID" type="String"/>  
    <parameter name="roleIDs" type="List"/> 
  </procedure>  
  <procedure name="deleteRoleManagementsProcedure" code-model="/SA/OPM/logic/code" code="RoleManagementProcedure.deleteRoleManagements">
    <parameter name="roleManagements" type="Map"/>
  </procedure>
</model>
