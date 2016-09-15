define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var docPath = null;
	var Model = function(){
		this.callParent();
	};

	Model.prototype.btn_per_new_depClick = function(event){
		this.comp("perDialogForDep").open();
	};

	Model.prototype.perDialogForDepReceive = function(event){
		var docAuthList = this.comp("docAuthList");
		var rows = event.data;
		var arrayData = [];
		for(var i in rows){
			arrayData[i]={
				"sAuthorizeeDeptName" : rows[i].val('sName'),
				"sAuthorizeeFID" :  rows[i].val('sFID'),
				"sDocPath" : docPath,
				"sAuthorizerFID" : this.getContext().getCurrentPersonMemberFID(),
				"sAuthorizerName" : this.getContext().getCurrentPersonMemberName(),
				"sAuthorizerDeptName" : this.getContext().getCurrentDeptName() ? this.getContext().getCurrentDeptName() : "",
				"sGrantTime" : new Date()
			};
		}
		
		docAuthList.newData({"defaultValues" : arrayData});
	};

	Model.prototype.btn_per_new_personClick = function(event){
		this.comp("perDialogForPerson").open();
	};

	Model.prototype.perDialogForPersonReceive = function(event){
		var docAuthList = this.comp("docAuthList");
		var rows = event.data;
		var arrayData = [];
		for(var i in rows){
			arrayData[i]={
				"sAuthorizeeName" : rows[i].val('sName'),
				"sAuthorizeeFID" :  rows[i].val('sFID'),
				"sDocPath" : docPath,
				"sAuthorizerFID" : this.getContext().getCurrentPersonMemberFID(),
				"sAuthorizerName" : this.getContext().getCurrentPersonMemberName(),
				"sAuthorizerDeptName" : this.getContext().getCurrentDeptName() ? this.getContext().getCurrentDeptName() : "",
				"sGrantTime" : new Date()
			};
		}
		docAuthList.newData({"defaultValues" : arrayData});
	};

	Model.prototype.windowReceiver1Receive = function(event){
		docPath =event.data;
		var docAuthList = this.comp("docAuthList");
		docAuthList.setFilter('docPathFilter', "sDocPath = '"+docPath+"'");
		docAuthList.refreshData();
	};

	Model.prototype.btn_per_closeClick = function(event){
		this.comp("windowReceiver1").windowCancel();
	};

	return Model;
});