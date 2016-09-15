<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="quickstartProcess" kind="SYSTEM"> 
    <static-activity name="mainActivity"/>  
    <label language="zh_CN">mobile快捷面板</label>  
    <has-action action="queryQuickStartAction" access-permission="public"/>  
    <has-action action="saveQuickStartAction" access-permission="public"/>  
    <has-action action="createQuickStartAction" access-permission="public"/> 
  </process> 
</model>
