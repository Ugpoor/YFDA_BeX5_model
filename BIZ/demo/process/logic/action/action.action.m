<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="batchAdvanceProcessAction" global="false" procedure="batchAdvanceProcessProcedure">
    <public type="List" name="tasks"/>  
    <public type="Object" name="control"/> 
  </action>  
  <action name="batchStartProcessAction" global="false" procedure="batchStartProcessProcedure">
    <public type="String" name="process"/> 
    <public type="List" name="datas"/>
  </action> 
</model>
