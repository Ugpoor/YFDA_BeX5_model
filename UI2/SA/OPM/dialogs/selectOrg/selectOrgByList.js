define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	
	var Model = function(){
		this.callParent();
	};

/*
	event.data = {
		"filter" :
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		var orgData = this.comp("orgData");
		orgData.setFilter("inputFilter", event.data.filter);

		var smartFilter = this.comp("smartFilter");
		if (smartFilter.searchText.get() != "") {
			smartFilter.clear();
		} else {
			orgData.refreshData();
		}
	};

	Model.prototype.okBtnClick = function(event){
		this.comp("windowReceiver").windowEnsure([this.comp("orgData").getCurrentRow()]);
	};

	Model.prototype.orgDataTablesCellRender = function(event){
		if (event.colName == "sOrgKindID") {
			event.html = "<img height='16' width='16' src='" + OpmUtils.getOrgImgURL(event.row.val("sOrgKindID"), event.row.val("sValidState") != 1, event.row.val("sParent") == event.row.val("personMainOrgID")) + "'/>"
		}
	};

	return Model;
});