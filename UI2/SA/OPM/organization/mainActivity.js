define(function(require) {
	require('css!../css/panel').load();
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var OrgKinds = require("$UI/system/service/org/orgKinds");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	var Grid = require("$UI/system/components/justep/grid/grid");

	var Model = function() {
		this.callParent();
		this.orgKinds = new OrgKinds(this.getContext());
		this.showFilterGird = justep.Bind.observable(false);
	};

	Model.prototype.modelModelConstructDone = function(event) {
		this.comp("orgKindsData").loadData(this.orgKinds.getTableData());
		this.refreshTreeData(true);
		this.refreshListData();
	};
	
	Model.prototype.refreshTreeData = function(isRefreshAll, toOrgFID) {
		var orgTreeData = this.comp("orgTreeData");
		var orgTreeGrid = this.comp("orgTreeGrid");
		
		toOrgFID = toOrgFID ? toOrgFID : orgTreeData.val("sFID");

		this._treeDataRefreshing = true;
		try {
			orgTreeData.refreshData({
				"parent" : isRefreshAll ? null : orgTreeData.getCurrentRow() 
			});
			
			if (toOrgFID && !Grid.isVirtualRoot(toOrgFID)) {
				orgTreeGrid.expandByIDPath(OpmUtils.orgFIDtoIDPath(toOrgFID));
			} else if (orgTreeGrid.useVirtualRoot) {
				orgTreeGrid.selectVirtualRoot();
			}
		} finally {
			this._treeDataRefreshing = false;
		}
	};
	
	Model.prototype.refreshListData = function(toOrgID) {
		var orgListData = this.comp("orgListData");
		orgListData.refreshData();
		var row = orgListData.getRowByID(toOrgID);
		if (row) {
			orgListData.to(row);
		}
	};
	
	Model.prototype.orgTreeDataIndexChanged = function(event){
		if (!this._treeDataRefreshing) {
			this.refreshListData();
		}
	};

	Model.prototype.orgTreeDataBeforeRefresh = function(event){
		var tempData = this.comp("tempData");
		event.source.setFilter("disableFilter", tempData.val("showDisabled")
			? "SA_OPOrg.sValidState in (0, 1)"
			: "SA_OPOrg.sValidState = 1");
	};

	Model.prototype.orgListDataBeforeRefresh = function(event){
		var orgTreeData = this.comp("orgTreeData");
		var orgSearchData = this.comp('orgSearchData');
		var tempData = this.comp("tempData");

		var isShowAllChildren = tempData.val("showAllChildren");
		
		var orgTreeID ="";
		if(this.showFilterGird.get() === false){
			orgTreeID = this.comp("orgTreeGrid").getSelection();
			
			event.source.setFilter("parentFilter",
				!orgTreeID ? "1=0" :
					(Grid.isVirtualRoot(orgTreeID) 
						? (isShowAllChildren ? "" : "SA_OPOrg.sParent is null")
						: (isShowAllChildren ? "SA_OPOrg.sFID like '" + orgTreeData.getValueByID("sFID", orgTreeID) + "/%'" : "SA_OPOrg.sParent = '" + orgTreeID + "'")
					)
				);
		}else{
			orgTreeID = this.comp("orgSearchData").getCurrentRowID();
			
				
			event.source.setFilter("parentFilter",
				!orgTreeID ? "1=0" :
					(Grid.isVirtualRoot(orgTreeID) 
						? (isShowAllChildren ? "" : "SA_OPOrg.sParent is null")
						: (isShowAllChildren ? "SA_OPOrg.sFID like '" + orgSearchData.getValueByID("sFID", orgTreeID) + "/%'" : "SA_OPOrg.sParent = '" + orgTreeID + "'")
					)
				);
		}
		
		
		event.source.setFilter("parentFilter",
			!orgTreeID ? "1=0" :
				(Grid.isVirtualRoot(orgTreeID) 
					? (isShowAllChildren ? "" : "SA_OPOrg.sParent is null")
					: (isShowAllChildren ? "SA_OPOrg.sFID like '" + orgTreeData.getValueByID("sFID", orgTreeID) + "/%'" : "SA_OPOrg.sParent = '" + orgTreeID + "'")
				)
			);

		event.source.setFilter("masterPsmFilter", tempData.val("onlyShowMasterPsm")
			? "SA_OPOrg.sOrgKindID <> 'psm' or SA_OPOrg.sParent = SA_OPPerson.sMainOrgID"
			: ""
		);

		event.source.setFilter("disableFilter", tempData.val("showDisabled")
			? "SA_OPOrg.sValidState in (0, 1)"
			: "SA_OPOrg.sValidState = 1"
		);
		
		event.source.setFilter("orgKindsFilter", tempData.val("listOrgKinds")
			? "SA_OPOrg.sOrgKindID in ('" + tempData.val("listOrgKinds").replace(/\s/g, "','") + "')"
			: ""
		);		
	};

	Model.prototype.tempDataValueChanged = function(event) {
		if (event.col == "showDisabled") {
			this.refreshTreeData(true);
			this.refreshListData();
		} else if ($.inArray(event.col, ["onlyShowMasterPsm", "showAllChildren", "listOrgKinds"]) != -1) {
			this.refreshListData();
		}
	};

	Model.prototype.orgListDataRefreshCreateParam = function(event) {
		event.param.setBoolean("splitFullIDCodeName", true);
	};

	Model.prototype.isTreeLeaf = function(orgKindID) {
		var children = this.orgKinds.getChildren(orgKindID);
		var index = $.inArray('psm', children);
		if (index != -1) {
			children.splice(index, 1);
		}
		return (children.length == 0);
	};

	Model.prototype.newOrgIsEnabled = function(orgKindID) {
		var treeRow = this.comp("orgTreeData").getCurrentRow();
		if (treeRow) {
			return ($.inArray(treeRow.val("sOrgKindID"), this.orgKinds.getParents(orgKindID)) != -1);
		} else {
			if (Grid.isVirtualRoot(this.comp("orgTreeGrid").getSelection())) {
				return (this.orgKinds.isRoot(orgKindID) && !OrgKinds.isPersonMember(orgKindID));
			} else {
				return false;
			}
		}
	};

	Model.prototype.newOrgBtnClick = function(event) {
		var orgKindRow = event.bindingContext.$object;
		var orgKindID = orgKindRow.getID();

		if (!this.newOrgIsEnabled(orgKindID)) {
			return;
		} 

		var parentID = this.comp("orgTreeGrid").getSelection();
		parentID = Grid.isVirtualRoot(parentID) ? null : parentID; 

		if (OrgKinds.isPersonMember(orgKindID)) {
			this.comp("personDetailDialog").open({
				data : {
					"openMode" : "new",
					"orgID" : parentID
				}
			});
		} else {
			this.comp("orgDetailDialog").open({
				data : {
					"openMode" : "new",
					"orgKindID" : orgKindID,
					"parentID" : parentID
				}
			});
		}
	};
	
	Model.prototype.editBtnClick = function(event) {
		var row = this.comp("orgListData").getCurrentRow();
		if (!row) {
			return;
		}
		var orgKindID = row.val("sOrgKindID");

		if (OrgKinds.isPersonMember(orgKindID)) {
			this.comp("personDetailDialog").open({
				data : {
					"openMode" : "edit",
					"personID" : row.val("sPersonID")
				}
			});
		} else {
			this.comp("orgDetailDialog").open({
				data : {
					"openMode" : "edit",
					"orgID" : row.getID()
				}
			});
		}
	};

	Model.prototype.orgDetailDialogReceive = function(event) {
		this.refreshTreeData();
		this.refreshListData(event.data.orgID);
	};

	Model.prototype.personDetailDialogReceive = function(event) {
		var psmID = OpmUtils.formatPsmID(event.data.personID, event.data.orgID);
		this.refreshListData(psmID);
		if (event.data.openMode == "new") {
			justep.Util.hint("新建人员成功，（" + event.data.name + "）的初始密码为（" + event.data.password + "）。");
		}
	};

	Model.prototype.enableOrgBtnClick = function(event) {
		var row = this.comp("orgListData").getCurrentRow();
		if (!row || (row.val("sValidState") != 0)) {
			return;
		}
		
		var id = row.getID();
		var name = row.val("sName");
		var version = row.val("version");
		var orgKind = row.val("sOrgKindID");
		var isMasterPsm = (row.val("sParent") == row.val("personMainOrgID"));
		var personValidState = row.val("personValidState");
		var personID = row.val("personID");

		var self = this;
		if (OrgKinds.isPersonMember(orgKind) && !isMasterPsm && personValidState != 1) {
			justep.Util.confirm("确实要启用（" + name + "）的主岗位和当前岗位吗？", function() {
				var params = new biz.Request.ActionParam();
				params.setString("psmID", id);
				params.setInteger("psmVersion", version);
				params.setString("personID", personID);
				biz.Request.sendBizRequest({
					"context" : self.getContext(),
					"action" : "enableSlavePsmAction",
					"parameters" : params,
					"callback" : function(data) {
						data.ignoreError = false;
						if (data.state) {
							self.refreshListData(id);
						}
					}
				});
			});
		} else {
			justep.Util.confirm("确实要启用（" + name + "）吗？", function() {
				var params = new biz.Request.ActionParam();
				params.setString("id", id);
				params.setInteger("version", version);
				params.setBoolean("enableSlavePsm", false);
				biz.Request.sendBizRequest({
					"context" : self.getContext(),
					"action" : "enableOrgAction",
					"parameters" : params,
					"callback" : function(data) {
						data.ignoreError = false;
						if (data.state) {
							if (!OrgKinds.isPersonMember(orgKind)) {
								self.refreshTreeData();
								self.refreshListData(id);
							} else {
								self.refreshListData(id);
							}
						}
					}
				});
			});
		}
	};

	Model.prototype.checkCurrentPerson = function(orgFullID) {
		var checked = false;
		$.each(this.getContext().getAllPersonMemberFIDs(), function(i, psmFullID) {
			if (psmFullID.indexOf(orgFullID) != -1) {
				checked = true;
				return false;
			}
		});
		return checked;
	};
	
	Model.prototype.disableBtnClick = function(event) {
		var row = this.comp("orgListData").getCurrentRow();
		if (!row || (row.val("sValidState") != 1)) {
			return;
		} else if (this.checkCurrentPerson(row.val("sFID"))) {
			justep.Util.hint("你不能禁用自己和自己的上级组织！");
			return;
		}
		
		var id = row.getID();
		var name = row.val("sName");
		var version = row.val("version");
		var orgKind = row.val("sOrgKindID");
		var isMasterPsm = (row.val("sParent") == row.val("personMainOrgID"));
		
		var self = this;
		justep.Util.confirm("确实要禁用（" + name + "）吗？", function() {
			var params = new biz.Request.ActionParam();
			params.setString("id", id);
			params.setInteger("version", version);
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "disableOrgAction", 
				"parameters" : params, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						if (OrgKinds.isPersonMember(orgKind)) {
							self.refreshListData(id);
						} else {
							self.refreshTreeData();
							self.refreshListData(id);
						}
					}
				}
			});
		});

	};

	Model.prototype.logicDeleteBtnClick = function(event) {
		var row = this.comp("orgListData").getCurrentRow();
		if (!row) {
			return;
		} else if (this.checkCurrentPerson(row.val("sFID"))) {
			justep.Util.hint("你不能删除自己和自己的上级组织！");
			return;
		}
		
		var id = row.getID();
		var fullID = row.val("sFID");
		var name = row.val("sName");
		var version = row.val("version");
		var orgKind = row.val("sOrgKindID");
		var isMasterPsm = (row.val("sParent") == row.val("personMainOrgID"));
		
		var self = this;
		justep.Util.confirm("确实要删除（" + name	+ "）吗？", function() {
			var params = new biz.Request.ActionParam();
			params.setString("id", id);
			params.setInteger("version", version);
			biz.Request.sendBizRequest({
				"context" : self.getContext(), 
				"action" : "logicDeleteOrgAction", 
				"parameters" : params, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						if (OrgKinds.isPersonMember(orgKind)) {
							self.refreshListData(id);
						} else {
							self.refreshTreeData();
							self.refreshListData(id);
						}
					} 
				}
			});
		});
	};

	Model.prototype.resetPasswordBtnClick = function(event){
		var row = this.comp("orgListData").getCurrentRow();
		if (!row || !OrgKinds.isPersonMember(row.val("sOrgKindID"))) {
			return;
		}

		var name = row.val("sName");
		var personID = row.val("personID");
		var personVersion = row.val("personVersion");
		
		var self = this;
		justep.Util.confirm("确实要重置（" + name + "）的密码吗？ ", function() {
			var params = new biz.Request.ActionParam();
			params.setString("id", personID);
			params.setInteger("version", personVersion);
			biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "resetPasswordAction", 
				"parameters" : params, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						self.refreshListData();
						justep.Util.hint("重置（" + name + "）的密码（" + data.response + "）成功。");
					}
				}
			});
		});
	};

	Model.prototype.assignPersonBtnClick = function(event){
		if (!this.newOrgIsEnabled("psm")) {
			return;
		}
	
		this.comp("assignPersonOrgDialog").open({
			"data" : {
				"selected" : []
			}
		});
	};

	Model.prototype.assignPersonOrgDialogReceive = function(event){
		var orgID = this.comp("orgTreeData").getCurrentRowID();
		var personIDs = new biz.Request.ListParam();
		$.each(event.data, function(i, row) {
			personIDs.add(row.val("sPersonID"));
		});
		var params = new biz.Request.ActionParam();
		params.setList("personIDs", personIDs);
		if (orgID) params.setString("orgID", orgID);
		params.setInteger("psmValidState", 1);
		params.setBoolean("autoEnableOldPsm", false);
		
		var self = this;
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action" : "assignPersonAction", 
			"parameters" : params,  
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					self.refreshListData();
				} 
			}
		});
	};

	Model.prototype.moveBtnClick = function(event){
		var row = this.comp("orgListData").getCurrentRow();
	
		if (this.checkCurrentPerson(row.val("sFID"))) {
			justep.Util.hint("你不能移动自己和自己的上级组织！");
			return;
		}
		
		var orgKindID = row.val("sOrgKindID");
		var parentOrgKindIDs = this.orgKinds.getParents(orgKindID).join(",");
		var isRoot = this.orgKinds.isRoot(orgKindID);
		var selectFilter = "js: " + (isRoot ? "!$row.val('sOrgKindID') || " : "") + "('," + parentOrgKindIDs + ",'.indexOf(',' + $row.val('sOrgKindID') + ',') != -1)";
		
		this.comp("moveOrgDialog").open({
			"filter": "not (SA_OPOrg.sFID like '" + row.val("sFID") + "%')",
			"selectFilter" : selectFilter,
			"includeOrgKind" : this.orgKinds.getAllParents(row.val("sOrgKindID")).join(","),
			"useVirtualRoot" : true,
			"reload" : true			
		});
	};

	Model.prototype.moveOrgDialogReceive = function(event){
		var row = this.comp("orgListData").getCurrentRow();
		var name = row.val("sName");
		var parentRow = event.data[0];

		var params = new biz.Request.ActionParam();
		params.setString("id", row.getID());
		params.setInteger("version", row.val("version"));
		params.setString("newParentID", Grid.isVirtualRoot(parentRow.getID()) ? "" : parentRow.getID());
		
		var self = this;
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action" : "moveOrgAction", 
			"parameters" : params, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					self.refreshTreeData(true, Grid.isVirtualRoot(parentRow.getID()) ? parentRow.getID() : parentRow.val("sFID"));
					self.refreshListData();
				}
			}
		});
	};

	Model.prototype.sortBtnClick = function(event) {
		var parentID = this.comp("orgTreeGrid").getSelection();
		if (!parentID) {
			return;
		}
		parentID = Grid.isVirtualRoot(parentID) ? null : parentID
		this.comp("sortOrgDialog").open({
			"data" : {
				"parentID" : parentID
			}
		});
	};

	Model.prototype.sortOrgDialogReceive = function(event){
		var ids = new biz.Request.ListParam();
		var versions = new biz.Request.ListParam();
	
		$.each(event.data, function(i, row) {
			ids.add(row.getID());
			versions.add(row.val("version"));
		});
	
		var params = new biz.Request.ActionParam();
		params.setList("ids", ids);
		params.setList("versions", versions);

		var parentID = this.comp("orgTreeData").getCurrentRowID();
		if (parentID) params.setString("parentID", parentID);
		
		var self = this;
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action" : "sortOrgsAction", 
			"parameters" : params, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					self.refreshTreeData();
					self.refreshListData();
				}
			}
		});
	};

	Model.prototype.changeMainOrgBtnClick = function(event){
		var row = this.comp("orgListData").getCurrentRow();
		if (!row || !OrgKinds.isPersonMember(row.val("sOrgKindID"))) {
			return;
		}
		this.comp("changeMainOrgDialog").open({
			"data" : {
				"filter" : "SA_OPOrg.sPersonID = '" + row.val("sPersonID") + "'"
			}
		});
	};

	Model.prototype.changeMainOrgDialogReceive = function(event){
		var row = this.comp("orgListData").getCurrentRow();
		var name = row.val("sName");
		var personID = row.val("personID");
		var personVersion = row.val("personVersion");
	
		var newMainOrgID = event.data[0].val("sParent");
		var newMainOrgFName = event.data[0].val("sFName");

		var params = new biz.Request.ActionParam();
		params.setString("id", personID);
		params.setInteger("version", personVersion);
		params.setString("newMainOrgID", newMainOrgID);
		params.setBoolean("disableOldMasterPsm", false);
		
		var self = this;
		biz.Request.sendBizRequest({
			"context" : self.getContext(),
			"action" : "changePersonMainOrgAction", 
			"parameters" : params, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					self.refreshListData();
				} 
			}
		});
	};

	Model.prototype.orgListDataTablesCellRender = function(event){
		if (event.colName == "sOrgKindID") {
			event.html = "<img height='16' width='16' src='" + OpmUtils.getOrgImgURL(event.row.val("sOrgKindID"), event.row.val("sValidState") != 1, event.row.val("sParent") == event.row.val("personMainOrgID")) + "'/>"
		}
	};
	
	
	Model.prototype.refreshOrgCache = function(event){
		var self = this;
		var params = new biz.Request.ActionParam();
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "updateOrgVersionAction",
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError=false;
				self.comp("moreDropDown").clearMenus();
			}
		});
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
		if (!this._treeDataRefreshing) {
			this.refreshListData();
		}
	};
	
	return Model;
});