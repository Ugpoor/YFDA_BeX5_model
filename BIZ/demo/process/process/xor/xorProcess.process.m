<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="xorProcess" start="start1" end="end1">
		<label language="zh_CN">XOR</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">XOR</label>
		</static-activity>
	<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>
<business-activity name="bizActivity1" condition="true"><label language="zh_CN">活动环节1</label>
<input name="x" unit="start1"></input>
<output name="x" unit="xor1"></output>
</business-activity>
<place name="xor1"><label language="zh_CN">XOR</label>
</place>
<business-activity name="bizActivity2" condition="true"><label language="zh_CN">活动环节2</label>
<input name="x" unit="xor1"></input>

<output name="x" unit="xor2"></output>
</business-activity>


<place name="xor2"><label language="zh_CN">XOR</label>
</place>
<business-activity name="bizActivity3" condition="true"><label language="zh_CN">活动环节3</label>
<input name="x" unit="xor2"></input>
<output name="x" unit="end1"></output>
</business-activity>
<place name="end1"><label language="zh_CN">结束</label>
</place>
<business-activity name="bizActivity4" condition="true"><label language="zh_CN">活动环节4</label>
<input name="x" unit="xor1"></input>
<output name="x" unit="xor2"></output>
</business-activity>



<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>

</process>
</model>
