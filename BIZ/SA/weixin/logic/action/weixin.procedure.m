<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="doWeixinRequestProcedure" code-model="/SA/weixin/logic/code" code="Weixin.doWeixinRequest"> 
    <parameter name="msgSignature" type="String"/>  
    <parameter name="inputStr" type="String"/>  
    <parameter name="nonce" type="String"/>  
    <parameter name="timestamp" type="String"/>  
    <parameter name="echostr" type="String"/> 
  </procedure>  
  <procedure name="sendLinkMessageProcedure" code-model="/SA/weixin/logic/code" code="Weixin.sendLinkMessage"> 
    <parameter name="msg" type="String"/>  
    <parameter name="url" type="String"/>  
    <parameter name="userid" type="String"/>  
    <parameter name="contextPath" type="String"/> 
  </procedure>  
  <procedure name="getUserIdProcedure" code-model="/SA/weixin/logic/code" code="Weixin.getUserId"> 
    <parameter name="userCode" type="String"/> 
  </procedure>  
  <procedure name="sendTextMessageProcedure" code-model="/SA/weixin/logic/code" code="Weixin.sendTextMessage"> 
    <parameter name="userId" type="String"/>  
    <parameter name="content" type="String"/> 
  </procedure>  
  <procedure name="handleMessageProcedure" code-model="/SA/weixin/logic/code" code="Weixin.handleMessage">
    <parameter name="inMessage" type="Object"/>
  </procedure>
</model>
