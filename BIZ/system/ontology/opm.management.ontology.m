<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <relation name="sManageOrgKind" data-type="String" single-valued="true">
    <label language="zh_CN">管理组织类型</label>
  </relation>
  <relation name="sManageOrgKindName" data-type="String" single-valued="true">
    <label language="zh_CN">管理组织类型名称</label>
  </relation>
  <relation name="sLeaderNumber" data-type="Integer" single-valued="true">
    <label language="zh_CN">上级个数</label>
  </relation>
  <relation name="sIsSystem" data-type="Integer" single-valued="true">
    <label language="zh_CN">是否系统</label>
  </relation>
  <relation name="sManageOrgID" data-type="SA_OPOrg" single-valued="true">
    <label language="zh_CN">管理组织</label>
  </relation>
  <relation name="sManageOrgName" data-type="String" single-valued="true">
    <label language="zh_CN">管理组织</label>
  </relation>
  <relation name="sManageOrgFID" data-type="String" single-valued="true">
    <label language="zh_CN">管理组织全路径ID</label>
  </relation>
  <relation name="sManageOrgFName" data-type="String" single-valued="true">
    <label language="zh_CN">管理组织全名</label>
  </relation>
  <relation name="sManagePersonID" data-type="SA_OPPerson" single-valued="true">
    <label language="zh_CN">管理人员</label>
  </relation>
  <relation name="sManageTypeID" data-type="SA_OPManageType" single-valued="true">
    <label language="zh_CN">管理类型</label>
  </relation>
  <!-- 管理类型 -->
  <concept name="SA_OPManageType" default-value-expr="guid()">
    <has-relation relation="sName"/>
    <has-relation relation="sCode"/>
    <has-relation relation="sManageOrgKind" default-value-expr="'*'"/>
    <has-relation relation="sManageOrgKindName"/>
    <has-relation relation="sLeaderNumber" default-value-expr="1"/>
    <has-relation relation="sIsSystem" default-value-expr="0"/>
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">业务管理类型</label>
  </concept>
  <!-- 管理权限 -->
  <concept name="SA_OPManagement" default-value-expr="guid()">
    <has-relation relation="sOrgID"><label language="zh_CN">上级组织ID</label>
</has-relation>
    <has-relation relation="sOrgFID"><label language="zh_CN">上级组织全路径ID</label>
</has-relation>
    <has-relation relation="sOrgName"><label language="zh_CN">上级组织名称</label>
</has-relation>
    <has-relation relation="sOrgFName"><label language="zh_CN">上级组织全路径名称</label>
</has-relation>
    <has-relation relation="sManageOrgID"><label language="zh_CN">下级组织ID</label>
</has-relation>
    <has-relation relation="sManageOrgName"><label language="zh_CN">下级组织名称</label>
</has-relation>
    <has-relation relation="sManageOrgFID"><label language="zh_CN">下级组织全路径ID</label>
</has-relation>
    <has-relation relation="sManageOrgFName"><label language="zh_CN">下级组织全路径名称</label>
</has-relation>
    <has-relation relation="sManageTypeID"><label language="zh_CN">管理类型ID</label>
</has-relation>
    <has-relation relation="sCreatorFID" default-value-expr="currentPersonMemberFID()">
      <label language="zh_CN">授权人</label>
    </has-relation>
	<has-relation relation="sCreatorFName" default-value-expr="currentPersonMemberFName()">
		<label language="zh_CN">授权人</label>
	</has-relation>
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">业务管理权限</label>
  </concept>
  <!-- 分级授权 -->
  <concept name="SA_OPRoleManagement" default-value-expr="guid()">
    <has-relation relation="sOrgID"/>
    <has-relation relation="sOrgFID"/>
    <has-relation relation="sOrgName"/>
    <has-relation relation="sOrgFName"/>
    <has-relation relation="sRoleID"/>
    <has-relation relation="sCreatorFID" default-value-expr="currentPersonMemberFID()">
		<label language="zh_CN">授权人</label>
	</has-relation>
	<has-relation relation="sCreatorFName" default-value-expr="currentPersonMemberFName()">
      <label language="zh_CN">授权人</label>
    </has-relation>
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/>
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">角色管理权限</label>
  </concept>
</model>
