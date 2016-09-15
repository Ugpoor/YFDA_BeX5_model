<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model">
 
  <relation name="fCode" data-type="String" single-valued="true">
    <label language="zh_CN">编码</label>
  </relation>

  <relation name="fName" data-type="String" single-valued="true">
    <label language="zh_CN">名称</label>
  </relation>
 
  <relation name="fSequence" data-type="Integer" single-valued="true">
    <label language="zh_CN">排序</label>
  </relation>
 
  <relation name="fUpdatePerName" data-type="String" single-valued="true">
    <label language="zh_CN">修改人</label>
  </relation>

  <relation name="fUpdateTime" data-type="DateTime" single-valued="true">
    <label language="zh_CN">修改时间</label>
  </relation>

  <relation name="fUseStatus" data-type="Integer" single-valued="true">
    <label language="zh_CN">启用标识</label>
  </relation>

  <relation name="fUseStatusName" data-type="String" single-valued="true">
    <label language="zh_CN">启用标识名称</label>
  </relation>
 
  <relation name="fCreateTime" data-type="DateTime" single-valued="true">
    <label language="zh_CN">提交时间</label>
  </relation>

  <relation name="fScode" data-type="String" single-valued="true">
    <label language="zh_CN">助记码</label>
  </relation>

  <relation name="fScodeName" data-type="String" single-valued="true">
    <label language="zh_CN">基础数据类型</label>
  </relation>

  <relation name="fUnitID" data-type="String" single-valued="true">
    <label language="zh_CN">计量单位</label>
  </relation>

  <relation name="fAssetClassID" data-type="String" single-valued="true">
    <label language="zh_CN">资产类别标识</label>
  </relation>

  <relation name="fUnitName" data-type="String" single-valued="true">
    <label language="zh_CN">计量单位名称</label>
  </relation>

  <relation name="fAssetClassName" data-type="String" single-valued="true">
    <label language="zh_CN">资产类别名称</label>
  </relation>

  <relation name="fSpecType" data-type="String" single-valued="true">
    <label language="zh_CN">规格型号</label>
  </relation>

  <relation name="fDisUseTime" data-type="DateTime" single-valued="true">
    <label language="zh_CN">停用时间</label>
  </relation>

  <relation name="fBizState" data-type="String" single-valued="true">
    <label language="zh_CN">业务单据状态</label>
  </relation>

  <relation name="fBizStateName" data-type="String" single-valued="true">
    <label language="zh_CN">业务单据状态名称</label>
  </relation>

  <relation name="fCreateDeptID" data-type="SA_OPOrg" single-valued="true">
    <label language="zh_CN">提交部门ID</label>
  </relation>

  <relation name="fCreateDeptName" data-type="String" single-valued="true">
    <label language="zh_CN">提交部门</label>
  </relation>

  <relation name="fCreatePerID" data-type="SA_OPPerson" single-valued="true">
    <label language="zh_CN">提交人ID</label>
  </relation>

  <relation name="fCreatePerName" data-type="String" single-valued="true">
    <label language="zh_CN">提交人</label>
  </relation>

  <relation name="fCreateURL" data-type="String" single-valued="true">
    <label language="zh_CN">提交人员URL</label>
  </relation>

  <relation name="fCreateURLName" data-type="String" single-valued="true">
    <label language="zh_CN">提交人员URL</label>
  </relation>
 
  <relation name="fUpdateDeptID" data-type="SA_OPOrg" single-valued="true">
    <label language="zh_CN">修改部门ID</label>
  </relation>

  <relation name="fUpdateDeptName" data-type="String" single-valued="true">
    <label language="zh_CN">修改部门</label>
  </relation>

  <relation name="fUpdatePerID" data-type="SA_OPPerson" single-valued="true">
    <label language="zh_CN">修改人ID</label>
  </relation>

  <relation name="fSName" data-type="String" single-valued="true">
    <label language="zh_CN">简称</label>
  </relation>

  <relation name="fDescription" data-type="String" single-valued="true">
    <label language="zh_CN">描述</label>
  </relation>

  <relation name="fID" data-type="String">
    <label language="zh_CN">主键</label>
  </relation>

  <relation name="fAttachment" data-type="String">
    <label language="zh_CN">附件</label>
  </relation>
</model>
