<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<process name="taskArchiveProcess">
<static-activity name="mainActivity"/>

<has-action action="archiveProcessAction" access-permission="public"></has-action>
<has-action action="backupTaskAction" access-permission="public"></has-action>
<has-action action="resetTaskAction" access-permission="public"></has-action>
</process>
</model>