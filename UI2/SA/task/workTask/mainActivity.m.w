<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">
	<div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
		style="top:26px;height:auto;left:378px;">
		<div component="$UI/system/components/justep/data/bizData" xid="taskData"
			directDelete="true" autoLoad="true" concept="SA_WorkTask" orderBy="sCreateTime desc"
			onSaveCommit="saveCommit">
			<reader action="/SA/task/logic/action/queryWorkTaskAction" />
			<writer action="/SA/task/logic/action/saveWorkTaskAction" />
			<creator action="/SA/task/logic/action/createWorkTaskAction" />
			<calculateRelation relation="calcCheckBox" />
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
		<div component="$UI/system/components/justep/data/data" xid="controlData"
			idColumn="edit" autoLoad="true">
			<column name="edit" type="Integer" />
			<data><![CDATA[
      [{edit:0}]
      ]]></data>
		</div>
	</div>

		<div component="$UI/system/components/justep/contents/contents"
			class="x-contents x-full" active="0" slidable="true" xid="contents">
			<div class="x-contents-content active" xid="list">
				<div xid="listPanel" component="$UI/system/components/justep/panel/panel" class="x-panel x-full">
					<div class="x-panel-top">
						<div component="$UI/system/components/justep/titleBar/titleBar"
							title="工作任务" class="x-titlebar">
							<div class="x-titlebar-left">
								<a component="$UI/system/components/justep/button/button"
									label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
									onClick="backBtnClick" xid="backBtn">
									<i class="icon-chevron-left" />
									<span></span>
								</a>
							</div>
							<div class="x-titlebar-title">工作任务</div>
							<div class="x-titlebar-right reverse">
								<a component="$UI/system/components/justep/button/button"
									label="" class="btn btn-link btn-only-icon" icon="icon-plus"
									onClick="addBtnClick" >
									<i class="icon-plus" />
									<span></span>
								</a>
								<a component="$UI/system/components/justep/button/button"
									label="" class="btn btn-link btn-only-icon" icon="icon-edit"
									onClick="editBtnClick">
									<i class="icon-edit" />
									<span></span>
								</a>
							</div>
						</div>
					</div>
					<div class="x-panel-content" refresh="true" load="true">
						<div xid="taskList" class="x-list x-inner-scroll"
							component="$UI/system/components/justep/list/list" data="taskData"
							limit="6">
							<div class="x-list-head" />
							<div class="x-scroll-view x-full">
								<div component="$UI/system/components/justep/scrollView/scrollView"
									supportPullToRefresh="true" supportInfiniteLoad="true" hScroll="false"
									vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true"
									class="x-scroll">
									<div class="x-content-center x-pull-down container">
									      <i class="x-pull-down-img glyphicon x-icon-pull-down"></i>
									      <span class="x-pull-down-label">下拉刷新...</span>
									</div>
									<div class="x-scroll-content">

										<ul class="x-list-template">
											<li>
												<div class="x-row x-row-center" component="$UI/system/components/justep/row/row">
													<div class="x-col" style="text-align: left;"
														bind-visible="$model.controlData.val('edit')==1">
														<span component="$UI/system/components/justep/button/checkbox"
															bind-ref="ref('calcCheckBox')" class="x-checkbox" />
													</div>
													<div class="x-col x-col-90" bind-click="showDetailClick">
														<div class="x-row" component="$UI/system/components/justep/row/row">
															<div class="x-col">
																<span class="x-output" style="font-weight:bold"
																	component="$UI/system/components/justep/output/output"
																	data="taskData" bind-ref="ref('sName')" />
															</div>
															<div class="x-col" style="text-align:right;color:gray">
																<span class="x-output"
																	component="$UI/system/components/justep/output/output"
																	data="taskData" format="yyyy-MM-dd" bind-ref="ref('sExecuteTime')" />
															</div>
														</div>
														<div class="x-row" style="color:gray" component="$UI/system/components/justep/row/row">
															<div class="x-col">
																<label class="small"
																	bind-text="$model.taskData.label('sStatusName')" />
																:
																<span component="$UI/system/components/justep/output/output"
																	data="taskData" bind-ref="ref('sStatusName')" />
															</div>
														</div>
														<div class="x-row" style="color:gray" component="$UI/system/components/justep/row/row">
															<div class="x-col">
																<label class="small"
																	bind-text="$model.taskData.label('sExecutorPersonName')" />
																:
																<span component="$UI/system/components/justep/output/output"
																	data="taskData" bind-ref="ref('sExecutorPersonName')" />
															</div>
														</div>
													</div>
													<div class="x-col" bind-click="showDetailClick"
														style="text-align: right;color:gray">
														<a component="$UI/system/components/justep/button/button"
															label="" class="btn btn-only-icon" icon="icon-chevron-right"
															>
															<i class="icon-chevron-right" />
															<span />
														</a>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<div class="x-content-center x-pull-up">
								        <span class="x-pull-up-label">加载更多...</span>
								    </div>
								</div>
							</div>
						</div>
					</div>
					<div class="x-panel-bottom">
						<div class="btn-group btn-group-justified" component="$UI/system/components/justep/button/buttonGroup" style="height:100%">
							<a component="$UI/system/components/justep/button/button"
								label="删除" class="btn btn-default" onClick="okEditClick">
								<i />
								<span>删除</span>
							</a>
							<a component="$UI/system/components/justep/button/button"
								label="取消" class="btn btn-default" onClick="cancelEditClick">
								<i />
								<span>取消</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="x-contents-content" xid="detail">
				<div component="$UI/system/components/justep/panel/panel"
					class="x-panel x-full">
					<div class="x-panel-top">
						<div component="$UI/system/components/justep/titleBar/titleBar"
							title="工作任务" class="x-titlebar">
							<div class="x-titlebar-left">
								<a component="$UI/system/components/justep/button/button"
									label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
									onClick="listBtnClick" xid="listBtn">
									<i class="icon-chevron-left" />
									<span></span>
								</a>
							</div>
							<div class="x-titlebar-title">工作任务</div>
							<div class="x-titlebar-right reverse">
								<a component="$UI/system/components/justep/button/button"
									label="" class="btn btn-link btn-only-icon" icon="icon-plus"
									onClick="addBtnClick" >
									<i class="icon-plus" />
									<span></span>
								</a>
								<a component="$UI/system/components/justep/button/button"
									label="" class="btn btn-link btn-only-icon " onClick="{operation:'taskData.save'}"
									xid="saveBtn" >
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
									<select class="form-control"
										component="$UI/system/components/justep/select/select"
										bind-ref="taskData.ref('sImportanceID')" bind-labelRef="taskData.ref('sImportanceName')"
										bind-options="importanceData" bind-optionsLabel="sName"
										bind-optionsValue="SA_Importance" bind-optionsCaption="请选择..." />
								</div>
							</div>
							<div component="$UI/system/components/justep/labelEdit/labelEdit"
								class="x-label-edit x-label20">
								<label class="x-label left" bind-text="$model.taskData.label('sEmergencyName')" />
								<div class="x-edit">
									<select class="form-control"
										component="$UI/system/components/justep/select/select"
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
										component="$UI/system/components/justep/textarea/textarea"
										data="taskData" bind-ref="taskData.ref('sContent')" />
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
									<select class="form-control"
										component="$UI/system/components/justep/select/select"
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
										component="$UI/system/components/justep/textarea/textarea"
										data="taskData" bind-ref="taskData.ref('sRemark')" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</div>
