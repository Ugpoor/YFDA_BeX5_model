<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryOPAgentAction" procedure="queryOPAgentProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_OPAgent"/>  
    <private name="select" type="String" value="SA_OPAgent.*,SA_OPPerson.sName as agentPersonName,'' as processLabel"/>  
    <private name="from" type="String" value="SA_OPAgent SA_OPAgent  optional  join SA_OPPerson SA_OPPerson on SA_OPAgent.sAgentID = SA_OPPerson"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPAgent"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPAgent.sCreateTime desc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询代理</label> 
  </action>  
  <action name="saveOPAgentAction" procedure="saveOPAgentProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_OPAgent"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <label language="zh_CN">保存代理</label> 
  </action>  
  <action name="createOPAgentAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="SA_OPAgent"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  <label language="zh_CN">创建代理</label>
</action> 
  <action name="appendAgentsAction" global="false" procedure="appendAgentsProcedure"> 
    <label language="zh_CN">添加代理</label>  
    <public type="List" name="orgFIDList" required="true"/>  
    <public type="List" required="true" name="processList"/>
    <public type="String" name="agentPersonID" required="true"/>  
    <public type="DateTime" name="startTime" required="false"/>  
    <public type="DateTime" name="finishTime" required="false"/> 
  <public type="Boolean" required="false" name="canTranAgent"/>
</action>  
  <action name="cancelAgentsAction" global="false" procedure="cancelAgentsProcedure"> 
    <label language="zh_CN">取消代理</label>  
    <public type="Map" name="agents" required="true"/> 
  </action>  
  <action name="deleteAgentsAction" global="false" procedure="deleteAgentsProcedure"> 
    <label language="zh_CN">删除代理</label>  
    <public type="Map" name="agents" required="true"/> 
  </action> 
<action name="agentProcessStringToTableAction" global="false" procedure="agentProcessStringToTableProcedure"><label language="zh_CN">代理权限StringToTable</label>
<public type="String" required="true" name="process"/>
</action>
<action name="agentProcessTableToStringAction" global="false" procedure="agentProcessTableToStringProcedure"><label language="zh_CN">代理权限TableToString</label>
<public type="Table" required="true" name="table"/>
</action>
<action name="getModelTreeAction" global="false" procedure="getModelTreeProcedure"><label language="zh_CN">获取模型树</label>
</action>
</model>
