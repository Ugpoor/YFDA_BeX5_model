<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="clearMessageNumberProcedure" code-model="/system/logic/code" code="SocialProcedure.clearMessageNumber"> 
    <parameter name="personID" type="String"/>  
    <parameter name="data" type="String"/> 
  </procedure>  
  <procedure name="updateMessageNumberProcedure" code-model="/system/logic/code" code="SocialProcedure.updateMessageNumber"> 
    <parameter name="data" type="String"/> 
    <parameter name="personID" type="String"/>  
  </procedure>  
  <procedure name="updateFocusProcedure" code-model="/system/logic/code" code="SocialProcedure.updateFocus">
    <parameter name="name" type="String"/>
    <parameter name="fid" type="String"/>
    <parameter name="fname" type="String"/>
    <parameter name="data" type="String"/>
    <parameter name="focus" type="Integer"/>
    <parameter name="process" type="String"/>
    <parameter name="activity" type="String"/>
    <parameter name="url" type="String"/>
  </procedure>
</model>
