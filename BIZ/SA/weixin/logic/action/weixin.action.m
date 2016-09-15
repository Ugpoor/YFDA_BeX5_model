<?xml version="1.0" encoding="utf-8" standalone="no"?><model xmlns="http://www.justep.com/model">  
  <action global="false" name="doWeixinRequest" procedure="doWeixinRequestProcedure"> 
    <label language="zh_CN">WeixinAction</label>  
    <public name="msgSignature" type="String"/>  
    <public name="inputStr" type="String"/>  
    <public name="nonce" type="String"/>  
    <public name="timestamp" type="String"/>  
    <public name="echostr" type="String"/> 
  </action>  
  <action global="false" name="sendLinkMessage" procedure="sendLinkMessageProcedure"> 
    <label language="zh_CN">sendLinkMessage</label>  
    <public name="msg" type="String"/>  
    <public name="url" type="String"/>  
    <public name="userid" type="String"/>  
    <public name="contextPath" type="String"/> 
  </action>  
  <action global="false" name="getUserId" procedure="getUserIdProcedure"> 
    <label language="zh_CN">getUserId</label>  
    <public name="userCode" type="String"/> 
  </action>  
  <action global="false" name="sendTextMessage" procedure="sendTextMessageProcedure"> 
    <label language="zh_CN">sendTextMessage</label>  
    <public name="userId" type="String"/>  
    <public name="content" type="String"/> 
  </action>  
  <action global="false" name="handleMessage" procedure="handleMessageProcedure">
    <label language="zh_CN">handleMessage</label>  
    <public name="inMessage" type="Object"/> 
  </action> 

<action name="querySA_WeixinCpAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="SA_WeixinCp"/>
<private name="select" type="String" value="SA_WeixinCp.*"/>
<private name="from" type="String" value="SA_WeixinCp SA_WeixinCp"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/SA/weixin/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="SA_WeixinCp"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveSA_WeixinCpAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="SA_WeixinCp"/>
<private name="dataModel" type="String" value="/SA/weixin/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createSA_WeixinCpAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="SA_WeixinCp"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>