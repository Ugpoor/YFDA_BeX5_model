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
			data : "demo/pcSample/forms/dynamicForm.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/dynamicForm.w&xid=controlGroup"
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
	
	Model.prototype.submitBtnClick = function(event){
		justep.Util.hint("提交成功");
	};
	//限制用户名的输入
	Model.prototype.nameBlur = function(event){
		var data = this.comp("userData");
		var name = this.comp("name").val();
		var jso = "admin";
		var js = "tom";
		if(jso==name|name==js){
			data.refreshData();
		}else{
			justep.Util.hint("输入不正确");
		}
	};
	
	return Model;
});