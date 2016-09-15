define(function(require){
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(){
		justep.Shell.closePage();
	};
	
	Model.prototype.test = function(){
		var process = this.comp("process");
		process.withdrawTaskExt("1");
	};

	
	Model.prototype.processBeforeStart = function(event){
		alert("before start");
	};

	
	Model.prototype.processAfterStart = function(event){
		alert("after start");
	};

	
	Model.prototype.processStartCommit = function(event){
		alert("start commit");
	};

	
	Model.prototype.processStartError = function(event){
		alert("start error");
	};

	
	Model.prototype.processBeforeAdvance = function(event){
		alert("before advance");
	};

	
	Model.prototype.processAfterAdvance = function(event){
		alert("after advance");
	};

	
	Model.prototype.processAdvanceCommit = function(event){
		alert("advance commit");
	};

	
	Model.prototype.processAdvanceError = function(event){
		alert("advance error");
	};

	
	Model.prototype.processBeforeAdvanceQuery = function(event){
		alert("before advance query");
	};

	
	Model.prototype.processAfterAdvanceQuery = function(event){
		alert("after advance query");
	};

	
	Model.prototype.processAdvanceQueryError = function(event){
		alert("advance query error");
	};

	Model.prototype.actionDialogBackBtnClick = function(event){
		this.comp("actionDialog").close();
	};
	
	Model.prototype.moreBtnClick = function(event){
		this.comp("actionDialog").open();
	};
	Model.prototype.processBeforeBack = function(event){
		alert("before back");
	};
	Model.prototype.processAfterBack = function(event){
		alert("after back");
	};
	Model.prototype.processBackCommit = function(event){
		alert("back commit");
	};
	Model.prototype.processBackError = function(event){
		alert("back error");
	};
	Model.prototype.processBeforeBackQuery = function(event){
		alert("before back query");
	};
	Model.prototype.processAfterBackQuery = function(event){
		alert("after back query");
	};
	Model.prototype.processBackQueryError = function(event){
		alert("back query error");
	};
	Model.prototype.processBeforeAbort = function(event){
		alert("before abort");
	};
	Model.prototype.processAfterAbort = function(event){
		alert("after abort");
	};
	Model.prototype.processAbortCommit = function(event){
		alert("abort commit");
	};
	Model.prototype.processAbortError = function(event){
		alert("abort error");
	};
	Model.prototype.processBeforeAbortQuery = function(event){
		alert("before abort query");
	};
	Model.prototype.processAfterAbortQuery = function(event){
		alert("after abort query");
	};
	Model.prototype.processAbortQueryError = function(event){
		alert("abort query error");

	};
	Model.prototype.processBeforeSuspend = function(event){
		alert("before suspend");
	};
	Model.prototype.processAfterSuspend = function(event){
		alert("after suspend");
	};
	Model.prototype.processSuspendCommit = function(event){
		alert("suspend commit");
	};
	Model.prototype.processSuspendError = function(event){
		alert("suspend error");
	};
	Model.prototype.processBeforeSuspendQuery = function(event){
		alert("before suspend query");
	};
	Model.prototype.processAfterSuspendQuery = function(event){
		alert("after suspend query");
	};
	Model.prototype.processSuspendQueryError = function(event){
		alert("suspend query error");
	};
	Model.prototype.processBeforeOpenDialog = function(event){
		alert("before open dialog");
	};
	Model.prototype.processBeforeTransfer = function(event){
		alert("before transfer");
	};
	Model.prototype.processAfterTransfer = function(event){
		alert("after transfer");
	};
	Model.prototype.processTransferCommit = function(event){
		alert("transfer commit");
	};
	Model.prototype.processTransferError = function(event){
		alert("transfer error");
	};
	Model.prototype.processBeforeTransferQuery = function(event){
		alert("before transfer query");
	};
	Model.prototype.processAfterTransferQuery = function(event){
		alert("after transfer query");
	};
	Model.prototype.processTransferQueryError = function(event){
		alert("transfer query error");

	};
	Model.prototype.processBeforeSpecial = function(event){
		alert("before special");
	};
	Model.prototype.processAfterSpecial = function(event){
		alert("after special");
	};
	Model.prototype.processSpecialCommit = function(event){
		alert("special commit");
	};
	Model.prototype.processSpecialError = function(event){
		alert("special error");
	};
	Model.prototype.processBeforeSpecialQuery = function(event){
		alert("before special query");
	};
	Model.prototype.processAfterSpecialQuery = function(event){
		alert("after special query");
	};	
	Model.prototype.processSpecialQueryError = function(event){
		alert("special query error");
	};	
	return Model;
});
