<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">
  <action name="getTaskGanttAction" global="true" procedure="getTaskGanttProcedure"> 
    <label language="zh_CN">获取任务甘特图</label> 
    <public name="task" type="String"/>  
  </action>  

  <action name="backupTaskAction" global="true" procedure="backupTaskProcedure"> 
    <label language="zh_CN">任务备份</label> 
  </action>  
  <action name="resetTaskAction" global="true" procedure="resetTaskProcedure"> 
    <label language="zh_CN">任务还原</label> 
  </action>  
  <action name="archiveProcessAction" global="true" procedure="archiveProcessProcedure"> 
    <public name="begin" type="Date" required="false"/>  
    <public name="end" type="Date" required="false"/>  
    <label language="zh_CN">流程归档</label> 
  </action>  
  
  <action name="startProcessQueryAction" global="true" procedure="startProcessQueryProcedure"> 
    <public name="process" type="String"/>  
    <public name="attributes" type="Map"/>  
    <private name="tokens" type="List"/>  
    <public name="executor" type="String" required="false" value=""/>  
    <public name="creator" type="String" required="false" value=""/>  
    <label language="zh_CN">[内部]流程启动查询</label> 
  </action>  
  <action name="startProcessAction" global="true" procedure="startProcessProcedure"> 
    <public name="process" type="String"/>  
    <public name="attributes" type="Map"/>  
    <public name="control" type="Object"/>  
    <public name="executor" type="String" required="false" value=""/>  
    <private name="tokens" type="List"/>  
    <label language="zh_CN">[内部]流程启动</label> 
  <public type="String" name="creator" required="false"></public>
