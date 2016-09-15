<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model"> 
  <relation name="fParentID" data-type="String" single-valued="true" inverse-of="fChildren">
    <label language="zh_CN">父</label>
  </relation>
  
  <relation name="fChildren" data-type="String" inverse-of="fParentID" single-valued="false">
    <label language="zh_CN">子</label>
  </relation>
 
  <relation name="fLevel" data-type="String" single-valued="true">
    <label language="zh_CN">级次</label>
  </relation>
 
  <concept name="DEMO_AssetClass" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">资产类别</label>
    <has-relation relation="fParentID" data-type="DEMO_AssetClass"/>
    <has-relation relation="fChildren" data-type="DEMO_AssetClass"/>
    <has-relation relation="fLevel"/>
    <has-relation relation="fCode"/>
    <has-relation relation="fName"/>
    <has-relation relation="fDescription"/>
    <has-relation relation="fSequence"/>
    <has-relation relation="fUseStatus" default-value-expr="0"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fDisUseTime"/>
    <has-relation relation="fScodeName" default-value-expr="'资产类别'"/>
  </concept>
</model>
