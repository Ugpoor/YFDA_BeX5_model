define(function(require) {
	require('css!../css/panel').load();
	
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
		this.showFilterGird = justep.Bind.observable(false);
		this.showFilterGird2 = justep.Bind.observable(false);
		this.searchResult = [];
	};

	Model.prototype.navsClick = function(event){
		this.comp("contents").to(event.index);
		if (event.index == 1) {
			this.comp("funcTreeData").open();
		}
	};

	Model.prototype.orgTreeDataIndexChanged = function(event) {
		this.comp("permissionByOrgData").refreshData();
	};

	Model.prototype.permissionByOrgDataRefreshCreateParam = function(event) {
		var orgTreeData = this.comp("orgTreeData");
		var orgSearchData = this.comp('orgSearchData');
		var orgFID = "";
		if(this.showFilterGird.get() === false){
			orgFID= orgTreeData.getValue("sFID");
		}else{
			orgFID= orgSearchData.getValue("sFID");
		}
		event.param.setString("orgFID", orgFID);
		event.param.setBoolean("includeInherited", true);
	};

	Model.prototype.funcTreeDataCustomRefresh = function(event) {
		biz.Request.sendHttpRequest({
			"contentType" : "application/json",
			"url" : require.toUrl("$UI/SA/OPM/dialogs/selectFunction/getFunctionData.j?mode=tree"),
			"callback" : function(xhr, ts) {
				if (biz.Request.isSuccess(xhr)) {
					event.source.loadData(xhr.responseJSON);
				}
			}
		});
	};

	Model.prototype.funcTreeDataIndexChanged = function(event) {
		this.comp("orgByPermissionData").refreshData();
	};

	Model.prototype.orgByPermissionDataRefreshCreateParam = function(event) {
		var funcData = this.comp("funcTreeData");
		var funcListData = this.comp('funcListData');
		var process = "";
		var activity = "";
		if(this.showFilterGird2.get() === false){
			process = funcData.getValue("process");
			activity = funcData.getValue("activity");
		}else{
			process = funcListData.getValue("process");
			activity = funcListData.getValue("activity");
		}
		event.param.setString("process", process);
		event.param.setString("activity", activity);
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
			this.comp('orgTreePC').getTree().autoSize();
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
	

	
	

	Model.prototype.filterChange1 = function(event){
		var v = event.source.val();
		if(!v) this.searchClick();
	};
	

	
	

	Model.prototype.filterKeypress1 = function(event){
		if(event.keyCode===13){
			this.searchClick();
		}
	};
	

	
	

	Model.prototype.searchClick = function(event){
		
		var inputFilter = this.comp('filter2');
		var v = inputFilter.$domNode.val();
		if(v){
			this.showFilterGird2.set(true);
			$(this.getElementsByXid('searchDiv2')).css({height:'100%',position: 'relative'});
			this.comp('funcListData').refreshData();
			this.searchResult.length = 0;
			this.comp('searchGrid2').reload();
			if(this.searchResult.length > 0){
				this.comp('funcListData').to(this.searchResult[0]);
			}
			
		}else{
			this.showFilterGird2.set(false);
			$(this.getElementsByXid('searchDiv2')).css({height:0,position: 'absolute'});
			
		}
	};
	
	Model.prototype.filter = function(row){
			var inputFilter = this.comp('filter2');
			var v = inputFilter.$domNode.val();
			if(row.val('label').indexOf(v) == -1){
				return false;
			}else{
				this.searchResult.push(row);
				return true;
			}
	}
	

	

	Model.prototype.funcListDataCustomRefresh = function(event){
		biz.Request.sendHttpRequest({
			"contentType" : "application/json",
			"url" : require.toUrl("$UI/SA/OPM/dialogs/selectFunction/getFunctionData.j?mode=list"),
			"callback" : function(xhr, ts) {
				if (biz.Request.isSuccess(xhr)) {
					event.source.loadData(xhr.responseJSON);
				}
			}
		});
	};
	

	
	

	Model.prototype.orgSearchDataIndexChanged = function(event){
		this.comp("permissionByOrgData").refreshData();
	};
	

	
	

	Model.prototype.funcListDataIndexChanged = function(event){
		this.comp('orgByPermissionData').refreshData();
	};
	
	

	return Model;
});