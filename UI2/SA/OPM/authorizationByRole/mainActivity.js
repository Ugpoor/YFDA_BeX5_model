define(function(require){
	require('css!../css/panel').load();
	
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.roleDataIndexChanged = function(event){
		this.comp("authorizeData").refreshData();
	};

	Model.prototype.authorizeDataRefreshCreateParam = function(event){
		event.param.setString("roleID", this.comp("roleData").getCurrentRowID());
		event.param.setBoolean("includeRoleChildren", this.comp("tempData").val("showInherited"));
	};

	Model.prototype.tempDataValueChanged = function(event){
		if (event.col == "showInherited") {
			this.comp("authorizeData").refreshData();
		}
	};

	Model.prototype.deleteOrgBtnClick = function(event){
		var authorizeTables = this.comp("authorizeTables");
		if (authorizeTables.getCheckeds().length == 0) {
			justep.Util.hint("请勾选要删除的组织！");
			return;
		}

		var self = this;
		justep.Util.confirm("确实要删除当前勾选的组织吗？", function() {
			var authorizeData = self.comp("authorizeData");

			var params = new biz.Request.ActionParam();
			var authorizes = new biz.Request.MapParam();
			var roleID = self.comp("roleData").getCurrentRowID();
			$.each(authorizeTables.getCheckeds(), function(i, row) {
				if (row.val("sAuthorizeRoleID") == roleID) {
					authorizes.put(row.getID(), row.val("version"));
				}
			});
			params.setMap("authorizes", authorizes);
			
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "deleteAuthorizesAction", 
				"parameters" : params, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						authorizeData.refreshData();
					}
				}
			});
		});

	};

	Model.prototype.authorizeTablesRowCheck = function(event){
		event.cancel = (this.comp("roleData").getCurrentRowID() != event.row.val("sAuthorizeRoleID"));
	};

	Model.prototype.addOrgBtnClick = function(event){
		this.comp("orgDialog").open({
			"data" : {
				"selected" : []
			}
		});
	};

	Model.prototype.orgDialogReceive = function(event){
		if (event.data.length == 0)
			return;

		var authorizeData = this.comp("authorizeData");
		var roleData = this.comp("roleData");
		var roleID = roleData.getCurrentRowID();
	
		var	orgIDs = new biz.Request.ListParam();
		var	roleIDs = new biz.Request.ListParam();
		for ( var i = 0; i < event.data.length; i++) {
			var orgID = event.data[i].getID();
			orgIDs.add(orgID);
			roleIDs.add(roleID);
		}
		var params = new biz.Request.ActionParam();
		params.setList("orgIDs", orgIDs);
		params.setList("roleIDs", roleIDs);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "appendAuthorizesAction", 
			"parameters" : params, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					authorizeData.refreshData();
				} 
			}
		});
	};

	Model.prototype.authorizeTablesCellRender = function(event){
		if (event.colName == "orgKindID") {
			event.html = "<img height='16' width='16' src='" + OpmUtils.getOrgImgURL(event.row.val("orgKindID"), false, false) + "'/>"
		}
	};

	return Model;
});