define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.openMode = justep.Bind.observable("view");
	};

/*	
	event.data = {
		openMode: new | edit | view
		personID:
		orgID:
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		this.comp("cancelBtn").set({
			"disabled" : false
		});
	
		var personData = this.comp("personData");
		
		this._params = event.data;
		this.openMode.set(this._params.openMode || "view");

		if (this._params.openMode == "new") {
			personData.clear();
			personData.newData();
			personData.setValue("sMainOrgID", this._params.orgID);
			personData.setValue("sName", "新建人员");
		} else {
			personData.setFilter("idFilter", "SA_OPPerson = '" + this._params.personID + "'");
			personData.refreshData();
		}

		this.mainOrgData.setFilter("idFilter", "SA_OPOrg = '" + personData.getValue("sMainOrgID") + "'");
		this.mainOrgData.refreshData();
	};

	Model.prototype.okBtnClick = function(event){
		var personData = this.comp("personData");

		if (personData.saveData()) {
			if (this._params.openMode == "new") {
				this._params.personID = personData.getRowID();
				this._params.name = personData.val("sName");
				this._params.password = personData.getUserData("password");
			}
			this.comp("windowReceiver").windowEnsure(this._params);
		}
	};

	Model.prototype.blobImage1UploadStart = function(event) {
		event.cancel = !this.comp("personData").saveData();
		this.comp("cancelBtn").set({
			"disabled" : true
		});
	};

	return Model;
});