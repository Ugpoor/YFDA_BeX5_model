<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fCode" data-type="String" size="32"> 
    <label language="zh_CN">编码</label> 
  </relation>  
  <relation name="fName" data-type="String" size="64"> 
    <label language="zh_CN">名称</label> 
  </relation>  
  <relation name="fSequence" data-type="Integer"> 
    <label language="zh_CN">排序</label> 
  </relation>  
  <relation name="fBizState" data-type="String" size="32"> 
    <label language="zh_CN">业务状态</label> 
  </relation>  
  <relation name="fBizStateName" data-type="String" size="64"> 
    <label language="zh_CN">业务状态名称</label> 
  </relation>  
  <relation name="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
    <label language="zh_CN">提交时间</label> 
  </relation>  
  <relation name="fCreatorPsnID" data-type="String" size="32" default-value-expr="currentPersonID()"> 
    <label language="zh_CN">提交人ID</label> 
  </relation>  
  <relation name="fCreatorPsnName" data-type="String" size="64" default-value-expr="currentPersonName()"> 
    <label language="zh_CN">提交人</label> 
  </relation>  
  <relation name="fCreatorFullID" data-type="String" size="256" default-value-expr="currentPersonMemberFID()"> 
    <label language="zh_CN">提交人员URL</label> 
  </relation>  
  <relation name="fCreatorFullName" data-type="String" size="512" default-value-expr="currentPersonMemberFName()"> 
    <label language="zh_CN">提交人员URL</label> 
  </relation>  
  <relation name="fUpdateTime" data-type="DateTime" default-value-expr="currentDateTime()"> 
    <label language="zh_CN">修改时间</label> 
  </relation>  
  <relation name="fUpdatorPsnID" data-type="String" size="32" default-value-expr="currentPersonID()"> 
    <label language="zh_CN">修改人ID</label> 
  </relation>  
  <relation name="fUpdatorPsnName" data-type="String" size="64" default-value-expr="currentPersonName()"> 
    <label language="zh_CN">修改人</label> 
  </relation>  
  <relation name="fDescription" data-type="String" size="512"> 
    <label language="zh_CN">描述</label> 
  </relation>  
  <relation name="fRemark" data-type="Text">
    <label language="zh_CN">备注</label> 
  </relation> 
  <relation name="fAttachment" data-type="Text"> 
    <label language="zh_CN">附件</label> 
  </relation>  
  <relation name="fSampleName" data-type="String" size="128">
    <label language="zh_CN">示例名称</label> 
  </relation>  
  <relation name="fTitle" data-type="String" size="128">
    <label language="zh_CN">标题</label> 
  </relation>  
  <relation name="fNumber" data-type="String" size="32">
    <label language="zh_CN">编号</label> 
  </relation>  
  <relation name="fAuthor" data-type="String" size="32">
    <label language="zh_CN">作者</label> 
  </relation>  
  <relation name="fCreateDate" data-type="Date">
    <label language="zh_CN">成文日期</label> 
  </relation>  
  <relation name="fBlobImage" data-type="Blob">
    <label language="zh_CN">BlobImage</label> 
  </relation> 
  <relation name="fKeyword" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">关键字</label> 
  </relation>  
</model>
