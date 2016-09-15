<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="DEMO_Dynamic_Flows" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">动态流程_配置</label> 
  <has-relation relation="fProcess" data-type="String" required="true"></has-relation>
<has-relation relation="fProcessLabel" data-type="String" required="true"></has-relation>
</concept> 
  <concept name="DEMO_Dynamic_LeaveApply" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">动态流程_请假申请</label>  
    <has-relation relation="fApplyDate" data-type="Date"/>  
    <has-relation relation="fDays" data-type="Integer"/>  
    <has-relation relation="fReason" data-type="Text"/> 
  <has-relation relation="fProcess"></has-relation>
<has-relation relation="fProcessLabel"></has-relation>
<has-relation relation="fApplyPerson"></has-relation>
</concept>  
  <relation name="fApplyDate" data-type="Date">
    <label language="zh_CN">请假日期</label> 
  </relation>  
  <relation name="fDays" data-type="Integer">
    <label language="zh_CN">请假天数</label> 
  </relation>  
  <relation name="fReason" data-type="Text">
    <label language="zh_CN">请假原因</label> 
  </relation>  
    
  <relation name="fDestination" data-type="String" size="256">
    <label language="zh_CN">目的地</label> 
  </relation>  
<relation name="fProcess" data-type="String" size="512"><label language="zh_CN">流程</label>
</relation>
<relation name="fProcessLabel" data-type="String" size="1024"><label language="zh_CN">流程名称</label>
</relation>
<relation name="fApplyPerson" data-type="String" size="64" default-value-expr="currentPersonName()"><label language="zh_CN">申请人</label>
</relation>
</model>
