<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="demoActionParamsProcedure" code-model="/demo/actions/logic/code" code="Actions.demoActionParams"> 
    <parameter name="param_string" type="String"/>  
    <parameter name="param_integer" type="Integer"/>  
    <parameter name="param_long" type="Long"/>  
    <parameter name="param_double" type="Double"/>  
    <parameter name="param_float" type="Float"/>  
    <parameter name="param_datetime" type="DateTime"/>  
    <parameter name="param_date" type="Date"/>  
    <parameter name="param_time" type="Time"/>  
    <parameter name="param_boolean" type="Boolean"/>  
    <parameter name="param_decimal" type="Decimal"/>  
    <parameter name="param_list" type="List"/>  
    <parameter name="param_map" type="Map"/>  
    <parameter name="param_object" type="Object"/>  
    <parameter name="param_xml" type="Xml"/>  
    <parameter name="param_table" type="Table"/> 
  </procedure>  
  <procedure name="demoUploadFileProcedure" code-model="/demo/actions/logic/code" code="Actions.demoUploadFile"> 
    <parameter name="fileName" type="String"/>  
    <parameter name="file" type="Object"/> 
  </procedure>  
  <procedure name="demoDownloadFileProcedure" code-model="/demo/actions/logic/code" code="Actions.demoDownloadFile"> 
    <parameter name="fileName" type="String"/> 
  </procedure>  
  <procedure name="demoReturnSimpleProcedure" code-model="/demo/actions/logic/code" code="Actions.demoReturnSimple"/>  
  <procedure name="demoReturnMapProcedure" code-model="/demo/actions/logic/code" code="Actions.demoReturnMap"/>  
  <procedure name="demoAsyncProcedure" code-model="/demo/actions/logic/code" code="Actions.demoAsync"/>  
  <procedure name="demoReturnListProcedure" code-model="/demo/actions/logic/code" code="Actions.demoReturnList"/>  
  <procedure name="demoReturnXMLProcedure" code-model="/demo/actions/logic/code" code="Actions.demoReturnXML"/>  
  <procedure name="demoReturnTableProcedure" code-model="/demo/actions/logic/code" code="Actions.demoReturnTable"/>  
  <procedure name="demoReturnObjectProcedure" code-model="/demo/actions/logic/code" code="Actions.demoReturnObject"/>  
  <procedure name="demoBatchAction1Procedure" code-model="/demo/actions/logic/code" code="Actions.demoBatchAction1"/>  
  <procedure name="demoBatchAction2Procedure" code-model="/demo/actions/logic/code" code="Actions.demoBatchAction2"/>
</model>
