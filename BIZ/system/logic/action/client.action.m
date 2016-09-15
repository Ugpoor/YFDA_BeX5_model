<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action global="false" name="initSysDbAction" procedure="initSysDbProcedure"> 
    <label language="zh_CN">初始化系统库数据</label>  
    <public name="client" required="false" type="String"/> 
  </action>  
  <action global="false" name="addClientAction" procedure="addClientProcedure"> 
    <label language="zh_CN">添加租户</label>  
    <public type="String" name="id"></public><public name="name" type="String" required="false"/>  
    <public type="Map" name="options" required="false"/> 
  
</action>  
  <action global="false" name="addAppAction" procedure="addAppProcedure"> 
    <label language="zh_CN">添加应用</label>  
    <public name="appModel" type="String"/>  
    <public type="Map" name="options" required="false"/> 
  </action>  
  <action global="false" name="addClientAppAction" procedure="addClientAppProcedure"> 
    <label language="zh_CN">添加租户应用</label>  
    <public name="client" required="false" type="String"/>  
    <public name="appModel" type="String"/>  
    <public type="Map" name="options" required="false"/> 
  </action>  
  <action name="getClientAppsAction" procedure="getClientAppsProcedure"> 
    <label language="zh_CN">获取当前租户拥有的应用</label> 
  </action>  
  <action global="false" name="getAllAppsAction" procedure="getAllAppsProcedure"> 
    <label language="zh_CN">获取所有的应用[应用管理]</label> 
  </action>  
  <action name="querySA_ClientAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_Client"/>  
    <private name="select" type="String" value="SA_Client.*"/>  
    <private name="from" type="String" value="SA_Client SA_Client"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_Client"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveSA_ClientAction" procedure="saveClientProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_Client"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createSA_ClientAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_Client"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="querySA_AppAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_App"/>  
    <private name="select" type="String" value="SA_App.*"/>  
    <private name="from" type="String" value="SA_App SA_App"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_App"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveSA_AppAction" procedure="saveAppProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_App"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createSA_AppAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_App"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="querySA_AppVendorAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_AppVendor"/>  
    <private name="select" type="String" value="SA_AppVendor.*"/>  
    <private name="from" type="String" value="SA_AppVendor SA_AppVendor"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_AppVendor"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveSA_AppVendorAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_AppVendor"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createSA_AppVendorAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_AppVendor"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="querySA_ClientAppAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_ClientApp"/>  
    <private name="select" type="String" value="SA_ClientApp.*"/>  
    <private name="from" type="String" value="SA_ClientApp SA_ClientApp"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_ClientApp"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveSA_ClientAppAction" procedure="saveClientAppProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_ClientApp"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createSA_ClientAppAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_ClientApp"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action> 
</model>
