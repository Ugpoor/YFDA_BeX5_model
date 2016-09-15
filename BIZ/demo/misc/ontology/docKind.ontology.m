<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <concept name="DEMO_DocKind" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">公文设置</label>
    <has-relation relation="fCode"/>
    <has-relation relation="fName"/>
    <has-relation relation="fSequence"/>
    <has-relation relation="fUpdatePerName" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="fUpdateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="fUseStatus" default-value-expr="0"/>
    <has-relation relation="fUseStatusName" default-value-expr="'未启用'"/>
    <has-relation relation="fScodeName" default-value-expr="'行文设置'"/>
    <has-relation relation="fDisUseTime"/>
  </concept>
</model>
    