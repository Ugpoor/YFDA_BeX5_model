define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.button2Click = function(event){
		alert('点击了取消');
		window.close();
	};
	
	Model.prototype.button3Click = function(event){
		alert('点击了确定');
		window.close();
	};

	return Model;
});