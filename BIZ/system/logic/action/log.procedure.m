<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<procedure name="getActionsProcedure"
		code-model="/system/logic/code"
		code="LogProcedure.getActions">
		<parameter name="processes" type="Xml"/>
	</procedure>
	<procedure name="logProcedure"
		code-model="/system/logic/code"
		code="LogProcedure.log">
		<parameter name="actionName" type="String"/>
		<parameter name="parameters" type="String"/>
		<parameter name="result" type="String"/>
		<parameter name="typeName" type="String"/>
		<parameter name="description" type="String"/>
	</procedure>
	<procedure name="enableLogSettingProcedure"
		code-model="/system/logic/code"
		code="LogProcedure.enableLogSetting">
	</procedure>
</model>