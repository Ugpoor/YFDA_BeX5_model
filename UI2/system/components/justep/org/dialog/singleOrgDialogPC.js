define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var Grid = require("$UI/system/components/justep/grid/grid");
	var Org = require("../js/org");
	var OrgUtil = Org.Util;
	var OrgRow = Org.Row;
	var OrgCommonGroup = Org.CommonGroup;
	var Filter = require("$UI/system/components/justep/data/js/filter");
	

	var Model = function(){
		this.cacheKind = "";
		this.cascade = false;
		this.includeOrgKind = "";
		this.selectFilter = "";
		this.filter = "";
		this.includeDisabled = false;
		this.showFilterGird = justep.Bind.observable(false);
		this.showCommonGroup = true;
		this.initOK = justep.Bind.observable(false);
		
		this.canReturn = justep.Bind.computed(function(){
			if(!this.initOK.get()) return false;
			var v = this.getSelected();
			if(v.length===1 && this.doSelectFilter(v[0])) return true;
			else return false;
		},this);
		
		this.callParent();
	};
	
	Model.prototype.add = function(row){
		if(row instanceof Data.Row || row instanceof OrgRow){
			this.clear();
			var data = this.comp('selectData');
			if(data.isExist(row.getID())) return;
			var defaultValue = {};
			$.each(data.defCols, function(col,v){
				defaultValue[col] = row.val(col);
			});
			data.newData({defaultValues:[defaultValue]});
		}
	};
	
	Model.prototype.remove = function(row){
		var data = this.comp('selectData');
		data.deleteData(row,{async:true});
	};

	Model.prototype.clear = function(){
		var data = this.comp('selectData');
		data.clear();
	};
	
	Model.prototype.addAll = function(orgData){
		orgData.each(function(p){
			this.add(p.row);
		},this);
	};

	Model.prototype.getSelected = function(){
		var ret = [];
		var data = this.comp('selectData');
		data.each(function(p){
			ret.push(p.row);
		});
		return ret;
	};
	
	Model.prototype.OKBtnClick = function(event){
		this.comp('windowReceiver').windowEnsure(this.getSelected());
	};

	Model.prototype.modelModelConstructDone = function(event){
	};

