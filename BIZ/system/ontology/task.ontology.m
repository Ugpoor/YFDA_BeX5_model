<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<relation name="sPrev" inverse-of="sNext" single-valued="false">
		<label language="zh_CN">前序任务</label>
	</relation>
	<relation name="sNext" inverse-of="sPrev" single-valued="false">
		<label language="zh_CN">后序任务</label>
	</relation>
	<relation name="sParent" inverse-of="sChildren" single-valued="true">
		<label language="zh_CN">父任务</label>
	</relation>
	<relation name="sChildren" inverse-of="sParent" single-valued="false">
		<label language="zh_CN">子任务</label>
	</relation>
	
	<relation name="sCatalogID">
		<label language="zh_CN">任务级别</label>
	</relation>
	<relation name="sKindID">
		<label language="zh_CN">任务分类</label>
	</relation>
	
	<relation name="sRemark" data-type="String" single-valued="true">
		<label language="zh_CN">处理情况</label>
	</relation>
	
	<relation name="sFlowID" single-valued="true">
		<label language="zh_CN">流程实例</label>
	</relation>
	
	<relation name="sSourceID" single-valued="true">
		<label language="zh_CN">回退的目标</label>
	</relation>
	
	<relation name="sFrontID" data-type="SA_Task" single-valued="true">
		<label language="zh_CN">回退的起点</label>
	</relation>
	
	
	<relation name="sTypeID" single-valued="true">
		<label language="zh_CN">任务类型ID</label>
	</relation>
	<relation name="sTypeName" data-type="String" single-valued="true">
		<label language="zh_CN">任务类型</label>
	</relation>

	<relation name="sStatusID" single-valued="true">
		<label language="zh_CN">任务状态ID</label>
	</relation>
	<relation name="sStatusName" data-type="String" single-valued="true">
		<label language="zh_CN">任务状态</label>
	</relation>
	
	<relation name="sImportanceID" data-type="SA_Importance" single-valued="true">
		<label language="zh_CN">重要性ID</label>
	</relation>
	<relation name="sImportanceName" data-type="String" single-valued="true">
		<label language="zh_CN">重要性</label>
	</relation>
	<relation name="sEmergencyID" data-type="SA_Emergency" single-valued="true">
		<label language="zh_CN">紧迫度ID</label>
	</relation>
	<relation name="sEmergencyName" data-type="String" single-valued="true">
		<label language="zh_CN">紧迫度</label>
	</relation>
	
	<relation name="sCURL" data-type="String" single-valued="true">
		<label language="zh_CN">提交页面</label>
	</relation>
	<relation name="sEURL" data-type="String" single-valued="true">
		<label language="zh_CN">执行页面</label>
	</relation>
	

	<relation name="sCreateTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">创建时间</label>
	</relation>
	<relation name="sDistributeTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">发布时间</label>
	</relation>
	<relation name="sLastModifyTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">最后修改时间</label>
	</relation>
	<relation name="sLimitTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">限制时间</label>
	</relation>
	<relation name="sWarningTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">警告时间</label>
	</relation>
	<relation name="sExpectStartTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">预计开始时间</label>
	</relation>
	<relation name="sExpectFinishTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">预计结束时间</label>
	</relation>
	<relation name="sActualStartTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">开始时间</label>
	</relation>
	<relation name="sActualFinishTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">结束时间</label>
	</relation>
	<relation name="sExecuteTime" data-type="DateTime" single-valued="true">
		<label language="zh_CN">处理时间</label>
	</relation>

	<relation name="sExecutorFID" data-type="String" single-valued="true">
		<label language="zh_CN">执行者FID</label>
	</relation>
	<relation name="sExecutorFName" data-type="String" single-valued="true">
		<label language="zh_CN">执行者</label>
	</relation>
	<relation name="sExecutorNames" data-type="String" single-valued="true">
		<label language="zh_CN">执行者列表</label>
	</relation>
	
	<relation name="sResponsible" data-type="String" single-valued="true">
		<label language="zh_CN">负责人</label>
	</relation>
	<relation name="sExecuteMode2" data-type="String" single-valued="true">
		<label language="zh_CN">执行模式2</label>
	</relation>
	<relation name="sExecuteMode" data-type="SA_TaskExecuteMode" single-valued="true">
		<label language="zh_CN">执行模式</label>
	</relation>
	<relation name="sPreemptMode" data-type="SA_TaskPreemptMode" single-valued="true">
		<label language="zh_CN">抢占模式</label>
	</relation>
	<relation name="sRemindMode" data-type="String" single-valued="true">
		<label language="zh_CN">提醒模式</label>
	</relation>
	
	<relation name="sData1" data-type="String" single-valued="true">
		<label language="zh_CN">业务数据1</label>
	</relation>
	<relation name="sData2" data-type="String" single-valued="true">
		<label language="zh_CN">业务数据2</label>
	</relation>
	<relation name="sData3" data-type="String" single-valued="true">
		<label language="zh_CN">业务数据3</label>
	</relation>
	<relation name="sData4" data-type="String" single-valued="true">
		<label language="zh_CN">业务数据4</label>
	</relation>
	<relation name="sVariable" data-type="String" single-valued="true">
		<label language="zh_CN">变量</label>
	</relation>
	
	<relation name="sAIID" data-type="String" single-valued="true">
		<label language="zh_CN">环节实例</label>
	</relation>
	<relation name="sAIActive" data-type="String" single-valued="true">
		<label language="zh_CN">环节激活</label>
	</relation>
	<relation name="sAIStatusID" data-type="String" single-valued="true">
		<label language="zh_CN">环节状态ID</label>
	</relation>
	<relation name="sAIStatusName" data-type="String" single-valued="true">
		<label language="zh_CN">环节状态</label>
	</relation>


	<relation name="sLock" data-type="String" single-valued="true">
		<label language="zh_CN">编号</label>
	</relation>
	<relation name="sHints" data-type="String" single-valued="true">
		<label language="zh_CN">提示</label>
	</relation>
	<relation name="sShortcut" data-type="String" single-valued="true">
		<label language="zh_CN">快捷操作</label>
	</relation>
	
	<relation name="sSequence" data-type="Integer" single-valued="true">
		<label language="zh_CN">序号</label>
	</relation>
	
	
	<relation name="sCustomerID" single-valued="true">
		<label language="zh_CN">客户ID</label>
	</relation>
	<relation name="sCustomerName" data-type="String" single-valued="true">
		<label language="zh_CN">客户</label>
	</relation>

	<relation name="sProjectID" single-valued="true">
		<label language="zh_CN">项目ID</label>
	</relation>
	<relation name="sProjectName" data-type="String" single-valued="true">
		<label language="zh_CN">项目</label>
	</relation>

	<relation name="sPlanID" single-valued="true">
		<label language="zh_CN">计划ID</label>
	</relation>
	<relation name="sPlanName" data-type="String" single-valued="true">
		<label language="zh_CN">计划</label>
	</relation>

	<relation name="sCreatorPersonID" data-type="SA_OPPerson" single-valued="true">
		<label language="zh_CN">提交人ID</label>
	</relation>
	
	<relation name="sCreatorPersonName" data-type="String" single-valued="true">
		<label language="zh_CN">提交人</label>
	</relation>

	<relation name="sCreatorPosID" data-type="SA_OPOrg" single-valued="true">
		<label language="zh_CN">提交者岗位ID</label>
	</relation>
	
	<relation name="sCreatorPosName" data-type="String" single-valued="true">
		<label language="zh_CN">提交者岗位</label>
	</relation>
	
	<relation name="sCreatorDeptID" data-type="SA_OPOrg" single-valued="true">
		<label language="zh_CN">提交者部门ID</label>
	</relation>
	
	<relation name="sCreatorDeptName" data-type="String" single-valued="true">
		<label language="zh_CN">提交者部门</label>
	</relation>
	
	<relation name="sCreatorOgnID" data-type="SA_OPOrg" single-valued="true">
		<label language="zh_CN">提交者机构ID</label>
	</relation>
	
	<relation name="sCreatorOgnName" data-type="String" single-valued="true">
		<label language="zh_CN">提交者机构</label>
	</relation>

	<relation name="sExecutorPersonID" data-type="SA_OPPerson" single-valued="true">
		<label language="zh_CN">执行人ID</label>
	</relation>
	
	<relation name="sExecutorPersonName" data-type="String" single-valued="true">
		<label language="zh_CN">执行人</label>
	</relation>

	<relation name="sExecutorPosID" data-type="SA_OPOrg" single-valued="true">
		<label language="zh_CN">执行者岗位ID</label>
	</relation>
	
	<relation name="sExecutorPosName" data-type="String" single-valued="true">
		<label language="zh_CN">执行者岗位</label>
	</relation>
	
	<relation name="sExecutorDeptID" data-type="SA_OPOrg" single-valued="true">
		<label language="zh_CN">执行者部门ID</label>
	</relation>
	
	<relation name="sExecutorDeptName" data-type="String" single-valued="true">
		<label language="zh_CN">执行者部门</label>
	</relation>
	
	<relation name="sExecutorOgnID" data-type="SA_OPOrg" single-valued="true">
		<label language="zh_CN">执行者机构ID</label>
	</relation>
	
	<relation name="sExecutorOgnName" data-type="String" single-valued="true">
		<label language="zh_CN">执行者机构</label>
	</relation>
	
	
	<!-- SA_Task -->
	<concept name="SA_Task" default-value-expr="shortGuid()">
		<label language="zh_CN">任务</label>
		<has-relation relation="sPrev" data-type="SA_Task">
			<label language="zh_CN">前序任务</label>
		</has-relation>
		<has-relation relation="sNext" data-type="SA_Task" >
			<label language="zh_CN">后序任务</label>
		</has-relation>
		<has-relation relation="sParent" data-type="SA_Task" >
			<label language="zh_CN">父任务</label>
		</has-relation>
		<has-relation relation="sChildren" data-type="SA_Task" >
			<label language="zh_CN">子任务</label>
		</has-relation>
		
		
		<has-relation relation="sName" />
		<has-relation relation="sContent" />
		<has-relation relation="sRemark" />
		
		<has-relation relation="sFlowID" data-type="SA_Task"/>
		<has-relation relation="sSourceID" data-type="SA_Task"/>
		<has-relation relation="sFrontID" data-type="SA_Task"/>
		<has-relation relation="sCatalogID" data-type="SA_TaskScope"/>
		<has-relation relation="sKindID" data-type="SA_TaskKind"/>
		
		<has-relation relation="sResponsible" />
		<has-relation relation="sExecuteMode2" />
		<has-relation relation="sExecuteMode" />
		<has-relation relation="sPreemptMode" />
		<has-relation relation="sRemindMode" />
	
		<has-relation relation="sTypeID" data-type="String">
			<label language="zh_CN">任务类型ID</label>
		</has-relation>
		<has-relation relation="sTypeName" >
			<label language="zh_CN">任务类型</label>
		</has-relation>
		
		<has-relation relation="sImportanceID" />
		<has-relation relation="sImportanceName" />
		
		<has-relation relation="sEmergencyID" />
		<has-relation relation="sEmergencyName" />
		
		<has-relation relation="sCURL" />
		<has-relation relation="sEURL" />
		
		<has-relation relation="sDistributeTime" />
		<has-relation relation="sCreateTime" />
		<has-relation relation="sLastModifyTime" />
		<has-relation relation="sLimitTime" />
		<has-relation relation="sWarningTime" />
		<has-relation relation="sExecuteTime" />
		<has-relation relation="sExpectStartTime" />
		<has-relation relation="sExpectFinishTime" />
		<has-relation relation="sActualStartTime" />
		<has-relation relation="sActualFinishTime" />

		<has-relation relation="sCreatorFID" />
		<has-relation relation="sCreatorFName" />

		
		
		<has-relation relation="sExecutorFID" />
		<has-relation relation="sExecutorFName" />

		<has-relation relation="sCreatorPersonID" />
		<has-relation relation="sCreatorPersonName" />
		<has-relation relation="sCreatorPosID" />
		<has-relation relation="sCreatorPosName" />
		<has-relation relation="sCreatorDeptID" />
		<has-relation relation="sCreatorDeptName" />
		<has-relation relation="sCreatorOgnID" />
		<has-relation relation="sCreatorOgnName" />


		<has-relation relation="sExecutorPersonID" />
		<has-relation relation="sExecutorPersonName" />
		<has-relation relation="sExecutorPosID" />
		<has-relation relation="sExecutorPosName" />
		<has-relation relation="sExecutorDeptID" />
		<has-relation relation="sExecutorDeptName" />
		<has-relation relation="sExecutorOgnID" />
		<has-relation relation="sExecutorOgnName" />
		
		<has-relation relation="sExecutorNames" />
		
		<has-relation relation="sCustomerID" data-type="String"/>
		<has-relation relation="sCustomerName"/>
		<has-relation relation="sProjectID" data-type="String"/>
		<has-relation relation="sProjectName" />
		<has-relation relation="sPlanID" data-type="String"/>
		<has-relation relation="sPlanName" />
		
		
		<has-relation relation="sData1" />
		<has-relation relation="sData2" />
		<has-relation relation="sData3" />
		<has-relation relation="sData4" />
		<has-relation relation="sVariable" />
		
		<has-relation relation="sActive" />
		<has-relation relation="sStatusID" data-type="SA_TaskStatus">
			<label language="zh_CN">任务状态ID</label>
		</has-relation>
		<has-relation relation="sStatusName" >
			<label language="zh_CN">任务状态</label>
		</has-relation>
		
		<has-relation relation="sAIActive" />
		<has-relation relation="sAIID" />
		<has-relation relation="sAIStatusID" />
		<has-relation relation="sAIStatusName" />
		
		<has-relation relation="sSequence" />
		
		<has-relation relation="sLock" />
		<has-relation relation="sHints" />
		<has-relation relation="sShortcut" />
		
		<has-relation relation="sProcess" />
		<has-relation relation="sActivity" />
		<has-relation relation="sProcessName" />
		<has-relation relation="sActivityName" />
		
		<has-relation relation="version" default-value-expr="0"/>
		
		<has-relation relation="sProcessTemplateID"/>
		<has-relation relation="sProcessTemplateItemSequence"/>
	<has-relation relation="sTempPermissionID" data-type="String"><label language="zh_CN">临时权限</label>
