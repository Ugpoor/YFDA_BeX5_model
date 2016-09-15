define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
/*
	event.data = {
		"managed" : boolean
	}
*/

	Model.prototype.windowReceiverReceive = function(event) {
		var tempData = this.comp("tempData");
		var orgTreeData = this.comp("orgTreeData");
		var orgTreeGrid = this.comp("orgTreeGrid");
			
		if (event.data && event.data.managed) {
			this.comp("orgTreePC1").set({
				"manageCodes" : "systemManagement"
			});
			orgTreeData.getTreeOption().rootFilter = "1=1";
		} else {
			this.comp("orgTreePC1").set({
				"manageCodes" : ""
			});
			orgTreeData.getTreeOption().rootFilter = "";
		}
		orgTreeData.refreshData();
		
		$.each(orgTreeGrid.getCheckeds(), function(i, id) {
			orgTreeGrid.setRowChecked(id, false);
		});
		
		tempData.setValue("manageTypeID", "");
		tempData.setValue("manageTypeName", "");
	};

	Model.prototype.okBtnClick = function(event){
		var tempData = this.comp("tempData");
		var manageTypeData = this.comp("manageTypeData");
		var orgTreeData = this.comp("orgTreeData");
		var orgTreeGrid = this.comp("orgTreeGrid");
		
		if (tempData.val("manageTypeID") && orgTreeGrid.getCheckeds().length > 0) {
			var orgs = [];
			$.each(orgTreeGrid.getCheckeds(), function(i, id) {
				orgs.push(orgTreeData.getRowByID(id));
			});
			this.comp("windowReceiver").windowEnsure({
				"manageType" : manageTypeData.getRowByID(tempData.val("manageTypeID")),
				"orgs" : orgs 
			});
		} else {
			justep.Util.hint("请选择业务管理类型，并勾选要组织。", {
				"parent" : this.getRootNode(),
				"type" : "danger"
			});
		}
	};

	return Model;
});