define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.deleteOrgBtnClick = function(event){
		var orgData = this.comp("orgData");
		if (!orgData.getCurrentRow()) {
			return;
		}
		
		var id = orgData.getRowID();
		var name = orgData.val("sName");
		var version = orgData.val("version");
		
		var self = this;
		justep.Util.confirm("确实要清除（" + name + "）吗？", function() {
			var params = new biz.Request.ActionParam();
			params.setString("id", id);
			params.setInteger("version", version);
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "physicalDeleteOrgAction",
				"parameters" : params, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						orgData.refreshData();
					}
				}
			});
		});
	};

	Model.prototype.restoreOrgBtnClick = function(event){
		var orgData = this.comp("orgData");
		if (!orgData.getCurrentRow()) {
			return;
		}

		var id = orgData.getRowID();
		var name = orgData.val("sName");
		var version = orgData.val("version");
		
		var self = this;
		justep.Util.confirm("确实要还原（" + name + "）吗？", function() {
			var params = new biz.Request.ActionParam();
			params.setString("id", id);
			params.setInteger("version", version);
			params.setBoolean("restoreSlavePsm", false);
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "restoreOrgAction", 
				"parameters" : params,
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						orgData.refreshData();
					}
				}
			});
		});
	};

	Model.prototype.clearAllBtnClick = function(event){
		var self = this;
		justep.Util.confirm("确实要清除全部已删除的组织吗？", function() {
			var orgData = self.comp("orgData");
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "physicalDeleteAllAction",
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						orgData.refreshData();
					}
				}
			});
		});
	};

	Model.prototype.orgDataTablesCellRender = function(event){
		if (event.colName == "sOrgKindID") {
			event.html = "<img height='16' width='16' src='" + OpmUtils.getOrgImgURL(event.row.val("sOrgKindID"), false, event.row.val("sParent") == event.row.val("personMainOrgID")) + "'/>"
		}
	};

	return Model;
});