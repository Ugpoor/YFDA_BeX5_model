<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="dynamicFlow2Process" start="start1" end="end1"> 
    <label language="zh_CN">动态工作流2</label>  
    <static-activity name="mainActivity"> 
      <label language="zh_CN">动态工作流2</label> 
    </static-activity>  
    <place name="start1">
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="firstActivity" condition="true">
      <label language="zh_CN">首环节</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="bizActivity"/> 
    </business-activity>  
    <business-activity name="bizActivity" condition="true">
      <label language="zh_CN">业务处理环节</label>  
      <input name="x" unit="firstActivity"/>  
      <output name="x" unit="checkActivity"/> 
    </business-activity>  
    <business-activity name="checkActivity" condition="true">
      <label language="zh_CN">审核环节</label>  
      <input name="x" unit="bizActivity"/>  
      <output name="x" unit="end1"/> 
    </business-activity>  
    <place name="end1">
      <label language="zh_CN">结束</label> 
    </place>  
  </process> 
</model>
