define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.buttonClick = function(event){
		event.source.setCSS({"background-color":"#32ABF3"});
	};

	return Model;
});