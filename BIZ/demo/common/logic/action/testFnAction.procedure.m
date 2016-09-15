<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="testFnProcedure" code-model="/demo/common/logic/code" code="TestFn.testFn"> 
    <parameter name="fn" type="String"/>
    <parameter name="fnModel" type="String"/>
  </procedure>  
  <procedure name="testProcessFnProcedure" code-model="/demo/common/logic/code" code="TestFn.testProcessFn"> 
    <parameter name="fn" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="task" type="String"/> 
  </procedure> 
</model>
