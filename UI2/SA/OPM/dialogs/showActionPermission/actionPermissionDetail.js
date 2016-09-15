define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");	
	
	var Model = function(){
		this.callParent();
		this.openMode = justep.Bind.observable("view");
	};

/*	
	event.data = {
		openMode : edit | view
		id : 
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		this._params = event.data;
		this.openMode.set(this._params.openMode || "view");
		
		var actionData = this.comp("actionData");
		var actionTables = this.comp("actionTables");
		actionData.refreshData();

		var self = this;
		var params = new biz.Request.ActionParam();
		params.setString("permissionID", this._params.id);
		var translateParam = new biz.Request.TranslateParam();
		translateParam.dataType = biz.Request.TranslateParam.DATATYPE_ROW_LIST;
		translateParam.rowOption.sequence = actionData.getColumnIDs();
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getActionsPolicyAction",
			"parameters" : params,
			"translateParam" : translateParam,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					self._params.version = data.response.version;
					actionData.loadData(data.response.protectedActionsTable);
					actionTables.reload();
					
					var actions = data.response.actions;
					if (actions) {
						$.each(actions.split(","), function(i, action) {
							actionTables.setRowChecked(actionData.getRowByID(action), true);
						})
					}
				}
			}
		});
	};

	Model.prototype.okBtnClick = function(event){
		var actionTables = this.comp("actionTables");
	
		var actions = new biz.Request.MapParam();
		$.each(actionTables.getCheckeds(), function(i, row) {
			actions.put(row.val("name"), row.val("label"));
		});
		
		var windowReceiver = this.comp("windowReceiver");
		var params = new biz.Request.ActionParam();
		params.setString("permissionID", this._params.id);
		params.setInteger("permissionVersion", this._params.version);
		params.setMap("actions", actions);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "setActionsPolicyAction",
			"parameters" : params, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					windowReceiver.windowEnsure(this._params);
				} 
			}
		});
	};

	return Model;
});