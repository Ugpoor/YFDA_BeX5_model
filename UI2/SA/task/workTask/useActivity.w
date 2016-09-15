<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window"
	xid="window">
	<div component="$UI/system/components/justep/model/model" xid="model"
		onLoad="modelLoad" style="top:26px;height:auto;left:378px;">
		<div component="$UI/system/components/justep/data/bizData" xid="taskData"
			autoLoad="false" concept="SA_WorkTask" orderBy="sCreateTime desc"
			onSaveCommit="saveCommit">
			<reader action="/SA/task/logic/action/queryWorkTaskAction" />
			<writer action="/SA/task/logic/action/saveWorkTaskAction" />
			<creator action="/SA/task/logic/action/createWorkTaskAction" />
		</div>
		<div xid="importanceData" component="$UI/system/components/justep/data/bizData"
			concept="SA_Importance" autoLoad="false">
			<reader action="/system/logic/action/queryImportanceAction" />
		</div>
		<div xid="emergencyData" component="$UI/system/components/justep/data/bizData"
			concept="SA_Emergency" autoLoad="false">
			<reader action="/system/logic/action/queryEmergencyAction" />
		</div>
		<div xid="statusData" component="$UI/system/components/justep/data/bizData"
			concept="SA_TaskStatus" autoLoad="false">
			<reader action="/system/logic/action/queryStatusAction" />
		</div>
	</div>


	<div component="$UI/system/components/justep/panel/panel" 
		class="x-panel x-full">
		<div class="x-panel-top">
			<div component="$UI/system/components/justep/titleBar/titleBar"
				title="工作任务" class="x-titlebar">
				<div class="x-titlebar-left">
					<a component="$UI/system/components/justep/button/button" label=""
						class="btn btn-link btn-only-icon" icon="icon-chevron-left"
						onClick="backBtnClick" xid="backBtn">
						<i class="icon-chevron-left" />
						<span></span>
					</a>
				</div>
				<div class="x-titlebar-title">工作任务</div>
				<div class="x-titlebar-right reverse">
					<a component="$UI/system/components/justep/button/button" label=""
						class="btn btn-link btn-only-icon " onClick="{operation:'taskData.save'}"
						xid="saveBtn">
						<i />
						<span></span>
					</a>
				</div>
			</div>
		</div>
		<div class="x-panel-content">
			<div component="$UI/system/components/justep/controlGroup/controlGroup"
				class="x-control-group" title="基本信息">
				<div class="x-control-group-title">基本信息</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sName')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sName')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sCode')" />
					<div class="x-edit">
						<span class="x-output" component="$UI/system/components/justep/output/output"
							data="taskData" bind-ref="taskData.ref('sCode')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sCustomerName')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sCustomerName')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sPlanName')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sPlanName')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sProjectName')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sProjectName')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sImportanceName')" />
					<div class="x-edit">
						<select class="form-control" component="$UI/system/components/justep/select/select"
							bind-ref="taskData.ref('sImportanceID')" bind-labelRef="taskData.ref('sImportanceName')"
							bind-options="importanceData" bind-optionsLabel="sName"
							bind-optionsValue="SA_Importance" bind-optionsCaption="请选择..." />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sEmergencyName')" />
					<div class="x-edit">
						<select class="form-control" component="$UI/system/components/justep/select/select"
							bind-ref="taskData.ref('sEmergencyID')" bind-labelRef="taskData.ref('sEmergencyName')"
							bind-options="emergencyData" bind-optionsLabel="sName"
							bind-optionsValue="SA_Emergency" bind-optionsCaption="请选择..." />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sLimitTime')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sLimitTime')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sContent')" />
					<div class="x-edit">
						<textarea class="form-control"
							component="$UI/system/components/justep/textarea/textarea" data="taskData"
							bind-ref="taskData.ref('sContent')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sCreatorFName')" />
					<div class="x-edit">
						<span class="x-output" component="$UI/system/components/justep/output/output"
							data="taskData" bind-ref="taskData.ref('sCreatorFName')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sCreateTime')" />
					<div class="x-edit">
						<span class="x-output" component="$UI/system/components/justep/output/output"
							data="taskData" bind-ref="taskData.ref('sCreateTime')" />
					</div>
				</div>
			</div>
			<div component="$UI/system/components/justep/controlGroup/controlGroup"
				class="x-control-group" title="处理信息">
				<div class="x-control-group-title">处理信息</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sStatusName')" />
					<div class="x-edit">
						<select class="form-control" component="$UI/system/components/justep/select/select"
							bind-ref="taskData.ref('sStatusID')" bind-labelRef="taskData.ref('sStatusName')"
							bind-options="statusData" bind-optionsLabel="sName"
							bind-optionsValue="SA_TaskStatus" bind-optionsCaption="请选择..." />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sExecuteTime')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sExecuteTime')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sExpectStartTime')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sExpectStartTime')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sExpectFinishTime')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sExpectFinishTime')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sActualStartTime')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sActualStartTime')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sActualFinishTime')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('sActualFinishTime')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit x-label20">
					<label class="x-label left" bind-text="$model.taskData.label('sRemark')" />
					<div class="x-edit">
						<textarea class="form-control"
							component="$UI/system/components/justep/textarea/textarea" data="taskData"
							bind-ref="taskData.ref('sRemark')" />
					</div>
				</div>
			</div>
		</div>
	</div>


</div>
