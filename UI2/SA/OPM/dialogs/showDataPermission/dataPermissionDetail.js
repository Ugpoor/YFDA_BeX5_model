define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function() {
		this.callParent();
		this.openMode = justep.Bind.observable("view");
	};

/*	
	event.data = {
		openMode : new | edit | view
		id :
		roleID :
	}
*/
	Model.prototype.windowReceiverReceive = function(event) {
		this._params = event.data;
		this.openMode.set(this._params.openMode || "view");
		
		var permissionData = this.comp("permissionData");
		var policyData = this.comp("policyData");
		var policyGrid = this.comp("policyGrid");
		permissionData.clear();
		policyData.clear();

		if (this._params.openMode == "new") {
			permissionData.newData();
		} else {
			var params = new biz.Request.ActionParam();
			params.setString("id", this._params.id);
			var translateParam = new biz.Request.TranslateParam();
			translateParam.dataType = biz.Request.TranslateParam.DATATYPE_ROW_LIST;
			translateParam.rowOption.sequence = policyData.getColumnIDs();
			
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "getDataPermissionAction",
				"parameters" : params,
				"translateParam" : translateParam, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						permissionData.newData({
							"defaultValues" : [{
								"id" : data.response.id,
								"version" : data.response.version,
								"process" : data.response.process,
								"activity" : data.response.activity,
								"activityFName" : data.response.activityFName
							}]
						});
						$.each(data.response.dataPolicyTable.rows, function(i, row) {
							row.id.value = i;
						});
						policyData.loadData(data.response.dataPolicyTable);
						policyGrid.refresh();
					}
				}
			});
		}
	};

	Model.prototype.okBtnClick = function(event) {
		var permissionData = this.comp("permissionData");
		var policyData = this.comp("policyData");
		var windowReceiver = this.comp("windowReceiver");
		
		if (!policyData.isValid()) {
			throw justep.Error.create(policyData.getInvalidInfo());
		}
		
		if (policyData.find(["action"], ["*"]).length > 0 && (permissionData.getValue("process") != "*" || permissionData.getValue("activity") != "*")) {
			throw justep.Error.create("业务策略的Process和Activity必须设置为 * ");
		}
		
		var self = this;
		
		if (this._params.openMode == "new") {
			var params = new biz.Request.ActionParam();
			params.setString("roleID", this._params.roleID);
			params.setString("process", permissionData.getValue("process"));
			params.setString("activity", permissionData.getValue("activity"));
			params.setString("activityFName", permissionData.getValue("activityFName"));
			params.setTable("dataPolicyTable", new biz.Request.TableParam(policyData.toJson(false)));
	
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "appendDataPermission",
				"parameters" : params,
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						self._params.id = data.response;
						windowReceiver.windowEnsure(self._params);
					} 
				}
			});
		} else if (this._params.openMode == "edit") {
			var params = new biz.Request.ActionParam();
			params.setString("id", permissionData.getValue("id"));
			params.setInteger("version", permissionData.getValue("version"));
			params.setString("process", permissionData.getValue("process"));
			params.setString("activity", permissionData.getValue("activity"));
			params.setString("activityFName", permissionData.getValue("activityFName"));
			params.setTable("dataPolicyTable", new biz.Request.TableParam(policyData.toJson(false)));
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "updateDataPermission",
				"parameters" : params,
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						windowReceiver.windowEnsure(self._params);
					} 
				}
			});
		}
	};

	Model.prototype.policyGridCellRender = function(event){
		if (event.colName == "valuesLabel") {
			event.html = "<button name='valueBtn' style='float: right'>...</button>" + (event.colVal ? event.colVal : "");
		}
	};

	Model.prototype.selectFunBtnClick = function(event){
		this.comp("selectFunDialog").open();
	};

	Model.prototype.selectFunDialogReceive = function(event){
		var permissionData = this.comp("permissionData");
		permissionData.setValue("process", event.data.val("process"));
		permissionData.setValue("activity", event.data.val("activity"));
		permissionData.setValue("activityFName", event.data.val("path"));
	};

	Model.prototype.newParamPolicyClick = function(event) {
		var permissionData = this.comp("permissionData");
		this.comp("selectParamDialog").open({
			"data" : {
				"process" : permissionData.getValue("process"),
				"activity" : permissionData.getValue("activity")
			}
			
		});
	};

	Model.prototype.selectParamDialogReceive = function(event){
		if (event.data) {
			var policyData = this.comp("policyData");
			policyData.newData({
				"defaultValues" : [{
					"id" : justep.UUID.createUUID(),
					"action" : event.data.val("action"),
					"actionLabel" : event.data.val("actionLabel"),
					"typeOrParam" : event.data.val("param"),
					"typeOrParamLabel" : event.data.val("paramLabel"),
					"kind" : "expr",
					"kindLabel" : "表达式"
				}]
			})
		}
	};

	Model.prototype.newBizPolicyClick = function(event){
		var policyData = this.comp("policyData");
		policyData.newData({
			"defaultValues" : [{
				"id" : justep.UUID.createUUID(),
				"action" : "*",
				"actionLabel" : "所有",
				"kind" : "expr",
				"kindLabel" : "表达式"
			}]
		})
	};

	Model.prototype.delPolicyBtnClick = function(event){
		var policyData = this.comp("policyData");
		var policyGrid = this.comp("policyGrid");
		var rows = [];
		$.each(policyGrid.getCheckeds(), function(i, rowID) {
			rows.push(policyData.getRowByID(rowID));
		});
		policyData.deleteData(rows);
	};

	Model.prototype.policyGridRowClick = function(event){
		var policyData = this.comp("policyData");
		if ($(event.domEvent.target).attr("name") == "valueBtn") {
			var values = policyData.val("values", event.row);
			this.comp("valuesDialog").open({
				"data" : {
					"openMode" : (this.openMode.get() == "view") ? "view" : "edit",
					"values" : values
				}
			});
		}
	};

	Model.prototype.valuesDialogReceive = function(event){
		var policyData = this.comp("policyData");
		policyData.setValue("values", event.data.values);
		policyData.setValue("valuesLabel", event.data.valuesLabel);
	};

	Model.prototype.policyDataValueChanged = function(event){
		if (event.col == "typeOrParam" && event.row.val("action") == "*") {
			event.row.val("typeOrParamLabel", event.value);
		}
	};

	return Model;
});