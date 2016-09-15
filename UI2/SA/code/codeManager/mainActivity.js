define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.getCurrentType = function() {
		var type = this.comp("tempData").getValue("type");
		type = type ? type : "";
		type.replace(/'/g, "''");
		return type;
	}

	Model.prototype.codeDataNewCreateParam = function(event){
		var type = this.getCurrentType();
		event.defaultValues["sType"] = "'" + type + "'";
	};

	Model.prototype.tempDataValueChange = function(event){
		var codeData = this.comp("codeData");
		if (event.col == "type") {
			if (codeData.isChanged()) {
				event.newValue = event.oldValue;
				justep.Util.hint("请先保存当前数据！", {"type" : "info"});
			} else {
				this.refreshCodeDataByType(event.newValue);
			}
		}
	};
	
	Model.prototype.refreshCodeDataByType = function(type) {
		var codeData = this.comp("codeData");
		if (type) {
			codeData.setFilter("typeFilter", "SA_Code.sType = :type");
			codeData.filters.setStringVar("type", type);
		} else {
			codeData.setFilter("typeFilter", "");
		}
		codeData.refreshData();
	};	

	Model.prototype.gridSelect1ShowOption = function(event){
		this.comp("typeData").refreshData();
	};	

	return Model;
});