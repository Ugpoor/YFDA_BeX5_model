<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryRBBAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="R_BB"/>  
    <private name="select" type="String" value="R_BB.*"/>  
    <private name="from" type="String" value="R_BB R_BB"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/report/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="R_BB"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveRBBAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="R_BB"/>  
    <private name="dataModel" type="String" value="/demo/report/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <action name="createRBBAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="R_BB"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryRZBAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="R_ZB"/>  
    <private name="select" type="String" value="R_ZB.*"/>  
    <private name="from" type="String" value="R_ZB R_ZB"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/report/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="R_ZB"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveRZBAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="R_ZB"/>  
    <private name="dataModel" type="String" value="/demo/report/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <action name="createRZBAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="R_ZB"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action> 
</model>
