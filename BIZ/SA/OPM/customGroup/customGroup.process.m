<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="customGroupProcess"> 
    <label language="zh_CN">常用组</label>  
    <static-activity name="publicGroup">
      <label language="zh_CN">设置公共常用组</label> 
    </static-activity>  
    <static-activity name="privateGroup">
      <label language="zh_CN">设置个人常用组</label> 
    </static-activity>  
    <has-action action="queryOPCustomGroupAction" access-permission="public"/>  
    <has-action action="saveOPCustomGroupAction" access-permission="public"/>  
    <has-action action="createOPCustomGroupAction" access-permission="public"/>  
    <has-action action="queryResourceControlAction" access-permission="public"/>  
    <has-action action="addOrgResource" access-permission="public"/>  
    <has-action action="removeOrgResource" access-permission="public"/> 
  </process> 
</model>
