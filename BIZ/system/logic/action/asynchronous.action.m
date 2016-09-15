<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
	<action name="createRemindTaskAction" global="true"
		procedure="createRemindProcedure">
		<label language="zh_CN">创建提醒消息</label>
		<public name="sid" type="String" />
	</action>
	<action name="queryIdByNameAction" procedure="sqlQueryProcedure">
		<public name="sql" type="Map" />
		<public name="dataModel" type="String" value="/system/data" />
		<label language="zh_CN">查询用户ID</label>
	</action>

	<action name="queryOrgInfoForPushManagerAction" global="true"
		procedure="queryOrgInfoForPushManagerProcedure">
		<label language="zh_CN">获取组织信息</label>
	</action>
	<action name="registerTerminalAction" global="true" procedure="registerTerminalProcedure">
		<public name="type" type="String" />
		<public name="terminalID" type="String"/>
		<public name="personID" type="String" required="false"/>
		<public name="protocol" type="String"/>
		<label language="zh_CN">注册终端</label>
	</action>
	<action name="unRegisterTerminalAction" global="true" procedure="unRegisterTerminalProcedure">
		<public name="type" type="String" />
		<public name="terminalID" type="String"/>
		<public name="personID" type="String" required="false"/>
		<public name="protocol" type="String"/>
		<label language="zh_CN">取消终端</label>
	</action>


</model>
