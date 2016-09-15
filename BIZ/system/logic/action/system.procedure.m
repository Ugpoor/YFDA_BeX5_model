<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="getProcessProcedure" code-model="/system/logic/code" code="SystemProcedure.getProcessList"/>  
  <procedure name="getAgentListProcedure" code-model="/system/logic/code" code="SystemProcedure.getAgentList"> 
    <parameter name="type" type="String"/> 
  </procedure>  
  <procedure name="getSysParamsProcedure" code-model="/system/logic/code" code="SystemProcedure.getSysParams"/>  
  <procedure name="getPersonMembersProcedure" code-model="/system/logic/code" code="SystemProcedure.getPersonMembers"> 
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/>  
    <parameter name="type" type="String"/> 
  </procedure>  
  <procedure name="openActivityProcedure" code-model="/system/logic/code" code="SystemProcedure.openActivity"/>  
  <procedure name="closeActivityProcedure" code-model="/system/logic/code" code="SystemProcedure.closeActivity"/>  
  <procedure name="getDataModelProcedure" code-model="/system/logic/code" code="SystemProcedure.getDataModelList"> 
    <parameter name="process" type="String"/> 
  </procedure>  
  <procedure name="getActivationPackageProcedure" code-model="/system/logic/code" code="SystemProcedure.getActivationPackage"/>  
  <procedure name="getActivationTimeProcedure" code-model="/system/logic/code" code="SystemProcedure.getActivationTime"/>  
  <procedure name="regActivationPackageProcedure" code-model="/system/logic/code" code="SystemProcedure.regActivationPackage"> 
    <parameter name="pkg" type="String"/> 
  </procedure>  
  <procedure name="getSysCodeProcedure" code-model="/system/logic/code" code="SystemProcedure.getSysCode"/>
</model>
