/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	//只有打开这个功能后, 这个alert才会生效
	biz.Push.on(biz.Push.MESSAGE_EVENT, function(event){
		var title = event.message.title || event.message.aps.alert || "";
		alert("接收到新消息：" + title);
	});
	

	var Model = function(){
		this.callParent();
	};


	Model.prototype.sendClick = function(event){
		var sendData = this.comp("sendData");
		if (sendData.isValid()){
			var params = new biz.Request.ActionParam();
			params.setString("targets", sendData.getValue("targets") || "");
			params.setString("title", sendData.getValue("title") || "");
			params.setString("type", sendData.getValue("type") || "");
			params.setString("url", sendData.getValue("url") || "");
			var options = {};
			options.context = this.getContext();
			options.action = "sendMessageAction";
			options.parameters = params;
			options.directExecute = true;
			options.contentType = biz.Request.JSON_TYPE;
			options.dataType = biz.Request.JSON_TYPE;
			options.process = this.getContext().getCurrentProcess();
			options.activity = this.getContext().getCurrentActivity();
			var self = this;
			biz.Request.sendBizRequest(options);
		}else{
			justep.Util.hint(sendData.getInvalidInfo());
		}
		
	};


	Model.prototype.modelModelConstructDone = function(event){
		var sendData = this.comp("sendData");
		var fid = this.getContext().getCurrentPersonMemberFID();
		var name = this.getContext().getCurrentPersonName();
		sendData.setValue("targets", fid);
		sendData.setValue("targetNames", name);
	};


	return Model;
});