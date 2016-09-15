<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="hasActionProcess">
		<label language="zh_CN">引用动作</label>
		
	
<static-activity name="staticActivity1">
<has-action action="demoHasAction1" access-permission="public"></has-action>
<label language="zh_CN">引用动作-activity1</label>
</static-activity>
<static-activity name="staticActivity2">
<has-action action="demoHasAction2" access-permission="public"></has-action>
<label language="zh_CN">引用动作-activity2</label>
</static-activity>
<has-action action="demoHasAction3" access-permission="public"></has-action>
</process>
</model>
