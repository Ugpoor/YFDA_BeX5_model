<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<procedure name="externalStartProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.startProcessQuery">
		<parameter name="process" type="String"/>
		<parameter name="attributes" type="Map"/>
		<parameter name="tokens" type="List"/>
		<parameter name="executor" type="String"/>
		<parameter name="creator" type="String"/>
	</procedure>

	<procedure name="externalStartProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.startProcess">
		<parameter name="process" type="String"/>
		<parameter name="attributes" type="Map"/>
		<parameter name="control" type="Object"/>
		<parameter name="tokens" type="List"/>
		<parameter name="executor" type="String"/>
		<parameter name="creator" type="String"/>
	</procedure>
	
	<procedure name="externalAdvanceProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.advanceProcessQuery">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="externalAdvanceProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.advanceProcess">
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="externalBackProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.backProcessQuery">
		<parameter name="task" type="String"/>
		<parameter name="backRange" type="String"/>
	</procedure>

	<procedure name="externalBackProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.backProcess">
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="externalAbortProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.abortProcessQuery">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="externalAbortProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.abortProcess">
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="externalSuspendProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.suspendProcessQuery">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="externalSuspendProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.suspendProcess">
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>
	
	<procedure name="externalTransferTaskQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.transferTaskQuery">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="externalTransferTaskProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.transferTask">
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>

	<procedure name="externalSpecialProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.specialProcessQuery">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="externalSpecialProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.specialProcess">
		<parameter name="task" type="String"/>
		<parameter name="control" type="Object"/>
	</procedure>

	
	<procedure name="externalFinishProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.finishProcess">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="externalResumeProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.resumeProcess">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="externalStartCustomizedProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.startCustomizedProcess">
		<parameter name="task" type="String"/>
		<parameter name="template" type="String"/>
	</procedure>
	
	<procedure name="externalCancelCustomizedProcessProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.cancelCustomizedProcess">
		<parameter name="task" type="String"/>
	</procedure>
	
	<procedure name="externalStartCustomizedProcessQueryProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.startCustomizedProcessQuery">
		<parameter name="task" type="String"/>
	</procedure>

	<procedure name="externalWithdrawTaskProcedure"
		code-model="/system/logic/code"
		code="ExternalProcessProcedure.withdrawTask">
		<parameter name="task" type="String"/>
	</procedure>
	
	
</model>