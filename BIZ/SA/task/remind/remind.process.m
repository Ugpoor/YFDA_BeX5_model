<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="remindProcess" kind="SYSTEM"> 
    <static-activity name="mainActivity"/>  
    <label language="zh_CN">任务提醒</label>  
    <has-action action="createRemindAction" access-permission="public"/>  
    <has-action action="saveRemindAction" access-permission="public"/>  
    <has-action action="queryRemindAction" access-permission="public"/>  

    <has-action action="queryRemindConfigAction" access-permission="public"/>  
    <has-action action="createRemindConfigAction" access-permission="public"/>  
    <has-action action="saveRemindConfigAction" access-permission="public"/>  
	
	<!--      
    <has-action action="createReminderAction" access-permission="public"/>  
    <has-action action="saveRemindActionParameterAction" access-permission="public"/>  
    <has-action action="saveyReminderAction" access-permission="public"/>  
    <has-action action="queryReminderAction" access-permission="public"/>  
    <has-action action="queryRemindActionParameterAction" access-permission="public"/>  
    -->  
    <has-action action="queryWorkRemindAction" access-permission="public"/>  
    <has-action action="saveWorkRemindAction" access-permission="public"/>
    <has-action action="queryRemindCountAction" access-permission="public"/>  
    <!--  
    <has-action action="querySA_RemindTaskAction" access-permission="public"/>  
    <has-action action="saveSA_RemindTaskAction" access-permission="public"/>  
    <has-action action="createSA_RemindTaskAction" access-permission="public"/>
    -->  
    <has-action action="queryOPOrgAction" access-permission="public"/>  
    <has-action action="getDataModelAction" access-permission="public"/> 
  </process> 
</model>
