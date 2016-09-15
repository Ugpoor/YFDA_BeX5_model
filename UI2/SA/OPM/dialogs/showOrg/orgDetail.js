define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OrgKinds = require("$UI/system/service/org/orgKinds");

	var Model = function() {
		this.callParent();
		this.orgKinds = new OrgKinds(this.getContext());

		this.openMode = justep.Bind.observable("view");
	};

/*	
	event.data = {
		openMode : new | edit | view
		orgID :
		parentID :
		orgKindID :
	}
*/
	Model.prototype.windowReceiverReceive = function(event) {
		var orgData = this.comp("orgData");
		var parentData = this.comp("parentData"); 
		
		this._params = event.data;
		this.openMode.set(this._params.openMode || "view");

		if (this._params.openMode == "new") {
			orgData.clear();
			orgData.newData();
			orgData.setValue("sParent", this._params.parentID);
			orgData.setValue("sOrgKindID", this._params.orgKindID);
			orgData.setValue("sName", "新建" + this.orgKinds.getLabel(this._params.orgKindID));
		} else {
			orgData.setFilter("idFilter", "SA_OPOrg = '" + this._params.orgID + "'");
			orgData.refreshData();
		}
		
		parentData.setFilter("idFilter", "SA_OPOrg = '" + orgData.getValue("sParent") + "'");
		parentData.refreshData();
	};

	Model.prototype.okBtnClick = function(event) {
		var orgData = this.comp("orgData");
		if (orgData.saveData()) {
			if (this._params.openMode == "new") {
				this._params.orgID = orgData.getRowID();
			}
			this.comp("windowReceiver").windowEnsure(this._params);
		}
	};

	return Model;
});