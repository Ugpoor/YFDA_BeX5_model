<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="themeUseProcess" kind="SYSTEM"> 
    <static-activity name="mainActivity"> 
      <label language="zh_CN">mainActivity</label> 
    </static-activity>  
    <has-action action="queryThemeDefineAction" access-permission="public"/>  
    <has-action action="saveThemeDefineAction" access-permission="public"/>  
    <has-action action="createThemeDefineAction" access-permission="public"/>  
    <has-action action="queryThemeManagerAction" access-permission="public"/>  
    <has-action action="saveThemeManagerAction" access-permission="public"/>  
    <has-action action="createThemeManagerAction" access-permission="public"/>  
    <has-action action="getThemeDefineAction" access-permission="public"/>  
    <has-action action="savePersonThemeAction" access-permission="public"/>  
    <has-action action="removeThemeDefineAction" access-permission="public"/>   
    <label language="zh_CN">themeUse</label> 
  </process> 
</model>
