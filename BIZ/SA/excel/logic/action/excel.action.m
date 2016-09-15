<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="exportExcel" global="true" procedure="exportExcelProcedure"> 
    <label language="zh_CN">excel导出</label>  
    <public name="from" type="String"/>  
    <public name="config" type="Xml"/>  
    <public name="data" type="Table"/>  
    <public type="Map" name="queryActionParam"/> 
  </action>  
  <action name="downloadExportExcel" global="true" procedure="downloadExportExcelProcedure"> 
    <label language="zh_CN">excel导出文件下载</label>  
    <public name="fileName" type="String"/> 
  </action>  
  <action name="uploadImportExcel" global="true" procedure="uploadImportExcelProcedure"> 
    <label language="zh_CN">excel导入文件上传</label>  
    <public name="excel" type="Object" required="true"/>  
    <public name="mapping" type="Object" required="true"/> 
</action>  
  <action name="importExcel" global="true" procedure="importExcelProcedure">
    <label language="zh_CN">excel导入</label> 
    <public name="config" type="Xml"/>  
    <public type="Map" name="createActionParam"/> 
    <public type="Map" name="saveActionParam"/> 
  </action> 
<action name="exportExcelBeforeAction" global="true" procedure="exportExcelBeforeProcedure">
	<label language="zh_CN">导出excel前</label>
	<public name="data" type="Table"></public>
	<public name="excel" type="Object"></public>
</action>
<action name="exportExcelAfterAction" global="true" procedure="exportExcelAfterProcedure">
	<label language="zh_CN">导出excel后</label>
	<public name="data" type="Table"></public>
	<public name="excel" type="Object"></public>
</action>
<action name="importExcelBeforeAction" global="true" procedure="importExcelBeforeProcedure"><public name="excel" type="Object"></public>
<public name="config" type="Object"></public>
<label language="zh_CN">导入excel前</label>
</action>
<action name="importExcelAfterAction" global="true" procedure="importExcelAfterProcedure"><public name="data" type="Table"></public>
<public name="excel" type="Object"></public>
<public name="config" type="Object"></public>
<label language="zh_CN">导入excel后</label>
</action>
</model>
