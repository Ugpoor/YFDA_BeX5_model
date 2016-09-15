<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="testcaseProcess" >
    
    <static-activity name="testgridActivity"/>
    <static-activity name="testgroupActivity"/>
    <static-activity name="testcrossActivity"/>
  <static-activity name="testcase"></static-activity>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/demo/report/data"></public>
</has-action>
<has-action action="testGrid" access-permission="public"></has-action>
<has-action action="testGroup" access-permission="public"></has-action>
</process>
</model>
