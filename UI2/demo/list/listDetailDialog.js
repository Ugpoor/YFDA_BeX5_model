define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var MessageDialog = require("$UI/system/components/justep/messageDialog/messageDialog");		

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.editBtnClick = function(event){
		this.comp("dataDialog").open({data:this.comp("taskData").getCurrentRow()});
	};

	Model.prototype.dataDialogReceive = function(event){

	};

	Model.prototype.newData = function(event){
		var options = {action:'new'};
		this.comp("dataDialog").open({data:options})
	};

	return Model;
});
