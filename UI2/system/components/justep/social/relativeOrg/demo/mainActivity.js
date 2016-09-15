/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(){
		justep.Shell.closePage();
	};
	
	
	Model.prototype.clearMessageNumber = function(event){
		debugger;
		var options = {};
		options.context = this.getContext();
		options.action = "testAction";
		biz.Request.sendBizRequest(options);
		
		return;
		var id = this.comp("taskData").val("SA_Task");
		var options = {};
		options.context = this.getContext();
		options.action = "clearMessageNumberAction";
		options.parameters = new biz.Request.ActionParam();
		options.parameters.setString("data", id);
		biz.Request.sendBizRequest(options);
	};

	Model.prototype.updateMessageNumber = function(event){
		var id = this.comp("taskData").val("SA_Task");
		var options = {};
		options.context = this.getContext();
		options.action = "updateMessageNumberAction";
		options.parameters = new biz.Request.ActionParam();
		options.parameters.setString("data", id);
		biz.Request.sendBizRequest(options);
	};
	
	
	Model.prototype.saveClick = function(event){
		this.comp("taskData").saveData();
	};

	return Model;
});
