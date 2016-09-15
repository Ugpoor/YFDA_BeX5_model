<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="propertyProcess" >

    <static-activity name="barcodeActivity"/>
    <static-activity name="basePropertyActivity"/>
    <static-activity name="chartActivity"/>
    <static-activity name="parameterFilterActivity"/>
    <static-activity name="visibleActivity"/>
    <static-activity name="multiReportActivity"/>
    
    <has-action action="chartReportAction1" access-permission="public"/>
    <has-action action="chartReportAction2" access-permission="public"/>
    
    <has-action action="parameterFilterReportAction" access-permission="public"/>
    <has-action action="gridReportAction" access-permission="public"/>
    <has-action action="crossReportAction" access-permission="public"/>
    <has-action action="groupReportAction" access-permission="public"/>    
  </process>
</model>
