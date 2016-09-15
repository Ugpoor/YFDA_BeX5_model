define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.button1Click = function(event){
		
		window.location.reload();
	};

	Model.prototype.button2Click = function(event){
		window.close();
	};

	return Model;
});