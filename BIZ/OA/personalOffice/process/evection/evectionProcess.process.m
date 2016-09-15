<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="evectionProcess">
		<label language="zh_CN">出差管理</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">出差管理</label>
		</static-activity>
	























































<has-action action="queryOA_EvectionAction" access-permission="public"></has-action>
<has-action action="saveOA_EvectionAction" access-permission="public"></has-action>
<listener action="saveOA_EvectionAction" event="after" handler="evectionProcessAfterSaveOA_EvectionActionProcedure"></listener>
<has-action action="createOA_EvectionAction" access-permission="public"></has-action>
<has-action action="queryOA_EvectionPlaceAction" access-permission="public"></has-action>
<has-action action="saveOA_EvectionPlaceAction" access-permission="public"></has-action>
<has-action action="createOA_EvectionPlaceAction" access-permission="public"></has-action>
<has-action action="queryOA_EvectionOpAction" access-permission="public"></has-action>
<has-action action="queryOA_EvectionClAction" access-permission="public"></has-action>
<has-action action="queryOA_Evection1AllAction" access-permission="public"></has-action>
</process>
</model>