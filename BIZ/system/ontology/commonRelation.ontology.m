<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model">
	<relation name="sName" data-type="String" single-valued="true">
		<label language="zh_CN">名称</label>
	</relation>
	<relation name="version" data-type="Integer" single-valued="true" default-value-expr="0">
		<label language="zh_CN">版本</label>
	</relation>
	<relation name="sDescription" data-type="String"
		single-valued="true">
		<label language="zh_CN">描述</label>
	</relation>
	<relation name="sCreatorFID" data-type="String" single-valued="true" default-value-expr="currentPersonMemberFID()">
		<label language="zh_CN">提交者FID</label>
	</relation>
	<relation name="sCreatorID" data-type="SA_OPPerson" default-value-expr="currentPersonMemberID()"
		single-valued="true">
		<label language="zh_CN">提交者ID</label>
	</relation>
	<relation name="sCreatorCode" data-type="String"
		single-valued="true">
		<label language="zh_CN">提交者CODE</label>
	</relation>
	<relation name="sCreatorFName" data-type="String" default-value-expr="currentPersonMemberFName()"
		single-valued="true">
		<label language="zh_CN">提交者</label>
	</relation>
	<relation name="sStartTime" data-type="DateTime"
		single-valued="true">
		<label language="zh_CN">开始时间</label>
	</relation>
	<relation name="sFinishTime" data-type="DateTime"
		single-valued="true">
		<label language="zh_CN">结束时间</label>
	</relation>
</model>