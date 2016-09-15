<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="managementProcess">
		<label language="zh_CN">管理权限</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">管理权限</label>
		</static-activity>
	










<has-action action="querySendDocAction" access-permission="public"></has-action>
<listener action="querySendDocAction" event="before" handler="managementProcessBeforeQuerySendDocActionProcedure"></listener>
</process>
</model>
