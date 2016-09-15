<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <process name="justepAppProcess">
  	<static-activity name="apiListActivity"/>
  	<static-activity name="apiDetailActivity"/>
   


<has-action action="queryAssetAction" access-permission="public"></has-action>
<has-action action="createAssetAction" access-permission="public"></has-action>
<has-action action="saveAssetAction" access-permission="public"></has-action>
</process>
</model>