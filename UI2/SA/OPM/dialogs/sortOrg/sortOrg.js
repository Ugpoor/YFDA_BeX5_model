define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		var orgData = this.comp("orgData");
		orgData.setFilter("parentFilter", event.data.parentID ? "SA_OPOrg.sParent = '" + event.data.parentID + "'" : "SA_OPOrg.sParent is null");
		orgData.refreshData();
	};

	Model.prototype.okBtnClick = function(event){
		this.comp("windowReceiver").windowEnsure(this.comp("orgData").datas.get());
	};

	Model.prototype.moveRow = function(row, index) {
		if (!row) {
			return;
		}
		var orgData = this.comp("orgData");
		var newRow = orgData.loadData({
			"@type" : "table",
			"rows" : [{
				"SA_OPOrg" : row.val("SA_OPOrg"),
				"sName" : row.val("sName"),
				"sCode" : row.val("sCode"),
				"sOrgKindID" : row.val("sOrgKindID"),
				"version" : row.val("version")
			}],
			"userdata" : row.data.userdata
		}, true, null, index)[0];
		orgData.deleteData([row]);
		orgData.to(newRow);
		this.comp("orgGrid").refresh();
	};
	
	Model.prototype.moveTopBtnClick = function(event){
		this.moveRow(this.comp("orgData").getCurrentRow(), 0);
	};

	Model.prototype.moveUpBtnClick = function(event){
		var orgData = this.comp("orgData");
		var row = orgData.getCurrentRow();
		this.moveRow(row, orgData.datas.indexOf(row) - 1);
	};

	Model.prototype.moveDownBtnClick = function(event){
		var orgData = this.comp("orgData");
		var row = orgData.getCurrentRow();
		this.moveRow(row, orgData.datas.indexOf(row) + 2);
	};

	Model.prototype.moveBottomBtnClick = function(event){
		this.moveRow(this.comp("orgData").getCurrentRow(), -1);
	};

	Model.prototype.orgGridCellRender = function(event){
		if (event.colName == "sOrgKindID") {
			var row = this.comp("orgData").getRowByID(event.rowID);
			event.html = "<img height='16' width='16' src='" + 
				OpmUtils.getOrgImgURL(row.val("sOrgKindID")) + 
				"'/>"
		}
	};

	return Model;
});