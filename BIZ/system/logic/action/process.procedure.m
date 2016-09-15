<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	
	<procedure name="getTaskGanttProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.getTaskGantt">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="backupTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.backupTask">
	</procedure>
	<procedure name="resetTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.resetTask">
	</procedure>
	<procedure name="archiveProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.archiveProcess">
		<parameter name="begin" type="Date"/>
		<parameter name="end" type="Date"/>
	</procedure>
	<procedure name="startProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.startProcessQuery">
		<before code="ProcessProcedure.beforeStartProcessQuery"/>
		<parameter name="process" type="String"/>
		<parameter name="attributes" type="Map"/>
		<parameter name="tokens" type="List"/>
		<parameter name="executor" type="String"/>
		<parameter name="creator" type="String"/>
	</procedure>

	<procedure name="startProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.startProcess">
		<before code="ProcessProcedure.beforeStartProcess"/>
		<parameter name="process" type="String"/>
		<parameter name="attributes" type="Map"/>
		<parameter name="control" type="Object"/>
		<parameter name="tokens" type="List"/>
		<parameter name="executor" type="String"/>
		<parameter name="creator" type="String"/>
	</procedure>
	
	<procedure name="advanceProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.advanceProcessQuery">
		<before code="ProcessProcedure.beforeAdvanceProcessQuery"/>
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="advanceProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.advanceProcess">
		<before code="ProcessProcedure.beforeAdvanceProcess"/>
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="backProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.backProcessQuery">
		<before code="ProcessProcedure.beforeBackProcessQuery"/>
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="backProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.backProcess">
		<before code="ProcessProcedure.beforeBackProcess"/>
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="abortProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.abortProcessQuery">
		<before code="ProcessProcedure.beforeAbortProcessQuery"/>
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="abortProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.abortProcess">
		<before code="ProcessProcedure.beforeAbortProcess"/>
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="suspendProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.suspendProcessQuery">
		<before code="ProcessProcedure.beforeSuspendProcessQuery"/>
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="suspendProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.suspendProcess">
		<before code="ProcessProcedure.beforeSuspendProcess"/>
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>

	<procedure name="specialProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.specialProcessQuery">
		<before code="ProcessProcedure.beforeSpecialProcessQuery"/>
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="specialProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.specialProcess">
		<before code="ProcessProcedure.beforeSpecialProcess"/>
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="transferTaskQueryProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.transferTaskQuery">
		<before code="ProcessProcedure.beforeTransferTaskQuery"/>
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="transferTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.transferTask">
		<before code="ProcessProcedure.beforeTransferTask"/>
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="finishProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.finishProcess">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="resumeProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.resumeProcess">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="queryAllBusinessActivityProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.queryAllBusinessActivity">
		<parameter name="process" type="String"/>
		<parameter name="template" type="String"/>
	</procedure>

	<procedure name="queryAllBusinessActivity2Procedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.queryAllBusinessActivity2">
		<parameter name="range" type="Xml"/>
	</procedure>

	<procedure name="queryProcessProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.queryProcess">
		<parameter name="type" type="String"/>
		<parameter name="range" type="Xml"/>
	</procedure>
	
	<procedure name="queryTaskDataProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.queryTaskData">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="withdrawTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.withdrawTask">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="executeTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.executeTask">
		<parameter name="task" type="String"/>
		<parameter name="executor" type="String"/>
	</procedure>

	<procedure name="premmptTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.premmptTask">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="queryOrgUnitChildrenProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.queryOrgUnitChildren">
		<parameter name="id" type="String"/>
	</procedure>
	
	<procedure name="filterOrgUnitProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.filterOrgUnit">
		<parameter name="range" type="Xml"/>
		<parameter name="condition" type="String"/>
	</procedure>
	
	<procedure name="getProcessChartByPIProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.getProcessChartByPI">
		<parameter name="pi" type="String"/>
		<parameter name="ext" type="String"/>
	</procedure>
	
	<procedure name="getProcessChartByTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.getProcessChartByTask">
		<parameter name="task" type="String"/>
		<parameter name="ext" type="String"/>
	</procedure>

	<procedure name="getProcessChartByDataProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.getProcessChartByData">
		<parameter name="process" type="String"/>
		<parameter name="data" type="String"/>
		<parameter name="ext" type="String"/>
	</procedure>
	
	<procedure name="finishTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.finishTask">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="modifyTaskExecutorProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.modifyTaskExecutor">
		<parameter name="task" type="String"/>
		<parameter name="fid" type="String"/>
		<parameter name="fname" type="String"/>
	</procedure>
	
	
	<procedure name="createCommonTaskProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.createCommonTask">
		<parameter name="name" type="String"/>
		<parameter name="process" type="String"/>
		<parameter name="activity" type="String"/>
		<parameter name="sCURL" type="String"/>
		<parameter name="sEURL" type="String"/>
		<parameter name="sData1" type="String"/>
		<parameter name="executors" type="List"/>
		<parameter name="options" type="Map"/>
	</procedure>
	
	<procedure name="canModifyExecutorProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.canModifyExecutor">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="modifyExecutorProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.modifyExecutor">
		<parameter name="task" type="String"/>
		<parameter name="fid" type="String"/>
		<parameter name="check" type="Boolean"/>
	</procedure>
	
	<procedure name="queryProcessExecuteListProcedure"
		code-model="/system/logic/code"
		code="ProcessProcedure.queryProcessExecuteList">
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
		<parameter name="shardCondition" type="String"/>
	</procedure>
	
</model>