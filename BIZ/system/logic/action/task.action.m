<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">
	<action global="false" name="queryImportanceAction" procedure="bizQueryProcedure">
		<private name="concept" type="String" value="SA_Importance"/>
		<public name="idColumn" type="String" value="SA_Importance"/>
		<private name="select" type="String" value="SA_Importance.*"/>
		<private name="from" type="String" value="SA_Importance SA_Importance"/>
		<private name="aggregate" type="String"/>
		<protected name="condition" type="String" value=""/>
		<permission name="range" type="List"/>
		<public name="filter" type="String"/>
		<public name="limit" type="Integer"/>
		<public name="offset" type="Integer"/>
		<public name="distinct" type="Boolean"/>
		<public name="columns" type="String"/>
		<public name="orderBy" type="String"/>
		<public name="aggregateColumns" type="String"/>
		<public name="variables" type="Map"/>
		<private name="fnModel" type="String"/>
		<private name="dataModel" type="String" value="/system/data"/>
	</action>
	
	<action name="queryEmergencyAction" procedure="bizQueryProcedure">
		<private name="concept" type="String" value="SA_Emergency"/>
		<public name="idColumn" type="String" value="SA_Emergency"/>
		<private name="select" type="String" value="SA_Emergency.*"/>
		<private name="from" type="String" value="SA_Emergency SA_Emergency"/>
		<private name="aggregate" type="String"/>
		<protected name="condition" type="String" value=""/>
		<permission name="range" type="List"/>
		<public name="filter" type="String"/>
		<public name="limit" type="Integer"/>
		<public name="offset" type="Integer"/>
		<public name="distinct" type="Boolean"/>
		<public name="columns" type="String"/>
		<public name="orderBy" type="String"/>
		<public name="aggregateColumns" type="String"/>
		<public name="variables" type="Map"/>
		<private name="fnModel" type="String"/>
		<private name="dataModel" type="String" value="/system/data"/>
	</action>

	<action name="queryStatusAction" procedure="bizQueryProcedure">
		<private name="concept" type="String" value="SA_TaskStatus"/>
		<public name="idColumn" type="String" value="SA_TaskStatus"/>
		<private name="select" type="String" value="SA_TaskStatus.*"/>
		<private name="from" type="String" value="SA_TaskStatus SA_TaskStatus"/>
		<private name="aggregate" type="String"/>
		<protected name="condition" type="String" value=""/>
		<permission name="range" type="List"/>
		<public name="filter" type="String"/>
		<public name="limit" type="Integer"/>
		<public name="offset" type="Integer"/>
		<public name="distinct" type="Boolean"/>
		<public name="columns" type="String"/>
		<public name="orderBy" type="String"/>
		<public name="aggregateColumns" type="String"/>
		<public name="variables" type="Map"/>
		<private name="fnModel" type="String"/>
		<private name="dataModel" type="String" value="/system/data"/>
	</action>
	
	
	<action name="queryTaskTypeAction" procedure="bizQueryProcedure">
		<private name="concept" type="String" value="SA_TaskType"/>
		<public name="idColumn" type="String" value="SA_TaskType"/>
		<private name="select" type="String" value="SA_TaskType.*"/>
		<private name="from" type="String" value="SA_TaskType SA_TaskType"/>
		<private name="aggregate" type="String"/>
		<protected name="condition" type="String" value=""/>
		<permission name="range" type="List"/>
		<public name="filter" type="String"/>
		<public name="limit" type="Integer"/>
		<public name="offset" type="Integer"/>
		<public name="distinct" type="Boolean"/>
		<public name="columns" type="String"/>
		<public name="orderBy" type="String"/>
		<public name="aggregateColumns" type="String"/>
		<public name="variables" type="Map"/>
		<private name="fnModel" type="String"/>
		<private name="dataModel" type="String" value="/system/data"/>
	</action>

	

<action global="true" name="queryTaskAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="SA_Task"/>
<private name="select" type="String" value="SA_Task.*"/>
<private name="from" type="String" value="SA_Task SA_Task"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/system/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="SA_Task"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action global="true" name="saveTaskAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="SA_Task"/>
<private name="dataModel" type="String" value="/system/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action global="true" name="createTaskAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="SA_Task"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>