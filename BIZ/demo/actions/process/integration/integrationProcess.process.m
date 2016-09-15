<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="integrationProcess" start="start1" end="end1"> 
    <label language="zh_CN">系统集成</label>  
    <static-activity name="staticActivity1">
      <label language="zh_CN">系统集成</label>  
      <has-action action="startBorrowBook" access-permission="public"/>  
      <has-action action="invokeTestWebService" access-permission="public"/> 
    </static-activity>  
    <has-action action="queryDEMO_BorrowBookAction" access-permission="public"/>  
    <has-action action="saveDEMO_BorrowBookAction" access-permission="public"/>  
    <has-action action="createDEMO_BorrowBookAction" access-permission="public"/>  
    <static-activity name="staticActivity2">
      <label language="zh_CN">系统集成-跳转到第三方页面</label>  
      <has-action action="getUserNameAndPassword" access-permission="public"/> 
    </static-activity> 
    <static-activity name="mainActivity"> 
      <label language="zh_CN">系统集成-第三方发起X5工作流</label> 
    </static-activity>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="businessActivity1" condition="true">
      <label language="zh_CN">系统集成-第三方发起X5工作流-借书申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="businessActivity2"/> 
    </business-activity>  
    <business-activity name="businessActivity2" condition="true">
      <label language="zh_CN">系统集成-第三方发起X5工作流-借书审核</label>  
      <input name="x" unit="businessActivity1"/>  
      <output name="x" unit="end1"/>  
      <execute-rule condition="true" task-assign-mode="together">
        <executor-range range-expr="findOrgUnitsByCode('system')" default-expr="findOrgUnitsByCode('system')">
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value>
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">concat('借书审核:', currentPIName())</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place>  
  </process> 
</model>
