<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="loginProcedure" code-model="/system/logic/code" code="OPMProcedure.login"> 
    <parameter name="name" type="String"/>  
    <parameter name="loginDate" type="Date"/>  
    <parameter name="pwd" type="String"/>  
    <parameter name="lang" type="String"/>  
    <parameter name="ip" type="String"/>  
    <parameter name="options" type="Map"/> 
  </procedure>  
  <procedure name="updatePersonNumProcedure" code-model="/system/logic/code" code="OPMProcedure.updatePersonNum"> 
    <parameter name="num" type="Integer"/>  
    <parameter name="personID" type="String"/>  
  </procedure>  
  <procedure name="ntLoginProcedure" code-model="/system/logic/code" code="OPMProcedure.ntLogin"> 
    <parameter name="name" type="String"/>  
    <parameter name="loginDate" type="String"/>  
    <parameter name="lang" type="String"/>  
    <parameter name="ip" type="String"/>  
    <parameter name="options" type="Map"/> 
  </procedure>  
  <procedure name="logoutProcedure" code-model="/system/logic/code" code="OPMProcedure.logout"> 
    <parameter name="sessionID" type="String"/> 
  </procedure>  
  <procedure name="changePasswordProcedure" code-model="/system/logic/code" code="OPMProcedure.changePassword"> 
    <parameter name="name" type="String"/>  
    <parameter name="opwd" type="String"/>  
    <parameter name="npwd" type="String"/> 
  </procedure>  
  <procedure name="recoverPasswordProcedure" code-model="/system/logic/code" code="OPMProcedure.recoverPassword"> 
    <parameter name="code" type="String"/> 
  </procedure>  
  <procedure name="queryOrgProcedure" code-model="/system/logic/code" code="OPMProcedure.query"> 
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
    <parameter name="manageCodes" type="String"/>  
    <parameter name="includeChildrenOfManage" type="Boolean"/>  
    <parameter name="includePersonPhotoLastModified" type="Boolean"/>  
    <parameter name="cacheFilter" type="Map"/>  
    <parameter name="includeChildren" type="Integer"/> 
  </procedure>  
  <procedure name="queryOrgsByResourceProcedure" code-model="/system/logic/code" code="OPMProcedure.queryOrgsByResource"> 
    <parameter name="resourceID" type="String"/>  
    <parameter name="typeID" type="String"/>  
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/>  
    <parameter name="action" type="String"/> 
  </procedure>  
  <procedure name="saveResourceControl2Procedure" code-model="/system/logic/code" code="OPMProcedure.saveResourceControl2"> 
    <parameter name="resourceID" type="String"/>  
    <parameter name="typeID" type="String"/>  
    <parameter name="typeName" type="String"/>  
    <parameter name="newOrgs" type="Map"/>  
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/>  
    <parameter name="action" type="String"/> 
  </procedure>  
  <procedure name="checkPermissionProcedure" code-model="/system/logic/code" code="OPMProcedure.checkPermission"> 
    <parameter name="permissions" type="List"/> 
  </procedure>  
  <procedure name="queryOnlineUserProcedure" code-model="/system/logic/code" code="OPMProcedure.queryOnlineUser"/>  
  <procedure name="loadRegistUserProcedure" code-model="/system/logic/code" code="OPMProcedure.loadRegistUser"/>  
  <procedure name="queryOrgCommonGroupProcedure" code-model="/system/logic/code" code="OPMProcedure.queryOrgCommonGroup"> 
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
    <parameter name="parentID" type="String"/> 
  </procedure>  
  <procedure name="getOrgKindsProcedure" code-model="/system/logic/code" code="OPMProcedure.getOrgKinds"/>  
  <procedure name="updateOrgVersionProcedure" code-model="/system/logic/code" code="OPMProcedure.updateOrgVersion"/>  
  <procedure name="getDisabledActionsProcedure" code-model="/system/logic/code" code="OPMProcedure.getDisabledActions">
    <parameter name="process" type="String"/>
    <parameter name="activity" type="String"/>
  </procedure>
</model>
