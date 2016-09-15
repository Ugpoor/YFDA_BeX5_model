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
	return Model;
});