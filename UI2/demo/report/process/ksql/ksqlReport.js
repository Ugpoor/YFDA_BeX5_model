define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.searchData = function(event){
		var pName = this.comp("pName").val();
		var data = this.comp("ds1");
		data.setStringVar("p",pName);
		this.comp("report").refresh();
	};

	return Model;
});