define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var Org = require("../js/org");
	var OrgUtil = Org.Util;
	var OrgCommonGroup = Org.CommonGroup;
	var Filter = require("$UI/system/components/justep/data/js/filter");

	var Model = function(){
		this.cacheKind = "";
		this.cascade = false;
		this.includeOrgKind = "";
		this.selectFilter = "";
		this.filter = "";
		this.includeDisabled = false;
		this.showCommonGroup = true;
		this.showFilterGird = justep.Bind.observable(false);
		this.isRootFilterByFIDs = false;		
		this.callParent();
	};
	
	Model.prototype.isCascade = function(){
		return this.comp('cbCascade').val();
	};
	
	Model.prototype.add = function(row){
		if(row instanceof Data.Row){
			if(this.doSelectFilter(row)){
				var data = this.comp('selectData');
				if(data.isExist(row.getID())) return;
				var defaultValue = {};
				$.each(data.defCols, function(col,v){
					defaultValue[col] = row.val(col);
				});
				data.newData({defaultValues:[defaultValue]});
			}
		}
	};
	
	Model.prototype.cascadeAddChildren = function(row){
		var ret = row;
		if(row instanceof Data.Row){
			if(this.isCascade()){
				var orgData = this.getOrgData();
				orgData.each(function(p){
					this.add(p.row);
					ret = p.row;
				},this,row);
			}
		}
		return ret;
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

	Model.prototype.selectGridRowDblClick = function(event){
		this.remove(event.row);
	};

	Model.prototype.orgGridRowDblClick = function(event){
		this.add(event.row);
		this.cascadeAddChildren(event.row);
	};

	Model.prototype.addAllBtnClick = function(event){
		var isSearch = this.showFilterGird.get();
		this.addAll(!isSearch?this.comp('orgData'):this.comp('orgSearchData'));
	};

	Model.prototype.removeAllBtnClick = function(event){
		this.clear();
	};

	Model.prototype.addBtnClick = function(event){
		var isSearch = this.showFilterGird.get();
		var orgGrid = !isSearch?this.comp('orgGrid'):this.comp('searchGrid');
		var rowid = orgGrid.getSelection(),row;
		if(rowid instanceof Data.Row) row = rowid;
		else{
			var orgData = !isSearch?this.comp('orgData'):this.comp('orgSearchData');
			row = orgData.getRowByID(rowid);
		}
		if(row){
			this.add(row);
			row = this.cascadeAddChildren(row);
			if(row instanceof Data.Row){
				row.data.to(row);
				row.data.next();
			}
		}
	};

	Model.prototype.removeBtnClick = function(event){
		var grid = this.comp('selectGrid');
		var row = grid.getSelection();
		var data = this.comp('selectData');
		if(row) data.deleteData(row,{async:true});
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
		orgTree.set({manageCodes:param.manageCodes});
		this.filter = param.filter;
		this.isRootFilterByFIDs = justep.Util.isArray(param.rootFilter);
		if (this.isRootFilterByFIDs){
			param.selectFilter = param.selectFilter ? ("(" +param.selectFilter + ") && !row.isVirtual" ) : ("!row.isVirtual"); 
		
			var fids = [];
			for (var i=0; i<param.rootFilter.length; i++){
				fids[i] = param.rootFilter[i].fid;
			}
			this.setSeachRootFitler(fids);
		}
		
		this.comp('cbCascade').val(!!param.cascade);
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
	
	Model.prototype.canSelect = function(row){
		if(row)	return this.doSelectFilter(row._row);
		else true;
	};
	
	Model.prototype.doSelectFilter = function(row) {
		//控制常用组标识节点不能选择
		if (!(row instanceof Data.Row && !row.val('isVirtual')))
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
			for(var i=0;i<selected.length;i++){
				this.add(selected[i]);
			}
		}
	};
	
	Model.prototype.windowReceiverReceive = function(event){
		if(event.data){
			if(event.data.selected){
				this.setSelected(event.data.selected);
			}
		}
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
		if(!this.isRootFilterByFIDs && !event.parent){
			//记录根
			var fids = [];
			var rows = event.source.getChildren();
			for(var i=0; i<rows.length; i++){
				fids[i] = rows[i].val('sFID');
			}
			this.setSeachRootFitler(fids);
		}
	};
	
	Model.prototype.setSeachRootFitler = function(fids){
		var searchRootFilters = [];
		for(var i=0; i<fids.length; i++){
			searchRootFilters.push("SA_OPOrg.sFID like '"+fids[i]+"%'");
		}
		var filter;
		if(searchRootFilters.length>0){
			filter = searchRootFilters.join(' OR ');
		}else{
			filter = "1>2";
		}			
		var searchData = this.comp('orgSearchData');
		searchData.setFilter('_search_root_filter_', filter);
	};
	
	Model.prototype.searchGridRowDblClick = function(event){
		this.add(event.row);
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
	
	Model.prototype.getOrgs = function(orgs){
		/*
		orgs = [ 
		{fid: "/ORG01.ogn/PSN01@ORG01.psm", fname: "/起步软件/system"},
		{fid: "/ORG01.ogn", fname: "/起步软件"}, 
		{fid: "/F92C257AEA094865A96DCB617482B37C.ogn/ED91E477DC6A470AA303F925DDAB0E37.ogn", fname: "/阳光集团（演示数据）/上海分公司"}
		];
		*/
		var result = {rows: [], userdata: {dataModel: "/system/data"}}; 
		var caches = {};
		
		var items = [],i,j;
		for (i=0; i<orgs.length; i++){
			var join = true;
			for (j=items.length-1; j>=0; j--){
				if ((orgs[i].fid.indexOf(items[j].fid) === 0) || (orgs[i].fid===items[j].fid)){
					join = false;
					break;
				}else if (items[j].fid.indexOf(orgs[i].fid) === 0){
					items.splice(j, 1);
				}
			}
			if (join){
				items.push(orgs[i]);
			}
		}
		
		for (i=0; i<items.length; i++){
			var fid = items[i].fid;
			var fname = items[i].fname;
			if (fid && fname){
				var fids = fid.split("/");
				var fnames = fname.split("/");
				
				var parentFID = null;
				var parentFName = null;
				//忽略第一项是""
				for (j=1; j<fids.length; j++){
					var curFID = parentFID ? (parentFID+"/"+fids[j]) : ("/"+fids[j]);
					var curFName = parentFName ? (parentFName+"/"+fnames[j]) : ("/"+fnames[j]);
					if (!caches[curFID]){
						var curId =  fids[j].substr(0, fids[j].lastIndexOf("."));
						var curName = fnames[j];
						var curOrgKindID = fids[j].substr(fids[j].lastIndexOf(".")+1);
						
						var parent = result;
						if (parentFID && caches[parentFID]){
							parent = caches[parentFID];
						}
						
						caches[curFID] = {
							SA_OPOrg: curId,
							sFID: curFID,
							sFName: curFName,
							sName: curName,
							sNodeKind: null,
							sOrgKindID: curOrgKindID,
							isVirtual: (curFID !== fid), //标识是否允许选中
							version: 0,
							userdata: {
								loaded: (curFID !== fid)
							},
							sParent: parent["SA_OPOrg"] || null,
							rows: []
						};
						
						parent.rows.push(caches[curFID]);
					}
					
					parentFID = curFID;
					parentFName = curFName;
				}
			}
		}
		return result;
	};
	
	Model.prototype.orgDataCustomRefresh = function(event){
		var data = event.source, model = this, orgTree = this.comp('orgTree'),org,parent,treeOption;
		//DEPT_CACHE ORG_CACHE
		if(this.cacheKind && !orgTree.get('manageCodes')){
			parent = event.options ? event.options.parent : null;
			treeOption = data.getTreeOption();
			treeOption.isDelayLoad = true;
			data.limit = -1;
			if(!parent){
				org = null;
				if (justep.Util.isArray(treeOption.rootFilter)){
					//hcr 支持流程对话框rootFilter传组织节点
					org = this.getOrgs(treeOption.rootFilter);
				}else{
					org = !treeOption.rootFilter?this.rootFilterOrgTree():(('string'!==typeof(treeOption.rootFilter))?this.rootFilterOrgTree(treeOption.rootFilter):null);
				}
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
			parent = event.options ? event.options.parent : null;
			treeOption = data.getTreeOption();
			if(!parent && this.isRootFilterByFIDs){
				//hcr 支持流程对话框rootFilter传组织节点
				org = this.getOrgs(treeOption.rootFilter);
				data.loadData(org, event.options ? event.options.append : false, event.options ? event.options.parent : null);
			}else{
				data.doRefreshData(event.options);
			}
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
	
	Model.prototype.filterChange = function(event){
		var v = event.source.val();
		if(!v) this.searchBtnClick();
	};
	
	return Model;
});
