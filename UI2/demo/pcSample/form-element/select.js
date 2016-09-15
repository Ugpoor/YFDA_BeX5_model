define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Select=require("$UI/system/components/justep/select/select");
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};
	Model.prototype.valueBtnClick = function(event){
		justep.Util.hint(this.comp("valueData").val("optionsValue"));

	};
	//禁用 可用
	Model.prototype.enableBtnClick = function(event){
		this.comp("select").set({
		"disabled":false
		})
	};
	//动态选中
	Model.prototype.disabledBtnClick = function(event){
		this.comp("select").set({
		"disabled":true
		})
	};
	Model.prototype.changeSelectChange = function(event){
	
		justep.Util.hint(this.comp("valueData").val("changeValue"));
	};
	Model.prototype.checkedClick = function(event){
	
		this.comp("valueData").newData({
					
						defaultValues : [ {
							"dynamic" : "北京"
						} ]
					});
	};
	Model.prototype.addbtnClick = function(event){
		this.comp("valueData").newData({
					
						defaultValues : [ {
							"dynamic" : "新增一项"
						} ]
					});
	};
	//js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/select.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/select.w&xid=contents"
		}, true);
	};

	Model.prototype.loginBtnClick = function(event){
		justep.Util.hint("登录中");
	};

	Model.prototype.resetBtnClick = function(event){
	
		this.comp("selectData").refreshData();
		this.comp("valueData").refreshData();
	};

	Model.prototype.submitBtnClick = function(event){
		justep.Util.hint("正在提交");
	};

	return Model;
});