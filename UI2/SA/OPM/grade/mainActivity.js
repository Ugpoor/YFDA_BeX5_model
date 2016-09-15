define(function(require) {
	require('css!../css/panel').load();
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
		this.showFilterGird = justep.Bind.observable(false);
	};

	Model.prototype.managementDataBeforeRefresh = function(event) {
		var orgFID = "";
		if(this.showFilterGird.get() === false){
			orgFID = this.comp("orgTreeData").val("sFID");
		}else{
			orgFID = this.comp("orgSearchData").val("sFID");
		}
		var showInherited = this.comp("tempData").val("showInherited"); 
		event.source.setFilter("orgFilter", 
			!orgFID ? "1=0" :
				(showInherited 
					? OpmUtils.createParentPathFilter("SA_OPManagement.sOrgFID", orgFID) 
					: "SA_OPManagement.sOrgFID = '"	+ orgFID + "'"
				)
			);
	};

	Model.prototype.roleManagementDataBeforeRefresh = function(event){
		var orgFID = "";
		if(this.showFilterGird.get() === false){
			orgFID = this.comp("orgTreeData").val("sFID");
		}else{
			orgFID = this.comp("orgSearchData").val("sFID");
		}
		var showInherited = this.comp("tempData").val("showInheritedRole"); 
		event.source.setFilter("orgFilter", 
			!orgFID ? "1=0" :
				(showInherited 
					? OpmUtils.createParentPathFilter("SA_OPRoleManagement.sOrgFID", orgFID) 
					: "SA_OPRoleManagement.sOrgFID = '"	+ orgFID + "'"
				)
			);
	};

	Model.prototype.tempDataValueChanged = function(event) {
		if (event.col == "showInherited") {
			this.comp("managementData").refreshData();
		} else if (event.col == "showInheritedRole") {
			this.comp("roleManagementData").refreshData();
		}
	};

	Model.prototype.orgTreeDataIndexChanged = function(event) {
		this.comp("managementData").refreshData();
		this.comp("roleManagementData").refreshData();
	};

	Model.prototype.addManagementBtnClick = function(event) {
		if (this.comp("orgTreeData").getCurrentRowID()) {
			this.comp("orgDialog").open({
				"data" : {
					"selected" : []
				}
			});
		}
	};

	Model.prototype.orgDialogReceive = function(event) {
		if (!event.data) return;
	
		var orgTreeData = this.comp("orgTreeData");
		var orgID = orgTreeData.getCurrentRowID();
	
		var manageOrgIDs = new biz.Request.ListParam();
		$.each(event.data, function(i, row) {
			manageOrgIDs.add(row.getID());
		});
		var params = new biz.Request.ActionParam();
		params.setString("orgID", orgID);
		params.setString("manageTypeID", "systemManagement");
		params.setList("manageOrgIDs", manageOrgIDs);
		
		var self = this;
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action": "appendManagementsAction", 
			"parameters": params, 
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					self.comp("managementData").refreshData();
				}
			}
		});
	};

	Model.prototype.deleteManagementBtnClick = function(event) {
		var managementDataTables = this.comp("managementDataTables");
		if (managementDataTables.getCheckeds().length == 0) {
			justep.Util.hint("请勾选要删除的管理组织！");
			return;
		}

		var self = this;
		justep.Util.confirm("确实要删除当前勾选的管理组织吗？", function() {
			var managementData = self.comp("managementData");
			var managements = new biz.Request.MapParam();
			var orgID = self.comp("orgTreeData").getCurrentRowID();
			$.each(managementDataTables.getCheckeds(), function(i, row) {
				if (row.val("sOrgID") == orgID) {
					managements.put(row.getID(), row.val("version"));
				}
			});
			var params = new biz.Request.ActionParam();
			params.setMap("managements", managements);
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "deleteManagementsAction",
				"parameters" : params,
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						managementData.refreshData();
					}
				}
			});
		});
		;
	};

	Model.prototype.managementDataTablesRowCheck = function(event){
		event.cancel = (this.comp("orgTreeData").getCurrentRowID() != event.row.val("sOrgID"));
	};

	Model.prototype.addRoleBtnClick = function(event){
		if (this.comp("orgTreeData").getCurrentRowID()) {
			this.comp("roleDialog").open();
		}
	};

	Model.prototype.roleDialogReceive = function(event){
		if (!event.data) return;
	
		var orgTreeData = this.comp("orgTreeData");
		var orgID = orgTreeData.getCurrentRowID();
	
		var roleIDs = new biz.Request.ListParam();
		$.each(event.data, function(i, row) {
			roleIDs.add(row.getID());
		});
		var self = this;
		var params = new biz.Request.ActionParam();
		params.setString("orgID", orgID);
		params.setList("roleIDs", roleIDs);
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action": "appendRoleManagementsAction",
			"parameters": params, 
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					self.comp("roleManagementData").refreshData();
				}
			}
		});
	};

	Model.prototype.deleteRoleBtnClick = function(event){
		var roleDataTables = this.comp("roleDataTables");
		if (roleDataTables.getCheckeds().length == 0) {
			justep.Util.hint("请勾选要删除的管理角色！");
			return;
		}

		var self = this;
		justep.Util.confirm("确实要删除当前勾选的管理角色吗？", function() {
			var roleManagementData = self.comp("roleManagementData");
			var roleManagements = new biz.Request.MapParam();
			var orgID = self.comp("orgTreeData").getCurrentRowID();
			$.each(roleDataTables.getCheckeds(), function(i, row) {
				if (row.val("sOrgID") == orgID) {
					roleManagements.put(row.getID(), row.val("version"));
				}
			});
			var params = new biz.Request.ActionParam();
			params.setMap("roleManagements", roleManagements);
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "deleteRoleManagementsAction",
				"parameters" : params,
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						roleManagementData.refreshData();
					}
				}
			});
		});
		;	};

	Model.prototype.roleDataTablesRowCheck = function(event){
		event.cancel = (this.comp("orgTreeData").getCurrentRowID() != event.row.val("sOrgID"));
	};
	
	
	
	
	Model.prototype.searchBtnClick = function(event){

		var inputFilter = this.comp('filter');
		var v = inputFilter.$domNode.val();
		if(v){
			this.showFilterGird.set(true);
			$(this.getElementsByXid('searchDiv')).css({height:'100%',position: 'relative'});
			var searchData = this.comp('orgSearchData');
			searchData.setFilter('_search_filter_',this.getSearchFilter(["SA_OPOrg.sCode","SA_OPOrg.sName"],v));
			searchData.refreshData();
		}else{
			this.showFilterGird.set(false);
			$(this.getElementsByXid('searchDiv')).css({height:0,position: 'absolute'});
			this.comp('orgTreePC1').getTree().autoSize();
		}
	};
	
	Model.prototype.filterChange = function(event){
		var v = event.source.val();
		if(!v) this.searchBtnClick();
	};
	
	
	Model.prototype.filterKeypress = function(event){
		if(event.keyCode===13){
			this.searchBtnClick();
		}
	};
	
	Model.prototype.getSearchFilter = function(fields, text){
		var searchText = text.replace(/'/g, "''").toUpperCase();
		var filters = [];
		for (var i = 0; i < fields.length; i++) {
			filters.push("(UPPER(" + fields[i] + ") LIKE '%" + searchText + "%')");
		}
		return filters.join("OR");
	};
	

	Model.prototype.orgSearchDataIndexChanged = function(event){
		this.comp("managementData").refreshData();
		this.comp("roleManagementData").refreshData();
	};
	

	return Model;
});