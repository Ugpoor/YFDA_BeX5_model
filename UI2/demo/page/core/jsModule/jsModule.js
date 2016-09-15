define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.button2Click = function(event){
		this.showMessage();
	};
	
	Model.prototype.showMessage = function(){
		alert("this is page");
	};
	

	return Model;
});