define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.orgDataRefreshCreateParam = function(event){
		event.param.setString("manageCodes", "systemManagement");
		event.param.setString("manageFilterMode", "like");
	};
	return Model;
});