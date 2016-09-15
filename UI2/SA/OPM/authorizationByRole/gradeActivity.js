define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.roleDataRefreshCreateParam = function(event){
		event.param.setBoolean("managed", true);
	};

	Model.prototype.authorizeDataRefreshCreateParam = function(event){
		event.param.setString("roleID", this.comp("roleData").getCurrentRowID());
		event.param.setBoolean("includeRoleChildren", this.comp("tempData").val("showInherited"));
		event.param.setBoolean("graded", true);
	};

	return Model;
});
