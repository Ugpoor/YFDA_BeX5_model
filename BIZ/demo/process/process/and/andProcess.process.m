<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="andProcess" start="start1" end="end1">
		<label language="zh_CN">AND</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">AND</label>
		</static-activity>
	<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>
<business-activity name="bizActivity1" condition="true"><label language="zh_CN">活动环节1</label>
<input name="x" unit="start1"></input>
<output name="x" unit="and1"></output>
</business-activity>
<and-activity name="and1"><label language="zh_CN">AND</label>
<input name="x" unit="bizActivity1"></input>
<output name="x" unit="bizActivity2"></output>
<output name="x" unit="bizActivity4"></output>
</and-activity>
<business-activity name="bizActivity2" condition="true"><label language="zh_CN">活动环节2</label>
<input name="x" unit="and1"><label language="zh_CN">分支2</label>
</input>
<output name="x" unit="and2"></output>
</business-activity>
<and-activity name="and2"><label language="zh_CN">AND</label>
<input name="x" unit="bizActivity2"></input>
<output name="x" unit="bizActivity3"></output>
<input name="x" unit="bizActivity4"></input>
</and-activity>
<business-activity name="bizActivity3" condition="true"><label language="zh_CN">活动环节3</label>
<input name="x" unit="and2"></input>
<output name="x" unit="end1"></output>
</business-activity>
<place name="end1"><label language="zh_CN">结束</label>
</place>

<business-activity name="bizActivity4" condition="true"><label language="zh_CN">活动环节4</label>
<input name="x" unit="and1"><label language="zh_CN">分支1</label>
</input>
<output name="x" unit="and2"></output>
</business-activity>




<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>
</process>
</model>
