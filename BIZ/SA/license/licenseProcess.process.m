<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<process name="licenseProcess">
<static-activity name="mainActivity"/>
<label language="zh_CN">license相关</label>



<has-action log-enabled="true" action="getActivationPackageAction" access-permission="public"></has-action>
<has-action log-enabled="true" action="regActivationPackageAction" access-permission="public"></has-action>
<has-action log-enabled="true" action="getActivationTimeAction" access-permission="public"></has-action>
</process>
</model>