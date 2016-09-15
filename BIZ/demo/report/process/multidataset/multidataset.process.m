<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="multidatasetProcess"> 
    <static-activity name="mutilDatasetHVActivity"/>  
    <static-activity name="mutilDatasetVerticalActivity"/>  
    <static-activity name="mutilDatasetHorizontalActivity"/>  
    <static-activity name="multiDatasetCrossActivity"/>  
    <static-activity name="masterDetailActivity"/>
    <static-activity name="masterDDActivity"/>
    <static-activity name="masterDDDActivity"/>  

    <has-action action="masterDDReportAction1" access-permission="public"/>
    <has-action action="masterDDReportAction2" access-permission="public"/>
    <has-action action="masterDDReportAction3" access-permission="public"/>
    <has-action action="masterDDReportAction4" access-permission="public"/>  

    <has-action action="masterDetailReportAction1" access-permission="public"/>
    <has-action action="masterDetailReportAction2" access-permission="public"/>  

    <has-action action="multiDatasetCrossReportAction1" access-permission="public"/>
    <has-action action="multiDatasetCrossReportAction2" access-permission="public"/>  

    <has-action action="multiDatasetHVReportAction1" access-permission="public"/>
    <has-action action="multiDatasetHVReportAction2" access-permission="public"/>
    <has-action action="multiDatasetHVReportAction3" access-permission="public"/>
      
    <has-action action="mutilDatasetHorizontalReportAction" access-permission="public"/>  
    <has-action action="mutilDatasetVerticalReportAction" access-permission="public"/> 
  </process> 
</model>
