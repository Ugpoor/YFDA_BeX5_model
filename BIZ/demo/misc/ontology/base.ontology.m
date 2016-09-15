<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <concept name="DEMO_Unit" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">固定资产计量单位</label>
    <has-relation relation="fName"/>
    <has-relation relation="fSequence"/>
    <has-relation relation="fUseStatus" default-value-expr="0"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fCreateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fDisUseTime"/>
    <has-relation relation="fDescription"/>
    <has-relation relation="fScodeName" default-value-expr="'固定资产计量单位'"/>
    <has-relation relation="fID"/>
  </concept>
 
  <concept name="DEMO_ExigenceLevel" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">公文紧急程度</label>
    <has-relation relation="fCode"/>
    <has-relation relation="fName"/>
    <has-relation relation="fDescription"/>
    <has-relation relation="fUseStatus" default-value-expr="0"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fSequence"/>
    <has-relation relation="fScodeName"/>
    <has-relation relation="fCreateTime"/>
    <has-relation relation="fID"/>
  </concept>

  <concept name="DEMO_SecretLevel" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">公文密级</label>
    <has-relation relation="fCode"/>
    <has-relation relation="fName"/>
    <has-relation relation="fDescription"/>
    <has-relation relation="fUseStatus" default-value-expr="0"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fSequence"/>
    <has-relation relation="fScodeName"/>
    <has-relation relation="fCreateTime"/>
    <has-relation relation="fID"/>
  </concept>
 
  <concept name="DEMO_SendDirect" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">行文方向</label>
    <has-relation relation="fCode"/>
    <has-relation relation="fName"/>
    <has-relation relation="fSequence"/>
    <has-relation relation="fUpdatePerName" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fUseStatus" default-value-expr="0"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fScodeName" default-value-expr="'行文方向'"/>
    <has-relation relation="fID"/>
    <has-relation relation="fDisUseTime"/>
  </concept>
</model>
