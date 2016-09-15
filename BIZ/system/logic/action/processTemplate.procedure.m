<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="saveProcessTemplateProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.saveProcessTemplate"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="saveProcessTemplate3Procedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.saveProcessTemplate3"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="startCustomizedProcessProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.startCustomizedProcess"> 
    <parameter name="task" type="String"/>  
    <parameter name="template" type="String"/> 
  </procedure>  
  <procedure name="cancelCustomizedProcessProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.cancelCustomizedProcess"> 
    <parameter name="task" type="String"/> 
  </procedure>  
  <procedure name="startCustomizedProcessQueryProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.startCustomizedProcessQuery"> 
    <parameter name="task" type="String"/> 
  </procedure>  
  <procedure name="queryCustomizedRangeProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.queryCustomizedRange"> 
    <parameter name="task" type="String"/> 
  </procedure>  
  <procedure name="queryCustomizedRange2Procedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.queryCustomizedRange2"> 
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/> 
  </procedure>  
  <procedure name="queryCustomizedRange3Procedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.queryCustomizedRange3"> 
    <parameter name="process" type="String"/> 
  </procedure>  
  <procedure name="queryProcessTemplateProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.queryProcessTemplate"> 
    <parameter name="concept" type="String"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="range" type="List"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="queryRange" type="String"/> 
  </procedure>  
  <procedure name="queryProcessDefineProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.queryProcessDefine"> 
    <parameter name="process" type="String"/> 
  </procedure>  
  <procedure name="queryProcessDefine2Procedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.queryProcessDefine2"> 
    <parameter name="process" type="String"/> 
  </procedure>  
  <procedure name="queryProcessChartByCustomizedProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.queryProcessChartByCustomized"> 
    <parameter name="task" type="String"/> 
  </procedure>  
  <procedure name="assignTemplatePermissionProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.assignTemplatePermission"> 
    <parameter name="template" type="String"/>  
    <parameter name="process" type="String"/>  
    <parameter name="processName" type="String"/>  
    <parameter name="orgIDs" type="List"/>  
    <parameter name="orgNames" type="List"/>  
    <parameter name="orgFIDs" type="List"/>  
    <parameter name="orgFNames" type="List"/> 
  </procedure>  
  <procedure name="deleteTemplatePermissionProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.deleteTemplatePermission"> 
    <parameter name="ids" type="Map"/> 
  </procedure>  
  <procedure name="deleteTemplateProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.deleteTemplate"> 
    <parameter name="ids" type="Map"/>  
    <parameter type="Map" name="processes"/> 
  </procedure>  
  <procedure name="enabledTemplateProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.enabledTemplate"> 
    <parameter name="ids" type="Map"/>  
    <parameter type="Map" name="processes"/> 
  </procedure>  
  <procedure name="disabledTemplateProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.disabledTemplate"> 
    <parameter name="ids" type="Map"/>  
    <parameter type="Map" name="processes"/> 
  </procedure>  
  <procedure name="saveProcessTemplate4Procedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.saveProcessTemplate4"> 
    <parameter name="id" type="String"/>  
    <parameter name="sName" type="String"/>  
    <parameter name="sProcess" type="String"/>  
    <parameter name="sContent" type="String"/>  
    <parameter name="sContent2" type="String"/>  
    <parameter name="sTemplateID" type="String"/>  
    <parameter name="sKindID" type="String"/> 
  </procedure>  
  <procedure name="replaceTemplateProcedure" code-model="/system/logic/code" code="ProcessTemplateProcedure.replaceTemplate">
    <parameter name="task" type="String"/>
    <parameter name="template" type="String"/>
  </procedure>
</model>
