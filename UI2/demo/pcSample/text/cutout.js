define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.callParent();
	};
	// 改变statuData中status的值改变绑定的css使div的宽度变大
	Model.prototype.magnifyBtnClick = function(event) {
		this.comp("statusData").setValue('status', 1);
	};
	// 改变statuData中status的值改变绑定的css使div的宽度变小
	Model.prototype.minishBtnClick = function(event) {
		this.comp("statusData").setValue('status', 0);
	};
	// 显示提示
	Model.prototype.textOutputMouseover = function(event) {
		this.comp('textPopOver').show();
	};
	// 隐藏提示
	Model.prototype.textOutputMouseleave = function(event) {
		this.comp('textPopOver').hide();
	};

	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/text/cutout.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/text/cutout.w&xid=window"
		},true);
	};

	return Model;
});