/*
				limit : this.limit,
				rootFilter : this.rootFilter,
				selectFilter : this.selectFilter,
				includeOrgKind : this.includeOrgKind,
				manageCodes
				cascade: this.cascade
*/
	Model.prototype.setParam = function(param){
		var orgData = this.getOrgData(), orgTree = this.comp('orgTree');
		orgData.limit = param.limit;
		orgData.getTreeOption().rootFilter = param.rootFilter;
		this.filter = param.filter;
		orgTree.set({manageCodes:param.manageCodes});
		this.cascade = param.cascade;
		this.includeOrgKind = param.includeOrgKind;
		this.includeDisabled = param.includeDisabled;
		if (param.hasOwnProperty('showCommonGroup'))
			this.showCommonGroup = param.showCommonGroup;
		this.cacheKind = param.cacheKind;
		if('string'===typeof(this.includeOrgKind)){
			this.includeOrgKind = this.includeOrgKind.split(',');
		}
		if(this.selectFilter !== param.selectFilter){
			this.selectFilter = param.selectFilter;
			this.selectFilterExpr = new justep.Express(this.selectFilter);
		}
	};
	
	Model.prototype.doSelectFilter = function(row) {
		//控制常用组标识节点不能选择
		if((row instanceof Data.Row && (row.val('SA_OPOrg')==OrgCommonGroup.GROUP_ROOT_ID||!row.val('sCode')))||!(row instanceof Data.Row)) return false;
		if (this.selectFilterExpr instanceof justep.Express) {
			var m = 'function'==typeof(this.owner.getModel)?this.owner.getModel():this;
			var ctx = {
					$model : m,
					$row : row
			};
			return justep.Express.eval(this.selectFilterExpr, ctx.$row, ctx);
		}
		return true;
	};

	Model.prototype.reload = function(){
		this.getOrgData().refreshData();
	};
	
	Model.prototype.open = function(){
		this.getOrgData().open();
	};
	
	Model.prototype.getOrgData = function(){
		return this.comp('orgData');
	};
	
	Model.prototype.setSelected = function(selected) {
		this.clear();
		if ($.isArray(selected) && selected.length > 0) {
			selected = selected[0];
		}
		this.add(selected);
	};
	
	Model.prototype.windowReceiverReceive = function(event){
		if(event.data){
			if(event.data.selected){
				this.setSelected(event.data.selected);
			}
		}
		this.initOK.set(true);
	};
	
	Model.prototype.orgDataBeforeRefresh = function(event){
		this.setFilter(event.source);
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
			this.comp('searchGrid').autoSize();
		}else{
			this.showFilterGird.set(false);
			$(this.getElementsByXid('searchDiv')).css({height:0,position: 'absolute'});
			this.comp('orgTree').getTree().autoSize();
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
	
	Model.prototype.filterKeypress = function(event){
		if(event.keyCode===13){
			this.searchBtnClick();
		}
	};
	
	Model.prototype.orgDataAfterRefresh = function(event){
		if(!event.parent){
			//记录根
			var searchRootFilters = [];
			var rows = event.source.getChildren();
			for(var i=0; i<rows.length; i++){
				searchRootFilters.push("SA_OPOrg.sFID like '"+rows[i].val('sFID')+"%'");
			}
			if(searchRootFilters.length>0){
				var searchData = this.comp('orgSearchData');
				searchData.setFilter('_search_root_filter_', searchRootFilters.join(' OR '));
			}
		}
	};
	
	Model.prototype.orgGridRowSelect = function(event){
		this.searchGridRowSelect(event);
	};
	
	Model.prototype.searchGridRowSelect = function(event){
		var data = event.source.getData();
		var row = !Grid.isVirtualRoot(event.rowID)?data.getRowByID(event.rowID):new OrgRow({SA_OPOrg:event.rowID});
		this.add(row);
	};
	
	Model.prototype.searchGridBeforeRowSelect = function(event){
		/*
		var data = event.source.getData();
		var row = !Grid.isVirtualRoot(event.rowID)?data.getRowByID(event.rowID):new OrgRow({SA_OPOrg:event.rowID});
		event.cancel = !this.doSelectFilter(row);
		*/
	};
	
	Model.prototype.orgGridBeforeRowSelect = function(event){
		this.searchGridBeforeRowSelect(event);
	};
	
	Model.prototype.rootFilterOrgTree = function(filter,root){
		/*
		 * filter = {col:'sCode',value:['code1','code2']};
		 */
		var org = OrgUtil.getOrgTreeData();
		if(org){
			var ret = {rows:[]};
			if(filter){
				this.each(org.rows,function(row){
					var code = row[filter.col]?row[filter.col].value:undefined;
					var ok = false;
					$.each(filter.value,function(i,v){
						if(code==v){
							ok = true;
							return false;
						}
					});
					if(ok){
						row.rows = null;
						ret.rows.push(row);
						return false;
					}
				},root);
			}else{
				this.each(org.rows,function(row){
					row.rows = null;
					ret.rows.push(row);
				},true);
			}
			return ret;
		}
	};
	
	Model.prototype.each = function(rows,callback,single){
		var self = this;
		if($.isArray(rows) && $.isFunction(callback)){
			$.each(rows,function(i,r){
				var cancelC = false===callback(r);
				if(!single && !cancelC && r.rows) self.each(r.rows,callback);
			});
		}
	};
	
	Model.prototype.orgDataCustomRefresh = function(event){
		var data = event.source, model = this, orgTree = this.comp('orgTree');
		var parent = event.options ? event.options.parent : null;
		//DEPT_CACHE ORG_CACHE
		if(this.cacheKind && !orgTree.get('manageCodes')){
			var treeOption = data.getTreeOption();
			treeOption.isDelayLoad = true;
			data.limit = -1;
			if(!parent){
				var org = !treeOption.rootFilter?this.rootFilterOrgTree():(('string'!==typeof(treeOption.rootFilter))?this.rootFilterOrgTree(treeOption.rootFilter):null);
				if(org){
					data.loadData(org, event.options ? event.options.append : false, event.options ? event.options.parent : null);
				}else{
					treeOption.isDelayLoad = false;
					if('string'!==typeof(treeOption.rootFilter)){
						model._rootFilter = treeOption.rootFilter;
					}
					event.options.onLoad = function(evt){
						OrgUtil.setOrgTreeData(evt.rows);
						treeOption.isDelayLoad = true;
						if(model._rootFilter){
							evt.rows.rows = model.rootFilterOrgTree(model._rootFilter).rows;
						}
					};
					event.options.limit = -1;
					var _creatsParamfunc = function(event){
						event.param.setParam('cacheFilter',{});
					};
					data.on('onRefreshCreateParam', _creatsParamfunc);
					data.doRefreshData(event.options);
					data.off('onRefreshCreateParam', _creatsParamfunc);
				}
			}else{
				if('ORG_CACHE'==this.cacheKind && 'pos'==parent.val('sOrgKindID')){
					var _creatsPersonParamfunc = function(event){
						event.param.setParam('cacheFilter',{'sParent':[parent.getID()]});
					};
					data.on('onRefreshCreateParam', _creatsPersonParamfunc);
					data.doRefreshData(event.options);
					data.off('onRefreshCreateParam', _creatsPersonParamfunc);
				}else{
					var org1 = this.rootFilterOrgTree({col:'sParent',value:[parent.getID()]},false);
					if(org1) data.loadData(org1, event.options ? event.options.append : false, parent);
				}
			}
		}else{
			data.doRefreshData(event.options);
		}
		if(!parent && this.showCommonGroup){
			var filters = new Filter();
			this.setFilter(filters);
			var orgCommonGroupDatas = OrgCommonGroup.loadGroupRoot(this.getContext(),data.getColumnIDs(),filters.toString());
			data.loadData(orgCommonGroupDatas, true);
		}
	};
	
	Model.prototype.setFilter = function(filters){
		filters.setFilter('_dialog_ValidFilter_', OrgUtil.getValidFilter(this.includeDisabled));
		filters.setFilter('_OrgFilter_', this.filter?this.filter:'');
		filters.setFilter('_dialog_OrgKindFilter_', OrgUtil.getIncludeOrgKindFilter(this.includeOrgKind));
	};
	
	Model.prototype.orgDataRefreshCreateParam = function(event){
		var parent = event.options ? event.options.parent : null;
		var parentID = parent?parent.getID():null;
		if (parentID && OrgCommonGroup.isGroupOrgID(parentID)) {
			event.source.queryAction = "queryOrgCommonGroupAction";
			event.param.setString("parentID", parentID);
		} else {
			event.source.queryAction = "queryOrgAction";
			event.param.deleteParam("parentID");
		}
	};
	
	return Model;
});
