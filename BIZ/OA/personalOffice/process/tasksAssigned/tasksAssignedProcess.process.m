<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="tasksAssignedProcess"> 
    <label language="zh_CN">工作交办</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">工作交办</label> 
    </static-activity>  
    <has-action action="queryOA_TasksAssignedAllAction" access-permission="public"/>  
    <has-action action="queryOA_TasksAssignedOpAction" access-permission="public"/>  
    <has-action action="queryOA_TasksAssignedClAction" access-permission="public"/> 
    <has-action action="queryOA_TasksAssignedAction" access-permission="public"/>  
    <has-action action="saveOA_TasksAssignedAction" access-permission="public"/>  
    <listener action="saveOA_TasksAssignedAction" event="after" handler="tasksAssignedProcessAfterSaveOA_TasksAssignedActionProcedure"/>  
    <has-action action="createOA_TasksAssignedAction" access-permission="public"/>  
    <has-action action="queryOA_TasksAssignedDateAction" access-permission="public"/>  
    <has-action action="saveOA_TasksAssignedDateAction" access-permission="public"/>  
    <has-action action="createOA_TasksAssignedDateAction" access-permission="public"/>  
  </process> 
</model>
