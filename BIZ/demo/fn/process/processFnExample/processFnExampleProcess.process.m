<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="processFnExampleProcess" start="start1" end="end1"> 
      
    <static-activity name="mainActivity"> 
      <label language="zh_CN">流程函数案例-订单申请</label> 
    </static-activity>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="businessActivity1" condition="true">
      <label language="zh_CN">流程函数案例-订单申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="conditionBranch1"/> 
    </business-activity>  
    <business-activity name="businessActivity2" condition="true">
      <label language="zh_CN">流程函数案例-财务审批</label>  
      <input name="x" unit="conditionBranch1">
        <label language="zh_CN">是</label> 
      </input>  
      <output name="x" unit="businessActivity3"/> 
    </business-activity>  
    <if-else-activity name="conditionBranch1" condition="relationValue('DEMO_Orders',getProcessData1(),null,null,'fFreght','/demo/common/data')&gt;50">
      <label language="zh_CN">运费额度 &gt; 50</label>  
      <input name="x" unit="businessActivity1"/>  
      <false-output name="x" unit="businessActivity3"/>  
      <true-output name="x" unit="businessActivity2"/> 
    </if-else-activity>  
    <business-activity name="businessActivity3" condition="true">
      <label language="zh_CN">流程函数案例-部门审批</label>  
      <output name="x" unit="end1"/>  
      <input name="x" unit="conditionBranch1">
        <label language="zh_CN">否</label> 
      </input>  
      <input name="x" unit="businessActivity2"/> 
    </business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place>  
    <has-action action="queryDEMO_OrdersAction" access-permission="public"/>  
    <has-action action="saveDEMO_OrdersAction" access-permission="public"/>  
    <has-action action="createDEMO_OrdersAction" access-permission="public"/>  
    <has-action action="testProcessFnAction" access-permission="public">
      <protected name="fnModel" type="String" value="/system/logic/fn"/> 
    </has-action>  
    <start-rule condition="true">
      <task-relation-value>
        <item relation="sName">concat('销售订单-',relationValue('DEMO_Orders',getProcessData1(),null,null,'fOrderNumber','/demo/common/data'))</item> 
      </task-relation-value> 
    </start-rule> 
  <label language="zh_CN">流程函数案例</label>
</process> 
</model>
