<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryRemindCountProcedure" code-model="/SA/task/logic/code" code="RemindProcedure.queryRemindCount"/>  
  <!-- 
  <procedure name="liveProcedure" code-model="/SA/task/logic/code" code="RemindProcedure.live"/>  
  <procedure name="createRemindProcedureTask" code-model="/SA/task/logic/code" code="Task.createRemind"> 
    <parameter name="concept" type="String"/>  
    <parameter name="table" type="Table"/>  
    <parameter name="defaultValues" type="Map"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  -->
  <procedure name="saveRemindProcedure" code-model="/SA/task/logic/code" code="Task.saveRemind">
    <parameter name="concept" type="String"/>
    <parameter name="readOnly" type="String"/>
    <parameter name="notNull" type="String"/>
    <parameter name="table" type="Table"/>
    <parameter name="dataModel" type="String"/>
    <parameter name="insertRange" type="List"/>
    <parameter name="deleteRange" type="List"/>
    <parameter name="updateRange" type="List"/>
    <parameter name="fnModel" type="String"/>
  </procedure>
</model>
