define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	
	var Model = function(){
		this.callParent();
	};

/*
	event.data = {
		"filter" :
		"managed" :
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		this.managed = event.data && event.data.managed ? event.data.managed : false;
		
		var roleData = this.comp("roleData");
		roleData.setFilter("inputFilter", event.data && event.data.filter ? event.data.filter : "");

		var smartFilter = this.comp("smartFilter");
		if (smartFilter.searchText.get() != "") {
			smartFilter.clear();
		} else {
			roleData.refreshData();
		}
	};

	Model.prototype.roleDataRefreshCreateParam = function(event){
		event.param.setBoolean("managed", this.managed);
	};

	Model.prototype.okBtnClick = function(event){
		var rows = this.comp("roleDataTables").getCheckeds();
		this.comp("windowReceiver").windowEnsure(rows);
	};

	Model.prototype.roleDataTablesCellRender = function(event){
		if (event.colName == "sRoleKind") {
			event.html = "<img height='16' width='16' src='" + OpmUtils.getRoleImgURL(event.colVal, event.row.val("sValidState") != 1) + "'/>";
		}
	};

	return Model;
});