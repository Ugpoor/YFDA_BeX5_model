<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="printProcess" >
    <static-activity name="subColumnActivity"/>
    <static-activity name="pagingActivity"/>
    <static-activity name="lastpageActivity"/>
    <static-activity name="mprintActivity"/>
    
    <has-action action="gridReportAction" access-permission="public"/>
  </process>
</model>
