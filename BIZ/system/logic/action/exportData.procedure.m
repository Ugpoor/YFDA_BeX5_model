<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="exportDataFromDBProcedure" code-model="/system/logic/code" code="ExportData.exportDataFromDB">
    <parameter name="concepts" type="List"/>
    <parameter name="dataModel" type="String"/>
  </procedure>
  <procedure name="exportDataFromDB2Procedure" code-model="/system/logic/code" code="ExportData.exportDataFromDB2">
    <parameter name="config" type="Map"/>
  </procedure>
  
  <procedure name="getDataModelsProcedure" code-model="/system/logic/code" code="ExportData.getDataModels"> 
  	<parameter name="model" type="String"/> 
  </procedure> 
  <procedure name="getConceptsInModelProcedure" code-model="/system/logic/code" code="ExportData.getConceptsInModel"> 
    <parameter name="model" type="String"/> 
  </procedure>    
</model>
