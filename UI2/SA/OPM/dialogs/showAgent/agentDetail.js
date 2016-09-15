define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		
		this.openMode = justep.Bind.observable("view");
	};

/*	
	event.data = {
		openMode : new | edit | view
		agentID :
		isMyself : boolean
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		var agentData = this.comp("agentData");
		this._params = event.data;
		
		this.openMode.set(this._params.openMode || "view");
		
		if (this._params.openMode == "new") {
			agentData.clear();
			agentData.newData({
				"defaultValues" : [{
					"sOrgFID" : this.getContext().getCurrentPersonMemberFID(),
					"sOrgFName" : this.getContext().getCurrentPersonMemberFName()
				}]
			});
		} else {
			agentData.setFilter("idFilter", "SA_OPAgent = '" + this._params.agentID + "'");
			agentData.refreshData();
		}
	};
	
	Model.prototype.getCurrentPsmFilter = function() {
		var psms = this.getContext().getAllPersonMemberFIDs();
		var filters = [];
		$.each(psms, function(i, psm) {
			filters.push("('" + psm + "' LIKE concat(SA_OPOrg.sFID, '%'))")
		});
		return filters.join(" OR ");
	};

	Model.prototype.okBtnClick = function(event){
		var agentData = this.comp("agentData");
		if (agentData.saveData()) {
			if (this._params.openMode == "new") {
				this._params.agentID = agentData.getRowID();
			}
			this.comp("windowReceiver").windowEnsure(this._params);
		}
	};

	Model.prototype.btnSelectPsmClick = function(event){
		var dialog = this.comp("selectPsmDialog");
		dialog.set({"filter": this._params.isMyself ? this.getCurrentPsmFilter() : ""}); 
		dialog.open();
	};

	Model.prototype.selectPsmDialogReceive = function(event) {
		var row = event.data[0];
		var agentData = this.comp("agentData");
		if (agentData.getValue("sOrgFID") != row.val("sFID")) {
			agentData.setValue("sOrgFID", row.val("sFID"));
			agentData.setValue("sProcess", "");
			agentData.setValue("processLabel", "");
		}
		agentData.setValue("sOrgFName", row.val("sFName"));
		
	};

	Model.prototype.btnSelectAgentPersonClick = function(event){
		this.comp("selectAgentPersonDialog").open();
	};

	Model.prototype.selectAgentPersonDialogReceive = function(event){
		var row = event.data[0];
		var agentData = this.comp("agentData");
		agentData.setValue("sAgentID", row.val("sPersonID"));
		agentData.setValue("agentPersonName", row.val("sName"));
	};

	Model.prototype.btnSelectProcessClick = function(event){
		var agentData = this.comp("agentData");
		this.comp("agentProcessDialog").open({
			"data" : {
				"openMode" : this.openMode.get() == "view" ? "view" : "edit",
				"process" : agentData.val("sProcess"),
				"orgFID" : agentData.val("sOrgFID")
			}
		});
	};

	Model.prototype.agentProcessDialogReceive = function(event){
		var agentData = this.comp("agentData");
		agentData.setValue("sProcess", event.data.process);
		agentData.setValue("processLabel", event.data.processLabel);
	};

	return Model;
});