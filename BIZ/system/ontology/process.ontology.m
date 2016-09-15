<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<relation name="sProcess" data-type="String" single-valued="true">
		<label language="zh_CN">过程</label>
	</relation>
	<relation name="sProcessName" data-type="String" single-valued="true">
		<label language="zh_CN">过程</label>
	</relation>
	<relation name="sActivity" data-type="String" single-valued="true">
		<label language="zh_CN">环节</label>
	</relation>
	<relation name="sActivityName" data-type="String" single-valued="true">
		<label language="zh_CN">环节</label>
	</relation>
	<relation name="sAction" data-type="String" single-valued="true">
		<label language="zh_CN">动作</label>
	</relation>
	<relation name="sOperatorID" data-type="SA_OPPerson" single-valued="true">
		<label language="zh_CN">执行者</label>
	</relation>
	<relation name="sContent" data-type="String" single-valued="true">
		<label language="zh_CN">内容</label>
	</relation>

	<!-- SA_ProcessControl -->
	<concept name="SA_ProcessControl">
		<has-relation relation="sProcess" />
		<has-relation relation="sActivity" />
		<has-relation relation="sAction" />
		<has-relation relation="sKind" />
		<has-relation relation="sContent" />
		<has-relation relation="sOperatorID" />
		<has-relation relation="version" default-value-expr="0"/>
	<label language="zh_CN">流程控制信息</label>
<has-relation relation="sProcessTemplateID2"></has-relation>
</concept>


	<relation name="sPlace" data-type="String" single-valued="true">
		<label language="zh_CN">库所</label>
	</relation>
	<relation name="sProcessInstanceID" data-type="SA_Task" single-valued="true">
		<label language="zh_CN">流程实例</label>
	</relation>
	<relation name="sFromActivity" data-type="String" single-valued="true">
		<label language="zh_CN">源环节</label>
	</relation>
	<relation name="sFromActivityInstanceID" data-type="SA_Task" single-valued="true">
		<label language="zh_CN">源环节实例</label>
	</relation>
	<relation name="sToActivity" data-type="String" single-valued="true">
		<label language="zh_CN">目标环节</label>
	</relation>
	<relation name="sToActivityInstanceID" data-type="SA_Task" single-valued="true">
		<label language="zh_CN">目标环节实例</label>
	</relation>
	<relation name="sValue" data-type="String" single-valued="true">
		<label language="zh_CN">值</label>
	</relation>
	<relation name="sActive" data-type="String" single-valued="true">
		<label language="zh_CN">激活</label>
	</relation>

	<!-- SA_TokenInstance -->
	<concept name="SA_TokenInstance">
		<has-relation relation="sProcess" />
		<has-relation relation="sPlace" />
		<has-relation relation="sProcessInstanceID" />
		<has-relation relation="sFromActivity" />
		<has-relation relation="sFromActivityInstanceID"/>
		<has-relation relation="sToActivity" />
		<has-relation relation="sToActivityInstanceID"/>
		<has-relation relation="sValue" />
		<has-relation relation="sActive" />
		<has-relation relation="version" default-value-expr="0"/>
		<label language="zh_CN">令牌</label>
	<has-relation relation="sProcessTemplateID2"></has-relation>
</concept>
	
	<relation name="sCreatorName" data-type="String" 
		single-valued="true">
		<label language="zh_CN">提交者</label>
	</relation>
	
	<relation name="sScopeID" data-type="String" 
		single-valued="true">
		<label language="zh_CN">作用范围</label>
	</relation>

	<concept name="SA_ProcessTemplate" default-value-expr="guid()">
		<label language="zh_CN">流程模板</label>
		<has-relation relation="sName"/>
		<has-relation relation="sKindID" data-type="String"/> <!--template, instance-->
		<has-relation relation="sProcess"/>
		<has-relation relation="sProcessName"/>
		<has-relation relation="sActivity"/>
		<has-relation relation="sActivityName"/>
		<has-relation relation="sScopeID"/> <!-- public, private -->
		
		
		<has-relation relation="sCreatorFID" default-value-expr="currentPersonMemberFID()"/>
		<has-relation relation="sCreatorFName" default-value-expr="currentPersonMemberFName()"/>
		<has-relation relation="sCreatorName" default-value-expr="currentPersonName()"/>
		<has-relation relation="sCreatorID" default-value-expr="currentPersonID()"/>
		
		<has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/>
		<has-relation relation="sContent"/>
		<has-relation relation="version"/>
		
	<has-relation relation="sTypeID" data-type="String"><label language="zh_CN">类型</label>
</has-relation>
<has-relation relation="sContent2" data-type="String"></has-relation>
<has-relation relation="sTemplateID" data-type="SA_ProcessTemplate"></has-relation>
<has-relation relation="sValidState"></has-relation>
</concept>
	
	
<relation name="sContent2" data-type="String"><label language="zh_CN">内容</label>
</relation>
<relation name="sTemplateID" data-type="SA_ProcessTemplate"><label language="zh_CN">源模板</label>
</relation>
</model>