define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};
	// js代码
	Model.prototype.jsBtnClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/homepage_Information_tab2.js"
		}, true);
	};
	// 数据统计源码
	Model.prototype.sourceBtnOne = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab2.w&xid=controlGroupOne"
		}, true);
	};
	// 打开menu1
	Model.prototype.showPopMenuOne = function(event) {
		this.comp("popMenu1").show();

	};
	// 打开menu2
	Model.prototype.showPopMenuTwo = function(event) {
		this.comp("popMenu2").show();
	};
	// 最新消息源码
	Model.prototype.button3 = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab2.w&xid=controlGroupTwo"
		}, true);
	};
	// 打开menu3
	Model.prototype.moreThreeClick = function(event) {
		this.comp("popMenu3").show();
	};
	// 代办事项源码
	Model.prototype.sourceBtnThree = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab2.w&xid=controlGroupThree"
		}, true);
	};
	// 打开menu4
	Model.prototype.moreFourClick = function(event) {
		this.comp("popMenu4").show();
	};
	// 常用工具源码
	Model.prototype.sourceFour = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab2.w&xid=controlGroupFour"
		}, true);
	};
	// 打开menu5
	Model.prototype.moreFiveClick = function(event) {
		this.comp("popMenu5").show();
	};
	// 信息统计源码
	Model.prototype.sourceFive = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/homepage_Information_tab2.w&xid=controlGroupFive"
		}, true);
	};

	return Model;
});