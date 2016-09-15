<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action global="false" name="demoAction1" procedure="demoAction1Procedure">
    <label language="zh_CN">示例动作1</label> 
  </action>  
  <action global="false" name="demoAction2" procedure="demoAction2Procedure">
    <label language="zh_CN">示例动作2</label> 
  </action>  
  <action global="false" name="demoAction3" procedure="demoAction3Procedure">
    <label language="zh_CN">示例动作3</label> 
  </action>  
  <action name="queryDEMO_ReportOrdersAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_ReportOrders"/>  
    <private name="select" type="String" value="DEMO_ReportOrders.*"/>  
    <private name="from" type="String" value="DEMO_ReportOrders DEMO_ReportOrders"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/org/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_ReportOrders"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">订单查询（数据权限示例）</label> 
  </action>  
  <action name="orderShipVerify" global="false" procedure="orderShipVerifyProcedure">
    <label language="zh_CN">订单发货审核（参数策略示例）</label>  
    <public type="String" required="true" name="orderID"/>  
    <permission type="List" name="verifyLimit"/> 
  </action>  
  <action name="orderShipVerify1" global="false" procedure="orderShipVerify1Procedure">
    <label language="zh_CN">订单发货审核1（业务策略示例）</label>  
    <public type="String" required="true" name="orderID"/> 
  </action> 
</model>
