define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
		var pi = this.getContext().getRequestParameter("pi")
		this.comp("processChart1").loadByPI(pi);
	};

	return Model;
});