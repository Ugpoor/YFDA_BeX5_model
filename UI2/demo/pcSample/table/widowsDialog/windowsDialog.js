define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;
	};

	//打开空白弹窗
	Model.prototype.dialogButtonClick = function(event){
		this.comp("wdEmpty").open();
		
	};
	//打开普通弹窗
	Model.prototype.wdTableButtonClick = function(event){
		this.comp("wdTable").open();
	};
	//打开弹窗Plus
	Model.prototype.wdTableButtonPlusClick = function(event){
		this.comp('wdTablePlus').open();
	};
	//显示JS
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			data: 'demo/pcSample/table/widowsDialog/windowsDialog.js',
			self: this
		},true);
	};
	//显示源码
	Model.prototype.showSourceBtnClick = function(event){
		util.showSource({
			data: "demo/pcSample/table/widowsDialog/windowsDialog.w&xid=window",
			self: this,
			type: true
		},true);
	};

	return Model;
});