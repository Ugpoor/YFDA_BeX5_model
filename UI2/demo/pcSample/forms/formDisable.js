define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	//显示js
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
		this.flag=true;
	};

	//清空数据
	Model.prototype.clearBtnClick = function(event){
		var data = this.comp("userData");
		data.clear();
		var row = data.getCurrentRow();
		if(!row){
			data.newData();
		}
	};
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/formDisable.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/formDisable.w&xid=controlGroup"
		},true);
	};
	//提交
	Model.prototype.subBtnClick = function(event){
		justep.Util.hint("提交成功");
	};
	//表单禁用
	Model.prototype.showBtnClick = function(event){
		var data = event.source;
		if(this.flag){
			this.comp("popOver").show();
			data.set("label","启用表单");
			this.flag=false;
		}else{
			this.comp("popOver").hide();
			data.set("label","禁用表单");
			this.flag=true;
		}
	};


	return Model;
});