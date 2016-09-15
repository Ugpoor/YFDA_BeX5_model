<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">
	<action name="queryWorkTaskAction" procedure="taskQueryProcedure">
		<private name="concept" type="String" value="SA_WorkTask"/>
		<public name="idColumn" type="String" value="SA_WorkTask"/>
		<private name="select" type="String" value="SA_WorkTask.*"/>
		<private name="from" type="String" value="SA_WorkTask SA_WorkTask"/>
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

	<action name="saveWorkTaskAction" procedure="bizSaveProcedure">
		<private name="concept" type="String" value="SA_WorkTask"/>
		
		<protected name="readOnly" type="String"/>
		<protected name="notNull" type="String"/>
		<public name="table" type="Table"/>
		<private name="dataModel" type="String" value="/SA/task/data"/>
	<permission name="insertRange" type="List"/><permission name="deleteRange" type="List"/><permission name="updateRange" type="List"/><private name="fnModel" type="String" value="/system/logic/fn"/></action>
	
	<action name="createWorkTaskAction" procedure="bizCreateProcedure">
		<private name="concept" type="String" value="SA_WorkTask"/>
		<public name="table" type="Table"/>
		<public name="defaultValues" type="Map"/>
		<private name="fnModel" type="String"/>
	</action>



</model>