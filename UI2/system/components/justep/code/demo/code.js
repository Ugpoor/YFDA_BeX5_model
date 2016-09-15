define(function(require){
	//var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	/*
	 */
	Model.prototype.test = function(a, b){
	  alert('a+12='+(a+12)+',b='+b);
	};
	
	return Model;
});