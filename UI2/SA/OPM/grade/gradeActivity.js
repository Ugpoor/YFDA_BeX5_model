define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.addRoleBtnClick = function(event){
		if (this.comp("orgTreeData").getCurrentRowID()) {
			this.comp("roleDialog").open({
				"data" : {
					"managed" : true
				}
			});
		}
	};

	return Model;
});