</action>  
  <action name="advanceProcessQueryAction" global="true" procedure="advanceProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]流程流转查询</label> 
  </action>  
  <action name="advanceProcessAction" global="true" procedure="advanceProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">[内部]流程流转</label> 
  </action>  
  <action name="backProcessQueryAction" global="true" procedure="backProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]流程回退查询</label> 
  </action>  
  <action name="backProcessAction" global="true" procedure="backProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">[内部]流程回退</label> 
  </action>  
  <action name="abortProcessQueryAction" global="true" procedure="abortProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]流程终止查询</label> 
  </action>  
  <action name="abortProcessAction" global="true" procedure="abortProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">[内部]流程终止</label> 
  </action>  
  <action name="suspendProcessQueryAction" global="true" procedure="suspendProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]流程暂停查询</label> 
  </action>  
  <action name="suspendProcessAction" global="true" procedure="suspendProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">[内部]流程暂停</label> 
  </action>  
  <action name="specialProcessQueryAction" global="true" procedure="specialProcessQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]流程特送查询</label> 
  </action>  
  <action name="specialProcessAction" global="true" procedure="specialProcessProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">[内部]流程特送</label> 
  </action>  

  <action name="transferTaskQueryAction" global="true" procedure="transferTaskQueryProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]任务转发查询</label> 
  </action>  
  <action name="transferTaskAction" global="true" procedure="transferTaskProcedure"> 
    <public name="task" type="String"/>  
    <public name="control" type="Object"/>  
    <label language="zh_CN">[内部]任务转发</label> 
  </action>  
  <action name="finishProcessAction" global="true" procedure="finishProcessProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]流程结束</label> 
  </action>  
  <action name="resumeProcessAction" global="true" procedure="resumeProcessProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]流程唤醒</label> 
  </action>  
  <action name="queryAllBusinessActivityAction" global="true" procedure="queryAllBusinessActivityProcedure"> 
    <public name="process" type="String"/>
    <public name="template" type="String"/>  
    <label language="zh_CN">[内部]查询所有的业务功能</label> 
  </action>  
  <action name="queryAllBusinessActivity2Action" procedure="queryAllBusinessActivity2Procedure"> 
    <public name="range" type="Xml"/>  
    <label language="zh_CN">[内部]查询所有的业务功能2</label> 
  </action>  
  <action name="queryProcessAction" global="true" procedure="queryProcessProcedure"> 
    <public name="type" type="String"/>  
    <public name="range" type="Xml"/>  
    <label language="zh_CN">[内部]查询所有的业务功能2</label> 
  </action>  
  <action name="queryTaskDataAction" global="true" procedure="queryTaskDataProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]查询任务关联的数据</label> 
  </action>  
  <action name="withdrawTaskAction" global="true" procedure="withdrawTaskProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]任务回收</label> 
  </action>  
  <action name="executeTaskAction" global="true" procedure="executeTaskProcedure"> 
    <public name="task" type="String"/>  
    <public name="executor" type="String"/>  
    <label language="zh_CN">[内部]执行任务</label> 
  </action>  
  <action name="premmptTaskAction" global="true" procedure="premmptTaskProcedure"> 
    <public name="task" type="String"/>  
    <label language="zh_CN">[内部]抢占任务</label> 
  </action>  
  <action name="queryOrgUnitChildrenAction" global="true" procedure="queryOrgUnitChildrenProcedure"> 
    <public name="id" type="String"/>  
    <label language="zh_CN">[内部]查询组织的子节点</label> 
  </action>  
  <action name="filterOrgUnitAction" global="true" procedure="filterOrgUnitProcedure"> 
    <public name="range" type="Xml"/>  
    <public name="condition" type="String"/>  
    <label language="zh_CN">[内部]组织机构过虑</label> 
  </action>  
  <action name="getProcessChartByPIAction" global="true" procedure="getProcessChartByPIProcedure"> 
    <public name="pi" type="String"/>  
    <public name="ext" type="String" required="false"/>  
    <label language="zh_CN">[内部]根据PI获取流程图</label> 
  </action>  
  <action name="getProcessChartByDataAction" global="true" procedure="getProcessChartByDataProcedure"> 
    <public name="process" type="String"/>  
    <public name="data" type="String"/>  
    <public name="ext" type="String" required="false"/>  
    <label language="zh_CN">[内部]根据业务数据获取流程图</label> 
  </action>  
  <action name="getProcessChartByTaskAction" global="true" procedure="getProcessChartByTaskProcedure"> 
    <public name="task" type="String"/>  
    <public name="ext" type="String" required="false"/>  
    <label language="zh_CN">[内部]根据任务获取流程图</label> 
  </action>  
  <action name="finishTaskAction" global="true" procedure="finishTaskProcedure">
    <label language="zh_CN">结束任务</label>  
    <public type="String" required="true" name="task"/> 
  </action> 
  <action name="modifyTaskExecutorAction" procedure="modifyTaskExecutorProcedure">
    <label language="zh_CN">修改任务执行者</label>  
    <public type="String" required="true" name="task"/>
    <public type="String" required="true" name="fid"/>
    <public type="String" required="true" name="fname"/> 
  </action> 
  <action name="createCommonTaskAction" global="true" procedure="createCommonTaskProcedure">
    <label language="zh_CN">创建任务</label>  
    <public type="String" required="true" name="name"/> 
    <public type="String" required="true" name="process"/> 
    <public type="String" required="true" name="activity"/> 
    <public type="String" required="true" name="sCURL"/> 
    <public type="String" required="true" name="sEURL"/> 
    <public type="String" required="true" name="sData1"/> 
    <public type="List" required="true" name="executors"/> 
    <public type="Map" required="true" name="options"/> 
  </action> 
  <action name="queryProcessExecuteListAction" procedure="queryProcessExecuteListProcedure" global="true">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_Task"/>  
    <private name="select" type="String" value="SA_Task.*"/>  
    <private name="from" type="String" value="SA_Task SA_Task"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="( (SA_Task.sWithdraw is null) OR (SA_Task.sWithdraw = 0) ) AND ( ( (SA_Task.sKindID = 'tkTask') AND (SA_Task.sExecutorPersonID is not null) AND ( SA_Task.sStatusID in ('tesPaused', 'tesFinished', 'tesReturned', 'tesAborted', 'tesTransmited', 'tesWaited') ) ) OR ( (SA_Task.sKindID = 'tkExecutor') AND ( SA_Task.sStatusID in ('tesPaused', 'tesFinished', 'tesReturned', 'tesAborted', 'tesTransmited') ) ) )"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_Task"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_Task.sActualFinishTime asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>
    <public name="shardCondition" type="String" required="false"/> 
    
  <label language="zh_CN">查询流程记录</label>
</action> 

  <action name="canModifyExecutorAction" global="true" procedure="canModifyExecutorProcedure">
    <label language="zh_CN">是否允许修改任务执行者</label>  
    <public type="String" required="true" name="task"/> 
  </action> 
  <action name="modifyExecutorAction" global="true" procedure="modifyExecutorProcedure">
    <label language="zh_CN">修改任务执行者</label>  
    <public type="String" required="true" name="task"/>
    <public type="String" required="true" name="fid"/> 
  <public type="Boolean" name="check" value="true" required="false"></public>
</action> 

</model>
