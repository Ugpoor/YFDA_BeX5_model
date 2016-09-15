<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="masterProcess" start="start1" end="end1"> 
    <label language="zh_CN">主流程</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">主流程</label> 
    </static-activity>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="sub1Activity" condition="true">
      <label language="zh_CN">子流程1</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="conditionBranch1"/> 
    <listener action="advanceProcessAction" event="after" handler="sub1ActivityAfterAdvanceProcedure"></listener>
</business-activity>  
    <if-else-activity name="conditionBranch1" condition="relationValue('DEMO_Order',:sData1,null,null,'fTolotalAmt','/demo/process/data') &gt; 100">
      <label language="zh_CN">金额</label>  
      <input name="x" unit="sub1Activity"/>  
      <true-output name="x" unit="sub2Activity"/>  
      <false-output name="x" unit="end1"><label language="zh_CN">小于等于100</label>
</false-output> 
    </if-else-activity>  
    <business-activity name="sub2Activity" condition="true">
      <label language="zh_CN">子流程2</label>  
      <input name="x" unit="conditionBranch1"><label language="zh_CN">大于100</label>
</input>  
      <output name="x" unit="end1"/> 
    </business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place> 
  


<has-action action="queryOrderAction" access-permission="public"></has-action>
<has-action action="createOrderAction" access-permission="public"></has-action>
<has-action action="saveOrderAction" access-permission="public"></has-action>
</process> 
</model>
