define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};
	//js代码
	Model.prototype.jsBtnClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/cross_navigation_flow.js"
		},true);

	};
	//导航栏1源码
	Model.prototype.sourceClickOne = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/cross_navigation_flow.w&xid=pageOne"
		},true);
	};
	//导航栏2源码
	Model.prototype.sourceClickTwo = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/cross_navigation_flow.w&xid=pageTwo"
		},true);
	};
	//导航栏3源码
	Model.prototype.sourceClickThree = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/cross_navigation_flow.w&xid=pageThree"
		},true);
	};
	
	//导航栏4源码
	Model.prototype.sourceClickFour = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/cross_navigation_flow.w&xid=pageFour"
		},true);
	};
	return Model;
});
