<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="orgSynchToWeixinAction" global="false" procedure="orgSynchToWeixinProcedure">
    <label language="zh_CN">组织机构同步</label>  
    <public type="String" name="AccountType"/>  
     
  </action>  
  <action name="getMenuConfigAction" global="false" procedure="getMenuConfigProcedure">
    <label language="zh_CN">获取微信菜单配置</label> 
  <public type="String" name="sCode"></public>
<public type="String" name="isSingle"></public>
</action>  
  <action name="saveMenuConfigAction" global="false" procedure="saveMenuConfigProcedure">
    <label language="zh_CN">保存微信菜单配置</label>  
    <public type="String" name="strJson"/> 
  <public type="String" name="angentID"></public>
<public type="String" name="oldAngentID"></public>
<public type="String" name="isSingle"></public>
</action>  
  <action name="menuSynchToWxAction" global="false" procedure="menuSynchToWxProcedure">
    <label language="zh_CN">同步微信菜单</label>  
    <public type="String" name="AppID"/> 
  <public type="String" name="isSingle"></public>
</action>  
  <action name="getweixinSetAction" global="false" procedure="getweixinSetProcedure">
    <label language="zh_CN">获取微信配置信息</label> 
  </action> 
<action name="deleteMenuConfigAction" global="false" procedure="deleteMenuConfigProcedure"><label language="zh_CN">删除菜单配置</label>
<public type="String" name="sCode"></public>
<public type="String" name="isSingle"></public>
</action>
<action name="psnSynchToWeixinAction" global="false" procedure="psnSynchToWeixinProcedure"><label language="zh_CN">同步人员</label>
<public type="String" name="AccountType"></public>
</action>
<action name="modifyOrgwxDeptIDAction" global="false" procedure="modifyOrgwxDeptIDProcedure"><label language="zh_CN">组织机构微信部门ID置空</label>
</action>
<action name="reLoadWxCacheAction" global="false" procedure="reLoadWxCacheProcedure"><label language="zh_CN">重新生成缓存</label>
<public type="String" name="sText"></public>
</action>
<action name="setClipbordContentsAction" global="false" procedure="setClipbordContentsProcedure"><label language="zh_CN">复制字符串到剪切板</label>
<public type="String" name="contents"></public>
</action>
</model>
