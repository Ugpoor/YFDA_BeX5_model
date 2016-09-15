<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryOPOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.queryOPOrg"> 
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
    <parameter name="manageFilterMode" type="String"/>  
    <parameter name="splitFullIDCodeName" type="Boolean"/> 
  </procedure>  
  <procedure name="saveOPOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.saveOPOrg"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="createOPOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.createOPOrg"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="defaultValues" type="Map"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="queryOPPersonProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.queryOPPerson"> 
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
  </procedure>  
  <procedure name="saveOPPersonProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.saveOPPerson"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="createOPPersonProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.createOPPerson"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="defaultValues" type="Map"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="disableOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.disableOrg"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/> 
  </procedure>  
  <procedure name="enableOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.enableOrg"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/>  
    <parameter name="enableSlavePsm" type="Boolean"/> 
  </procedure>  
  <procedure name="logicDeleteOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.logicDeleteOrg"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/> 
  </procedure>  
  <procedure name="restoreOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.restoreOrg"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/>  
    <parameter name="restoreSlavePsm" type="Boolean"/> 
  </procedure>  
  <procedure name="physicalDeleteOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.physicalDeleteOrg"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/>  
    <parameter name="deletePerson" type="Boolean"/> 
  </procedure>  
  <procedure name="sortOrgsProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.sortOrgs"> 
    <parameter name="ids" type="List"/>  
    <parameter name="versions" type="List"/>  
    <parameter name="parentID" type="String"/> 
  </procedure>  
  <procedure name="moveOrgProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.moveOrg"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/>  
    <parameter name="newParentID" type="String"/> 
  </procedure>  
  <procedure name="assignPersonProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.assignPerson"> 
    <parameter name="personIDs" type="List"/>  
    <parameter name="orgID" type="String"/>  
    <parameter name="psmValidState" type="Integer"/>  
    <parameter name="autoEnableOldPsm" type="Boolean"/> 
  </procedure>  
  <procedure name="resetPasswordProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.resetPassword"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/> 
  </procedure>  
  <procedure name="changePersonMainOrgProcedure" code-model="/SA/OPM/logic/code"
    code="OrgProcedure.changePersonMainOrg"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/>  
    <parameter name="newMainOrgID" type="String"/>  
    <parameter name="disableOldMasterPsm" type="Boolean"/> 
  </procedure>  
  <procedure name="enableSlavePsmProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.enableSlavePsm"> 
    <parameter name="psmID" type="String"/>  
    <parameter name="psmVersion" type="Integer"/>  
    <parameter name="personID" type="String"/> 
  </procedure>  
  <procedure name="physicalDeletePersonProcedure" code-model="/SA/OPM/logic/code"
    code="OrgProcedure.physicalDeletePerson"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/> 
  </procedure>  
  <procedure name="restorePersonProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.restorePerson"> 
    <parameter name="id" type="String"/>  
    <parameter name="version" type="Integer"/>  
    <parameter name="restoreSlavePsm" type="Boolean"/>  
    <parameter name="newMainOrgID" type="String"/> 
  </procedure>  
  <procedure name="getCurrentPersonMainFIDProcedure" code-model="/SA/OPM/logic/code"
    code="OrgProcedure.getCurrentPersonMainFID"/>  
  <procedure name="physicalDeleteAllProcedure" code-model="/SA/OPM/logic/code" code="OrgProcedure.physicalDeleteAll"/> 
</model>
