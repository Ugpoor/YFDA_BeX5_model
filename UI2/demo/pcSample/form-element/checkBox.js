define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var CheckBoxGroup=require("$UI/system/components/justep/select/checkboxGroup");
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};
	//可用
	Model.prototype.enableBtnClick = function(event){
	this.comp("defaultData").setValue("enable",false);
		this.comp("basicData").refreshData();
	};
	//禁用
	Model.prototype.disabledBtnClick = function(event){
		this.comp("defaultData").setValue("enable",true);
		this.comp("basicData").refreshData();
	};
	//获取选中值	
	Model.prototype.getValueBtnClick = function(event){
		var data =this.comp("defaultData").val("value");
		justep.Util.hint(data);
	};
	//动态选中
	Model.prototype.likeBallBtnClick = function(event){
			this.comp("defaultData").setValue("dynamic", "足球 篮球 排球");
	};

	Model.prototype.likeBasketballBtnClick = function(event){
		this.comp("defaultData").setValue("dynamic", "篮球");

	};

	Model.prototype.dislikeClick = function(event){
		this.comp("defaultData").setValue("dynamic", "");
		
	};
	// js代码
	Model.prototype.jdBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/checkBox.js"
		},true);
	};
	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/checkBox.w&xid=contents"
		}, true);
	};

	return Model;
});