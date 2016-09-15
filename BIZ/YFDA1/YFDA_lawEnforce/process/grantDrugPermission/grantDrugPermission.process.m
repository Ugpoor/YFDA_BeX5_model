<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<process name="newProcess" start="start1" end="end1">
<static-activity name="newDrugPermission"><label language="zh_CN">药品许可</label>
<has-action action="queryYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="createYF_ApplicationAction" access-permission="public"></has-action>
<has-action action="queryYF_ApplierAction" access-permission="public"></has-action>
<has-action action="saveYF_ApplierAction" access-permission="public"></has-action>
<has-action action="createYF_ApplierAction" access-permission="public"></has-action>
<has-action action="queryYF_AcceAction" access-permission="public"></has-action>
<has-action action="saveYF_AcceAction" access-permission="public"></has-action>
<has-action action="createYF_AcceAction" access-permission="public"></has-action>
</static-activity>


<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>


<place name="end1"><label language="zh_CN">结束</label>
</place>












<business-activity name="grantPermission" condition="true"><label language="zh_CN">颁发许可</label>




<input name="x" unit="checkPermission"></input>
<output name="x" unit="end1"></output>
</business-activity>


<label language="zh_CN">药品许可证办理</label>
<business-activity name="audit" condition="true"><label language="zh_CN">通用审批(筹建)</label>
<input name="x" unit="start1"></input>
<output name="x" unit="createPermission"></output>
</business-activity>
<if-else-activity name="createPermission" condition="true"><label language="zh_CN">筹建许可</label>
<input name="x" unit="audit"></input>
<true-output name="x" unit="checkAudit"></true-output>

<false-output name="x" unit="end1"></false-output>
</if-else-activity>
<business-activity name="checkAudit" condition="true"><label language="zh_CN">通用审批(验收)</label>
<input name="x" unit="createPermission"></input>
<output name="x" unit="checkPermission"></output>
</business-activity>
<if-else-activity name="checkPermission" condition="true"><label language="zh_CN">验收许可</label>
<input name="x" unit="checkAudit"></input>
<true-output name="x" unit="grantPermission"></true-output>

<false-output name="x" unit="end1"></false-output>
</if-else-activity>
</process>
</model>