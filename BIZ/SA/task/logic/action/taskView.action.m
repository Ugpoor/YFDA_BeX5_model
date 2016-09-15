<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<action name="querySubmitTaskAction" procedure="querySubmitTaskProcedure"/>
	
	<action name="queryWaitTaskAction" procedure="queryWaitTaskProcedure"/>
	
	<action name="queryTaskSummaryAction" procedure="queryTaskSummaryProcedure"/>
	
	<action name="queryWaitTask2Action" procedure="queryWaitTask2Procedure">
		<private name="concept" type="String" value="SA_Task"/>
		<public name="idColumn" type="String" value="SA_Task"/>
		<private name="select" type="String" value="SA_Task.*"/>
		<private name="from" type="String" value="SA_Task SA_Task"/>
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
	
	<action name="querySubmitTask2Action" procedure="querySubmitTask2Procedure">
		<private name="concept" type="String" value="SA_Task"/>
		<public name="idColumn" type="String" value="SA_Task"/>
		<private name="select" type="String" value="SA_Task.*"/>
		<private name="from" type="String" value="SA_Task SA_Task"/>
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
	
<action name="queryWaitMessageAction" global="false" procedure="queryWaitMessageProcedure"></action>
<action name="querySubmitMessageAction" global="false" procedure="querySubmitMessageProcedure"></action>
</model>