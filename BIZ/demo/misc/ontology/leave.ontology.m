<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="DEMO_LeaveApply" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">请假申请</label>  
    <has-relation relation="fNO" default-value-expr="nextSeqString(format('%s%s','QJSQ-',format('%1$tY%1$tm%1$td', currentDateTime())),'000')"
      size="32"> 
      <label language="zh_CN">单据号</label> 
    </has-relation>  
    <has-relation relation="fLeaveReason" data-type="String" size="1024"> 
      <label language="zh_CN">请假事由</label> 
    </has-relation>  
    <has-relation relation="fStartTime" data-type="Date" default-value-expr="currentDate()"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>  
    <has-relation relation="fEndTime" data-type="Date" default-value-expr="currentDate()"> 
      <label language="zh_CN">结束时间</label> 
    </has-relation>  
      
    <has-relation relation="fLeaveTypeID" data-type="String" size="32"> 
      <label language="zh_CN">请假类型</label> 
    </has-relation><has-relation relation="fLeaveTypeName" data-type="String" size="64"> 
      <label language="zh_CN">请假类型</label> 
    </has-relation>  
      
    <has-relation relation="fCreateDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"
      size="32"> 
      <label language="zh_CN">提交部门ID</label> 
    </has-relation>  
    <has-relation relation="fCreateDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"
      size="64"> 
      <label language="zh_CN">提交部门</label> 
    </has-relation>  
    <has-relation relation="fCreatePerID" data-type="String" default-value-expr="currentPersonID()"
      size="32"> 
      <label language="zh_CN">提交人ID</label> 
    </has-relation>  
    <has-relation relation="fCreatePerName" data-type="String" default-value-expr="currentPersonName()"
      size="64"> 
      <label language="zh_CN">提交人</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation> 
  

</concept>  
  <relation name="fNO" data-type="String"> 
    <label language="zh_CN">单据号</label> 
  </relation>  
  <relation name="fLeaveReason" data-type="String"> 
    <label language="zh_CN">请假事由</label> 
  </relation>  
  <relation name="fStartTime" data-type="String"> 
    <label language="zh_CN">开始时间</label> 
  </relation>  
  <relation name="fEndTime"> 
    <label language="zh_CN">结束时间</label> 
  </relation>  
  <relation name="fLeaveDays" data-type="Integer"> 
    <label language="zh_CN">请假天数</label> 
  </relation>  
  <relation name="fLeaveTypeName" data-type="String"> 
    <label language="zh_CN">请假类型</label> 
  </relation>  
  <relation name="fLeaveTypeID" data-type="String"> 
    <label language="zh_CN">请假类型</label> 
  </relation>  
  <relation name="fVerdict" data-type="String"> 
    <label language="zh_CN">处理结论</label> 
  </relation>  
</model>
