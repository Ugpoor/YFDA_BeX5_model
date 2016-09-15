define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.addManagementBtnClick = function(event){
		if (this.comp("orgTreeData").getCurrentRowID()) {
			this.comp("selectManagementDialog").open({
				"data" : {
					"managed" : true
				}
			});
		}
	};
	return Model;
});