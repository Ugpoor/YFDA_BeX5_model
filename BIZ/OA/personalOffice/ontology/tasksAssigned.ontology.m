<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_TasksAssigned" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">工作交办表</label>  
    <has-relation relation="fName" data-type="String" size="100"/>  
    <has-relation relation="fContent" data-type="String" size="200"/>  
    <has-relation relation="fCreatorID" data-type="String" default-value-expr="currentPersonID()" size="32"><label language="zh_CN">委托人ID</label>
</has-relation>  
    <has-relation relation="fCreator" data-type="String" default-value-expr="currentPersonName()" size="10"><label language="zh_CN">委托人</label>
</has-relation>  
    <has-relation relation="fCreatorTime" data-type="DateTime" default-value-expr="currentDateTime()"><label language="zh_CN">委托时间</label>
</has-relation>  
    <has-relation relation="fExecutor" data-type="String" size="10"/>  
    <has-relation relation="fExecutorID" data-type="String" size="32"/>  
    <has-relation relation="fCloser" data-type="String" size="10"/>  
    <has-relation relation="fCloserID" data-type="String" size="32"/>  
    <has-relation relation="fCloserMemo" data-type="String" size="200"/>  
    <has-relation relation="fStatus" data-type="String" default-value-expr="'未关闭'" size="10"><label language="zh_CN">任务状态</label>
</has-relation>  
    <has-relation relation="fLastModifyTime" data-type="DateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="fAttachment" data-type="Text"/> 
  </concept>  
  <concept name="OA_TasksAssignedDate" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">工作交办截至日期表</label>  
    <has-relation relation="fTaskID" data-type="String" size="32"/>  
    <has-relation relation="fUpToDate" data-type="Date">
      <label language="zh_CN">截至日期</label> 
    </has-relation>  
    <has-relation relation="fReason" data-type="String" size="200"/>
    <has-relation relation="fOperatorID" data-type="String" default-value-expr="currentPersonID()" size="32"/>
    <has-relation relation="fOperator" data-type="String" default-value-expr="currentPersonName()" size="10"/>  
    <has-relation relation="fOperatorTime" data-type="DateTime" default-value-expr="currentDateTime()"/> 
  <has-relation relation="fDelay" data-type="String" size="1" default-value-expr="'0'"></has-relation>
</concept>  
  <relation name="fExecutor" data-type="String"> 
    <label language="zh_CN">负责人</label> 
  </relation>  
  <relation name="fExecutorID" data-type="String"> 
    <label language="zh_CN">负责人ID</label> 
  </relation>  
    <relation name="fCloser" data-type="String"> 
    <label language="zh_CN">关闭人</label> 
  </relation>  
  <relation name="fCloserID" data-type="String"> 
    <label language="zh_CN">关闭人ID</label> 
  </relation>  
  <relation name="fCloserMemo" data-type="String"> 
    <label language="zh_CN">关闭说明</label> 
  </relation> 
  <relation name="fDelay" data-type="String"><label language="zh_CN">延期</label>
</relation>
  <relation name="fTaskID" data-type="String"> 
    <label language="zh_CN">任务ID</label> 
  </relation>    <relation name="fReason" data-type="String">
    <label language="zh_CN">修改原因</label> 
  </relation>  
  <relation name="fOperator" data-type="String"> 
    <label language="zh_CN">操作人</label> 
  </relation>  
  <relation name="fOperatorID" data-type="String">
    <label language="zh_CN">操作人ID</label> 
  </relation>  
    <relation name="fOperatorTime" data-type="DateTime"> 
    <label language="zh_CN">操作时间</label> 
  </relation>  
  </model>
