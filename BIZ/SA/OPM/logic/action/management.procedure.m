<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">
	<procedure name="appendManagementsProcedure" code-model="/SA/OPM/logic/code"
		code="ManagementProcedure.appendManagements">
		<parameter name="manageTypeID" type="String" />
		<parameter name="orgID" type="String" />
		<parameter name="manageOrgIDs" type="List" />
	</procedure>
	<procedure name="deleteManagementsProcedure" code-model="/SA/OPM/logic/code"
		code="ManagementProcedure.deleteManagements">
		<parameter name="managements" type="Map" />
	</procedure>
</model>