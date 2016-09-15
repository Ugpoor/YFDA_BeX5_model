<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <action name="externalStartProcessQueryAction" global="true" procedure="externalStartProcessQueryProcedure"> 
    <public name="process" type="String"/>  
    <public name="attributes" type="Map"/>  
    <private name="tokens" type="List"/>  
    <public name="executor" type="String" required="false" value=""/>  
    <public type="String" name="creator" required="false"/> 
    <label language="zh_CN">流程启动查询</label> 
  </action>  
  <action name="externalStartProcessAction" global="true" procedure="externalStartProcessProcedure"> 
    <public name="process" type="String"/>  
    <public name="attributes" type="Map"/>  
    <public name="control" type="Object"/>  
    <public name="executor" type="String" required="false" value=""/>  
    <private name="tokens" type="List"/>  
    <label language="zh_CN">流程启动</label>  
    <public type="String" name="creator" required="false"/> 
  </action>  
  <action name="externalAdvanceProcessQueryAction" global="true" procedure="externalAdvanceProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">流程流转查询</label> 
  </action>  
  <action name="externalAdvanceProcessAction" global="true" procedure="externalAdvanceProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">流程流转</label> 
  </action>  
  <action name="externalBackProcessQueryAction" global="true" procedure="externalBackProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <public name="backRange" type="String" required="false" value=""/>
    <label language="zh_CN">流程回退查询</label> 
  </action>  
  <action name="externalBackProcessAction" global="true" procedure="externalBackProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">流程回退</label> 
  </action>  
  <action name="externalAbortProcessQueryAction" global="true" procedure="externalAbortProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">流程终止查询</label> 
  </action>  
  <action name="externalAbortProcessAction" global="true" procedure="externalAbortProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">流程终止</label> 
  </action>  
  <action name="externalSuspendProcessQueryAction" global="true" procedure="externalSuspendProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">流程暂停查询</label> 
  </action>  
  <action name="externalSuspendProcessAction" global="true" procedure="externalSuspendProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">流程暂停</label> 
  </action>  
  <action name="externalSpecialProcessQueryAction" global="true" procedure="externalSpecialProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">流程特送查询</label> 
  </action>  
  <action name="externalSpecialProcessAction" global="true" procedure="externalSpecialProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">流程特送</label> 
  </action>  
  <action name="externalTransferTaskQueryAction" global="true" procedure="externalTransferTaskQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">任务转发查询</label> 
  </action>  
  <action name="externalTransferTaskAction" global="true" procedure="externalTransferTaskProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">任务转发</label> 
  </action>  
  <action name="externalFinishProcessAction" global="true" procedure="externalFinishProcessProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">结束流程</label> 
  </action>  
  <action name="externalResumeProcessAction" global="true" procedure="externalResumeProcessProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">唤醒流程</label> 
  </action>  
  <action name="externalStartCustomizedProcessAction" global="true" procedure="externalStartCustomizedProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="template" type="String"/>  
    <label language="zh_CN">启动流程定制</label> 
  </action>  
  <action name="externalStartCustomizedProcessQueryAction" global="true" procedure="externalStartCustomizedProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">启动流程定制查询</label> 
  </action>  
  <action name="externalCancelCustomizedProcessAction" global="true" procedure="externalCancelCustomizedProcessProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">取消流程定制</label> 
  </action>  
  <action name="externalWithdrawTaskAction" global="true" procedure="externalWithdrawTaskProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">回收任务</label> 
  </action> 
</model>
