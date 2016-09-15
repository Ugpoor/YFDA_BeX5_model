<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_Schedule" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">日程管理</label>  
    <has-relation relation="fName" data-type="String" size="50"/>  
    <has-relation relation="fContent" data-type="Text" size="200"/>  
    <has-relation relation="fPlace" data-type="String" size="100"/>  
    <has-relation relation="fStartTime" data-type="DateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fEndTime" data-type="DateTime" default-value-expr="addHours(currentDateTime(),1)"/>  
    <has-relation relation="fRepeat" data-type="String" default-value-expr="'none'" size="10"/>  
    <has-relation relation="fRepeatFrequency" data-type="Integer"/>  
    <has-relation relation="fWeekRepeat" data-type="String" size="50"/>
    <has-relation relation="fRepeatCount" data-type="Integer"/>
    <has-relation relation="fUpToDate" data-type="Date"/>  
    <has-relation relation="fOwn" data-type="String" size="1"/>  
    <has-relation relation="fCreatorID" default-value-expr="currentPersonID()" size="32"> 
      <label language="zh_CN">创建人ID</label> 
    </has-relation>  
    <has-relation relation="fCreator" default-value-expr="currentPersonName()" size="10"> 
      <label language="zh_CN">创建人</label> 
    </has-relation> 
  <has-relation relation="fAttachment"></has-relation>
    <has-relation relation="fTimePeriod" size="50"/>  
    <has-relation relation="fScheDay" size="20"/>  
    <has-relation relation="fIsTitle" data-type="String" size="10"/>  
    <has-relation relation="fScheID" data-type="String"/> 
  <has-relation relation="fLastModifyTime"></has-relation>
</concept>  
  <relation name="fRepeat" data-type="String">
    <label language="zh_CN">重复</label> 
  </relation>  
  <relation name="fRepeatFrequency" data-type="Integer">
    <label language="zh_CN">重复频率</label> 
  </relation>  
  <relation name="fOwn" data-type="Integer">
    <label language="zh_CN">私人日程</label> 
  </relation>  
  <relation name="fWeekRepeat" data-type="String">
    <label language="zh_CN">周重复</label> 
  </relation>  
  <relation name="fRepeatCount" data-type="Integer">
    <label language="zh_CN">重复次数</label> 
  </relation>   <relation name="fTimePeriod" data-type="String">
    <label language="zh_CN">日程时间段</label> 
  </relation>  
  <relation name="fScheDay" data-type="String">
    <label language="zh_CN">日程日</label> 
  </relation>  
  <relation name="fIsTitle" data-type="String">
    <label language="zh_CN">是否标题</label> 
  </relation>  
  <relation name="fScheID" data-type="String">
    <label language="zh_CN">日程ID</label> 
  </relation>  
</model>
