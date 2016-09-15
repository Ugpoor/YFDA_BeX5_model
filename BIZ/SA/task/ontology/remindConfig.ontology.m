<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
    
  <relation name="sIntervalMinute" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">提醒间隔时间</label> 
  </relation>  
  <relation name="sEnable" data-type="String" single-valued="true"> 
    <label language="zh_CN">是否提醒</label> 
  </relation>  
  <relation name="sOverdueEnable" data-type="String" single-valued="true"> 
    <label language="zh_CN">是否提醒过期任务</label> 
  </relation>  
  <concept name="SA_RemindConfig"> 
    <has-relation relation="sOverdueEnable" default-value-expr="'TRUE'"> 
      <label language="zh_CN">是否提醒过期任务</label> 
    </has-relation>  
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <has-relation relation="sPersonID" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">设置人ID</label> 
    </has-relation>  
    <has-relation relation="sEnable" default-value-expr="'TRUE'"> 
      <label language="zh_CN">是否提醒</label> 
    </has-relation>  
    <label language="zh_CN">任务提醒设置</label>  
    <has-relation relation="sIntervalMinute" default-value-expr="30">
      <label language="zh_CN">提醒间隔时间</label> 
    </has-relation> 
  </concept> 
</model>
