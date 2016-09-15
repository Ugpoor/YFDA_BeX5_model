define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};
	// js代码
	Model.prototype.showjsSource = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/local_rolling.js"
		},true);
	};
	// 源码
	Model.prototype.showPageSource = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/local_rolling.w&xid=window"
		},true);
	};

	return Model;
});