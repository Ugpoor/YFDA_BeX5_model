<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="startRuleProcess" start="start1" end="end1">
		<label language="zh_CN">启动规则</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">启动规则</label>
		</static-activity>
	<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>
<business-activity name="bizActivity1" condition="true"><label language="zh_CN">活动环节1</label>
<input name="x" unit="start1"></input>
<output name="x" unit="bizActivity2"></output>
</business-activity>
<business-activity name="bizActivity2" condition="true"><label language="zh_CN">活动环节2</label>
<input name="x" unit="bizActivity1"></input>
<output name="x" unit="end1"></output>
</business-activity>
<place name="end1"><label language="zh_CN">结束</label>
</place>





<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>











<start-rule condition="true"><task-relation-value><item relation="sName">toString(relationValue('DEMO_Order',null,concat('DEMO_Order=''',:sData1, ''''),null,'fTolotalAmt','/demo/process/data'))</item>
</task-relation-value>
</start-rule>
</process>
</model>