</has-relation>

<has-relation relation="sESField01" data-type="String"><label language="zh_CN">扩展01</label>
</has-relation>
<has-relation relation="sESField02" data-type="String"><label language="zh_CN">扩展02</label>
</has-relation>
<has-relation relation="sESField03" data-type="String"><label language="zh_CN">扩展03</label>
</has-relation>
<has-relation relation="sESField04" data-type="String"><label language="zh_CN">扩展04</label>
</has-relation>
<has-relation relation="sESField05" data-type="String"><label language="zh_CN">扩展05</label>
</has-relation>
<has-relation relation="sESField06" data-type="String"><label language="zh_CN">扩展06</label>
</has-relation>
<has-relation relation="sESField07" data-type="String"><label language="zh_CN">扩展07</label>
</has-relation>
<has-relation relation="sESField08" data-type="String"><label language="zh_CN">扩展08</label>
</has-relation>




<has-relation relation="sEDField21" data-type="DateTime"><label language="zh_CN">扩展21</label>
</has-relation>
<has-relation relation="sEDField22" data-type="DateTime"><label language="zh_CN">扩展22</label>
</has-relation>
<has-relation relation="sEDField23" data-type="DateTime"><label language="zh_CN">扩展23</label>
</has-relation>
<has-relation relation="sEDField24" data-type="DateTime"><label language="zh_CN">扩展24</label>
</has-relation>
<has-relation relation="sETField31" data-type="Text"><label language="zh_CN">扩展31</label>
</has-relation>
<has-relation relation="sETField32" data-type="Text"><label language="zh_CN">扩展32</label>
</has-relation>
<has-relation relation="sETField33" data-type="Text"><label language="zh_CN">扩展33</label>
</has-relation>
<has-relation relation="sETField34" data-type="Text"><label language="zh_CN">扩展34</label>
</has-relation>
<has-relation relation="sEIField41" data-type="Integer"><label language="zh_CN">扩展41</label>
</has-relation>
<has-relation relation="sEIField42" data-type="Integer"><label language="zh_CN">扩展42</label>
</has-relation>
<has-relation relation="sEIField43" data-type="Integer"><label language="zh_CN">扩展43</label>
</has-relation>
<has-relation relation="sEIField44" data-type="Integer"><label language="zh_CN">扩展44</label>
</has-relation>
<has-relation relation="sEBField51" data-type="Blob"><label language="zh_CN">扩展51</label>
</has-relation>
<has-relation relation="sEBField52" data-type="Blob"><label language="zh_CN">扩展52</label>
</has-relation>
<has-relation relation="sEBField53" data-type="Blob"><label language="zh_CN">扩展53</label>
</has-relation>
<has-relation relation="sEBField54" data-type="Blob"><label language="zh_CN">扩展54</label>
</has-relation>
<has-relation relation="sENField11" data-type="Decimal"><label language="zh_CN">扩展11</label>
</has-relation>
<has-relation relation="sENField12" data-type="Decimal"><label language="zh_CN">扩展12</label>
</has-relation>
<has-relation relation="sENField13" data-type="Decimal"><label language="zh_CN">扩展13</label>
</has-relation>
<has-relation relation="sENField14" data-type="Decimal"><label language="zh_CN">扩展14</label>
</has-relation>
<has-relation relation="sSummary" data-type="String"><label language="zh_CN">摘要</label>
</has-relation>
<has-relation relation="sActivityNames" data-type="String"><label language="zh_CN">当前活动环节</label>
</has-relation>
<has-relation relation="sCode"><label language="zh_CN">编号</label>
</has-relation>
<has-relation relation="sWithdraw" data-type="Integer"></has-relation>
<has-relation relation="sProcessTemplateID2" data-type="SA_ProcessTemplate"></has-relation>
<has-relation relation="sActivityInTemplate" data-type="String"></has-relation>
</concept>
	
	
	<relation name="sProcessTemplateID" data-type="SA_ProcessTemplate" single-valued="true">
		<label language="zh_CN">流程模板</label>
	</relation>
	<relation name="sProcessTemplateItemSequence" data-type="String" single-valued="true">
		<label language="zh_CN">流程模板序号</label>
	</relation>
	
	
	
	
	<relation name="sConcept" data-type="String" single-valued="true">
		<label language="zh_CN">详细信息</label>
	</relation>
	<relation name="sNewActivity" data-type="String" single-valued="true">
		<label language="zh_CN">新建环节</label>
	</relation>
	<relation name="sExecuteActivity" data-type="String" single-valued="true">
		<label language="zh_CN">执行环节</label>
	</relation>
	<relation name="sKind" data-type="String" single-valued="true">
		<label language="zh_CN">任务分类</label>
	</relation>
	
	<concept name="SA_TaskType">
		<label language="zh_CN">任务类型</label>
		<has-relation relation="sName" />
		<has-relation relation="sConcept" />
		<has-relation relation="sNewActivity" />
		<has-relation relation="sExecuteActivity" />
		<has-relation relation="sKind" />
		<has-relation relation="version" />
		<has-relation relation="sProcess" />
		<has-relation relation="sActivity" />
	</concept>

	<concept name="SA_Importance">
		<label language="zh_CN">重要性</label>
		<has-relation relation="sName" />
	<has-relation relation="version"></has-relation>
