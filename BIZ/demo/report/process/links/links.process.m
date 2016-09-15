<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="linksProcess" >
    <static-activity name="reportActivity"/>
    <static-activity name="chartLinksActivity"/>
    <static-activity name="reportLinksActivity"/>
    <static-activity name="chartReplaceActivity"/>
    <static-activity name="chartWindowActivity"/>
    <static-activity name="chartDialogActivity"/>
    
    <has-action action="gridReportAction" access-permission="public"/>
    <has-action action="linkReportAction" access-permission="public"/>
    <has-action action="linkChartAction" access-permission="public"/>
    <has-action action="pieChartAction" access-permission="public"/>
    
  </process>
</model>
