/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require("$UI/system/lib/justep");
	require("w!$UI/system/components/process/demo/process.w");
	var Model = function() {
		this.callParent();

		this.items = justep.Bind.observableArray([ {
			name : 'name1'
		}, {
			name : 'name2'
		} ]);
	};

	Model.prototype.startProcess = function() {
		var p = this.comp("demoProcess");
		p.start("/demo/process/process/and/andProcess", "新版本流程组件测试", "testNewProcess");
	};

	Model.prototype.advanceProcess = function() {
		var p = this.comp("demoProcess");
		p.advanceQuery();
	};

	Model.prototype.backProcess = function() {
		var p = this.comp("demoProcess");
		p.backQuery();
	};

	Model.prototype.suspendProcess = function() {
		var p = this.comp("demoProcess");
		p.suspendQuery();
	};

	Model.prototype.abortProcess = function() {
		var p = this.comp("demoProcess");
		p.abortQuery();
	};

	Model.prototype.specialProcess = function() {
		var p = this.comp("demoProcess");
		p.specialQuery();
	};

	Model.prototype.transferProcess = function() {
		var p = this.comp("demoProcess");
		p.transferQuery();
	};

	Model.prototype.withdrawTask = function() {
		var p = this.comp("demoProcess");
		p.withdrawTask();
	};

	Model.prototype.startCustomized = function() {
		var p = this.comp("demoProcess");
		p.startCustomizedQuery();
	};

	Model.prototype.beforeAdvanceQuery = function(event) {
		alert("流转查询之前");
	};

	Model.prototype.afterAdvanceQuery = function(event) {
		var processControl = event.processControl;
		var toItems = processControl.getToItems();
		if (toItems) {
			for ( var i = 0; i < toItems.length; i++) {
				var item = toItems[i];
				item.setTaskRelationValue("sEURL", "/UI2/system/components/process/demo/process.w");
				item.setTaskRelationValue("sCURL", "/UI2/system/components/process/demo/process.w");
			}
		}
		alert("流转查询之后");
	};

	Model.prototype.advanceQueryError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("流转查询出错, 错误信息：" + msg);
	};

	Model.prototype.beforeAdvance = function(event) {
		alert("流转之前");
	};

	Model.prototype.afterAdvance = function(event) {
		alert("流转之后");
	};

	Model.prototype.advanceCommit = function(event) {
		alert("流转成功");
	};

	Model.prototype.advanceError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("流转出错, 错误信息：" + msg);
	};

	Model.prototype.beforeBackQuery = function(event) {
		alert("回退查询之前");
	};

	Model.prototype.afterBackQuery = function(event) {
		var processControl = event.processControl;
		var toItems = processControl.getToItems();
		if (toItems) {
			for ( var i = 0; i < toItems.length; i++) {
				var item = toItems[i];
				item.setTaskRelationValue("sEURL", "/UI2/system/components/process/demo/process.w");
				item.setTaskRelationValue("sCURL", "/UI2/system/components/process/demo/process.w");
			}
		}
		alert("回退查询之后");
	};

	Model.prototype.backQueryError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("回退查询出错, 错误信息：" + msg);
	};

	Model.prototype.beforeBack = function(event) {
		alert("回退之前");
	};

	Model.prototype.afterBack = function(event) {
		alert("回退之后");
	};

	Model.prototype.backCommit = function(event) {
		alert("回退成功");
	};

	Model.prototype.backError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("回退出错, 错误信息：" + msg);
	};

	Model.prototype.beforeAbortQuery = function(event) {
		alert("终止查询之前");
	};

	Model.prototype.afterAbortQuery = function(event) {
		alert("终止查询之后");
	};

	Model.prototype.abortQueryError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("终止查询出错, 错误信息：" + msg);
	};

	Model.prototype.beforeAbort = function(event) {
		alert("终止之前");
	};

	Model.prototype.afterAbort = function(event) {
		alert("终止之后");
	};

	Model.prototype.abortCommit = function(event) {
		alert("终止成功");
	};

	Model.prototype.abortError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("终止出错, 错误信息：" + msg);
	};

	Model.prototype.beforeStart = function(event) {
		alert("启动流程之前");
	};
	Model.prototype.afterStart = function(event) {
		alert("启动流程之后");
	};
	Model.prototype.startCommit = function(event) {
		alert("启动流程成功");
	};
	Model.prototype.startError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("启动流程出错, 错误信息：" + msg);
	};

	Model.prototype.beforeSuspendQuery = function(event) {
		alert("暂停查询之前");
	};

	Model.prototype.afterSuspendQuery = function(event) {
		alert("暂停查询之后");
	};

	Model.prototype.suspendQueryError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("暂停查询出错, 错误信息：" + msg);
	};

	Model.prototype.beforeSuspend = function(event) {
		alert("暂停之前");
	};

	Model.prototype.afterSuspend = function(event) {
		alert("暂停之后");
	};

	Model.prototype.suspendCommit = function(event) {
		alert("暂停成功");
	};

	Model.prototype.suspendError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("暂停出错, 错误信息：" + msg);
	};

	Model.prototype.beforeSpecialQuery = function(event) {
		alert("特送查询之前");
	};

	Model.prototype.afterSpecialQuery = function(event) {
		var toItems = event.processControl.getToItems();
		if (toItems && toItems.length > 0) {
			var item = toItems[0];
			item.setSelected(true);
			var context = this.getContext();
			item.addExecutor(context.getCurrentPersonMemberFID(), context.getCurrentPersonMemberFName(), false);
			item.setTaskRelationValue("sEURL", "/UI2/system/components/process/demo/process.w");
			item.setTaskRelationValue("sCURL", "/UI2/system/components/process/demo/process.w");
		}

		event.processControl.deleteUnSelectedItems();
		alert("特送查询之后");
	};

	Model.prototype.specialQueryError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("特送查询出错, 错误信息：" + msg);
	};

	Model.prototype.beforeSpecial = function(event) {
		alert("特送之前");
	};

	Model.prototype.afterSpecial = function(event) {
		alert("特送之后");
	};

	Model.prototype.specialCommit = function(event) {
		alert("特送成功");
	};

	Model.prototype.specialError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("特送出错, 错误信息：" + msg);
	};

	Model.prototype.beforeTransferQuery = function(event) {
		alert("转发查询之前");
	};

	Model.prototype.afterTransferQuery = function(event) {
		var toItems = event.processControl.getToItems();
		if (toItems && toItems.length > 0) {
			var item = toItems[0];
			item.setSelected(true);
			var context = this.getContext();
			item.clearExecutors();
			item.addExecutor(context.getCurrentPersonMemberFID(), context.getCurrentPersonMemberFName(), false);
			item.setTaskRelationValue("sEURL", "/UI2/system/components/process/demo/process.w");
			item.setTaskRelationValue("sCURL", "/UI2/system/components/process/demo/process.w");
		}

		event.processControl.deleteUnSelectedItems();
		alert("转发查询之后");
	};

	Model.prototype.transferQueryError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("转发查询出错, 错误信息：" + msg);
	};

	Model.prototype.beforeTransfer = function(event) {
		alert("转发之前");
	};

	Model.prototype.afterTransfer = function(event) {
		alert("转发之后");
	};

	Model.prototype.transferCommit = function(event) {
		alert("转发成功");
	};

	Model.prototype.transferError = function(event) {
		var msg = event.errorNode ? event.errorNode.message : event.error.message;
		alert("转发出错, 错误信息：" + msg);
	};

	Model.prototype.backBtn = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.showProcessSource = function(event){
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/process/demo/process.w&xid=demoProcess"
		});
	};

	Model.prototype.showJsSource = function(event){
		this.comp("windowDialog").open({
			data : "system/components/justep/process/demo/process.js"
		});
	};

	return Model;
});
