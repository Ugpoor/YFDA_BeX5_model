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

	
	Model.prototype.backBtnClick = function(){
		justep.Shell.closePage();
	};

	Model.prototype.addBtnClick = function(){
		var data = this.comp("taskData");
		data.newData();
		var tabs = this.comp('tabs');
		tabs.setActiveTab('nav-detail');
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

	};
	
	Model.prototype.grid3RowClick = function(event){
		var data = this.comp("taskData");
		var id = event.row.getID();
		data.to(id);
		var tabs = this.comp('tabs');
		tabs.setActiveTab('nav-detail');
	};
	
	Model.prototype.searchBtnClick = function(event){
		$(this.getElementByXid("searchArea")).toggle();
	};
	
	Model.prototype.checkbox2Change = function(event){
		if(event.checked)
			$(this.getElementByXid("searchArea")).slideDown(300);
		else
			$(this.getElementByXid("searchArea")).slideUp(300);
	};
	
	Model.prototype.button2Click = function(event){
		var data = this.comp("taskData");
		var tabs = this.comp('tabs');
		data.deleteData(null,{async:true,onSuccess:function(){
			tabs.setActiveTab('nav-list');
		}});
	};
	
	Model.prototype.button1Click = function(event){
		var likeValue = this.comp("likeInput").get("value");
		var data = this.comp("taskData");
		var filterName = '_like_filter_';
		if(likeValue){
			var concept = "SA_WorkTask"; 
			var filterText = "(" + concept + ".sName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sImportanceName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sTypeName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sStatusName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sCreatorFName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sExecutorFName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sProjectName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sCustomerName LIKE '" + likeValue + "') OR"
				+ "(" + concept + ".sPlanName LIKE '" + likeValue + "')";
		
			data.filters.setFilter(filterName, filterText);
			data.refreshData();
		}else{
			data.filters.deleteFilter(filterName);
			data.refreshData();
		}
	};
	
	return Model;
});
