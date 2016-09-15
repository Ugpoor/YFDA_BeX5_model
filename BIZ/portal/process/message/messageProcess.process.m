<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="messageProcess" kind="SYSTEM"> 
    <label language="zh_CN">message</label>  
    <static-activity name="mainActivity"> 
      <has-action log-enabled="true" action="queryMessageAction" access-permission="public"/> 
      <has-action log-enabled="true" action="queryWaitMessageAction" access-permission="public"/> 
    </static-activity> 
  </process> 
</model>
