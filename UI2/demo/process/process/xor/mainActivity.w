<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window"
	component="$UI/system/components/justep/window/window">
	<div component="$UI/system/components/justep/model/model" xid="model">
		<div component="$UI/system/components/justep/data/bizData" xid="taskData"
			autoLoad="false" autoNew="true" concept="DEMO_Order" limit="20"
			offset="0" storeType="simple" updateMode="whereVersion">
			<reader action="/demo/misc/logic/action/queryOrderAction" />
			<writer action="/demo/misc/logic/action/saveOrderAction" />
			<creator action="/demo/misc/logic/action/createOrderAction" />
		</div>
	</div>
	
	<span component="$UI/system/components/justep/dialog/dialog" xid="actionDialog">
		<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full">
			<div class="x-panel-top">
				<div component="$UI/system/components/justep/titleBar/titleBar" title="更多动作"
					class="x-titlebar">
					<div class="x-titlebar-left">
						<a component="$UI/system/components/justep/button/button" label=""
							class="btn btn-link btn-only-icon" icon="icon-chevron-left"
							onClick="actionDialogBackBtnClick" xid="actionDialogBackBtn">
							<i class="icon-chevron-left" />
							<span></span>
						</a>
					</div>
					<div class="x-titlebar-title">更多动作</div>
					<div class="x-titlebar-right reverse"/>
				</div>
			</div>
			
			<div class="x-panel-content">
			    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group">
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="保存" xid="saveBtn2" onClick="{operation:'taskData.save'}">
	                <i/>
	                <span>保存</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="流转" xid="advanceBtn2" onClick="{operation:'process.advance'}">
	                <i/>
	                <span>流转</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="转发" xid="transferBtn2" onClick="{operation:'process.transfer'}">
	                <i/>
	                <span>转发</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="回退" xid="backBtn2" onClick="{operation:'process.back'}">
	                <i/>
	                <span>回退</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="暂停" xid="suspendBtn2" onClick="{operation:'process.suspend'}">
	                <i/>
	                <span>暂停</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="终止" xid="abortBtn2" onClick="{operation:'process.abort'}">
	                <i/>
	                <span>终止</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="流程记录" xid="processRecordBtn2" onClick="{operation:'process.processRecord'}">
	                <i/>
	                <span>流程记录</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="流程图" xid="showChartBtn2" onClick="{operation:'process.showChart'}">
	                <i/>
	                <span>流程图</span>
	              </a>  
	              <!--  
	              <div>以下仅用于测试</div>
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="特送" xid="specialBtn2" onClick="{operation:'process.special'}">
	                <i/>
	                <span>特送</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="流程定制" xid="customizedBtn2" onClick="{operation:'process.customized'}">
	                <i/>
	                <span>流程定制</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="回收任务" xid="withdrawTaskBtn2" onClick="{operation:'process.withdrawTask'}">
	                <i/>
	                <span>回收任务</span>
	              </a>  
	              <a component="$UI/system/components/justep/button/button" class="btn btn-primary  btn-block"
	                 label="修改执行者" xid="modifyExecutorBtn2" onClick="{operation:'process.modifyExecutor'}">
	                <i/>
	                <span>修改执行者</span>
	              </a>  
	              -->
				</div>
				
				
			</div>
		</div>		
 	</span>
 	
 	
	<div xid="process" data="taskData"
		component="$UI/system/components/justep/process/process" onBeforeStart="processBeforeStart" onAfterStart="processAfterStart" onStartCommit="processStartCommit" onStartError="processStartError" onBeforeAdvance="processBeforeAdvance" onAfterAdvance="processAfterAdvance" onAdvanceCommit="processAdvanceCommit" onAdvanceError="processAdvanceError" onBeforeAdvanceQuery="processBeforeAdvanceQuery" onAfterAdvanceQuery="processAfterAdvanceQuery" onAdvanceQueryError="processAdvanceQueryError" onBeforeBack="processBeforeBack" onAfterBack="processAfterBack" onBackCommit="processBackCommit" onBackError="processBackError" onBeforeBackQuery="processBeforeBackQuery" onAfterBackQuery="processAfterBackQuery" onBackQueryError="processBackQueryError" onBeforeAbort="processBeforeAbort" onAfterAbort="processAfterAbort" onAbortCommit="processAbortCommit" onAbortError="processAbortError" onBeforeAbortQuery="processBeforeAbortQuery" onAfterAbortQuery="processAfterAbortQuery" onAbortQueryError="processAbortQueryError" onBeforeSuspend="processBeforeSuspend" onAfterSuspend="processAfterSuspend" onSuspendCommit="processSuspendCommit" onSuspendError="processSuspendError" onBeforeSuspendQuery="processBeforeSuspendQuery" onAfterSuspendQuery="processAfterSuspendQuery" onSuspendQueryError="processSuspendQueryError" onBeforeOpenDialog="processBeforeOpenDialog" onBeforeTransfer="processBeforeTransfer" onAfterTransfer="processAfterTransfer" onTransferCommit="processTransferCommit" onTransferError="processTransferError" onBeforeTransferQuery="processBeforeTransferQuery" onAfterTransferQuery="processAfterTransferQuery" onTransferQueryError="processTransferQueryError" onBeforeSpecial="processBeforeSpecial" onAfterSpecial="processAfterSpecial" onSpecialCommit="processSpecialCommit" onSpecialError="processSpecialError" onBeforeSpecialQuery="processBeforeSpecialQuery" onAfterSpecialQuery="processAfterSpecialQuery" onSpecialQueryError="processSpecialQueryError" style="height:24px;width:24px;left:464px;top:65px;"/>
 	
 	
	<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full">
		<div class="x-panel-top">
			<div component="$UI/system/components/justep/titleBar/titleBar" title="XOR"
				class="x-titlebar">
				<div class="x-titlebar-left">
					<a component="$UI/system/components/justep/button/button" label=""
						class="btn btn-link btn-only-icon" icon="icon-chevron-left"
						onClick="backBtnClick" xid="backBtn">
						<i class="icon-chevron-left" />
						<span></span>
					</a>
				</div>
				<div class="x-titlebar-title">XOR</div>
				<div class="x-titlebar-right reverse">
					<a component="$UI/system/components/justep/button/button" label="..."
						class="btn btn-link btn-only-icon" onClick="moreBtnClick"
						xid="moreBtn">
						<i />
						<span>...</span>
					</a>
					<a component="$UI/system/components/justep/button/button" label="流转"
						class="btn btn-link btn-icon-left" onClick="{operation:'process.advance'}"
						xid="advanceQueryBtn">
						<i />
						<span>流转</span>
					</a>
				</div>
			</div>
		</div>
		<div class="x-panel-content" refresh="true">
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit">
					<label class="x-label left" data-bind="text:$model.taskData.label('fOrderCode')" />
					<div class="x-edit">
						<span class="x-output" component="$UI/system/components/justep/output/output"
							data="taskData" bind-ref="taskData.ref('fOrderCode')" />
					</div>
				</div>
				<div component="$UI/system/components/justep/labelEdit/labelEdit"
					class="x-label-edit">
					<label class="x-label left" data-bind="text:$model.taskData.label('fTolotalAmt')" />
					<div class="x-edit">
						<input class="form-control" component="$UI/system/components/justep/input/input"
							data="taskData" bind-ref="taskData.ref('fTolotalAmt')" />
					</div>
				</div>
		</div>
	</div>
</div>
