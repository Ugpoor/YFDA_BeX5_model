<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<concept name="SA_FilterPattern" default-value-expr="guid()">
		<has-relation relation="version">
			<label language="zh_CN">版本</label>
		</has-relation>
		<label language="zh_CN">过滤模式</label>
		<has-relation relation="sName" size="36" required="true">
			<label language="zh_CN">名称</label>
		</has-relation>
		<has-relation relation="sPerson" data-type="SA_OPPerson" default-value-expr="operatorID()" size="36">
			<label language="zh_CN">操作员</label>
		</has-relation>
		<has-relation relation="sProcess" size="1024" required="true">
			<label language="zh_CN">过程</label>
		</has-relation>
		<has-relation relation="sActivity" size="128" required="true">
			<label language="zh_CN">环节</label>
		</has-relation>
		<has-relation relation="sInstance" data-type="String" size="128" required="true">
			<label language="zh_CN">数据</label>
		</has-relation>
		<has-relation relation="sContent" data-type="Text">
			<label language="zh_CN">内容</label>
		</has-relation>
		<has-relation relation="sOrderNum" data-type="Integer" default-value-expr="nextSeq('$SA_FILTERPATTERN_ORDER$')">
			<label language="zh_CN">顺序号</label>
		</has-relation>
	<has-relation relation="sOrgFID" size="512"><label language="zh_CN">范围组织全路径ID</label>
</has-relation>
<has-relation relation="sOrgFName" size="1024"><label language="zh_CN">范围组织全路径名</label>
</has-relation>
<has-relation relation="sCreatorID" default-value-expr="operatorID()" size="32"></has-relation>
<has-relation relation="sCreatorName" default-value-expr="operatorName()" size="64"></has-relation>
<has-relation relation="sCreateTime" default-value-expr="currentDateTime()"></has-relation>
</concept>
	<relation name="sPerson" data-type="String">
		<label language="zh_CN">操作员</label>
	</relation>
	<relation name="sInstance" data-type="String">
		<label language="zh_CN">数据</label>
	</relation>
	<relation name="sOrderNum" data-type="Integer">
		<label language="zh_CN">顺序号</label>
	</relation>
</model>