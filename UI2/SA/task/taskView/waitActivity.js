define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.modelActive = function(event){
		var data = this.comp("taskData");
		if (data){
			data.refreshData();
		}
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
		url = this.addTaskData(url, row);
		
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

	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};
	
	Model.prototype.addTaskData = function(url, row){
		var data1 = row.val("sData1") || "";
		var data2 = row.val("sData2") || "";
		var data3 = row.val("sData3") || "";
		var data4 = row.val("sData4") || "";
		if (data1){
			url += "&sData1=" + data1;
		}
		if (data2){
			url += "&sData2=" + data2;
		}
		if (data3){
			url += "&sData3=" + data3;
		}
		if (data4){
			url += "&sData4=" + data4;
		}
		return url;
	}

	Model.prototype.modelLoad = function(event){
		if(window.__justep.__portalContext && window.__justep.__portalContext.data.waitTasks){
			this.comp("taskData").loadData(window.__justep.__portalContext.data.waitTasks.data.value);
			this.comp("taskData").autoLoad = true;
			this.comp("list").refresh();
			delete window.__justep.__portalContext.data.waitTasks;
		}else{
			this.comp("list").refresh();
		}
	};

	return Model;
});
