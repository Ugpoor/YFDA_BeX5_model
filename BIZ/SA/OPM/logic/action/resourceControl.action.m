<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="addOrgResource" global="false" procedure="addOrgResourceProcedure"> 
    <label language="zh_CN">增加组织资源</label>  
    <public type="Map" name="orgUnits" required="true"/>  
    <public type="String" name="resourceID" required="true"/>  
    <public type="String" name="typeID" required="true"/>  
    <public type="String" name="typeName" required="true"/> 
  </action>  
  <action name="removeOrgResource" global="false" procedure="removeOrgResourceProcedure"> 
    <label language="zh_CN">删除组织资源</label>  
    <public type="List" name="ids"/> 
  </action> 
</model>
