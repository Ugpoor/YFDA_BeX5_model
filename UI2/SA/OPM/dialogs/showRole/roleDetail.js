define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	var Data = require("$UI/system/components/justep/data/data");
	
	var Model = function(){
		this.callParent();
		this.OpmUtils = OpmUtils;
		
		this.openMode = justep.Bind.observable("view");
	};

/*
	event.data = {
		openMode : new | edit | view
		roleID : 
		roleKind :  
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		var roleData = this.comp("roleData");
		var roleParentsData = this.comp("roleParentsData");
		
		this._params = event.data;
		this.openMode.set(this._params.openMode || "view");
		
		if (this._params.openMode == "new") {
			roleData.clear();
			roleData.newData();
			roleData.setValue("sRoleKind", this._params.roleKind);
		} else {
			roleData.setFilter("idFilter", "SA_OPRole = '" + this._params.roleID + "'");
			roleData.refreshData();
		}
		roleParentsData.setFilter("idFilter", "SA_OPParentRole.sRoleID = '" + roleData.getRowID() + "'");
		roleParentsData.refreshData();
	};

	Model.prototype.okBtnClick = function(event){
		var roleData = this.comp("roleData");
		var row = roleData.getCurrentRow();
		if (roleData.getRowState(row) == Data.STATE.NONE) {
			roleData.setRowState(row, Data.STATE.EDIT);
		}
		if (roleData.saveData()) {
			this._params.roleID = roleData.getRowID();
			this.comp("windowReceiver").windowEnsure(this._params);
		}
	};

	Model.prototype.roleDataSaveCreateParam = function(event) {
		var parentIDs = new biz.Request.ListParam();
		var roleParentsData = this.comp("roleParentsData");
		roleParentsData.each(function(data){
			parentIDs.add(data.row.val("sParentRoleID"));
		});
		event.param.setList("parentIDs", parentIDs);
	};

	Model.prototype.addParentsBtnClick = function(event){
		var row = this.comp("roleData").getCurrentRow();
		var filter = "(SA_OPRole <> '" + row.getID() + "')";
		if (row.val("sRoleKind") == "data") {
			filter = filter + " and (SA_OPRole.sRoleKind <> 'fun')";
		} 
		this.comp("selectRolesDialog").open({
			"data" : {
				"filter" : filter
			}
		});
	};

	Model.prototype.selectRolesDialogReceive = function(event){
		var roleParentsData = this.comp("roleParentsData");
		var self = this;
		$.each(event.data, function(i, row) {
			if (roleParentsData.find(["sParentRoleID"], [row.getID()]).length == 0) {
				roleParentsData.newData();
				roleParentsData.setValue("sRoleID", self.comp("roleData").getCurrentRowID());
				roleParentsData.setValue("sParentRoleID", row.getID());
				roleParentsData.setValue("parentName", row.val("sName"));
			}
		});
	};

	Model.prototype.deleteParentBtnClick = function(event){
		this.comp("roleParentsData").deleteData(this.comp("roleParentsDataTables").getCheckeds());
	};

	return Model;
});