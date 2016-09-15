<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
  <action name="queryDEMO_ProjectAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_Project"/>  
    <private name="select" type="String" value="DEMO_Project.*"/>  
    <private name="from" type="String" value="DEMO_Project DEMO_Project"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_Project"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_ProjectAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_Project"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_ProjectAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="DEMO_Project"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_ProjectPlanAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_ProjectPlan"/>  
    <private name="select" type="String" value="DEMO_ProjectPlan.*,DEMO_Project.fProjectCode as ProjectCode,DEMO_Project.fProjectName as ProjectName"/>  
    <private name="from" type="String" value="DEMO_ProjectPlan DEMO_ProjectPlan  optional  join DEMO_Project DEMO_Project on DEMO_Project = DEMO_ProjectPlan.fProjectID"/>  
    <private name="aggregate" type="String" value="Min(DEMO_ProjectPlan.fStartDate) as MinDate,Max(DEMO_ProjectPlan.fEndDate) as MaxDate"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_ProjectPlan"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String" value="MinDate,MaxDate"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_ProjectPlanAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_ProjectPlan"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_ProjectPlanAction" procedure="createDEMO_ProjectPlanProcedure"> 
    <public name="table" type="Table"/>  
    <private name="concept" type="String" value="DEMO_ProjectPlan"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <public name="myParam" required="true" type="String"/> 
  </action>  
  <action name="queryDEMO_BookViewAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_BookView"/>  
    <private name="select" type="String" value="DEMO_BookView.*"/>  
    <private name="from" type="String" value="DEMO_BookView DEMO_BookView"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_BookView"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_BookViewAction" procedure="saveDEMO_BookViewProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_BookView"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_BookViewAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="DEMO_BookView"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_BookXMLAction" procedure="queryDEMO_BookXMLProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_BookXML"/>  
    <private name="select" type="String" value="DEMO_BookXML.*"/>  
    <private name="from" type="String" value="DEMO_BookXML DEMO_BookXML"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_BookXML"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_BookXMLAction" procedure="saveDEMO_BookXMLProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_BookXML"/>  
    <private name="dataModel" type="String" value="/demo/actions/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_BookXMLAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="DEMO_BookXML"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action> 
</model>