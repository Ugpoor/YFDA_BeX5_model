<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<process name="exportDataProcess">
<static-activity name="mainActivity"><label language="zh_CN">导出初始化数据</label>
</static-activity>
<label language="zh_CN">导出初始化数据</label>



<has-action action="getDataModelsAction" access-permission="public"></has-action>
<has-action action="getConceptsInModelAction" access-permission="public"></has-action>
<has-action action="exportDataFromDBAction" access-permission="public"></has-action>
</process>
</model>