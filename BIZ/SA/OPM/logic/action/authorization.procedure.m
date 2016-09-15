<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryOPAuthorizePermissionByOrgProcedure" code-model="/SA/OPM/logic/code" code="AuthorizationProcedure.queryOPAuthorizePermissionByOrg"> 
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
    <parameter name="orgFID" type="String"/>  
    <parameter name="includeInherited" type="Boolean"/> 
  </procedure>  
  <procedure name="appendAuthorizesProcedure" code-model="/SA/OPM/logic/code" code="AuthorizationProcedure.appendAuthorizes"> 
    <parameter name="orgIDs" type="List"/>  
    <parameter name="roleIDs" type="List"/> 
  </procedure>  
  <procedure name="deleteAuthorizesProcedure" code-model="/SA/OPM/logic/code" code="AuthorizationProcedure.deleteAuthorizes"> 
    <parameter name="authorizes" type="Map"/> 
  </procedure>  
  <procedure name="queryOPAuthorizeByRoleProcedure" code-model="/SA/OPM/logic/code" code="AuthorizationProcedure.queryOPAuthorizeByRole"> 
    <parameter name="concept" type="String"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="range" type="List"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="roleID" type="String"/>  
    <parameter name="includeRoleChildren" type="Boolean"/>  
    <parameter name="graded" type="Boolean"/> 
  </procedure>  
  <procedure name="queryOrgByPermissionProcedure" code-model="/SA/OPM/logic/code" code="AuthorizationProcedure.queryOrgByPermission">
    <parameter name="concept" type="String"/>
    <parameter name="idColumn" type="String"/>
    <parameter name="select" type="String"/>
    <parameter name="from" type="String"/>
    <parameter name="condition" type="String"/>
    <parameter name="range" type="List"/>
    <parameter name="filter" type="String"/>
    <parameter name="distinct" type="Boolean"/>
    <parameter name="offset" type="Integer"/>
    <parameter name="limit" type="Integer"/>
    <parameter name="columns" type="String"/>
    <parameter name="orderBy" type="String"/>
    <parameter name="aggregate" type="String"/>
    <parameter name="aggregateColumns" type="String"/>
    <parameter name="variables" type="Map"/>
    <parameter name="dataModel" type="String"/>
    <parameter name="fnModel" type="String"/>
    <parameter name="process" type="String"/>
    <parameter name="activity" type="String"/>
    <parameter name="graded" type="Boolean"/>
  </procedure>
</model>
