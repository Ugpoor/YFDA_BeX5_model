<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">  
  <action name="queryOrderAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="DEMO_Order"/>
    <public name="idColumn" type="String" value="DEMO_Order"/>  
    <private name="select" type="String" value="DEMO_Order.*"/>  
    <private name="from" type="String" value="DEMO_Order DEMO_Order"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String" value=""/>  
    <public name="distinct" type="Boolean" value="FALSE"/>  
    <public name="offset" type="Integer"/>  
    <public name="limit" type="Integer" value="1"/>  
    <public name="columns" type="String" value=""/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String" value=""/>  
    <public name="aggregateColumns" type="String" value=""/>  
    <public name="variables" type="Map"/>  
    <private name="dataModel" type="String" value="/demo/misc/data"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOrderForSocialAction" procedure="bizQueryProcedure" global="true"> 
  	<public name="concept" type="String" value="DEMO_Order"/>
    <public name="idColumn" type="String" value="DEMO_Order"/>  
    <private name="select" type="String" value="DEMO_Order.*,SA_Social.sActive as sFocus"/>  
    <private name="from" type="String" value="DEMO_Order DEMO_Order  optional  join SA_Social SA_Social on DEMO_Order = SA_Social.sData1 AND SA_Social.sTypeID = 'Focus' AND SA_Social.sValidState = 1 AND SA_Social.sPersonID = :currentPersonID()"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String" value=""/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="offset" type="Integer"/>  
    <public name="limit" type="Integer" value="1"/>  
    <public name="columns" type="String" value=""/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String" value=""/>  
    <public name="aggregateColumns" type="String" value=""/>  
    <public name="variables" type="Map"/>  
    <private name="dataModel" type="String" value="/demo/misc/data"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  
  <action name="createOrderAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="DEMO_Order"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action> 
   
  <action name="saveOrderAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="DEMO_Order"/>
    <private name="dataModel" type="String" value="/demo/misc/data"/>      
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
   </action>  
   
  <action name="queryOrder_DAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="DEMO_OrderDetail"/>
    <public name="idColumn" type="String" value="orderSub"/>  
    <private name="select" type="String" value="orderSub.*"/>  
    <private name="from" type="String" value="DEMO_OrderDetail orderSub"/>  
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
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="createOrder_DAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="DEMO_OrderDetail"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  
  <action name="saveOrder_DAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="DEMO_OrderDetail"/>
    <private name="dataModel" type="String" value="/demo/misc/data"/>       
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/> 
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>
    
  <action name="queryCustemorAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="DEMO_Custemor"/>
    <public name="idColumn" type="String" value="DEMO_Custemor"/>  
    <private name="select" type="String" value="DEMO_Custemor.*"/>  
    <private name="from" type="String" value="DEMO_Custemor DEMO_Custemor"/>  
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
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  
  <action name="queryProductAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="DEMO_Product"/>
    <public name="idColumn" type="String" value="product"/>  
    <private name="select" type="String" value="product.*"/>  
    <private name="from" type="String" value="DEMO_Product product"/>  
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
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  
  <action name="queryOPPersonAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="SA_OPPerson"/>
    <public name="idColumn" type="String" value="SA_OPPerson"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="select" type="String" value="SA_OPPerson.*"/>  
    <private name="from" type="String" value="SA_OPPerson SA_OPPerson"/>  
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
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action> 
</model>