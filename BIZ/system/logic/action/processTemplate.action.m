<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <action name="queryProcessTemplateAction" procedure="queryProcessTemplateProcedure"
    global="true"> 
    <private name="concept" type="String" value="SA_ProcessTemplate"/>  
    <public name="idColumn" type="String" value="SA_ProcessTemplate"/>  
    <private name="select" type="String" value="SA_ProcessTemplate.*,case when SA_ProcessTemplate.sScopeID = 'public' then '系统' else '用户' end as sScopeName,case when SA_ProcessTemplate.sTypeID='graph' then '图形' else '表格' end as sTypeName"/>  
    <private name="from" type="String" value="SA_ProcessTemplate SA_ProcessTemplate"/>  
    <private name="aggregate" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <label language="zh_CN">查询流程模板</label>  
    <public type="String" name="queryRange"/> 
  </action>  
  <!-- 
  <action name="queryProcessTemplate2Action" procedure="queryProcessTemplate2Procedure"
    global="true"> 
    <private name="concept" type="String" value="SA_ProcessTemplate"/>  
    <public name="idColumn" type="String" value="SA_ProcessTemplate"/>  
    <private name="select" type="String" value="SA_ProcessTemplate.*,case when SA_ProcessTemplate.sScopeID = 'public' then '系统' else '用户' end as sScopeName"/>  
    <private name="from" type="String" value="SA_ProcessTemplate SA_ProcessTemplate"/>  
    <private name="aggregate" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <label language="zh_CN">查询流程模板2</label> 
  </action>  
   -->  
  <action name="saveProcessTemplateAction" procedure="saveProcessTemplateProcedure"
    global="true"> 
    <label language="zh_CN">保存流程模板</label>  
    <public name="table" type="Table"/>  
    <public name="concept" type="String" value="SA_ProcessTemplate"/>  
    <public name="insertRange" type="List"/>  
    <public name="deleteRange" type="List"/>  
    <public name="updateRange" type="List"/>  
    <public name="readOnly" type="String"/>  
    <public name="notNull" type="String"/>  
    <public name="dataModel" type="String" value="/system/data"/>  
    <public name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="saveProcessTemplate3Action" procedure="saveProcessTemplate3Procedure"
    global="true"> 
    <label language="zh_CN">保存流程模板</label>  
    <public name="table" type="Table"/>  
    <public name="concept" type="String" value="SA_ProcessTemplate"/>  
    <public name="insertRange" type="List"/>  
    <public name="deleteRange" type="List"/>  
    <public name="updateRange" type="List"/>  
    <public name="readOnly" type="String"/>  
    <public name="notNull" type="String"/>  
    <public name="dataModel" type="String" value="/system/data"/>  
    <public name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="createProcessTemplateAction" procedure="bizCreateProcedure" global="true"> 
    <private name="concept" type="String" value="SA_ProcessTemplate"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <label language="zh_CN">新建流程模板</label> 
  </action>  
  <action name="startCustomizedProcessAction" global="true" procedure="startCustomizedProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="template" type="String"/>  
    <label language="zh_CN">启动流程定制</label> 
  </action>  
  <action name="cancelCustomizedProcessAction" global="true" procedure="cancelCustomizedProcessProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">取消流程定制</label> 
  </action>  
  <action name="startCustomizedProcessQueryAction" global="true" procedure="startCustomizedProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">启动流程定制查询</label> 
  </action>  
  <action name="queryCustomizedRangeAction" global="true" procedure="queryCustomizedRangeProcedure"> 
    <label language="zh_CN">查询定制范围</label>  
    <public name="task" type="String"/> 
  </action>  
  <action name="queryCustomizedRange2Action" global="true" procedure="queryCustomizedRange2Procedure"> 
    <label language="zh_CN">查询定制范围2</label>  
    <public name="process" type="String"/>  
    <public name="activity" type="String"/> 
  </action>  
  <action name="queryCustomizedRange3Action" global="true" procedure="queryCustomizedRange3Procedure"> 
    <label language="zh_CN">查询定制范围3</label>  
    <public name="process" type="String"/> 
  </action>  
  <action name="queryProcessDefineAction" global="true" procedure="queryProcessDefineProcedure"> 
    <label language="zh_CN">查询流程定义</label>  
    <public name="process" type="String"/> 
  </action>  
  <action name="queryProcessDefine2Action" global="true" procedure="queryProcessDefine2Procedure"> 
    <label language="zh_CN">查询流程定义2</label>  
    <public name="process" type="String"/> 
  </action>  
  <action name="queryProcessChartByCustomizedAction" global="true" procedure="queryProcessChartByCustomizedProcedure"> 
    <label language="zh_CN">查询定制中的流程轨迹图</label>  
    <public type="String" required="true" name="task"/> 
  </action>  
  <action name="assignTemplatePermissionAction" global="true" procedure="assignTemplatePermissionProcedure">
    <label language="zh_CN">分配模板权限</label>  
    <public type="String" name="template"/>  
    <public type="String" name="process"/>  
    <public type="String" name="processName"/> 
    <public type="List" name="orgIDs"/>
    <public type="List" name="orgNames"/>
    <public type="List" name="orgFIDs"/>  
    <public type="List" name="orgFNames"/>  
  </action> 
  <action name="deleteTemplateAction" procedure="deleteTemplateProcedure">
    <label language="zh_CN">删除模板</label>  
    <public type="Map" name="ids"/>  
    <public type="Map" name="processes"/>  
  </action> 
  <action name="deleteTemplatePermissionAction" procedure="deleteTemplatePermissionProcedure">
    <label language="zh_CN">删除模板权限</label>  
    <public type="Map" name="ids"/>  
  </action> 
  <action name="enabledTemplateAction" procedure="enabledTemplateProcedure">
    <label language="zh_CN">启用模板</label>  
    <public type="Map" name="ids"/>  
    <public type="Map" name="processes"/>  
  </action> 
  <action name="disabledTemplateAction" procedure="disabledTemplateProcedure">
    <label language="zh_CN">启用模板</label>  
    <public type="Map" name="ids"/>  
    <public type="Map" name="processes"/>  
  </action> 
<action name="saveProcessTemplate4Action" global="true" procedure="saveProcessTemplate4Procedure"><label language="zh_CN">保存流程模板</label>
<public type="String" name="sName"></public>
<public type="String" name="sProcess"></public>
<public type="String" name="sContent"></public>
<public type="String" name="sContent2"></public>
<public type="String" name="id" required="false"></public>

<public type="String" name="sTemplateID" required="false"></public><public type="String" name="sKindID" required="false"></public>
</action>
<action name="replaceTemplateAction" global="true" procedure="replaceTemplateProcedure"><label language="zh_CN">更换模板</label>
<public type="String" name="task"></public>
<public type="String" name="template"></public>
</action>
</model>
