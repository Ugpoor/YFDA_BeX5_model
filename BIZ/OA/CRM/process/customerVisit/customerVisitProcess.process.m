<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="customerVisitProcess">
		<label language="zh_CN">客户拜访</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">客户拜访</label>
		</static-activity>
	







































<has-action action="queryOA_CustomerVisitAction" access-permission="public"></has-action>
<has-action log-enabled="true" action="saveOA_CustomerVisitAction" access-permission="public"></has-action>
<listener action="saveOA_CustomerVisitAction" event="before" handler="customerVisitProcessBeforeSaveOA_CustomerVisitActionProcedure"></listener>
<has-action action="createOA_CustomerVisitAction" access-permission="public"></has-action>
<has-action action="queryOA_CustomerLetterAction" access-permission="public"></has-action>
<has-action action="queryOA_CustomerVisitRecentAction" access-permission="public"></has-action>
<has-action action="queryOA_CustomerVisitAgoAction" access-permission="public"></has-action>
</process>
</model>
