/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	//var $ = require("jquery");
	var WindowDialog = require("../windowDialog");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};

	Model.prototype.closeWin = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.openDialog = function(event){
		var url = require.toUrl("./dialog.w?data='url方式传递数据'");
		var status = justep.Browser.isPC ? "normal" : "maximize";//如果是移动端运行，全屏显示
		if (!this.dialog){
			this.dialog = new WindowDialog({
					title : '这是一个功能',
					showTitle : false,
					status: status,
					src : url,
					parentNode : this.getElementByXid("dialog")
			});
			this.dialog.on('onReceive', function(evt) {
				evt.source.getInnerModel().alertDlg();
				this.comp('output').set({value : ("name : "+ evt.data.val("name") + " age: " +evt.data.val("age"))});
			}, this);
			
		}
		this.dialog.open({data : "this is a test message"});
	};

	Model.prototype.mappingDailog = function(event){
		this.comp("windowDialog").open({data:"open(data)方法传递数据"});
	};

	Model.prototype.showWindowDialogSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "system/components/justep/windowDialog/demo/demo.w&xid=windowDialog"
		});
	};

	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "system/components/justep/windowDialog/demo/demo.js"
		});
	};
	
	Model.prototype.windowDialogReceive = function(event){
		event.source.getInnerModel().alertDlg();
	};
	
	Model.prototype.alertMain = function(){
		justep.Util.hint("调用主页面事件");
	};
	
	Model.prototype.showWdlgState = function() {
		var isPC =  justep.Browser.isPC;
		if (!isPC) {
			this.comp("windowDialog").set({"status":"maximize"});
		}
	}
	
	Model.prototype.modelLoad = function(event){
		this.showWdlgState();
	};
	
	return Model;
});
