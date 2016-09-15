<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="querySubmitTaskProcedure" code-model="/SA/task/logic/code" code="TaskViewProcedure.querySubmitTask"/>  
  <procedure name="queryWaitTaskProcedure" code-model="/SA/task/logic/code" code="TaskViewProcedure.queryWaitTask"/>  
  <procedure name="queryTaskSummaryProcedure" code-model="/SA/task/logic/code" code="TaskViewProcedure.queryTaskSummary"/>  
  <procedure name="queryWaitTask2Procedure" code-model="/SA/task/logic/code" code="TaskViewProcedure.queryWaitTask2"> 
    <parameter name="concept" type="String"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="range" type="List"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="querySubmitTask2Procedure" code-model="/SA/task/logic/code" code="TaskViewProcedure.querySubmitTask2"> 
    <parameter name="concept" type="String"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="range" type="List"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="queryWaitMessageProcedure" code-model="/SA/task/logic/code" code="TaskViewProcedure.queryWaitMessage"/>  
  <procedure name="querySubmitMessageProcedure" code-model="/SA/task/logic/code" code="TaskViewProcedure.querySubmitMessage"/>
</model>
