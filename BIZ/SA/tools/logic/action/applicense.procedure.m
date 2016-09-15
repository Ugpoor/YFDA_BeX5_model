<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="encryptAppProcedure" code-model="/SA/tools/logic/code" code="Tools.encryptApp"> 
    <parameter name="cert" type="Object"/>
    <parameter name="password" type="String"/>
    <parameter name="sourceModelPath" type="String"/>
    <parameter name="targetModelPath" type="String"/>
    <parameter name="app" type="String"/>
    <parameter name="isCompile" type="String"/>
  </procedure>  
  <procedure name="regAppLicenseProcedure" code-model="/SA/tools/logic/code" code="Tools.regAppLicense"> 
    <parameter name="appLicense" type="String"/> 
  </procedure> 
</model>