<has-relation relation="sCode"></has-relation>
</concept>
	
	<concept name="SA_Emergency">
		<label language="zh_CN">紧迫度</label>
		<has-relation relation="sName" />
	<has-relation relation="version"></has-relation>
<has-relation relation="sCode"></has-relation>
</concept>

	<concept name="SA_TaskStatus">
		<label language="zh_CN">状态</label>
		<has-relation relation="sName" />
	<has-relation relation="version"></has-relation>
<has-relation relation="sCode"></has-relation>
</concept>
	
	<concept name="SA_TaskScope">
		<label language="zh_CN">任务级别</label>
		<has-relation relation="sName" />
	<has-relation relation="sCode"></has-relation>
<has-relation relation="version"></has-relation>
</concept>
	
	<concept name="SA_TaskKind">
		<label language="zh_CN">任务分类</label>
		<has-relation relation="sName" />
	<has-relation relation="sCode"></has-relation>
<has-relation relation="version"></has-relation>
</concept>
	
	<concept name="SA_TaskExecuteMode">
		<label language="zh_CN">执行模式</label>
		<has-relation relation="sName" />
	<has-relation relation="sCode"></has-relation>
<has-relation relation="version"></has-relation>
</concept>
	
	<concept name="SA_TaskPreemptMode">
		<label language="zh_CN">抢占模式</label>
		<has-relation relation="sName" />
	<has-relation relation="sCode"></has-relation>
