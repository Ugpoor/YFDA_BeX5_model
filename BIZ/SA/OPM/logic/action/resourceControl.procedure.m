<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="addOrgResourceProcedure" code-model="/SA/OPM/logic/code" code="ResourceControlProcedure.addOrgResource"> 
    <parameter name="orgUnits" type="Map"/>  
    <parameter name="resourceID" type="String"/>  
    <parameter name="typeID" type="String"/>  
    <parameter name="typeName" type="String"/>
  </procedure>  
  <procedure name="removeOrgResourceProcedure" code-model="/SA/OPM/logic/code" code="ResourceControlProcedure.removeOrgResource"> 
    <parameter name="ids" type="List"/> 
  </procedure> 
</model>
