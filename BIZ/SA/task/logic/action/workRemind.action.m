<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">
	<action name="queryWorkRemindAction" procedure="taskQueryProcedure">
		<private name="concept" type="String" value="SA_WorkRemind"/>
		<public name="idColumn" type="String" value="SA_WorkRemind"/>
		<private name="select" type="String" value="SA_WorkRemind.*"/>
		<private name="from" type="String" value="SA_WorkRemind SA_WorkRemind"/>
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
		<private name="dataModel" type="String" value="/SA/task/data"/>
		<public type="String" name="status" required="false"/>
		<public type="String" required="false" name="org"/>
	</action>

	<action name="saveWorkRemindAction" procedure="bizSaveProcedure">
		<private name="concept" type="String" value="SA_WorkRemind"/>
		
		<protected name="readOnly" type="String"/>
		<protected name="notNull" type="String"/>
		<public name="table" type="Table"/>
		<private name="dataModel" type="String" value="/SA/task/data"/>
	<permission name="insertRange" type="List"/><permission name="deleteRange" type="List"/><permission name="updateRange" type="List"/><private name="fnModel" type="String" value="/system/logic/fn"/></action>
	
	<action name="createWorkRemindAction" procedure="bizCreateProcedure">
		<private name="concept" type="String" value="SA_WorkRemind"/>
		<public name="table" type="Table"/>
		<public name="defaultValues" type="Map"/>
		<private name="fnModel" type="String"/>
	</action>



</model>