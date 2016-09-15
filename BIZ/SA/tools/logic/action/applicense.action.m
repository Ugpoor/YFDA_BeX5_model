<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="encryptAppAction" global="false" procedure="encryptAppProcedure">
    <public type="Object" name="cert" required="true"/>
    <public type="String" name="password" required="true"/>
    <public type="String" name="sourceModelPath" required="true"/>  
    <label language="zh_CN">加密签名应用</label>  
    <public type="String" name="targetModelPath" required="true"/>  
    <public type="String" name="app" required="true"/> 
  <public type="String" name="isCompile"></public>
</action>  

  <action name="regAppLicenseAction" global="false" procedure="regAppLicenseProcedure">
    <public type="String" name="appLicense" required="true"/>  
    <label language="zh_CN">注册应用License</label> 
  </action>
   
</model>
