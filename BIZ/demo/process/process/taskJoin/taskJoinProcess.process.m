<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="taskJoinProcess" start="start1" end="end1">
		<label language="zh_CN">流转规则：任务合并</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">流转规则：任务合并</label>
		</static-activity>
	<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>
<business-activity name="bizActivity1" condition="true"><label language="zh_CN">活动环节1</label>
<input name="x" unit="start1"></input>
<output name="x" unit="bizActivity2"></output>
</business-activity>
<business-activity name="bizActivity2" condition="true"><label language="zh_CN">生成独立任务</label>
<input name="x" unit="bizActivity1"></input>
<output name="x" unit="bizActivity3"></output>

<execute-rule condition="true" task-assign-mode="singleness"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sName">'生成独立任务:流转规则：任务合并'</item>
</task-relation-value>
</execute-rule>
</business-activity>
<business-activity name="bizActivity3" condition="true"><label language="zh_CN">任务合并</label>
<input name="x" unit="bizActivity2"></input>




<output name="x" unit="bizActivity4"></output>









<advance-rule condition="true" dialog-enabled="true" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode="false" task-wait="true" task-join="true" task-wait-mode="twmSingle" task-join-mode="tjmMultiple" fork-activity="bizActivity2"></advance-rule>
</business-activity>





<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>
<business-activity name="bizActivity4" condition="true"><label language="zh_CN">活动环节4</label>
<input name="x" unit="bizActivity3"></input>
<output name="x" unit="end1"></output>
</business-activity>
<place name="end1"><label language="zh_CN">结束</label>
</place>
</process>
</model>
