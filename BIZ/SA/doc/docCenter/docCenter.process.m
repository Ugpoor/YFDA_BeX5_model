<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model">
  <process name="docCenterProcess">
		<label language="zh_CN">文档中心</label>
		
		
		
		
		
		
		
		<!--<has-action action="personGQueryAction" />-->
		
		
		
		
		
		
		
		<static-activity name="mainActivity">
			<label language="zh_CN">文档中心活动</label>
		</static-activity>
		<static-activity name="docPermissionViewActivity">
			<label language="zh_CN">文档权限属性</label>
		</static-activity>
	<has-action action="queryDocNodeAction" access-permission="public"></has-action>
<has-action action="createDocNodeAction" access-permission="public"></has-action>
<has-action action="saveDocNodeAction" access-permission="public"></has-action>
<has-action action="queryAuthAction" access-permission="public"></has-action>
<has-action action="createAuthAction" access-permission="public"></has-action>
<has-action action="saveAuthAction" access-permission="public"></has-action>
<has-action action="queryOrgAction" access-permission="public"></has-action>
<has-action action="queryPermissionAction" access-permission="public"></has-action>
<has-action action="queryNameSpaceAction" access-permission="public"></has-action>
<has-action action="queryDocAction" access-permission="public"></has-action>
<has-action action="addAccessRecordAction" access-permission="public"></has-action>
<has-action action="dispatchOptAction" access-permission="public"></has-action>
<has-action action="ksqlQueryAction" access-permission="public"></has-action>
<has-action action="querySA_DocAuthAction" access-permission="public"></has-action>
<has-action action="saveSA_DocAuthAction" access-permission="public"></has-action>
<has-action action="createSA_DocAuthAction" access-permission="public"></has-action>
</process>
</model>
