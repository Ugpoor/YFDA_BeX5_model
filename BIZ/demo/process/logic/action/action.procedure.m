<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="batchAdvanceProcessProcedure" code-model="/demo/process/logic/code"
    code="Process.batchAdvanceProcess"> 
    <parameter name="tasks" type="List"/>  
    <parameter name="control" type="Object"/> 
  </procedure>  
  <procedure name="batchStartProcessProcedure" code-model="/demo/process/logic/code"
    code="Process.batchStartProcess"> 
    <parameter name="process" type="String"/> 
    <parameter name="datas" type="List"/> 
  </procedure> 
</model>
