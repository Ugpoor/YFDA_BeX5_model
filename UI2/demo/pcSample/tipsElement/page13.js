define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.button1Click = function(event){
		alert('这是窗口页面中的方法');
	};
	
	Model.prototype.button2Click = function(event){
		this.comp("windowReceiver1").windowCancel();
	};
	
	return Model;
});