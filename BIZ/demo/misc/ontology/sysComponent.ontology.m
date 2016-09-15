<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <concept name="DEMO_SysWindow" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">系统对话框</label>
    <has-relation relation="fCode"/>
    <has-relation relation="fName"/>
    <has-relation relation="fSequence" default-value-expr="3"/>
    <has-relation relation="fStandBy"/>
    <has-relation relation="fUpdatePerName" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fYYID" default-value-expr="'118'"/>
    <has-relation relation="fExecutorPersonID" default-value-expr="currentPersonMemberID()"/>
    <has-relation relation="fExecutorPersonName" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="fExecutorDeptID" default-value-expr="currentDeptID()"/>
    <has-relation relation="fExecutorDeptName" default-value-expr="currentDeptName()"/>
  </concept>

  <relation name="fBM" data-type="String" single-valued="true">
    <label language="zh_CN">编码</label>
  </relation>
  
  <relation name="fStandBy" data-type="String" single-valued="true">
    <label language="zh_CN">备用值</label>
  </relation>
 
  <relation name="fYYID" data-type="String" single-valued="true">
    <label language="zh_CN">引用ID</label>
  </relation>
 
  <relation name="fExecutorPersonID" data-type="SA_OPPerson" single-valued="true">
    <label language="zh_CN">人员ID</label>
  </relation>
 
  <relation name="fExecutorPersonName" data-type="String" single-valued="true">
    <label language="zh_CN">人员姓名</label>
  </relation>
  
  <relation name="fBMID" data-type="SA_OPOrg" single-valued="true">
    <label language="zh_CN">部门ID</label>
  </relation>
  
  <relation name="fExecutorDeptID" data-type="SA_OPOrg" single-valued="true">
    <label language="zh_CN">部门ID</label>
  </relation>
  
  <relation name="fExecutorDeptName" data-type="String" single-valued="true">
    <label language="zh_CN">部门名称</label>
  </relation>
</model>
