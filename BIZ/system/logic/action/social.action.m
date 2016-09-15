<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <action name="querySocialAction" procedure="bizQueryProcedure" global="true">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_Social"/>  
    <private name="select" type="String" value="SA_Social.*"/>  
    <private name="from" type="String" value="SA_Social SA_Social"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_Social"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveSocialAction" procedure="bizSaveProcedure" global="true">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_Social"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createSocialAction" procedure="bizCreateProcedure" global="true">
    <private name="concept" type="String" value="SA_Social"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="clearMessageNumberAction" global="true" procedure="clearMessageNumberProcedure">
    <label language="zh_CN">清空相关人的消息数</label>  
    <public type="String" name="personID" required="false"/>  
    <public type="String" name="data"/> 
  </action> 
  <action name="updateMessageNumberAction" global="true" procedure="updateMessageNumberProcedure">
    <label language="zh_CN">更新消息数</label>  
    <public type="String" name="data"/> 
    <public type="String" name="personID" required="false"/>  
  </action> 
  <action name="updateFocusAction" global="true" procedure="updateFocusProcedure">
    <label language="zh_CN">更新关注状态</label>  
    <public type="String" name="name"/>  
    <public type="String" name="fid"/>  
    <public type="String" name="fname"/>  
    <public type="String" name="data"/> 
    <public type="Integer" name="focus"/> 
    <public type="String" name="process"/> 
    <public type="String" name="activity"/> 
    <public type="String" name="url"/> 
  </action> 
</model>
