define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.subdivClick = function(event){
		justep.Shell.showPage("tcourse");
	};
	return Model;
});