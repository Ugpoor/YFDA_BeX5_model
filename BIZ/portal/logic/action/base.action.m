<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<model xmlns="http://www.justep.com/model">
	<action name="queryMessageAction" procedure="queryMessageProcedure">
		<permission name="range" type="List" />
		<private name="concept" type="String" value="Portal_Message" />
		<private name="select" type="String" value="Portal_Message.*" />
		<private name="from" type="String" value="Portal_Message Portal_Message" />
		<private name="aggregate" type="String" />
		<private name="dataModel" type="String" value="/portal/data" />
		<private name="fnModel" type="String" />
		<protected name="condition" type="String" />
		<public name="distinct" type="Boolean" value="false" />
		<public name="idColumn" type="String" value="Portal_Message" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="aggregateColumns" type="String" />
		<public name="variables" type="Map" />
	</action>
	<action name="queryWaitMessageAction" procedure="queryWaitMessageProcedure">
		<permission name="range" type="List" />
		<private name="concept" type="String" value="Portal_Message" />
		<private name="select" type="String" value="Portal_Message.*" />
		<private name="from" type="String" value="Portal_Message Portal_Message" />
		<private name="aggregate" type="String" />
		<private name="dataModel" type="String" value="/portal/data" />
		<private name="fnModel" type="String" />
		<protected name="condition" type="String" />
		<public name="distinct" type="Boolean" value="false" />
		<public name="idColumn" type="String" value="Portal_Message" />
		<public name="filter" type="String" />
		<public name="limit" type="Integer" />
		<public name="offset" type="Integer" />
		<public name="columns" type="String" />
		<public name="orderBy" type="String" />
		<public name="aggregateColumns" type="String" />
		<public name="variables" type="Map" />
	</action>
</model>