<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <action name="getProcessAction" procedure="getProcessProcedure"> 
    <label language="zh_CN">获取所有的Process</label> 
  </action>  
  <action name="getAgentListAction" procedure="getAgentListProcedure"> 
    <label language="zh_CN">获取代理人列表</label>  
    <public type="String" required="false" name="type" value="xml"/> 
  </action>  
  <action name="getSysParamsAction" global="true" procedure="getSysParamsProcedure"> 
    <label language="zh_CN">获取系统参数</label> 
  </action>  
  <action name="getPersonMembersAction" global="true" procedure="getPersonMembersProcedure"> 
    <public name="process" type="String"/>  
    <public name="activity" type="String"/>  
    <label language="zh_CN">获取所有的人员成员</label>  
    <public type="String" required="false" name="type" value="xml"/> 
  </action>  
  <action name="dataQueryAction" global="true" procedure="ksqlQueryProcedure"> 
    <public name="ksql" type="String"/>  
    <public name="variables" type="Map"/>  
    <public name="dataModel" type="String"/>  
    <public name="fnModel" type="String"/>  
    <label language="zh_CN">数据查询</label> 
  </action>  
  <action name="openActivityAction" global="true" log-enabled="true" procedure="openActivityProcedure"> 
    <label language="zh_CN">打开功能</label> 
  </action>  
  <action name="closeActivityAction" global="true" log-enabled="true" procedure="closeActivityProcedure"> 
    <label language="zh_CN">关闭功能</label> 
  </action>  
  <action name="getDataModelAction" global="false" procedure="getDataModelProcedure"> 
    <label language="zh_CN">获取数据模型</label>  
    <public type="String" required="true" name="process"/> 
  </action>  
  <action name="getActivationPackageAction" global="false" procedure="getActivationPackageProcedure"
    log-enabled="true"> 
    <label language="zh_CN">获取手工激活包</label> 
  </action>  
  <action name="regActivationPackageAction" global="false" procedure="regActivationPackageProcedure"
    log-enabled="true"> 
    <label language="zh_CN">注册手工激活包</label>  
    <public name="pkg" type="String"/> 
  </action>  
  <action name="getActivationTimeAction" global="false" procedure="getActivationTimeProcedure"
    log-enabled="true"> 
    <label language="zh_CN">获取激活时间</label> 
  </action>  
<action name="getSysCode" global="true" procedure="getSysCodeProcedure"><label language="zh_CN">获取系统</label>
</action>
</model>
