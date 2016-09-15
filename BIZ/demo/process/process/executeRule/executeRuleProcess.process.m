<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="executeRuleProcess" start="start1" end="end1">
		<label language="zh_CN">执行规则</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">执行规则</label>
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










<execute-rule condition="relationValue('DEMO_Order',:sData1,null,null,'fTolotalAmt','/demo/process/data') &lt; 100" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'活动环节2:小于100'</item>
</task-relation-value>
</execute-rule>
<execute-rule condition="relationValue('DEMO_Order',:sData1,null,null,'fTolotalAmt','/demo/process/data') &gt;= 100" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""><kind>PSM</kind>
</executor-range>
<task-relation-value><item relation="sExecuteMode">'temSimultaneous'</item>
<item relation="sName">'活动环节2:大于等于100'</item>
</task-relation-value>
</execute-rule>
</business-activity>

<place name="end1"><label language="zh_CN">结束</label>
</place>



<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>
</process>
</model>
