<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="createDEMO_ProjectPlanProcedure" code-model="/demo/actions/logic/code" code="Actions.createDEMO_ProjectPlan"> 
    <parameter name="table" type="Table"/>
    <parameter name="concept" type="String"/>
    <parameter name="defaultValues" type="Map"/>
    <parameter name="fnModel" type="String"/>
    <parameter name="myParam" type="String"/>
  </procedure>  
  <procedure name="saveDEMO_BookViewProcedure" code-model="/demo/actions/logic/code" code="Actions.saveDEMO_BookView"> 
    <parameter name="concept" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="table" type="Table"/> 
  </procedure>  
  <procedure name="queryDEMO_BookXMLProcedure" code-model="/demo/actions/logic/code" code="Actions.queryDEMO_BookXML"> 
    <parameter name="concept" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="range" type="List"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/> 
  </procedure>  
  <procedure name="saveDEMO_BookXMLProcedure" code-model="/demo/actions/logic/code" code="Actions.saveDEMO_BookXML"> 
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="table" type="Table"/> 
  </procedure> 
</model>
