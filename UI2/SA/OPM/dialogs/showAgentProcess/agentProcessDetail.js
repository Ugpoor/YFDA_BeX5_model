define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");

	var Model = function() {
		this.callParent();
		
		this.openMode = justep.Bind.observable("view");
	};

/*	
	event.data = {
		openMode : edit | view
		process : 
		orgFID :
	}
*/
	Model.prototype.windowReceiverReceive = function(event) {
		this._params = event.data;
		
		this.openMode.set(this._params.openMode || "view");
		
		this.comp("agentProcessData").refreshData();
	};

	Model.prototype.agentProcessDataCustomRefresh = function(event) {
		var data = event.source;
		data.clear();
	
		if (this._params.process) {
			var params = new biz.Request.ActionParam();
			params.setString("process", this._params.process);
			
			var translateParam = new biz.Request.TranslateParam();
			translateParam.dataType = biz.Request.TranslateParam.DATATYPE_ROW_LIST;
			translateParam.rowOption.sequence = data.getColumnIDs();
			
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "agentProcessStringToTableAction",
				"parameters" : params,
				"callback" : function(result) {
					result.ignoreError = false;
					if (result.state) {
						data.loadData(result.response);
					}
				}
			});
		}
	};

	Model.prototype.selectRoleBtnClick = function(event) {
		this.comp("selectRoleDialog").open({
			"data" : {
				"filter" : "SA_OPRole in (select SA_OPAuthorize.sAuthorizeRoleID from SA_OPAuthorize SA_OPAuthorize where "
					+ OpmUtils.createParentPathFilter("SA_OPAuthorize.sOrgFID", this._params.orgFID) + ")"
			}
		});
	};

	Model.prototype.selectRoleDialogReceive = function(event) {
		var self = this;
		$.each(event.data, function(i, row) {
			var content = row.getID();
			var label = row.val("sName");
			self.appendAgentProcess("r", content, label);
		});
	};
	
	Model.prototype.appendAgentProcess = function(type, content, label) {
		var data = this.comp("agentProcessData");
		if (data.find(["type", "content"], [type, content]).length > 0) return;
		data.newData({
			"defaultValues" : [{
				"type" : type,
				"typeLabel" : this.getTypeLabel(type),
				"content" : content,
				"label" : label
			}]
		});
	};
	
	Model.prototype.getTypeLabel = function(type) {
		if (type == "r")
			return "角色";
		else if (type == "m")
			return "模块";
		else if (type == "p")
			return "过程";
		else if (type == "a")
			return "功能";
		else
			return "";
	};

	Model.prototype.selectFuncBtnClick = function(event){
		this.comp("selectFuncDialog").open({
			"data" : {
				"orgFID" : this._params.orgFID
			}
		});
	};

	Model.prototype.selectFuncDialogReceive = function(event){
		var self = this;
		$.each(event.data, function(i, row) {
			var process = row.val("sProcess");
			var activity = row.val("sActivity");
			if (process.lastIndexOf("/") > -1)
				process = process.substring(0, process.lastIndexOf("/"));
			var content = process + "/" + activity;
			var label = row.val("sActivityFName");
	
			self.appendAgentProcess("a", content, label);
		});
	};

	Model.prototype.deleteBtnClick = function(event){
		var table = this.comp("agentProcessTable");
		var data = this.comp("agentProcessData");
		data.deleteData(table.getCheckeds());
	};

	Model.prototype.okBtnClick = function(event) {
		var data = this.comp("agentProcessData");
		var params = new biz.Request.ActionParam();
		params.setTable("table", new biz.Request.TableParam(data.toJson(false)));
	
		var self = this;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "agentProcessTableToStringAction",
			"parameters" : params,
			"callback" : function(result) {
				result.ignoreError = false;
				if (result.state) {
					self.comp("windowReceiver").windowEnsure({
						"process" : result.response.process,
						"processLabel" : result.response.processLabel
					});
				}
			}
		});
	};

	return Model;
});