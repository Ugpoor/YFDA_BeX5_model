<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="opmLogAction" global="false" procedure="opmLogProcedure">
    <label language="zh_CN">组织权限变更日志</label>  
    <public type="String" required="true" name="operation"/>  
    <public type="String" required="true" name="description"/>  
    <public type="Xml" required="true" name="changeValues"/> 
  </action> 
</model>
