<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="taskAPIProcess">
		<label language="zh_CN">任务API</label>
		<static-activity name="mainActivity"><label language="zh_CN">创建任务</label>






<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>
</static-activity>
	<static-activity name="executeActivity"><label language="zh_CN">执行任务</label>
</static-activity>



<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>
</process>
</model>
