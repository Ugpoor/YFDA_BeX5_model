define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var MessageDialog = require("$UI/system/components/justep/messageDialog/messageDialog");		

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		if(!this.msgDialog) 
			this.msgDialog = new MessageDialog({parentNode: this.getElementByXid("window")});
		this.msgDialog.show({type:"OK", title: "提示", message: "保存成功！"});
	};

	
	Model.prototype.backBtnClick = function(){
		justep.Shell.closePage();
	};

	Model.prototype.modelLoad = function(){
		var taskData = this.comp("taskData");
		taskData.setFilter("taskFilter", "SA_WorkTask='" + this.getContext().getTask() + "'");
		taskData.refreshData();
	};
	
	
	return Model;
});
