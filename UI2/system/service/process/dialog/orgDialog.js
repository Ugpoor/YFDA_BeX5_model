/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OrgUtils = require("./orgUtils");
	var OrgKinds = require("./orgKinds");
	var OrgGroups = require("./orgGroups");

	var Model = function() {
		this.callParent();
		this.params = null;
		this.orgKinds = [];
		this.visibleOrgKinds = [];
		this.multiSelection = true;
	};

	Model.prototype.okBtnClick = function() {
		var receiver = this.comp("windowReceive");
		var data = {};
		data.options = this.params.options;
		data.rows = [];
		var contents = this.comp("contents");
		var orgTreeData = this.comp("orgTreeData");
		if (contents.getActiveXid() === "listContent") {
			if (this.multiSelection){
				this.comp("orgListData").each(function(options) {
					if (options.row.val("selected")) {
						var item = {};
						for (var name in options.row.data.defCols) {
							if (options.row.data.defCols.hasOwnProperty(name)){
								item[name] = options.row.val(name);
							}
						}
						data.rows.push(item);
					}
				});
			}else{
				var orgListData = this.comp("orgListData");
				var item = {};
				for (var name in orgListData.defCols) {
					if (orgListData.defCols.hasOwnProperty(name)){
						item[name] = orgListData.getValue(name);	
					}
				}
				data.rows.push(item);
			}
		} else {
			var orgTreeData = this.comp("orgTreeData");
			if (this.multiSelection){
				var rows = this.comp("orgTree").getSelected() || [];
				for ( var i = 0; i < rows.length; i++) {
					var item = {};
					for (var name in orgTreeData.defCols) {
						if (orgTreeData.defCols.hasOwnProperty(name)){
							item[name] = rows[i].val(name);	
						}
					}
					data.rows.push(item);
				}
			}else{
				var row = this.comp("orgTree").getSelected();
				var item = {};
				for (var name in orgTreeData.defCols) {
					if (orgTreeData.defCols.hasOwnProperty(name)){
						item[name] = row.val(name);	
					}
				}
				data.rows.push(item);
			}
		}
		receiver.windowEnsure(data);
	};

	Model.prototype.cancelBtnClick = function() {
		var receiver = this.comp("windowReceive");
		receiver.windowCancel();
	};

	/**
	 接收的数据格式 
		{ 
			options: {rowid: ''}, 
			range: [{fid: '', fname:'', responsible: 'true'}, {fid: '', fname:'', responsible: 'false'}], 
			orgKinds: ['psm'], 
			multiSelection: false 
		}
	 */
	Model.prototype.windowReceiveReceive = function(event) {
		this.reset();
		this.params = event.data || {};
		this.orgKinds = this.params.orgKinds;
		this.multiSelection = (this.params.multiSelection != false);
		this.comp("orgTree").set({multiSelection: this.multiSelection});
		
		this.initVisibleOrgKinds(this.orgKinds);
		this.initOrgTreeData(this.params.range);
		this.initOrgListData(this.params.range);
	};

	Model.prototype.reset = function() {
		this.comp("contents").to("treeContent");

		this.params = null;
		this.orgKinds = [];
		this.cascade = false;
		this.visibleOrgKinds = [];
		var orgTreeData = this.comp("orgTreeData");
		orgTreeData.filters.clear();
		orgTreeData.clear();

		var orgListData = this.comp("orgListData");
		orgListData.filters.clear();
		orgListData.clear();

		this.comp("searchData").setValue("text", "");
	};

	Model.prototype.initOrgTreeData = function(range) {
		range = range || [];
		var orgTreeData = this.comp("orgTreeData");
		orgTreeData.setFilter("validStateFilter", "SA_OPOrg.sValidState = 1");

		var orgKindsFilter = [ "1=0" ];
		for ( var i = 0; i < this.visibleOrgKinds.length; i++) {
			orgKindsFilter.push("(SA_OPOrg.sOrgKindID = '"
					+ this.visibleOrgKinds[i] + "')");
		}
		orgTreeData.setFilter("orgKindsFilter", orgKindsFilter.join(" or "));

		if ((range.length == 1) && (range[0] === "/")) {
			// TODO 当前的data还没有提供setTreeRootFilter的api
			// 当range指向根，显示全部
			// orgTreeData.setTreeRootFilter("SA_OPOrg.sParent is null");
			orgTreeData.refreshData();
		} else {
			var units = OrgUtils.orgUnitsFilterByKind(range,
					this.visibleOrgKinds);
			var tree = OrgUtils.orgUnitsToTree(units);
			var treeData = OrgUtils.orgUnitTreeToData(tree);
			orgTreeData.loadData(treeData);
		}

		this.loadOrgCommonGroup(range);

		this.comp("orgTree").refresh();
	};

	Model.prototype.initOrgListData = function(range) {
		var orgListData = this.comp("orgListData");
		orgListData.setFilter("validStateFilter", "SA_OPOrg.sValidState = 1");

		var orgKindsFilter = [ "1=0" ];
		for ( var i = 0; i < this.visibleOrgKinds.length; i++) {
			orgKindsFilter.push("(SA_OPOrg.sOrgKindID = '"
					+ this.visibleOrgKinds[i] + "')");
		}
		orgListData.setFilter("orgKindsFilter", orgKindsFilter.join(" or "));

		range = range || [];
		var rangeFilter = [ "1=0" ];
		if ((range.length == 1) && (range[0] === "/")) {
			rangeFilter.push("(1=1)");
		}else{
		
			for ( var i = 0; i < range.length; i++) {
				var orgKind = OrgUtils.getOrgKind(range[i].fid);
				if (orgKind == OrgKinds.ORGKIND_PERSONMEMBER) {
					rangeFilter.push("(SA_OPOrg.sFID = '" + range[i].fid + "')");
				} else {
					rangeFilter
							.push("(SA_OPOrg.sFID like '" + range[i].fid + "%')");
				}
			}
		}
		

		orgListData.setFilter("rangeFilter", rangeFilter.join(" or "));
	};

	Model.prototype.loadOrgCommonGroup = function(range) {
		var kindFilter = [ " 1=0 " ];
		for ( var i = 0; i < this.visibleOrgKinds.length; i++) {
			kindFilter.push("(SA_OPOrg.sOrgKindID = '"
					+ this.visibleOrgKinds[i] + "')");
		}
		var rangeFilter = [ " 1=0 " ];
		if ((range.length == 1) && (range[0] === "/")) {
			rangeFilter.push("(SA_OPOrg.sParent is NULL)");
		}else{
			for ( var i = 0; i < range.length; i++) {
				var orgKind = OrgUtils.getOrgKind(range[i].fid);
				if (orgKind == OrgKinds.ORGKIND_PERSONMEMBER) {
					rangeFilter.push("(SA_OPOrg.sFID = '" + range[i].fid + "')");
				} else {
					rangeFilter.push("(SA_OPOrg.sFID like '" + range[i].fid + "%')");
				}
			}
		}

		var validFilter = "SA_OPOrg.sValidState = 1";

		var filter = "((" + validFilter + ") and (" + kindFilter.join("or")
				+ ") and (" + rangeFilter.join("or") + "))";
		var orgTreeData = this.comp("orgTreeData");
		var groupData = OrgGroups.loadGroupRoot(orgTreeData.getColumnIDs(),
				filter, this.getContext());
		this.orgGroup2Row(groupData);
		orgTreeData.loadData(groupData, true);
	};

	Model.prototype.orgGroup2Row = function(group) {
		if (group.sOrgKindID && group.sOrgKindID.value === "group") {
			group.userdata['sys.loaded'] = true;
			group.userdata['sys.count'] = (group.rows || []).length;
			group.virtual = {
				value : true
			};
		}

		if (group.rows) {
			for ( var i = 0; i < group.rows.length; i++) {
				this.orgGroup2Row(group.rows[i]);
			}
		}
	};

	Model.prototype.initVisibleOrgKinds = function(kinds) {
		this.visibleOrgKinds = [];
		kinds = kinds || [];
		for ( var i = 0; i < kinds.length; i++) {
			var parents = OrgKinds.getParents(kinds[i], this.getContext());
			if (parents) {
				parents.push(kinds[i]);
				for ( var j = 0; j < parents.length; j++) {
					if (this.visibleOrgKinds.indexOf(parents[j]) == -1)
						this.visibleOrgKinds.push(parents[j]);
				}
			}
		}
	};

	Model.prototype.orgTreeDataRefreshCreateParam = function(event) {
		var parentID = event.source.getValue("SA_OPOrg");
		if (OrgGroups.isGroupOrgID(parentID)) {
			event.source.queryAction = OrgGroups.GROUP_QUERY_ACTION;
			;
			event.param.setString("parentID", parentID);
		} else {
			event.source.queryAction = "queryOrgAction";
			event.param.deleteParam("parentID");
		}

	};

	Model.prototype.searchBtnClick = function(event) {
		var contents = this.comp("contents");
		var searchData = this.comp("searchData");
		var text = searchData.getValue("text") || "";
		if (text) {
			contents.to("listContent");
			var searchFilter = "(SA_OPOrg.sName like '%" + text
					+ "%') or (SA_OPOrg.sCode like '%" + text + "%')";
			var orgListData = this.comp("orgListData");
			orgListData.setFilter("searchFilter", searchFilter);
			orgListData.refreshData();
			this.comp("orgList").refresh();
		} else {
			contents.to("treeContent");
		}
	};
	
	Model.prototype.isMultiSelection = function(){
		return this.multiSelection;
	};

	return Model;
});
