<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
  <action name="queryDEMO_TABLE2Action" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_TABLE2"/>  
    <private name="select" type="String" value="DEMO_TABLE2.*"/>  
    <private name="from" type="String" value="DEMO_TABLE2 DEMO_TABLE2"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/components/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_TABLE2"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_TABLE2Action" procedure="bizSaveProcedure">
    <private name="concept" type="String" value="DEMO_TABLE2"/>  
    <private name="dataModel" type="String" value="/demo/components/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>    
  </action>  
  <action name="createDEMO_TABLE2Action" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="DEMO_TABLE2"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_TABLE1Action" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_TABLE1"/>  
    <private name="select" type="String" value="DEMO_TABLE1.*"/>  
    <private name="from" type="String" value="DEMO_TABLE1 DEMO_TABLE1"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/components/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_TABLE1"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_TABLE1Action" procedure="bizSaveProcedure">
    <private name="concept" type="String" value="DEMO_TABLE1"/>  
    <private name="dataModel" type="String" value="/demo/components/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>   
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="createDEMO_TABLE1Action" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="DEMO_TABLE1"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_TABLE3Action" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_TABLE3"/>  
    <private name="select" type="String" value="DEMO_TABLE3.*"/>  
    <private name="from" type="String" value="DEMO_TABLE3 DEMO_TABLE3"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/components/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_TABLE3"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_TABLE3Action" procedure="bizSaveProcedure">
    <private name="concept" type="String" value="DEMO_TABLE3"/>  
    <private name="dataModel" type="String" value="/demo/components/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>   
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="createDEMO_TABLE3Action" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="DEMO_TABLE3"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action> 
</model>