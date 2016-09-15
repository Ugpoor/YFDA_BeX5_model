<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">

  <action name="querySecretLevelAction" procedure="bizQueryProcedure">
    <public name="concept" type="String" value="DEMO_SecretLevel"/>  
    <public name="idColumn" type="String" value="DEMO_SecretLevel" />
    <private name="select" type="String" value="DEMO_SecretLevel.*"/>
    <private name="from" type="String" value="DEMO_SecretLevel DEMO_SecretLevel"/>
    <protected name="condition" type="String" value=""/>
    <permission name="range" type="List"/>
    <public name="filter" type="String" value=""/>
    <public name="distinct" type="Boolean" value="FALSE"/>
    <public name="offset" type="Integer"/>
    <public name="limit" type="Integer" value="1"/>
    <public name="columns" type="String" value=""/>
    <public name="orderBy" type="String" value=""/>
    <private name="aggregate" type="String" value=""/>
    <public name="aggregateColumns" type="String" value=""/>
     <public name="variables" type="Map"/>
    <private name="dataModel" type="String" value="/demo/misc/data"/>
    <private name="fnModel" type="String" value="/system/logic/fn" />
  </action>
  
  <action name="queryExigenceLevelAction" procedure="bizQueryProcedure">
    <public name="concept" type="String" value="DEMO_ExigenceLevel"/>  
    <public name="idColumn" type="String" value="DEMO_ExigenceLevel" />
    <private name="select" type="String" value="DEMO_ExigenceLevel.*"/>
    <private name="from" type="String" value="DEMO_ExigenceLevel DEMO_ExigenceLevel"/>
    <protected name="condition" type="String" value=""/>
    <permission name="range" type="List"/>
    <public name="filter" type="String" value=""/>
    <public name="distinct" type="Boolean" value="FALSE"/>
    <public name="offset" type="Integer"/>
    <public name="limit" type="Integer" value="1"/>
    <public name="columns" type="String" value=""/>
    <public name="orderBy" type="String" value=""/>
    <private name="aggregate" type="String" value=""/>
    <public name="aggregateColumns" type="String" value=""/>
    <public name="variables" type="Map"/>
    <private name="dataModel" type="String" value="/demo/misc/data"/>
    <private name="fnModel" type="String" value="/system/logic/fn" />
  </action>
 
  <action name="queryUnitAction" procedure="bizQueryProcedure">
    <public name="concept" type="String" value="DEMO_Unit"/>  
    <public name="idColumn" type="String" value="DEMO_Unit" />
    <private name="select" type="String" value="DEMO_Unit.*"/>
    <private name="from" type="String" value="DEMO_Unit DEMO_Unit"/>
    <protected name="condition" type="String" value=""/>
    <permission name="range" type="List"/>
    <public name="filter" type="String" value=""/>
    <public name="distinct" type="Boolean" value="FALSE"/>
    <public name="offset" type="Integer"/>
    <public name="limit" type="Integer" value="1"/>
    <public name="columns" type="String" value=""/>
    <public name="orderBy" type="String" value=""/>
    <private name="aggregate" type="String" value=""/>
    <public name="aggregateColumns" type="String" value=""/>
     <public name="variables" type="Map"/>
    <private name="dataModel" type="String" value="/demo/misc/data"/>
    <private name="fnModel" type="String" value="/system/logic/fn" />
  </action>
 
  <action name="querySendDirectAction" procedure="bizQueryProcedure">
    <public name="concept" type="String" value="DEMO_SendDirect"/>   
    <public name="idColumn" type="String" value="DEMO_SendDirect" />
    <private name="select" type="String" value="DEMO_SendDirect.*"/>
    <private name="from" type="String" value="DEMO_SendDirect DEMO_SendDirect"/>
     <protected name="condition" type="String" value=""/>
    <permission name="range" type="List"/>
    <public name="filter" type="String" value=""/>
    <public name="distinct" type="Boolean" value="FALSE"/>
    <public name="offset" type="Integer"/>
    <public name="limit" type="Integer" value="1"/>
    <public name="columns" type="String" value=""/>
    <public name="orderBy" type="String" value=""/>
    <private name="aggregate" type="String" value=""/>
    <public name="aggregateColumns" type="String" value=""/>
     <public name="variables" type="Map"/>
    <private name="dataModel" type="String" value="/demo/misc/data"/>
    <private name="fnModel" type="String" value="/system/logic/fn" />
  </action>
</model>
