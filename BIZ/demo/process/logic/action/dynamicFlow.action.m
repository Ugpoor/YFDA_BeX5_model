<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model"><action global="true" name="queryDEMO_Dynamic_FlowsAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_Dynamic_Flows"/>
<private name="select" type="String" value="DEMO_Dynamic_Flows.*"/>
<private name="from" type="String" value="DEMO_Dynamic_Flows DEMO_Dynamic_Flows"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/process/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_Dynamic_Flows"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action global="true" name="saveDEMO_Dynamic_FlowsAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_Dynamic_Flows"/>
<private name="dataModel" type="String" value="/demo/process/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action global="true" name="createDEMO_Dynamic_FlowsAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_Dynamic_Flows"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action global="true" name="queryDEMO_Dynamic_LeaveApplyAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="DEMO_Dynamic_LeaveApply"/>
<private name="select" type="String" value="DEMO_Dynamic_LeaveApply.*"/>
<private name="from" type="String" value="DEMO_Dynamic_LeaveApply DEMO_Dynamic_LeaveApply"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/demo/process/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="DEMO_Dynamic_LeaveApply"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action global="true" name="saveDEMO_Dynamic_LeaveApplyAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="DEMO_Dynamic_LeaveApply"/>
<private name="dataModel" type="String" value="/demo/process/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action global="true" name="createDEMO_Dynamic_LeaveApplyAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="DEMO_Dynamic_LeaveApply"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>



</model>