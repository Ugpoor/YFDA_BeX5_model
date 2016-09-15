<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryOPCustomGroupAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_OPCustomGroup"/>  
    <private name="select" type="String" value="SA_OPCustomGroup.*"/>  
    <private name="from" type="String" value="SA_OPCustomGroup SA_OPCustomGroup"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPCustomGroup"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPCustomGroup.sSequence asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询自定义组织分组</label> 
  </action>  
  <action name="saveOPCustomGroupAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_OPCustomGroup"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <label language="zh_CN">保存自定义组织分组</label> 
  </action>  
  <action name="createOPCustomGroupAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="SA_OPCustomGroup"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <label language="zh_CN">创建自定义组织分组</label> 
  </action>
</model>
