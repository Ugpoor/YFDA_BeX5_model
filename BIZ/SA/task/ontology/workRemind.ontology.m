<model xmlns="http://www.justep.com/model">
	<concept name="SA_WorkRemind" default-value-expr="guid()">
		<label language="zh_CN">工作提醒</label>
		<has-relation relation="sName" default-value-expr="'新建工作提醒'"/>
		<has-relation relation="sProcess" default-value-expr="'/SA/task/workRemind/workRemindProcess'"/>
		<has-relation relation="sActivity" default-value-expr="'useActivity'"/>
		<has-relation relation="version" default-value-expr="0"/>
		<has-relation relation="sLock" default-value-expr="createSerialNumberByCurrentDate()"/>
		<has-relation relation="sCode" default-value-expr="createSerialNumberByCurrentDate()"/>
		<has-relation relation="sContent"/>
		
		<has-relation relation="sTypeName" default-value-expr="'工作提醒'"/>
		
		
		<has-relation relation="sCustomerID" data-type="String"><label language="zh_CN">客户</label>
</has-relation>
		<has-relation relation="sCustomerName"/>
		<has-relation relation="sProjectID" data-type="String"><label language="zh_CN">项目</label>
</has-relation>
		<has-relation relation="sProjectName"/>
		<has-relation relation="sPlanID" data-type="String"><label language="zh_CN">计划</label>
</has-relation>
		<has-relation relation="sPlanName"/>
		
		<has-relation relation="sLastModifyTime" default-value-expr="currentDateTime()"/>
		<has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/>
		<has-relation relation="sDistributeTime"/>
		<has-relation relation="sExpectStartTime" default-value-expr="currentDateTime()"/>
		<has-relation relation="sExpectFinishTime"/>
		<has-relation relation="sActualStartTime" default-value-expr="currentDateTime()"/>
		<has-relation relation="sActualFinishTime"/>
		<has-relation relation="sLimitTime"/>
		<has-relation relation="sWarningTime"/>
		<has-relation relation="sExecuteTime" default-value-expr="currentDateTime()"/>
		<has-relation relation="sStatusID" data-type="SA_TaskStatus" default-value-expr="'tesReady'">
			<label language="zh_CN">状态</label>
		</has-relation>
		<has-relation relation="sStatusName" default-value-expr="'尚未处理'">
			<label language="zh_CN">状态</label>
		</has-relation>
		<has-relation relation="sRemark"/>
		<has-relation relation="sImportanceID" default-value-expr="'tiMiddle'"><label language="zh_CN">重要性</label>
</has-relation>
		<has-relation relation="sImportanceName" default-value-expr="'中'"/>
		<has-relation relation="sEmergencyID" default-value-expr="'teMiddle'"><label language="zh_CN">紧迫度</label>
</has-relation>
		<has-relation relation="sEmergencyName" default-value-expr="'一般'"/>
		
		<has-relation relation="sCURL" default-value-expr="'/SA/task/workRemind/useActivity.a'"/>
		<has-relation relation="sEURL" default-value-expr="'/SA/task/workRemind/useActivity.a'"/>
		<has-relation relation="sKindID" data-type="SA_TaskKind" default-value-expr="'tkTask'" />
		<has-relation relation="sCatalogID" data-type="SA_TaskScope" default-value-expr="'tsTask'"/>
		<has-relation relation="sCreatorFID" default-value-expr="currentPersonMemberFID()"/>
		<has-relation relation="sCreatorFName" default-value-expr="currentPersonMemberFName()"/>

		<has-relation relation="sExecutorFID" default-value-expr="currentPersonMemberFID()"/>
		<has-relation relation="sExecutorFName" default-value-expr="currentPersonMemberFName()"/>
		
		<has-relation relation="sCreatorPersonID" default-value-expr="currentPersonID()"/>
		<has-relation relation="sCreatorPersonName" default-value-expr="currentPersonName()"/>
		<has-relation relation="sCreatorPosID" default-value-expr="currentPosID()"/>
		<has-relation relation="sCreatorPosName" default-value-expr="currentPosName()"/>
		<has-relation relation="sCreatorDeptID" default-value-expr="currentDeptID()"/>
		<has-relation relation="sCreatorDeptName" default-value-expr="currentDeptName()"/>
		<has-relation relation="sCreatorOgnID" default-value-expr="currentOgnID()"/>
		<has-relation relation="sCreatorOgnName" default-value-expr="currentOgnName()"/>


		<has-relation relation="sExecutorPersonID" default-value-expr="currentPersonID()"/>
		<has-relation relation="sExecutorPersonName" default-value-expr="currentPersonName()"/>
		<has-relation relation="sExecutorPosID" default-value-expr="currentPosID()"/>
		<has-relation relation="sExecutorPosName" default-value-expr="currentPosName()"/>
		<has-relation relation="sExecutorDeptID" default-value-expr="currentDeptID()"/>
		<has-relation relation="sExecutorDeptName" default-value-expr="currentDeptName()"/>
		<has-relation relation="sExecutorOgnID" default-value-expr="currentOgnID()"/>
		<has-relation relation="sExecutorOgnName" default-value-expr="currentOgnName()"/>
		

	</concept>
</model>

