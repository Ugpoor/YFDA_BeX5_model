<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="orgSynchToWeixinProcedure" code-model="/SA/weixin/logic/code" code="orgSynchronizeToWeixin.orgSynchToWeixin"> 
    <parameter name="AccountType" type="String"/> 
  </procedure>  
  <procedure name="getMenuConfigProcedure" code-model="/SA/weixin/logic/code" code="Menuconfig.getMenuConfig"> 
    <parameter name="sCode" type="String"/>  
    <parameter name="isSingle" type="String"/> 
  </procedure>  
  <procedure name="saveMenuConfigProcedure" code-model="/SA/weixin/logic/code" code="Menuconfig.saveMenuConfig"> 
    <parameter name="strJson" type="String"/>  
    <parameter name="angentID" type="String"/>  
    <parameter name="oldAngentID" type="String"/>  
    <parameter name="isSingle" type="String"/> 
  </procedure>  
  <procedure name="menuSynchToWxProcedure" code-model="/SA/weixin/logic/code" code="orgSynchronizeToWeixin.menuSynchToWx"> 
    <parameter name="AppID" type="String"/>  
    <parameter name="isSingle" type="String"/> 
  </procedure>  
  <procedure name="getweixinSetProcedure" code-model="/SA/weixin/logic/code" code="Menuconfig.getweixinSet"/>  
  <procedure name="deleteMenuConfigProcedure" code-model="/SA/weixin/logic/code" code="Menuconfig.deleteMenuConfig"> 
    <parameter name="sCode" type="String"/>  
    <parameter name="isSingle" type="String"/> 
  </procedure>  
  <procedure name="psnSynchToWeixinProcedure" code-model="/SA/weixin/logic/code" code="orgSynchronizeToWeixin.psnSynchToWeixin"> 
    <parameter name="AccountType" type="String"/> 
  </procedure>  
  <procedure name="modifyOrgwxDeptIDProcedure" code-model="/SA/weixin/logic/code" code="Menuconfig.modifyOrgwxDeptID"/>  
  <procedure name="reLoadWxCacheProcedure" code-model="/SA/weixin/logic/code" code="Menuconfig.reLoadWxCache"> 
    <parameter name="sText" type="String"/> 
  </procedure>  
  <procedure name="setClipbordContentsProcedure" code-model="/SA/weixin/logic/code" code="Menuconfig.setClipbordContents">
    <parameter name="contents" type="String"/>
  </procedure>
</model>
