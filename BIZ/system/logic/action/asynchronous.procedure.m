<?xml version="1.0" encoding="utf-8"?>


<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">
	<procedure name="queryOrgInfoForPushManagerProcedure"
		code-model="/system/logic/code" code="AsyncProcedure.queryOrgInfoForPushManager" />
	<procedure name="createRemindProcedure" code-model="/system/logic/code"
		code="com.justep.system.asynchronous.CreateRemindTask.create">
		<parameter name="sid" type="String" />
	</procedure>
	<procedure name="registerTerminalProcedure" code-model="/system/logic/code"
		code="AsyncProcedure.registerTerminal">
		<parameter name="type" type="String" />
		<parameter name="terminalID" type="String" />
		<parameter name="personID" type="String" />
		<parameter name="protocol" type="String" />
	</procedure>
	<procedure name="unRegisterTerminalProcedure" code-model="/system/logic/code"
		code="AsyncProcedure.registerTerminal">
		<parameter name="type" type="String" />
		<parameter name="terminalID" type="String" />
		<parameter name="personID" type="String" />
		<parameter name="protocol" type="String" />
	</procedure>
</model>
