<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fBrefExplain" data-type="String"> 
    <label language="zh_CN">简要说明</label> 
  </relation>  
  <relation name="fStateName" data-type="String"> 
    <label language="zh_CN">状态</label> 
  </relation>  
  <relation name="fCreatePsnName" data-type="String"> 
    <label language="zh_CN">提交人员</label> 
  </relation>  
  <relation name="fCreateTime" data-type="DateTime"> 
    <label language="zh_CN">提交时间</label> 
  </relation>  
  <relation name="fLeaveTypeName" data-type="String"> 
    <label language="zh_CN">类型</label> 
  </relation>  

  <relation name="fDate" data-type="Date"> 
    <label language="zh_CN">日期</label> 
  </relation>  
  <relation name="fYear" data-type="String"> 
    <label language="zh_CN">年度</label> 
  </relation>  
  <concept name="OA_WM_Holiday" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">节假日设定</label>  
    <has-relation relation="fName" size="64"> 
      <label language="zh_CN">名称</label> 
    </has-relation>  
    <has-relation relation="fBrefExplain" size="225"> 
      <label language="zh_CN">简要说明</label> 
    </has-relation>  
    <!--     <has-relation relation="fState" size="36"> 
      <label language="zh_CN">状态编码</label> 
    </has-relation>   -->  
    <has-relation relation="fStateName" size="64"> 
      <label language="zh_CN">状态</label> 
    </has-relation>  
    <has-relation relation="fCreatePsnName" size="64" default-value-expr="currentPersonName()"> 
      <label language="zh_CN">提交人员</label> 
    </has-relation>  
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">提交时间</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeName" size="64"> 
      <label language="zh_CN">类型</label> 
    </has-relation>  
    <has-relation relation="fLeaveTypeID" size="36"> 
      <label language="zh_CN">类型</label> 
    </has-relation>  
    <has-relation relation="fDate" data-type="Date"> 
      <label language="zh_CN">日期</label> 
    </has-relation>  
    <!--<has-relation relation="fMultiple" data-type="Integer"> 
      <label language="zh_CN">倍数</label> 
    </has-relation>-->  
    <has-relation relation="fYear" size="20"> 
      <label language="zh_CN">年度</label> 
    </has-relation>  
    <has-relation relation="fState" data-type="String" size="20">
      <label language="zh_CN">状态</label> 
    </has-relation> 
  </concept>  
  <relation name="fState" data-type="String">
    <label language="zh_CN">状态</label> 
  </relation> 
</model>
