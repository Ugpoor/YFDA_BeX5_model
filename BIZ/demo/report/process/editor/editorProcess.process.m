<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="editorProcess" > 
    <label language="zh_CN">edit</label>  
    <static-activity name="editActivity"/>  
    <has-action action="sqlQueryAction" access-permission="public">
      <public name="dataModel" type="String" value="/demo/report/data"/> 
    </has-action>  
    <has-action action="queryRBBAction" access-permission="public"/>  
    <has-action action="createRBBAction" access-permission="public"/>  
    <has-action action="saveRBBAction" access-permission="public"/>  
    <has-action action="queryRZBAction" access-permission="public"/>  
    <has-action action="createRZBAction" access-permission="public"/>  
    <has-action action="saveRZBAction" access-permission="public"/>  
    <has-action action="ksqlQueryAction" access-permission="public"/> 
  </process> 
</model>
