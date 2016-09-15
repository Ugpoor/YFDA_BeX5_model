<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="ifProcess" start="start1" end="end1">
		<label language="zh_CN">条件分支</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">条件分支</label>
		</static-activity>
	
<business-activity name="bizActivity1" condition="true"><label language="zh_CN">活动环节1</label>

<output name="x" unit="conditionFork1"></output>
<input name="x" unit="start1"></input>
</business-activity>
<if-else-activity name="conditionFork1" condition="relationValue('DEMO_Order',:sData1,null,null,'fTolotalAmt','/demo/process/data') &gt; 100"><label language="zh_CN">条件分支1</label>
<input name="x" unit="bizActivity1"></input>
<true-output name="x" unit="bizActivity2"></true-output>




<false-output name="x" unit="bizActivity3"></false-output>
</if-else-activity>
<business-activity name="bizActivity2" condition="true"><label language="zh_CN">活动环节2</label>
<input name="x" unit="conditionFork1"><label language="zh_CN">金额大于100</label>
</input>


<output name="x" unit="bizActivity3"></output>
</business-activity>


<business-activity name="bizActivity3" condition="true"><label language="zh_CN">活动环节3</label>

<output name="x" unit="end1"></output>

<input name="x" unit="bizActivity2"></input>


<input name="x" unit="conditionFork1"><label language="zh_CN">金额小于或等于100</label>
</input>
</business-activity>
<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>
<place name="end1"><label language="zh_CN">结束</label>
</place>































<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>
<has-action action="queryOrder_DAction" access-permission="public"></has-action>
<has-action action="createOrder_DAction" access-permission="public"></has-action>
<has-action action="saveOrder_DAction" access-permission="public"></has-action>
<has-action action="queryOPPersonAction" access-permission="public"></has-action>
<has-action action="queryCustemorAction" access-permission="public"></has-action>
<has-action action="queryProductAction" access-permission="public"></has-action>
</process>
</model>
