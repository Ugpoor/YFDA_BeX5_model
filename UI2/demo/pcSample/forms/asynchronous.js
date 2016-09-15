define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/asynchronous.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/asynchronous.w&xid=controlGroup"
		},true);
	};

	//重置
	Model.prototype.regestBtnClick = function(event){
		var data = this.comp("userData");
		data.clear();
		var row = data.getCurrentRow();
		if(!row){
			data.newData();
		}
	};

	//提交
	Model.prototype.submitClick = function(event){
			var data = this.comp("userData");
			//获取到当前行
			var row = data.getCurrentRow();
			//刷新
			data.refreshData();
			data.add().assign(row); 
			justep.Util.hint("提交成功");
	};
	//提交时显示popOver
	Model.prototype.submitBtnClick = function(event){
		var me = this.comp("popOver");
			me.show();
			window.setTimeout(function(){
				me.hide();
			},2000);
	};
	return Model;
});