<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="demoAction1Procedure" code-model="/demo/org/logic/code" code="Org.demoAction1"/>  
  <procedure name="demoAction2Procedure" code-model="/demo/org/logic/code" code="Org.demoAction2"/>  
  <procedure name="demoAction3Procedure" code-model="/demo/org/logic/code" code="Org.demoAction3"/>  
  <procedure name="demoDataPermissionProcedure" code-model="/demo/org/logic/code" code="Org.demoDataPermission"> 
    <parameter name="permissionParam" type="List"/> 
  </procedure>  
  <procedure name="orderVerifyProcedure" code-model="/demo/org/logic/code" code="Org.orderVerify"> 
    <parameter name="orderID" type="String"/>  
    <parameter name="verifyLimit" type="List"/> 
  </procedure>  
  <procedure name="orderShipVerifyProcedure" code-model="/demo/org/logic/code" code="Org.orderShipVerify"> 
    <parameter name="orderID" type="String"/>  
    <parameter name="verifyLimit" type="List"/> 
  </procedure>  
  <procedure name="orderShipVerify1Procedure" code-model="/demo/org/logic/code" code="Org.orderShipVerify1">
    <parameter name="orderID" type="String"/>
  </procedure>
</model>
