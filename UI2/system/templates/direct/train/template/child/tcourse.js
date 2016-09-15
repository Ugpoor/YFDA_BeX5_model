define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.toBtnClick = function(event){
		justep.Shell.showPage("submit");
	};
	return Model;
});