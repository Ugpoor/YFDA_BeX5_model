<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="demoActionParams" procedure="demoActionParamsProcedure"> 
    <label language="zh_CN">动作参数示例</label>  
    <public type="String" required="false" name="param_string"/>  
    <public type="Integer" required="false" name="param_integer"/>  
    <public type="Long" required="false" name="param_long"/>  
    <public type="Double" required="false" name="param_double"/>  
    <public type="Float" required="false" name="param_float"/>  
    <public type="DateTime" required="false" name="param_datetime"/>  
    <public type="Date" required="false" name="param_date"/>  
    <public type="Time" required="false" name="param_time"/>  
    <public type="Boolean" required="false" name="param_boolean"/>  
    <public type="Decimal" required="false" name="param_decimal"/>  
    <public type="List" required="false" name="param_list"/>  
    <public type="Map" required="false" name="param_map"/>  
    <public type="Object" required="false" name="param_object"/>  
    <public type="Xml" required="false" name="param_xml"/>  
    <public type="Table" required="false" name="param_table"/> 
  </action>  
  <action name="demoReturnSimple" global="false" procedure="demoReturnSimpleProcedure"> 
    <label language="zh_CN">返回简单值示例</label> 
  </action>  
  <action name="demoReturnList" global="false" procedure="demoReturnListProcedure"> 
    <label language="zh_CN">返回List示例</label> 
  </action>  
  <action name="demoReturnMap" global="false" procedure="demoReturnMapProcedure"> 
    <label language="zh_CN">返回Map示例</label> 
  </action>  
  <action name="demoReturnXML" global="false" procedure="demoReturnXMLProcedure">
    <label language="zh_CN">返回XML示例</label> 
  </action>  
  <action name="demoReturnTable" global="false" procedure="demoReturnTableProcedure">
    <label language="zh_CN">返回Table示例</label> 
  </action>  
  <action name="demoReturnObject" global="false" procedure="demoReturnObjectProcedure">
    <label language="zh_CN">返回自定义Object</label> 
  </action> 
  <action name="demoAsync" global="false" procedure="demoAsyncProcedure"> 
    <label language="zh_CN">异步请求示例</label> 
  </action>  
  <action name="demoUploadFile" procedure="demoUploadFileProcedure"> 
    <label language="zh_CN">上传文件示例</label>  
    <public type="String" required="true" name="fileName"/>  
    <public type="Object" required="true" name="file"/> 
  </action>  
  <action name="demoDownloadFile" procedure="demoDownloadFileProcedure"> 
    <label language="zh_CN">下载文件示例</label>  
    <public type="String" required="true" name="fileName"/> 
  </action>  
<action name="demoBatchAction1" global="false" procedure="demoBatchAction1Procedure"><label language="zh_CN">批请求动作1</label>
</action>
<action name="demoBatchAction2" global="false" procedure="demoBatchAction2Procedure"><label language="zh_CN">批请求动作2</label>
</action>
</model>
