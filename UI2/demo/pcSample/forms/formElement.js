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
			data : "demo/pcSample/forms/formElement.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/formElement.w&xid=controlGroup"
		},true);
	};
	
	//提交
	Model.prototype.subBtnClick = function(event){
		justep.Util.hint("提交成功");
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

	return Model;
});