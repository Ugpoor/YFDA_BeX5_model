<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<process name="systemProcess" kind="SYSTEM">
<static-activity name="mainActivity"/>

<has-action action="exportExcel" access-permission="public"></has-action>
<has-action action="downloadExportExcel" access-permission="public"></has-action>
<has-action action="uploadImportExcel" access-permission="public"></has-action>
<has-action action="importExcel" access-permission="public"></has-action>
</process>
</model>