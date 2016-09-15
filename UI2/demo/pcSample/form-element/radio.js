define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var RadioGroup=require("$UI/system/components/justep/select/radioGroup");
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};
	//设置默认选中
	Model.prototype.radioBtnClick = function(event){
		this.comp("defaultData").setValue("checked", "女");
	};
	//禁用，可用
	Model.prototype.enableBtnClick = function(event){
		this.comp("defaultData").setValue("num", false);
		this.comp("sexData").refreshData();
	};

	Model.prototype.disabledBtnClick = function(event){
			this.comp("defaultData").setValue("num",true);
			this.comp("sexData").refreshData();
	};
	//获取选中值
	Model.prototype.valueBtnClick = function(event){
		var data =this.comp("defaultData").val("value");
		justep.Util.hint(data);
	};
	// js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/radio.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/radio.w&xid=contents"
		}, true);
	};


	return Model;
});