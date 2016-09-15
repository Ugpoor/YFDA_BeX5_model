<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <action name="queryLogSettingAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_LogSetting"/>  
    <private name="select" type="String" value="SA_LogSetting.*"/>  
    <private name="from" type="String" value="SA_LogSetting SA_LogSetting"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_LogSetting"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询操作日志设置</label> 
  </action>  
  <action name="saveLogSettingAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_LogSetting"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <label language="zh_CN">保存操作日志设置</label> 
  </action>  
  <action name="createLogSettingAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_LogSetting"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <label language="zh_CN">新建操作日志设置</label> 
  </action>  
  <action name="queryLogAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_Log"/>  
    <private name="select" type="String" value="SA_Log.*"/>  
    <private name="from" type="String" value="SA_Log SA_Log"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_Log"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询操作日志</label> 
  </action>  
  <action name="saveLogAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_Log"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <label language="zh_CN">保存操作日志</label> 
  </action>  
  <action name="createLogAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_Log"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <label language="zh_CN">新建操作日志</label> 
  </action>  
  <action name="getActionsAction" procedure="getActionsProcedure"> 
    <public name="processes" required="true" type="Xml"/>  
    <label language="zh_CN">获取所有的操作</label> 
  </action>  
  <action global="true" name="logAction" procedure="logProcedure"> 
    <label language="zh_CN">记录操作日志</label>  
    <public name="actionName" required="true" type="String"/>  
    <public name="parameters" required="false" type="String"/>  
    <public name="result" required="false" type="String"/>  
    <public name="typeName" required="false" type="String"/>  
    <public name="description" required="false" type="String"/> 
  </action>  
  <action global="false" name="enableLogSettingAction" procedure="enableLogSettingProcedure">
    <label language="zh_CN">启动日志配置</label> 
  </action> 
</model>