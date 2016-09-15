<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window"
	component="$UI/system/components/justep/window/window">
	<div component="$UI/system/components/justep/model/model" xid="model"
		style="height:auto;left:496px;top:429px;">
		<div component="$UI/system/components/justep/data/data" xid="controlData" autoLoad="true"
			idColumn="rowid">
			<column name="rowid" type="String" />
			<column name="message" type="String" />
			<column name="postscript" type="String" />
			<data><![CDATA[
      [{rowid: '0', message: '', postscript:''}]
      ]]></data>
		</div>
		<div component="$UI/system/components/justep/data/data" xid="activityData" 
			idColumn="rowid">
			<column name="rowid" type="String" />
			<column name="selected" type="Integer" />
			<column name="isEnd" type="Integer" />
			<column name="label" type="String" />
			
			<column name="btnStatus" type="String" />
			<data />
		</div>
		<div component="$UI/system/components/justep/data/data" xid="flowToData"
			idColumn="rowid">
			<column name="rowid" type="String" />
			<column name="sName" type="String" />
			<column name="sExecuteMode" type="String" />
			<column name="sPreemptMode" type="String" />
			<column name="sExecuteMode2" type="String" />
			<data />
		</div>
		<div component="$UI/system/components/justep/data/data" xid="noticeData"
			idColumn="rowid">
			<column name="rowid" type="String" />
			<column name="selected" type="Integer" />
			<column name="sName" type="String" />
			
			<column name="btnStatus" type="String" />
			<data />
		</div>
		<div component="$UI/system/components/justep/data/data" xid="executorData"
			idColumn="rowid" confirmDelete="false">
			<column name="rowid" type="String" />
			<column name="owner" type="String" />
			<column name="sFID" type="String" />
			<column name="sFName" type="String" />
			<column name="responsible" type="Integer" />
			<column name="sName" type="String" />
			<data />
		</div>
	</div>
	<span xid="windowReceive"
		component="$UI/system/components/justep/windowReceiver/windowReceiver"
		onReceive="windowReceiveReceive" style="top:12px;left:92px;" />
	<div xid="dialogs" />
	<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel">
		<div class="x-panel-top" xid="panelTop">
			<div xid="bar" component="$UI/system/components/justep/titleBar/titleBar"
				title="" class="x-titlebar">
				<div class="x-titlebar-left">
					<a component="$UI/system/components/justep/button/button" label=""
						class="btn btn-link btn-only-icon " icon="icon-chevron-left"
						onClick="cancelBtnClick" xid="cancelBtn">
						<i class="icon-chevron-left" />
						<span></span>
					</a>
				</div>
				<div class="x-titlebar-title" />
				<div class="x-titlebar-right reverse">
					<a component="$UI/system/components/justep/button/button" label=""
						class="btn btn-link btn-only-icon " icon="icon-checkmark-round"
						onClick="okBtnClick" xid="okBtn">
						<i class="icon-checkmark-round" />
						<span></span>
					</a>
				</div>
			</div>
		</div>
		<div class="x-panel-content" xid="panelContent">
			<label xid="message" class="text-center"
				style="width:100%;font-weight: bold;margin-bottom:8px" bind-visible="$model.activityData.getCount() == 0"
				bind-text="$model.controlData.ref('message')" />
			<div class="panel-group">
				<div class="panel panel-default x-list" bind-visible="$model.activityData.getCount() &gt; 0"
					data="activityData" component="$UI/system/components/justep/list/list">
					<div class="panel-heading">环节列表</div>
					<ul class="list-group x-list-template ">
						<div class="list-group-item">
							<div class="row">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon">
											<span component="$UI/system/components/justep/button/checkbox"
												bind-ref="ref('selected')" class="x-checkbox" onChange="checkbox2Change" />
										</span>
										<div class="form-control font-bold x-output" component="$UI/system/components/justep/output/output"
											data="noticeData" bind-text="ref('label')" />
										
										<span class="input-group-addon"  bind-visible="!val('isEnd')">
											<a component="$UI/system/components/justep/button/button"
												label="高级" class="pull-right btn btn-link" style="padding:0px;border:0px"
												onClick="advanceBtnClick">
												<i />
												<span>高级</span>
											</a>
										</span>
										
									</div>
								</div>
							</div>
							<div class="row" bind-visible="!val('isEnd')">
								<div class="col-xs-12">
									<div class="x-list x-img-list" bind-click="imgListClick"
										component="$UI/system/components/justep/list/list" data="executorData"
										filter="js:val('rowid') == $row.val('owner')">
										<div class="x-list-template">
											<div class='x-img-item'>
												<div class='x-img-content'>
													<a>
														<div class='x-blob x-blob-radius x-img' component='$UI/system/components/justep/org/orgImage' onRefresh="orgImgRefresh"
															bind-ref='ref("sFID")'>
															<div class='x-blob-bar'>
																<i class='x-blob-edit icon-compose' />
																<i class='x-blob-del icon-close-round' />
															</div>
															<img class='x-blob-img x-autofill' />
														</div>
													</a>
													<a bind-visible='$parent.val("btnStatus") === "removeAll"'  class='x-img-top-right x-img-list-remove-item' bind-click='imgListRemoveItemClick'/>
													<div class='x-img-status' bind-visible="val('responsible') === 1"/>
												</div>
												<span class='x-img-name' bind-text='val("sName")' />
											</div>
										</div>
										<div bind-visible="!$model.flowToExecutorReadonly">
											<div class='x-img-item x-img-list-add' style='height:65px' bind-click="flowToAddClick" 
												bind-visible='!val("btnStatus")'>
												<div class='x-img-content'>
													<a>
														<img
															src='$UI/system/components/justep/social/relativeOrg/img/add.png'
															class='x-img x-img-border' />
													</a>
												</div>
											</div>
											<div class='x-img-item x-img-list-remove' bind-click="imgListRemoveClick" 
												style='height:65px' bind-visible='!val("btnStatus") &amp;&amp; ($model.comp($element.parentElement.parentElement).getForeachData().length > 0)'>
												<div class='x-img-content'>
													<a>
														<img
															src='$UI/system/components/justep/social/relativeOrg/img/remove.png'
															class='x-img x-img-border' />
													</a>
												</div>
											</div>
										</div>
										<div class='x-img-item x-img-list-remove-all' bind-visible="val('btnStatus') === 'removeAll'"  bind-click="imgListRemoveAllClick">
											<a style="color:#f57e7b;">清空所有</a>
										</div>
										<div style="clear:both" />
									</div>
								</div>
							</div>
						</div>
					</ul>
				</div>
				<div class="panel panel-default x-list" bind-visible="$model.noticeData.getCount() &gt; 0"
					data="noticeData" component="$UI/system/components/justep/list/list">
					<div class="panel-heading">通知</div>
					<ul class="list-group x-list-template ">
						<div class="list-group-item">
							<div class="row">
								<div class="col-xs-12">
									<div class="input-group">
										 <span class="input-group-addon">
										 	<span component="$UI/system/components/justep/button/checkbox"
												bind-ref="ref('selected')" class="x-checkbox"/>
										 </span>
										 <input class="form-control" component="$UI/system/components/justep/input/input"
											data="noticeData" bind-ref="ref('sName')" />
									</div>
								</div>								
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div component="$UI/system/components/justep/list/list"
										class="x-img-list "  bind-click="imgListClick"
										data="executorData" filter="js:val('rowid') == $row.val('owner')">
										<div class="x-list-template">
											<div class='x-img-item'>
												<div class='x-img-content'>
													<a>
														<div class='x-blob x-blob-radius x-img' component='$UI/system/components/justep/org/orgImage' onRefresh="orgImgRefresh"
															bind-ref='ref("sFID")'>
															<div class='x-blob-bar'>
																<i class='x-blob-edit icon-compose' />
																<i class='x-blob-del icon-close-round' />
															</div>
															<img class='x-blob-img x-autofill' />
														</div>
													</a>
													<a bind-visible='$parent.val("btnStatus") === "removeAll"'  class='x-img-top-right x-img-list-remove-item' bind-click='imgListRemoveItemClick'/>
													<div class='x-img-status' bind-visible="val('responsible') === 1"/>
												</div>
												<span class='x-img-name' bind-text='val("sName")' />
											</div>
										</div>
										<div class='x-img-item x-img-list-add' style='height:65px' bind-click="noticeAddClick" 
											bind-visible='!val("btnStatus")'>
											<div class='x-img-content'>
												<a>
													<img
														src='$UI/system/components/justep/social/relativeOrg/img/add.png'
														class='x-img x-img-border' />
												</a>
											</div>
										</div>
										<div class='x-img-item x-img-list-remove' bind-click="imgListRemoveClick" 
											style='height:65px' bind-visible='!val("btnStatus") &amp;&amp; ($model.comp($element.parentElement).getForeachData().length > 0)'>
											<div class='x-img-content'>
												<a>
													<img
														src='$UI/system/components/justep/social/relativeOrg/img/remove.png'
														class='x-img x-img-border' />
												</a>
											</div>
										</div>
										<div class='x-img-item x-img-list-remove-all' bind-visible="val('btnStatus') === 'removeAll'"  bind-click="imgListRemoveAllClick">
											<a style="color:#f57e7b;">清空所有</a>
										</div>
										<div style="clear:both" />
									</div>
								</div>
							</div>
						</div>
					</ul>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">附言</div>
					<textarea class="form-control"
						component="$UI/system/components/justep/textarea/textarea" data="controlData"
						bind-ref="$model.controlData.ref('postscript')" rows="3"
						style="border-top-right-radius: 0px;border-top-left-radius: 0px;" />
				</div>
			</div>
		</div>
	</div>
</div>
