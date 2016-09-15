<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="exportDataFromDBAction" global="false" procedure="exportDataFromDBProcedure">
    <label language="zh_CN">导出初始化数据</label>  
    <public type="List" name="concepts" /><public type="String" name="dataModel"/>  
     
  </action>  
  <action name="exportDataFromDB2Action" global="false" procedure="exportDataFromDB2Procedure">
    <label language="zh_CN">导出初始化数据2</label>  
    <public type="Map" name="config"/>  
  </action>  
  
  <action name="getDataModelsAction" global="false" procedure="getDataModelsProcedure">
    <label language="zh_CN">获取数据模块</label> 
  <public type="String" name="model" required="false"></public>
</action>  
  <action name="getConceptsInModelAction" global="false" procedure="getConceptsInModelProcedure">
    <label language="zh_CN">获取模块中的概念</label>  
    <public type="String" name="model"/> 
  </action> 
</model>
