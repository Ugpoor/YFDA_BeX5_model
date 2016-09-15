define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.li2Click = function(event) {
		var row = event.bindingContext.$object;
		var task = row.val("SA_Task");
		var process = row.val("sProcess");
		var activity = row.val("sActivity");
		
		var pattern = ((row.val("sKindID") == "tkNotice") ? "readonly" : "write");
		var url = row.val("sEURL");
		if (url.charAt(0) === "/"){
			if (url.indexOf(".a") !== -1){
				url = "$UI" + url;
			}else{
				url = "$model/UI" + url;
			}
		}
		url += ((url.indexOf("?") == -1) ? "?" : "&");
		url += "_pagePattern=" + pattern + "&process=" + process
				+ "&activity=" + activity + "&task=" + task;
		//url = this.addTaskData(url, row);
		
		var status = row.val("sStatusID");
		if (status === "tesReady"){
			var params = new biz.Request.ActionParam();
			params.setString("task", task);
			params.setString("executor", row.val("sExecutorFID"));
			var options = {};
			options.context = this.getContext();
			options.action = "executeTaskAction";
			options.parameters = params;
			options.directExecute = true;
			options.contentType = biz.Request.JSON_TYPE;
			options.dataType = biz.Request.JSON_TYPE;
			options.process = process;
			options.activity = activity;
			var self = this;
			options.callback = function(options) {
				if (options.state) {
					justep.Shell.showPage({url:url, title: row.val("sName"), executor: options.response || ""});						
				}else{
					options.ignoreError = false;
				}
			};
			biz.Request.sendBizRequest(options);
		}else{
			justep.Shell.showPage({url:url, title: row.val("sName"), executor: row.val("sExecutorFID") || ""});
		}		
	};

	Model.prototype.modelActive = function(event){
		var data = this.comp("taskData");
		if (data){
			data.refreshData();
		}
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};	

	return Model;
});
