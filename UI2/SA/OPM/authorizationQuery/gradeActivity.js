define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.addRoleBtnClick = function(event){
		if (this.comp("orgTreeData").getCurrentRow()) {
			this.comp("selectRolesDialog").open({
				"data" : {
					"managed" : true
				}
			});
		}
	};
	
	Model.prototype.orgByPermissionDataRefreshCreateParam = function(event){
		var funcData = this.comp("funcTreeData");
		event.param.setString("process", funcData.getValue("process"));
		event.param.setString("activity", funcData.getValue("activity"));
		event.param.setBoolean("graded", true);
	};
	return Model;
});