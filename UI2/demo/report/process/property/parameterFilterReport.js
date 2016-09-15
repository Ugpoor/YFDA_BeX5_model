define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.searchData = function(event){
		var nName = this.comp("proName").val();
		var nId = this.comp("proId").val();
		var data = this.comp("f1");
		data.setStringVar("name",nName);
		data.setStringVar("id",nId)
		this.comp("grid").refresh();
	};

	return Model;
});