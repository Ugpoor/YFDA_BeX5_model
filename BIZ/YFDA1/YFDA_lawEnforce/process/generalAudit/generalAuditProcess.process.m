<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="generalAuditProcess" start="start1" end="end1">
		<label language="zh_CN">通用审批</label>
		<static-activity name="generalAudit">
			<label language="zh_CN">通用审批</label>
		




































<has-action action="queryYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="createYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="queryYF_ApplierAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplierAction" access-permission="public"></has-action>
<has-action action="createYF_ApplierAction" access-permission="public"></has-action>
<has-action action="queryYF_AcceAction" access-permission="public"></has-action>
<has-action action="saveYF_AcceAction" access-permission="public"></has-action>
<has-action action="createYF_AcceAction" access-permission="public"></has-action>
<has-action action="queryYF_mainApplicationAction" access-permission="public"></has-action>
<has-action action="saveYF_mainApplicationAction" access-permission="public"></has-action>
<has-action action="createYF_mainApplicationAction" access-permission="public"></has-action>
</static-activity>
	<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>
<business-activity name="audit" condition="true"><label language="zh_CN">审批</label>
<input name="x" unit="start1"></input>
<output name="x" unit="passAudit"></output>









































<has-action action="queryYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="queryYF_ApplierAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplierAction" access-permission="public"></has-action>
<has-action action="queryYF_AcceAction" access-permission="public"></has-action>
<has-action action="saveYF_AcceAction" access-permission="public"></has-action>
<has-action action="queryYF_mainApplicationAction" access-permission="public"></has-action>
<has-action action="saveYF_mainApplicationAction" access-permission="public"></has-action>
<has-action action="createYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="createYF_ApplierAction" access-permission="public"></has-action>
<has-action action="createYF_AcceAction" access-permission="public"></has-action>
</business-activity>
<if-else-activity name="passAudit" condition="true"><label language="zh_CN">是否通过</label>
<input name="x" unit="audit"></input>
<true-output name="x" unit="latterTask"></true-output>

<false-output name="x" unit="end1"></false-output>
</if-else-activity>
<business-activity name="latterTask" condition="true"><label language="zh_CN">后置处理</label>
<input name="x" unit="passAudit"></input>
<output name="x" unit="end1"></output>

<has-action action="queryYF_ApplicationAction" access-permission="public"></has-action>
</business-activity>
<place name="end1"><label language="zh_CN">结束</label>
</place>



<has-action action="queryYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="queryYF_mainApplicationAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="queryYF_ApplierAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplierAction" access-permission="public"></has-action>
<has-action action="queryYF_AcceAction" access-permission="public"></has-action>
<has-action action="saveYF_AcceAction" access-permission="public"></has-action>
<has-action action="saveYF_mainApplicationAction" access-permission="public"></has-action>

</process>
</model>
