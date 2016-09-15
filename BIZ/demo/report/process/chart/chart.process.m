<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="chartProcess" >
    <static-activity name="pieActivity"/>
    <static-activity name="barVActivity"/>
    <static-activity name="barHActivity"/>
    <static-activity name="lineActivity"/>
    <static-activity name="areaActivity"/>
    <static-activity name="timingActivity"/>
    <static-activity name="ganttActivity"/>
    <static-activity name="dashboardActivity"/>
    <static-activity name="radarActivity"/>
    <static-activity name="accumulationActivity"/>
    
    <has-action action="accumulationChartAction" access-permission="public"/>
    <has-action action="areaChartAction" access-permission="public"/>
    <has-action action="barHChartAction" access-permission="public"/>
    <has-action action="barVChartAction" access-permission="public"/>
    <has-action action="dashboardChartAction" access-permission="public"/>
    <has-action action="ganttChartAction" access-permission="public"/>
    <has-action action="lineChartAction1" access-permission="public"/>
    <has-action action="lineChartAction2" access-permission="public"/>
    <has-action action="pieChartAction" access-permission="public"/>
    <has-action action="radarChartAction" access-permission="public"/>
    <has-action action="timingChartAction" access-permission="public"/>  
    
  </process>
</model>
