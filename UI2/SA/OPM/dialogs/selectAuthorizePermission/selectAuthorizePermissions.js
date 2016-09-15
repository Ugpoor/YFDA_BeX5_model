define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
/*
	event.data = {
		"filter" :
		"orgFID" :
	}
*/
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		this._params = event.data;
		
		var permissionData = this.comp("permissionData");
		permissionData.setFilter("inputFilter", event.data && event.data.filter ? event.data.filter : "");

		var smartFilter = this.comp("smartFilter");
		if (smartFilter.searchText.get() != "") {
			smartFilter.clear();
		} else {
			permissionData.refreshData();
		}
	};

	Model.prototype.okBtnClick = function(event){
		var rows = this.comp("permissionDataTables").getCheckeds();
		this.comp("windowReceiver").windowEnsure(rows);
	};

	Model.prototype.permissionDataRefreshCreateParam = function(event){
		event.param.setString("orgFID",	this._params.orgFID);
		event.param.setBoolean("includeInherited", true);
	};

	return Model;
});