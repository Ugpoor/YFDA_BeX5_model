/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.callParent();
		this.isVisible = util.flag;
	};

	Model.prototype.ok = function(event) {
		var data = this.comp("data");
		this.owner.send(data.getCurrentRow());
		this.owner.close();
	};

	Model.prototype.cancel = function(event) {
		this.owner.close();
	};

	Model.prototype.showWindowRevSource = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "system/components/justep/windowDialog/demo/dialog.w&xid=windowReceiver"
		});
	};

	Model.prototype.jsSource = function(event) {
		util.showSource({
			self : this,
			data : "system/components/justep/windowDialog/demo/dialog.js"
		});
	};

	Model.prototype.alertDlg = function() {
		justep.Util.hint("弹出框事件");
	}

	Model.prototype.modelParamsReceive = function(event){
		// 获取windowDialogde src属性上url的参数值
		var urlData = this.getContext().getRequestParameter("data");
		if (urlData)
			this.comp('urlData').set({
				value : '获取windowDialog的src上url的值:' + urlData
			});
		// 获取通过windowDialog的open(data)方法取值
		var openData = event.params.data;
		this.comp('openData').set({
			value : '获取windowDialog的open方法的值:' + openData
		});
		this.owner.getModel().alertMain();
	};

	return Model;
});