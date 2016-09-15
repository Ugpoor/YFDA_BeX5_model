define(function(require) {
	require('css!../css/panel').load();
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event) {
		this.comp("roleData").refreshData();
	};

	Model.prototype.roleDataBeforeRefresh = function(event){
		var tempData = this.comp("tempData");
		event.source.setFilter("disableFilter", 
			tempData.val("showDisabledRole") ? "" : "SA_OPRole.sValidState = 1"
		);
	};

	Model.prototype.roleDataIndexChanged = function(event) {
		this.comp("permissionData").refreshData();
	};

	Model.prototype.permissionDataRefreshCreateParam = function(event) {
		var roleID = this.comp("roleData").getCurrentRowID();
		var includeInherited = this.comp("tempData").val("showInheritedPermission");

		event.param.setString("roleID", roleID ? roleID : "");
		event.param.setBoolean("includeInherited", roleID ? includeInherited : false);
	};

	Model.prototype.tempDataValueChanged = function(event) {
		if (event.col == "showDisabledRole") {
			this.comp("roleData").refreshData();
		} else if (event.col == "showInheritedPermission") {
			this.comp("permissionData").refreshData();
		}
	};

	Model.prototype.editRoleBtnClick = function(event) {
		var row = this.comp("roleData").getCurrentRow();
		if (row) {
			this.comp("roleDetailDialog").open({
				"data" : {
					"openMode" : "edit",
					"roleID" : row.getID()
				}
			});
		}
	};

	Model.prototype.newFunRoleBtnClick = function(event) {
		this.comp("roleDetailDialog").open({
			"data" : {
				"openMode" : "new",
				"roleKind" : "fun"
			}
		});
	};

	Model.prototype.newDataRoleBtnClick = function(event) {
		this.comp("roleDetailDialog").open({
			"data" : {
				"openMode" : "new",
				"roleKind" : "data"
			}
		});
	};

	Model.prototype.roleDetailDialogReceive = function(event){
		this.comp("roleData").refreshData();
	};

	Model.prototype.enableRoleBtnClick = function(event){
		this.doRoleAction("enable");
	};

	Model.prototype.disableRoleBtnClick = function(event){
		this.doRoleAction("disable");
	};

	Model.prototype.deleteRoleBtnClick = function(event){
		this.doRoleAction("delete");
	};

	Model.prototype.doRoleAction = function(operator){
		var roleData = this.comp("roleData"); 
		var row = roleData.getCurrentRow();
		if (!row) {
			return;
		}
		
		var label = {
			"enable" : "启用",
			"disable" : "禁用",
			"delete" : "删除"
		}[operator];
		
		var self = this;
		justep.Util.confirm("确实要" + label + "当前选中的角色吗？", function() {
			var params = new biz.Request.ActionParam();
			var roles = new biz.Request.MapParam();
			roles.put(row.getID(), row.val("version"));
			params.setMap("roles", roles);
			
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : operator + "RolesAction",
				"parameters" : params, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						roleData.refreshData();
					} 
				}
			});
		});
	};

	Model.prototype.addFunPermissionBtnClick = function(event){
		if (this.comp("roleData").getCurrentRow()) {
			this.comp("functionDialog").open({
				"data" : {
//					"roots" : "UI2",
//					"files" : ".function.xml", 
					"identity" : true
				}	
			});
		}
	};

	Model.prototype.functionDialogReceive = function(event) {
		var roleID = this.comp("roleData").getCurrentRowID();
		var processes = new biz.Request.ListParam();
		var activities = new biz.Request.ListParam();
		var activitiesFNames = new biz.Request.ListParam();
		$.each(event.data, function(i, row) {
			processes.add(row.val("process"));
			activities.add(row.val("activity"));
			activitiesFNames.add(row.val("path"));
		});
		var params = new biz.Request.ActionParam();
		params.setString("roleID", roleID);
		params.setList("processes", processes);
		params.setList("activities", activities);
		params.setList("activitiesFNames", activitiesFNames);
		
		var self = this;
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action" : "assignFunPermissionsAction",
			"parameters" : params, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					self.comp("permissionData").refreshData();
				}
			}
		});
	};

	Model.prototype.deletePermissionBtnClick = function(event){
		var permissionDataTables = this.comp("permissionDataTables");
		if (permissionDataTables.getCheckeds().length == 0) {
			justep.Util.hint("请勾选要删除的权限！");
			return;
		}
		
		var self = this;
		justep.Util.confirm("确实要删除当前勾选的权限吗？", function() {
			var permissionData = self.comp("permissionData");
	
			var params = new biz.Request.ActionParam();
			var permissions = new biz.Request.MapParam();
			var roleID = self.comp("roleData").getCurrentRowID();
			$.each(permissionDataTables.getCheckeds(), function(i, row) {
				if (row.val("sPermissionRoleID") == roleID) {
					permissions.put(row.getID(), row.val("version"));
				}
			});
			params.setMap("permissions", permissions);
		
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "deletePermissionsAction",
				"parameters" : params, 
				"callback" : function(data) {
					data.igonreError = false;
					if (data.state) {
						permissionData.refreshData();
					}
				}
			});
		});
	};

	Model.prototype.addDataPermissionBtnClick = function(event){
		var roleData = this.comp("roleData");
		var roleID = roleData.getCurrentRowID();
		if (roleID) {
			this.comp("dataPermissionDialog").open({
				"data" : {
					"openMode" : "new",
					"roleID" : roleID
				}
			});
		}
	};

	Model.prototype.roleDataTablesCellRender = function(event){
		if (event.colName == "sRoleKind") {
			event.html = "<img height='16' width='16' src='" + OpmUtils.getRoleImgURL(event.colVal, event.row.val("sValidState") != 1) + "'/>";
		}
	};

	Model.prototype.permissionDataTablesCellRender = function(event){
		if (event.colName == "sPermissionKind") {
			event.html = "<img height='16' width='16' src='" + OpmUtils.getPermissionImgURL(event.colVal) + "'/>";
		} else if (event.colName == "actionsLabel") {
			event.html = "<button name='policyBtn' style='float: right'>...</button>" + (event.colVal ? event.colVal : "");
		}
	};

	Model.prototype.permissionDataTablesRowCheck = function(event){
		event.cancel = (this.comp("roleData").getCurrentRowID() != event.row.val("sPermissionRoleID"));
	};

	Model.prototype.permissionDataTablesRowClick = function(event){
		if ($(event.domEvent.target).attr("name") == "policyBtn") {
			if (event.row.val("sPermissionKind") == 1) {
				this.comp("dataPermissionDialog").open({
					"data" : {
						"openMode" : "edit",
						"id" : event.rowID
					}
				});
			} else {
				this.comp("actionPermissionDialog").open({
					"data" : {
						"openMode" : "edit",
						"id" : event.rowID
					}
				});
			}
		}
	};

	Model.prototype.dataPermissionDialogReceive = function(event){
		var permissionData = this.comp("permissionData");
		permissionData.refreshData();
	};

	Model.prototype.actionPermissionDialogReceive = function(event){
		var permissionData = this.comp("permissionData");
		permissionData.refreshData();
	};

	return Model;
});