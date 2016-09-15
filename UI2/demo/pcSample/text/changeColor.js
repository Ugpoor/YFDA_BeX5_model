define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var b;
	var c;

	var Model = function() {
		this.callParent();
	};
	
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/text/changeColor.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/text/changeColor.w&xid=window"
		},true);
	};
	
	// 开始变色
	Model.prototype.begin = function() {
		var me = this;
		var a = 0;
		// 调用setInterval()循环方法取不同的值绑定不同的css
		b = window.setInterval(function() {// 定义一个全局变量来接收setInterval()返回值，以便来停止循环
			a++;
			if (a > 6) {
				a = 1;
			}
			me.comp('colorData').setValue("colorID", a);
		}, 300);
	};
	// 停止变色
	Model.prototype.end = function() {
		this.comp('colorData').setValue("colorID", 0);
		window.clearInterval(b);// 方法取消由 setInterval() 设置的 timeout，停止循环
	};
	Model.prototype.startBtnClick = function(event) {
		this.begin();
	};
	Model.prototype.endBtnClick = function(event) {
		this.end();
	};
	
	Model.prototype.multiLineStartBtnClick = function(event){
     		var me = this;
		var a = 0;
		// 调用setInterval()循环方法取不同的值绑定不同的css
		c = window.setInterval(function() {// 定义一个全局变量来接收setInterval()返回值，以便来停止循环
			a++;
			if (a > 6) {
				a = 1;
			}
			me.comp('multiLineData').setValue("colorID", a);
		}, 300);
	};
	Model.prototype.multLineEndBtnClick = function(event){
		this.comp('multiLineData').setValue("colorID",0);
		window.clearInterval(c);// 方法取消由 setInterval() 设置的 timeout，停止循环
	};
	return Model;
});