<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <concept name="DEMO_Asset" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">资产</label>
    <has-relation relation="fCode">
      <label language="zh_CN">编号</label>
    </has-relation>
    <has-relation relation="fName"/>
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fUseStatus" default-value-expr="0"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fScode">
      <label language="zh_CN">资产助记码</label>
    </has-relation>
    <has-relation relation="fUnitID" data-type="DEMO_Unit"/>
    <has-relation relation="fAssetClassID" data-type="DEMO_AssetClass"/>
    <has-relation relation="fUnitName"/>
    <has-relation relation="fAssetClassName"/>
    <has-relation relation="fSpecType"/>
    <has-relation relation="fDisUseTime"/>
    <has-relation relation="fDescription"/>
    <has-relation relation="fSName"/>
    <has-relation relation="fSequence">
      <label language="zh_CN">序号</label>
    </has-relation>
    <has-relation relation="fCreateOrg"/>
    <has-relation relation="fCreatePerID" default-value-expr="currentPersonMemberID()"/>
    <has-relation relation="fCreatePerName" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fCreateDeptID" default-value-expr="currentDeptID()"/>
    <has-relation relation="fCreateDeptName" default-value-expr="currentDeptName()"/>
    <has-relation relation="fUpdatePerName" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="fUpdateDeptID" default-value-expr="currentDeptID()"/>
    <has-relation relation="fUpdateDeptName" default-value-expr="currentDeptName()"/>
    <has-relation relation="fUpdatePerID" default-value-expr="currentPersonMemberID()"/>
    <has-relation relation="fCreateURL"/>
    <has-relation relation="fAttachment"/>
  </concept>
 
  <relation name="fCreateOrg" data-type="String" single-valued="true">
    <label language="zh_CN">创建机构</label>
  </relation>
</model>
