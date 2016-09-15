/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	//var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var RichTextarea = require("../richTextarea");
	var Message = require("$UI/system/components/justep/common/common");
	
	var Model = function() {
		this.i = 0;
		this.callParent();
		this.isVisible = Message.flag;
	};

	Model.prototype.closeWin = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.showTextareaSource = function(event) {
		this.comp("windowDialog").open({
			data : "system/service/common/getWindowContent.j?window=/UI2/system/components/justep/richTextarea/demo/demo.w&xid=textareaStyle"
		});
	};

	Model.prototype.textarea1Change = function(event) {
		Message.message("aler","richTextarea中的内容发生改变");
	};

	Model.prototype.showJsSource = function(event){
		this.comp("windowDialog").open({
			data : "system/components/justep/richTextarea/demo/demo.js"
		});
	};

	Model.prototype.getTextAreaValue = function(event){
		justep.Util.hint(this.comp('textarea').val());
		//alert(this.comp('textarea').val());
	};

	Model.prototype.dynamicCreateTA = function(event){
		var parentNode = this.getElementByXid("parent");
		if (parentNode) {
			var xid = "text"+this.i++;
			var conf = {
					xid:xid,
					parentNode:parentNode,
			};
			new RichTextarea(conf);
		}
	};

	Model.prototype.modelLoad = function(event){
		var isPC = justep.Browser.isPC;
		if (!isPC) {
			this.comp("windowDialog").set({'status':'maximize'});
		}
	};

	return Model;
});