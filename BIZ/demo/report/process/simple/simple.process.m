<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="simpleProcess"> 
    <static-activity name="gridActivity"/>  
    <static-activity name="groupActivity"/>  
    <static-activity name="crossActivity"/>  
    <static-activity name="cardActivity"/>  
    <has-action action="gridReportAction" access-permission="public"/>  
    <has-action action="groupReportAction" access-permission="public"/>  
    <has-action action="crossReportAction" access-permission="public"/>  
    <has-action action="cardReportAction" access-permission="public"/>  
  </process> 
</model>
