<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fName" data-type="String"> 
    <label language="zh_CN">标题</label> 
  </relation>  
  <relation name="fContent" data-type="String"> 
    <label language="zh_CN">内容</label> 
  </relation>  
  <relation name="fCreatorID" data-type="String"> 
    <label language="zh_CN">创建人ID</label> 
  </relation>  
  <relation name="fCreator" data-type="String"> 
    <label language="zh_CN">创建人</label> 
  </relation>  
  <relation name="fCreatorTime" data-type="DateTime"> 
    <label language="zh_CN">创建时间</label> 
  </relation>  

  <relation name="fAttachment" data-type="Text">
    <label language="zh_CN">附件</label> 
  </relation>  
  <relation name="fStatus" data-type="String"> 
    <label language="zh_CN">状态</label> 
  </relation>  
  <relation name="fLastModifyTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
    <label language="zh_CN">最后修改时间</label> 
  </relation>  
  
  <relation name="fLeaveTypeID" data-type="String"> 
    <label language="zh_CN">请假类型ID</label> 
  </relation> 

  <relation name="fStartTime" data-type="DateTime">
    <label language="zh_CN">开始时间</label> 
  </relation>  
  <relation name="fEndTime" data-type="DateTime">
    <label language="zh_CN">结束时间</label> 
  </relation>  
  <relation name="fUpToDate" data-type="Date"> 
    <label language="zh_CN">截止日期</label> 
  </relation>  
  <relation name="fPlace" data-type="String">
    <label language="zh_CN">地点</label> 
  </relation>  

  <relation name="flongitude" data-type="String">
    <label language="zh_CN">经度</label> 
  </relation>  
  <relation name="fLatitude" data-type="String">
    <label language="zh_CN">纬度</label> 
  </relation>  
    <relation name="fCustomerID" data-type="String">
    <label language="zh_CN">客户ID</label> 
  </relation>  
  <relation name="fCustomer" data-type="String">
    <label language="zh_CN">客户</label> 
  </relation> 
</model>