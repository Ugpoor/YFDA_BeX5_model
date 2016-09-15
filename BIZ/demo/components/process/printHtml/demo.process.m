<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <process name="printHtmlProcess"> 
    <static-activity name="mainActivity"/>  
    <has-action action="queryDEMO_TABLE1Action" access-permission="public"/>  
    <has-action action="saveDEMO_TABLE1Action" access-permission="public"/>  
    <has-action action="createDEMO_TABLE1Action" access-permission="public"/> 
  </process> 
</model>
