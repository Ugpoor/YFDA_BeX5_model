<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <process name="workRecordProcess"> 
    <label language="zh_CN">工作日志</label>  
    <static-activity name="mainActivity"/>  
    <static-activity name="useActivity"/>  
    <has-action action="queryWorkRecordAction" access-permission="public"/>  
    <has-action action="createWorkRecordAction" access-permission="public"/>  
    <has-action action="saveWorkRecordAction" access-permission="public"/>  
    <has-action action="queryImportanceAction" access-permission="public"/>  
    <has-action action="createWorkRecordRemindAction" access-permission="public"/> 
  </process> 
</model>
