<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="getClientAppsProcedure" code-model="/system/logic/code" code="ClientProcedure.getClientApps"/>  
  <procedure name="initSysDbProcedure" code-model="/system/logic/code" code="ClientProcedure.initSysDb"> 
    <parameter name="client" type="String"/> 
  </procedure>  
  <procedure name="getAllAppsProcedure" code-model="/system/logic/code" code="ClientProcedure.getAllApps"/>  
  <procedure name="addClientAppProcedure" code-model="/system/logic/code" code="ClientProcedure.addClientApp"> 
    <parameter name="client" type="String"/>  
    <parameter name="appModel" type="String"/> 
    <parameter name="options" type="Map"/> 
  </procedure>  
  <procedure name="addAppProcedure" code-model="/system/logic/code" code="ClientProcedure.addApp"> 
    <parameter name="appModel" type="String"/> 
    <parameter name="options" type="Map"/> 
  </procedure>  
  <procedure name="addClientProcedure" code-model="/system/logic/code" code="ClientProcedure.addClient"> 
    <parameter name="id" type="String"/> 
    <parameter name="name" type="String"/> 
    <parameter name="options" type="Map"/> 
  </procedure>  
  
  <procedure name="saveAppProcedure" code-model="/system/logic/code" code="ClientProcedure.saveApp"> 
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

  <procedure name="saveClientProcedure" code-model="/system/logic/code" code="ClientProcedure.saveClient"> 
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

  <procedure name="saveClientAppProcedure" code-model="/system/logic/code" code="ClientProcedure.saveClientApp"> 
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
</model>
