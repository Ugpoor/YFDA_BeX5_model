<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="scheduleProcess"> 
    <label language="zh_CN">日程管理</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">日程管理</label> 
    </static-activity>  
    <has-action action="queryOA_ScheduleAction" access-permission="public"/>  
    <has-action action="saveOA_ScheduleAction" access-permission="public"/>  
    <listener action="saveOA_ScheduleAction" event="before" handler="scheduleProcessBeforeSaveOA_ScheduleActionProcedure"/>  
    <has-action action="createOA_ScheduleAction" access-permission="public"/>  
    <has-action action="queryOA_ScheduleMonthAction" access-permission="public"/>  
    <has-action action="queryOA_ScheduleNotSureAction" access-permission="public"/>  
    <has-action action="refuseScheAction" access-permission="public"/>  
    <has-action action="confirmScheAction" access-permission="public"/> 
  </process> 
</model>
