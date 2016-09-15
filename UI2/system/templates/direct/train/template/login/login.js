define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.login = function(event){
		justep.Shell.showPage("reg");
	};
	
	Model.prototype.first = function(event){
		justep.Shell.showPage("main");
	};
	
	return Model;
});
