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

	Model.prototype.addBtnClick = function(){
		var data = this.comp("taskData");
		data.newData();
		var contents = this.comp('contents');
		contents.to('detail');
	};

	Model.prototype.editBtnClick = function(){
		if (this.isEditable()){
			this.resetData();
		}
		this.updateEditStatus();
	};
	
	Model.prototype.isEditable = function(){
		return this.comp("controlData").getValue("edit") == 1;
	};
	
	Model.prototype.updateEditStatus = function(){
		var data = this.comp("controlData");
		var oldValue = data.getValue("edit");
		var newValue = (oldValue==0) ? 1 : 0;
		data.setValue("edit", newValue);
		if (newValue){
			this.comp("listPanel").showBottom();
		}else{
			this.comp("listPanel").hideBottom();
		}
	};
	
	Model.prototype.cancelEditClick = function(){
		this.resetData();
		this.updateEditStatus();
	};
	
	Model.prototype.resetData = function(){
		var data = this.comp("taskData");
		data.each(function(options){
			data.setValue("calcCheckBox", 0, options.row);
		});
	};
	
	Model.prototype.okEditClick = function(){
		var data = this.comp("taskData");
		var rows = [];
		data.each(function(options){
			if (data.getValue("calcCheckBox", options.row)){
				rows.push(options.row);
			}
		});
		if (rows.length > 0){
			var model = this;
			data.deleteData(rows,{async:true,onSuccess:function(){
				model.updateEditStatus();
			}});
		}
	};
	
	Model.prototype.modelLoad = function(){
		this.comp("listPanel").hideBottom();
	};
	
	
	Model.prototype.listBtnClick = function(){
		var contents = this.comp('contents');
		contents.to('list');
	};
	
	
	Model.prototype.showDetailClick = function(event){
		var data = this.comp("taskData");
		var id = data.getRowID(event.bindingContext.$object);
		data.to(id);
		if (this.isEditable()){
			var oldValue = data.getValue("calcCheckBox");
			var newValue = oldValue ? 0 : 1;
			data.setValue("calcCheckBox", newValue);
		}else{
			var contents = this.comp('contents');
			contents.to('detail');
		}
	};
	
	return Model;
});
