<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="tableProcess"> 
    <label language="zh_CN">Table</label>  
    <static-activity name="mainActivity"></static-activity>  
    <has-action action="createCalendarAction" access-permission="public"/>  
    <has-action action="returnTableAction" access-permission="public"/>  
    <has-action action="listTableAction" access-permission="public"/>  
    <has-action action="addTableRowAction" access-permission="public"/>  
    <has-action action="delTableRowAction" access-permission="public"/>  
    <has-action action="addColumnAction" access-permission="public"/>  
    <has-action action="delColumnAction" access-permission="public"/> 
  </process> 
</model>