<has-relation relation="version"></has-relation>
</concept>
<relation name="sTempPermissionID" data-type="String"><label language="zh_CN">临时权限</label>
</relation>

<relation name="sESField01" data-type="String"><label language="zh_CN">扩展01</label>
</relation>
<relation name="sESField02" data-type="String"><label language="zh_CN">扩展02</label>
</relation>
<relation name="sESField03" data-type="String"><label language="zh_CN">扩展03</label>
</relation>
<relation name="sESField04" data-type="String"><label language="zh_CN">扩展04</label>
</relation>
<relation name="sESField05" data-type="String"><label language="zh_CN">扩展05</label>
</relation>
<relation name="sESField06" data-type="String"><label language="zh_CN">扩展06</label>
</relation>
<relation name="sESField07" data-type="String"><label language="zh_CN">扩展07</label>
</relation>
<relation name="sESField08" data-type="String"><label language="zh_CN">扩展08</label>
</relation>

<relation name="sEDField21" data-type="DateTime"><label language="zh_CN">扩展21</label>
</relation>
<relation name="sEDField22" data-type="DateTime"><label language="zh_CN">扩展22</label>
</relation>
<relation name="sEDField23" data-type="DateTime"><label language="zh_CN">扩展23</label>
</relation>
<relation name="sEDField24" data-type="DateTime"><label language="zh_CN">扩展24</label>
</relation>
<relation name="sETField31" data-type="Text"><label language="zh_CN">扩展31</label>
</relation>
<relation name="sETField32" data-type="Text"><label language="zh_CN">扩展32</label>
</relation>
<relation name="sETField33" data-type="Text"><label language="zh_CN">扩展33</label>
</relation>
<relation name="sETField34" data-type="Text"><label language="zh_CN">扩展34</label>
</relation>
<relation name="sEIField41" data-type="Integer"><label language="zh_CN">扩展41</label>
</relation>
<relation name="sEIField42" data-type="Integer"><label language="zh_CN">扩展42</label>
</relation>
<relation name="sEIField43" data-type="Integer"><label language="zh_CN">扩展43</label>
</relation>
<relation name="sEIField44" data-type="Integer"><label language="zh_CN">扩展44</label>
</relation>
<relation name="sEBField51" data-type="Blob"><label language="zh_CN">扩展51</label>
</relation>
<relation name="sEBField52" data-type="Blob"><label language="zh_CN">扩展52</label>
</relation>
<relation name="sEBField53" data-type="Blob"><label language="zh_CN">扩展53</label>
</relation>
<relation name="sEBField54" data-type="Blob"><label language="zh_CN">扩展54</label>
</relation>
<relation name="sENField11" data-type="Decimal"><label language="zh_CN">扩展11</label>
</relation>
<relation name="sENField12" data-type="Decimal"><label language="zh_CN">扩展12</label>
</relation>
<relation name="sENField13" data-type="Decimal"><label language="zh_CN">扩展13</label>
</relation>
<relation name="sENField14" data-type="Decimal"><label language="zh_CN">扩展14</label>
</relation>
<relation name="sSummary" data-type="String"><label language="zh_CN">摘要</label>
</relation>
<relation name="sActivityNames" data-type="String"><label language="zh_CN">当前活动环节</label>
</relation>
<relation name="sWithdraw" data-type="Integer"><label language="zh_CN">回收标记</label>
</relation>
<relation name="sProcessTemplateID2" data-type="SA_ProcessTemplate"><label language="zh_CN">模板2</label>
</relation>
<relation name="sActivityInTemplate" data-type="String"><label language="zh_CN">环节2</label>
</relation>
<concept name="SA_TaskRelation" keys="sTaskID1:sTaskID2">
<label language="zh_CN">任务关系</label>
<has-relation relation="sTaskID1" data-type="String" size="32"></has-relation>
<has-relation relation="sTaskID2" data-type="String" size="32"></has-relation>
</concept>
<relation name="sTaskID1" data-type="String"><label language="zh_CN">任务标识</label>
</relation>
<relation name="sTaskID2" data-type="String"><label language="zh_CN">后序任务</label>
</relation>
</model>