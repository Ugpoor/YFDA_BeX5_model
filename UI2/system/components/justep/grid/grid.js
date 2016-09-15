/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Data = require("$UI/system/components/justep/data/data");
	var DataFilter = require("$UI/system/components/justep/dataTables/js/dataFilter");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	var PopMenu = require("$UI/system/components/justep/popMenu/popMenu");
	var Store = require("$UI/system/lib/base/store");

	// 引入jqQrid
	require("./js/grid.css");
	require("./js/i18n/grid");
	require("./js/jqGrid.src");
	
	var url = require.normalizeName("./grid");
	var ComponentConfig = require("./grid.config");
	
	var TreeGridRow = justep.Object.extend({
		constructor : function(row, cols) {
			this._exp = {};
			this._expCols = cols || [];
			this._row = row;
		},
		isExpCol : function(col){
			return this._expCols.indexOf(col)>-1;
		},
		ref : function(name) {
			if(this.isExpCol(name)) return undefined;
			return this._row.ref(name);
		},
		val : function(name, value) {
			var isExpCol = this.isExpCol(name);
			if (arguments.length == 1)
				return !isExpCol?this._row.val(name):this._exp[name];
			else
				!isExpCol?this._row.val(name, value):(this._exp[name]=value);
		},
		_val:function(name,value){
			return this._row.val.apply(this._row,arguments);
		},
		label : function(name) {
			return !this.isExpCol(name)?this._row.label(name):name;
		},
		parent : function() {
			return this._row.parent();
		},
		hasChildren : function(){
			return this._row.hasChildren();
		},
		getID: function(){
			return this._row.getID();
		}
	});

	var EditorBindingObject = justep.Object.extend({
		constructor : function(grid) {
			this.grid = grid;
			this.model = grid.getModel();
		},
		getRow: function(){
			var data = this.grid.getData();
			if(data){
				var r = data.getCurrentRow();
				if(r) return r;
			}
			return {
					ref: function(){
						return new justep.BindComponent.NullValue();
					},
					value: function(){
						return '';
					}
				};
		},
		ref : function(name) {
			return this.getRow().ref(name);
		},
		val : function(name, value) {
			return this.getRow().val(name);
		}
	});

	var _treeExpCols = {
		"icon_field" : '_justep_grid_icon',
		"level_field" : '_justep_grid_level',
		"leaf_field" : '_justep_grid_leaf',
		"expanded_field" : '_justep_grid_expanded',
		"loaded" : '_justep_grid_loaded',
		"virtual_field" : '_justep_grid_virtual'
	};
	var virtualRootID = '_virtual_root_';
	var _treeExpColArray = [ _treeExpCols.expanded_field, _treeExpCols.icon_field, _treeExpCols.leaf_field, _treeExpCols.level_field,
			_treeExpCols.loaded, _treeExpCols.virtual_field];
	
	var Grid = justep.ViewComponent.extend({
		mixins : [ DataFilter ],
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this._eventHandles = {};
			this._idPrefix = justep.UUID.createUUID();//行id增加的前缀
			this.data = null;
			this._lastsel = null;
			this.editors = null;
			this.directEdit = true;
			this.filter = null;
			this.useVirtualRoot = false;
			this.virtualRootLabel = justep.Message.getMessage(justep.Message.JUSTEP231085);//'根';
			this.rowAttr = null;
			this.callParent(options);
		},
		dispose : function() {
			if (this._autoSizeHandel)
				window.clearTimeout(this._autoSizeHandel);
			$('body').off('click',this._eventHandles['cell_edit_click']);
			if(this._eventHandles['resize']) $(window).off('resize',this._eventHandles['resize']);
			if(this._eventHandles['model_resize']) this.getModel().off("onResize", this._eventHandles['model_resize'], this);
			this.$domNode.jqGrid('unbindKeys');
			this.$domNode.jqGrid('GridDestroy');
			var cellEditors = this.getCellEditors();
			if(cellEditors) this.getModel().removeNode(cellEditors);
			this.callParent();
		},
		
		buildTemplate : function(config) {
			this._cfg = config || {};
			if(!this._cfg.hasOwnProperty('footerrow')) this._cfg.footerrow = this._cfg.useFooter;
			if(!this._cfg.hasOwnProperty('rownumbers')) this._cfg.rownumbers = this._cfg.showRowNumber;
			if(!this._cfg.hasOwnProperty('rownumWidth')) this._cfg.rownumWidth = this._cfg.rowNumberWidth;
			if(!this._cfg.hasOwnProperty('colModel')) this._cfg.colModel = this._cfg.columns;
			this.data = this._cfg.data;
			if(this._cfg.rowAttr) this.rowAttr = this._cfg.rowAttr;
			if('directEdit' in this._cfg) this.directEdit = this._cfg.directEdit;
			if(this._cfg.useVirtualRoot) this.useVirtualRoot = this._cfg.useVirtualRoot;
			if(this._cfg.virtualRootLabel) this.virtualRootLabel = this._cfg.virtualRootLabel;
			if(this._cfg.filter) this.filter = this._cfg.filter;
			if(!this._cfg.xid) this._cfg.xid=justep.UUID.createUUID();
			if(!this._cfg.hiddenPager)this._cfg.pager = justep.UUID.createUUID();
			var str = '<table xid="'+this._cfg.xid+'" component="'+url+'"'+(config['class']?(' class="'+config['class']+'"'):'')+'/>'
					+ ((!this._cfg.hiddenPager && !this._cfg.treeGrid)?('<div xid="'+this._cfg.pager+'"/>'):'');
			return $(str);
		},

		// 初始化
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			//移出x-cell-control,grid不支持，使用高宽100%
			this.$domNode.removeClass('x-cell-control');
			
			this.$parent = this.$domNode.parent();
			var cfg = this._processCfg();
			this.fireEvent('onBeforeInit',{source:this,settings:cfg});
			this.$domNode.jqGrid(cfg);
			//过滤工具条
			if(cfg.useFilterBar) this.$domNode.jqGrid('filterToolbar',{searchOperators : true});
			//多表头处理,必须在冻结列前处理
			this.setGroupHeaders(cfg.groupHeaders);
			//冻结列
			if('number'===typeof(cfg.frozenColumnCount) && cfg.frozenColumnCount>0)this.setFrozenColumns();
			this._initBindEvent();
			//加载数据
			this.reload(this._getDatas());
			this.fireEvent('onInit', {source:this});
			this._processFooter();
		},

		_createCustomComp : function(value, options, parent, $grid){
			var CompCls = this.getModel()['_justep_Grid_custom_class_'][options['compType']];
			var cfg = options['compCfg'];
			cfg.parentNode = parent;
			var comp = new CompCls(cfg);
			$.jgrid.bindEv.call($grid, comp.domNode, options);
			var data = this.getData();
			if(data){//获取data的原始值
				var row = $(parent).parent('tr').prop('Row');
				if(row){
					var colRef = row.ref(options.name);
					if(colRef) value = colRef.get();
				}
			}
			comp.set({value:value});
			comp.$domNode.addClass('customelement editable');
			return "justep_comp";
		},
		
		_getCustomCompVal : function(elem, operation, value){
			var comp = this.getModel().comp(elem.get(0));
			if(comp){
				if (operation === 'get') {
					return comp.get('value')||"";
				} else if (operation === 'set') {
					comp.set({value:value});
				}
			}else return '';
		},
		
		_trRender : function($elem,value,title,options){
			$elem.attr(title);
			justep.Bind.utils.setHtml($elem.get(0),value);
		},
		
		_processColCfg : function(cfg){
			//colModel
			var frozenColumnCount = ('number'===typeof(cfg.frozenColumnCount) && cfg.frozenColumnCount>0)?cfg.frozenColumnCount:0;
			var self = this, isAppearanceTree = 'tree'===cfg.appearance;
			//保存原始列定义
			var colModel = cfg.colModel;
			var _oldColModel = [];
			this._oldColModel = _oldColModel;
			$.each(colModel, function(i, col){
				_oldColModel.push($.extend({},col));
			});
			//加载保存的布局
			var layout = this.loadLayout();
			if(layout){
				var getColIndex = function(colModel, name){
					var ret = -1;
					$.each(colModel, function(i, col){
						if(name==col.name){
							ret = i;
							return false;
						}
					});
					return ret;
				};
				$.each(layout, function(i, col){
					var index = getColIndex(colModel, col.name);
					if(index>-1){
						var colDef = colModel[index];
						colDef.hidden = col.hidden;
						colDef.width = col.width;
						if(colModel[i] && col.name!==colModel[i].name){
							colModel.splice(index, 1);
							colModel.splice(i, 0, colDef);
						}
					}
				});
			}
			var data = this.getData(), idColumn = data?data.idColumn:'', hasIdCol = false, defCols = data.defCols;
			$.each(cfg.colModel,function(i,v){
				if(v.width) v.fixed=true;
				if(defCols && data.isUICalculateCol(v.name) && cfg.serverSort){
					//UI计算列不支持排序
					v.sortable = false;
				}
				if(defCols && undefined===v.label){
					var dcol = defCols[v.name];
					if(dcol && dcol.label) v.label = dcol.label;
				}
				if(i<frozenColumnCount) v.frozen = true;
				if(idColumn===v.name){
					hasIdCol = true;
					v.key = true;
				}
				if(v.edittype==='comp'){
					v.edittype = 'custom';
					v['render'] = self._trRender.bind(self);
					v.editoptions = v.editoptions || {}; 
					v.editoptions['custom_element'] = self._createCustomComp.bind(self);
					v.editoptions['custom_value'] = self._getCustomCompVal.bind(self);
				}
				if(isAppearanceTree){//如果是tree展现，隐藏其他列
					v.hidden = v.name!==cfg.expandColumn;
				}
				if(v.formatoptions && v.formatoptions.thousandsSeparator=='#none#') v.formatoptions.thousandsSeparator='';
			});
			
			//增加id列，jqgrid依赖id
			if(!hasIdCol){
				cfg.colModel.push({
					name : idColumn,
					hidden : true,
					key: true
				});
			}
		},
		
		_processFooter: function(){
			if(this.getGridParam('footerrow')){
				var colModel = this.getGridParam('colModel');
				var self = this, footerData = {};
				$.each(colModel,function(i,v){
					if(v.footerData && !v.hidden){
						if(!v._footerDataExpr) v._footerDataExpr = new justep.Express(v.footerData);
						var ctx = justep.Bind.contextFor(self.domNode);
						ctx.$data = self.getData();
						footerData[v.name] = justep.Express.eval(v._footerDataExpr, ctx.$object, ctx);
						delete ctx.$data;
					}
				});
				if(!$.isEmptyObject(footerData)) this.setFooterData(footerData);
			}
			
			//增加关于下边框有无的计算
			if(!this.isTree() && $(this.domNode.grid.bDiv).innerHeight()>this.$domNode.height()) this.$domNode.addClass('x-border-bottom');
			else this.$domNode.removeClass('x-border-bottom');
		},
		_processCfg : function(){
			var self = this;
			var cfg = $.extend({
				idPrefix : this._idPrefix,
				datatype : "local",
				treedatatype : "local", 
				treeGridModel : 'adjacency',
				className : this.$domNode.attr('class'),
				headerMenu : '',				moveColumn :false, 
				scroll : 1,
				rowNum : 30,
				height : '500',
				sortable : true,
				viewrecords : true,
				serverSort : true,
				caption : "Grid",
				hiddenPager: true,
				footerrow: false,
				rowattr: function(trData, row, trID){
					if(self.rowAttr){
						if(!self._rowAttrExpr) self._rowAttrExpr = new justep.Express(self.rowAttr);
						var ctx = justep.Bind.contextFor(self.domNode);
						ctx.$row = row;
						var ret = justep.Express.eval(self._rowAttrExpr, ctx.$row, ctx);
						delete ctx.$row;
						return ret;
					}
				},
				gridComplete : function() {
					//进行Bind扫描,需要先处理,保证行编辑组件能正常使用行上bind的data.Row
					self.applyBindings();

					//非多选时同步data的当前行
					//if(!self.isMultiSelect()){
						if(!this.p || this.p.page>1) return;//智能渲染时加载非第一页不用设置游标
						var data = self.getData();
						if(data){
							var crow = data.getCurrentRow(true);
							if(crow){
								var rid = data.getRowID(crow);
								self.setSelection(rid);
							}
						}
					//}
				},
				afterInsertRow : function(idr,rd,cur){
					//记录行对象到tr
					var tr = self.$domNode.jqGrid('getGridRowById',idr);
					if(tr) tr.Row = cur;
				},
				beforeRequest : function(){
					//刷新grid
				},
				onGroupTextFormat : function(evtData){
					//var evtData = {groupValue:gv, summary:n.summary, groupText:grpText, count:n.cnt, groupIndex:n.idx+1};
					if(self.hasListener('onGroupTextRender')){
						evtData.source = self;
						self.fireEvent('onGroupTextRender', evtData);						
					}
				},
				onFormat : function(evtData){
					//rowID, colVal, html, colName, colIndex
					if(evtData.colVal instanceof Data.ErrorValue) evtData.html = evtData.colVal.value;

					var data = self.getData();
					var r; 
					if(data){
						r = data.getRowByID(evtData.rowID);
						if(r){//增加对data的extendType的支持
							var gridColDef = self.getColDef(evtData.colIndex);
							//var html = Data.getDisplayHtml(self.getModel(),r.ref(evtData.colName),{comp:self,type:'grid'});
							var html,model = self.getModel(),ref = r.ref(evtData.colName);
							var cellEditor = self.getCellEditor(evtData.colName);
							var context, colDef, fn;
							if(cellEditor && cellEditor.hasDisplayFunc() && !gridColDef.disableEditorDisplay){
								colDef = Data.getColDef(ref);
								context = new justep.ViewComponent.DisplayContext({comp:self,type:'grid',colDef:colDef,row:r,editor:cellEditor,readonly:!gridColDef.editable});
								fn = cellEditor.getDisplayHtml || cellEditor.getDisplayText;
								if('function'===typeof(fn))	html = fn.call(cellEditor,context);
							}else if(Data.getExtendTypeObject){
								var extendTypeObj = Data.getExtendTypeObject(model, ref);
								if(extendTypeObj){ 
									colDef = Data.getColDef(ref);
									var editorUrl = extendTypeObj.getEditor();
									var Editor = model.getEditorClass(editorUrl);
									if(Editor && (Editor.getDisplayHtml||Editor.getDisplayText)){
										context = new justep.ViewComponent.DisplayContext({comp:self,type:'grid',colDef:colDef,row:r,extendType:extendTypeObj,readonly:!gridColDef.editable});
										fn = Editor.getDisplayHtml || Editor.getDisplayText;
										if('function'===typeof(fn))	html = fn.call(Editor,context);
									}
								}
							}
							if(undefined!==html) evtData.html = html;
						}
					}
					if(self.hasListener('onCellRender')){
						evtData.source = self;
						evtData.row = r;
						self.fireEvent('onCellRender', evtData);						
					}
					if(evtData.colVal===virtualRootID){
						if(data){
							r = data.getRowByID(evtData.rowID);
							var v = r?r.val(evtData.colName):'';
							evtData.html = v?v:'';
						}
					}
				},
				onSelectRow : function(rowid, stat, e) {
					var data = self.getData();
					var r,oR;
					if (rowid && rowid !== self.lastsel) {
						self.editStop();
						var originalRowID = self.lastsel;
						var odRowID = self.ID2DataRowID(originalRowID),
							dRowID = self.ID2DataRowID(rowid);
						self.lastsel = rowid;
						if(data){
							r = data.getRowByID(dRowID);
							oR = data.getRowByID(odRowID);
						}
						self.fireEvent('onIndexChanged', {
							source : self,
							originalRowID : odRowID,
							originalRow : oR,
							rowID : dRowID,
							row : r
						});						
						if(data){data.to(r);}
					}
					if(self.hasListener('onRowSelect')){
						if(data)
							r = data.getRowByID(self.ID2DataRowID(rowid));
						self.fireEvent('onRowSelect', {
							source : self,
							rowID : self.ID2DataRowID(rowid),
							row: r
						});						
					}	
				}
			},this._cfg||this.$domNode.data('config'));
			//处理自动宽度
			if('100%'===cfg.width){
				delete cfg.width;// = this.$domNode.parent().innerWidth()-16;
				this.autoWidth = true;
			}
			if('100%'===cfg.height){
				delete cfg.height;// = this.$domNode.parent().innerWidth()-16;
				this.autoHeight = true;
			}
			if('auto'===cfg.height){
				cfg.scroll = false;
				cfg.rowNum = -1;
			}
			//分组逻辑,当使用分组时不能支持scroll和rowNum
			if(cfg.grouping || cfg.useGroupbar){
				cfg.scroll = false;
				cfg.rowNum = -1;
			}
			//固定列处理
			//如下情况不能固定列subGrid treeGrid cellEdit sortable scroll
			if('number'===typeof(cfg.frozenColumnCount) && cfg.frozenColumnCount>0){
				cfg.scroll = false;
				cfg.sortable = false;
				cfg.rowNum = -1;
			}
			//处理treeGrid/tree
			if('tree'===cfg.appearance||'treeGrid'===cfg.appearance){
				cfg.treeGrid = true;
				cfg.rownumbers = false;
			}
			//处理数据源data
			var data = this.getData();
			if(data){
				cfg['data'] = [];//初始使用空数据，grid组件创建完成后再加载数据
				if(cfg.treeGrid){//设置treeGrid的id列
					if(!data.isTree()){
						var msg = new justep.Message(justep.Message.JUSTEP231095,self.$domNode.attr('xid'));
						throw justep.Error.create(msg);
					}
					cfg.localReader = cfg.localReader||{};
					cfg.localReader.id = data.idColumn;
					var dataTreeOps = data.getTreeOption();
					cfg.treeReader = cfg.treeReader || {};
					//增加控制树的相关列
					$.extend(cfg.treeReader,_treeExpCols);
					cfg.treeReader["parent_id_field"] = dataTreeOps.parentRelation;
					cfg.treeGridModel = 'adjacency';
				}
			}
			//如果是tree目前不支持分屏渲染,分组
			if(cfg.treeGrid){
				cfg.scroll = 0;
				cfg.grouping = false;
				cfg.hasGroupbar = false;
			}
			//展现使用tree
			if('tree'===cfg.appearance){
				cfg.hasGroupbar = false;
				cfg.hiddenPager = true;
				cfg.hiddenCaptionbar = true;
				if(!cfg['width'] && !this.autoWidth)
					cfg.autoTreeWidth = true;
			}
			//处理pager
			if(cfg['pager']){
				//保证pager有ID，jqgrid要求
				var pager = this.$domNode.parent().children("div[xid='"+cfg['pager']+"']").attr('id',this.getModel().getIDByXID(cfg['pager']));
				cfg['pager'] = pager;
			}

			//处理列定义
			this._processColCfg(cfg);
			
			//增加cfg中的model
			cfg['model'] = this.getModel();
			return cfg;
		},
		moveColTo: function(index, to){
			//TODO 需要处理多表头、固定列
			var grid = this;
			var colModel = grid.getGridParam('colModel');
			var cols = $('table.x-grid-htable thead tr.x-grid-labels th.x-th-column', grid.domNode.grid.hDiv);
			var trs = $('table.x-grid-btable tbody tr', grid.domNode.grid.bDiv);
			var colDef = colModel[index];
			colModel.splice(index, 1);
			colModel.splice(to, 0, colDef);
			$(cols[index]).insertBefore(cols[to]);
			trs.each(function(){
				var tds = $('td',this);
				$(tds[index]).insertBefore(tds[to]);
			});
			if(grid.domNode.p.footerrow){
				var footRowCols = $('tr.footrow td', grid.domNode.grid.sDiv);
				$(footRowCols[index]).insertBefore(footRowCols[to]);
			}
		},
		_setCols: function(cols){
			var grid = this;
			var colModel = grid.getGridParam('colModel');
			$.each(cols, function(i, col){
				if(col.name!==colModel[i].name){
					var index = grid.getColIndex(col.name);
					grid.moveColTo(index,i,true);
				}
			});
		},
		showColDlg : function(){
			var grid = this;
			if (!this._showColDlg){
				this._showColDlg = new WindowDialog({
					title : justep.Message.getMessage(justep.Message.JUSTEP231114),
					showTitle : true,
					resizable : true,
					status: '',
					width: '70%',
					height: '70%',
					src : require.toUrl("$UI/system/components/justep/grid/dialog/column.w"),
					parentNode : this.getModel().getRootNode()
				});
				this._showColDlg.on('onReceive', function(evt) {
					var cols = evt.data;
					grid._setCols(cols);
					$.each(cols, function(i, col){
						grid[col.show?'showCol':'hideCol'](col.name);
					}); 
				}, this);
			}
			this._showColDlg.open({data : grid.getGridParam('colModel')});
		},
		getHeadMenu : function(){
			var grid = this;
			if (!this._headMenu){
				this._headMenu = new PopMenu({
					parentNode : this.getModel().getRootNode()
				});
				//headerMenu
				this._headMenu.set('opacity',0);
				this._headMenuItems = {};
				var menu = this._headMenu.getInnerMenu();
				if(menu){
					//隐藏列
					var btn = menu.addItem({label:justep.Message.getMessage(justep.Message.JUSTEP231112)});
					btn.on('onClick',function(){
						grid.hideCol(grid._headMenu._colName);
					});
					this._headMenuItems['hideColumn'] = [btn];
					//调整列
					btn = menu.addItem({label:justep.Message.getMessage(justep.Message.JUSTEP231114)});
					btn.on('onClick',function(){
						grid.showColDlg();
					});
					this._headMenuItems['setColumn'] = btn;
					//按列分组
					btn = menu.addItem({label:justep.Message.getMessage(justep.Message.JUSTEP231113)});
					btn.on('onClick',function(){
						grid.groupBy(grid._headMenu._colName);
					});
					this._headMenuItems['groupColumn'] = [btn];
					//保存布局
					btn = menu.addItem({label:justep.Message.getMessage(justep.Message.JUSTEP231115)});
					btn.on('onClick',function(){
						grid.saveLayout();
					});
					var saveBtns = [btn];
					//取消布局
					btn = menu.addItem({label:justep.Message.getMessage(justep.Message.JUSTEP231116)});
					btn.on('onClick',function(){
						grid.cancelLayout();
					});
					saveBtns.push(btn);
					this._headMenuItems['saveLayout'] = saveBtns;			
				}
			}
			return this._headMenu;
		},
		_getSaveLayoutKey: function(){
			var xid = this.$domNode.attr('xid');
			var url = justep.Shell.getActivePageXid();
			return url +'__'+ xid;
		},
		saveLayout: function(){
			var layout = [];
			var colModel = this.getGridParam('colModel');
			$.each(colModel, function(i, col){
				layout.push({name:col.name,hidden:col.hidden,width:col.width});
			});
			
			var key = this._getSaveLayoutKey();
			Store.set(key,layout);
		},
		cancelLayout: function(){
			var key = this._getSaveLayoutKey();
			Store.remove(key);
			var grid = this;
			grid._setCols(grid._oldColModel);
			$.each(grid._oldColModel, function(i, col){
				grid[col.hidden?'hideCol':'showCol'](col.name);
			}); 
		},
		loadLayout: function(){
			var key = this._getSaveLayoutKey();
			if(Store.has(key)) return Store.get(key);
		},
		isVirtualRoot : function(rowid){
			return virtualRootID==rowid;
		},
		
		getData : function(){
			if(this.data)
				return this.getDataByExpr(this.data);
		},
		
		ID2DataRowID : function(id){
			if(id){
				id = (''+id);
				if(0===id.indexOf(this._idPrefix))
					return id.substring(this._idPrefix.length);
			}
			return id;
		},
		applyBindings : function(){
			var isReady = justep.Bind.isBound(this.domNode);
			var self = this, gridview = this.getGridParam('gridview');
			if (isReady){
				//目前没有需要不进行bind
				//var context = justep.Bind.contextFor(this.domNode);
				this.$domNode.find('tr.jqgfirstrow ~ tr').each(function(){
					//目前没有需要不进行bind
					//if(!justep.Bind.isBound(this)) justep.Bind.applyBindings(context, this);
					//行上bind Row
					if(gridview) self._bindRowData(this);
				});
			}else if(gridview){
				this.$domNode.find('tr.jqgfirstrow ~ tr').each(function(){
					//行上bind Row
					self._bindRowData(this);
				});
			}	
		},
		
		_bindRowData : function(tr){
			if(!tr) return;
			var data = this.getData();
			if(data){
				var rowid = $(tr).attr('id');
				var row = data.getRowByID(this.ID2DataRowID(rowid));
				if(row) tr['Row'] = row;
			}
		},
		_getDatas : function(parent,offset){
			var datas = [];
			var data = this.getData();
			if(data){
				if(!this.getGridParam('treeGrid'))
					datas = data.datas.get().slice(0);
				else{
					//当是树时使用TreeGridRow中间结构，增加grid需要关于tree处理的列
					var treeOps = this.getGridParam('treeReader');
					var expandColumn = this.getGridParam('expandColumn');
					var dataTreeOps = data.getTreeOption();
					//创建tree的虚根节点
					if(this.useVirtualRoot && !parent){
						var defaultValue = {};
						defaultValue[data.idColumn] = virtualRootID;
						defaultValue[expandColumn] = this.virtualRootLabel;
						var row = data.add(defaultValue,null,true,true);
						var treeR = new TreeGridRow(row,_treeExpColArray);
						treeR.val(treeOps['level_field'], 0);
						treeR.val(treeOps['loaded'],true);
						treeR.val(treeOps['icon_field'],true);
						treeR.val(treeOps['expanded_field'],true);
						datas.push(treeR);
					}
					var self = this;
					data.each(function(p){
						if(offset && p.index<offset) return;
						var treeExpCols = _treeExpColArray;
						//增加虚根数据处理
						var hasVirtualRoot = (self.useVirtualRoot && !(p.parent instanceof Data.Row));
						if(hasVirtualRoot){
							treeExpCols = treeExpCols.slice(0);
							treeExpCols.push(treeOps['parent_id_field']);
						}
						var r = new TreeGridRow(p.row,treeExpCols), level = hasVirtualRoot?1:0;
						if(hasVirtualRoot){
							r.val(treeOps['parent_id_field'],virtualRootID);
						}
						if(p.parent instanceof Data.Row){
							level = p.parent['_tree_level_'] + 1;
							p.parent['__tree_grid_row__'].val(treeOps['loaded'],true);//设置加载标志
						}
						r.val(treeOps['level_field'], level);
						p.row['_tree_level_'] = level;//特殊处理，在行上保存了level
						p.row['__tree_grid_row__'] = r;//保存grid的行对象到data的row上
						//延迟加载时判断是否叶子节点和非延迟加载时是否有子数据
						if((dataTreeOps.isDelayLoad && data.isLeaf(p.row)) || (!dataTreeOps.isDelayLoad && !r.hasChildren()) || (dataTreeOps.isDelayLoad && data.isLoaded(p.row) && !r.hasChildren())){
							r.val(treeOps['leaf_field'],true);
						}
						r.val(treeOps['loaded'],!dataTreeOps.isDelayLoad ||(dataTreeOps.isDelayLoad && data.isLoaded(p.row)));
						r.val(treeOps['icon_field'],true);
						datas.push(r);
						
						//增加更多行
						if(!offset && dataTreeOps.isDelayLoad){
							var parentRow = p.row.parent();
							var pRows = parentRow?parentRow.rows.get():data.datas.get();
							if(data.hasMore(parentRow) && p.index + 1 === pRows.length){
								var moreR = new TreeGridRow(p.row, _treeExpColArray.concat([data.idColumn,expandColumn]));
								$.each(_treeExpColArray,function(i){
									moreR.val(_treeExpColArray[i], r.val(_treeExpColArray[i]));
									moreR.val(treeOps['leaf_field'],true);
									moreR.val(treeOps['virtual_field'],true);
									moreR.val(data.idColumn, Data.UUID());
									moreR.val(expandColumn, '更多......');
								});
								datas.push(moreR);
							}						
						}
					}, data, parent);
				}
				datas = this.doFilter(datas);
			}
			return datas;
		},
		getCellEditorsBindingObject: function(){
			if(!this._cellEditorsBindingObject) 
				this._cellEditorsBindingObject = new EditorBindingObject(this);
			return this._cellEditorsBindingObject;
		},
		getCellEditors: function(){
			return this.getModel().getElementByXid(this.editors);
		},
		getCellEditor: function(cellName){
			var t = this.getCellEditors();
			if(t){
				var $editor = $(t).children("div[col="+cellName+"]").children();
				if($editor.size()>0)
					return this.getModel().comp($editor[0]);
			}
		},
		editStop : function(){
			if(this._editCell){
				var data = this.getData();
				var t = this.getCellEditors();
				var $cellDiv = $(t).children("div[col="+this._editCell.cellName+"]");
				$(this._editCell.cell).off('keydown',this._eventHandles['cell_edit_keydown']).removeClass('x-grid-editing').children().each(function(){
					$cellDiv[0].appendChild(this);
				});

				if(this._editCell['isTreeExpandCol']){
					$(this._editCell.cell).append(this._editCell['html']);
				}

				var rid = data.getRowID(this._editCell.row);
				var values = {};
				values[this._editCell.cellName] = data.getValue(this._editCell.cellName,this._editCell.row);
				values.oper = 'update';
				this.$domNode.jqGrid('setRowData', this._idPrefix+rid, values);
				this._editCell = null;
			}
		},
		getNextCell: function(cell){
			if(!cell || cell.tagName.toUpperCase()!=='TD') return;
			var $cell = $(cell), $next = $(cell).next();
			if($next.size()>0) return $next[0];
			else {
				var $nextTR = $cell.closest('tr').next();
				if($nextTR.size()>0){
					var dataRow = $nextTR.prop('Row');
					if(dataRow && 'function'===typeof(dataRow.getID)) this.setSelection(dataRow.getID());
					return $nextTR.children('td:first')[0];
				}
			}
		},
		nextEditCell: function(cell){
			var nextCell = this.getNextCell(cell);
			if(nextCell){
				if(!this.editCell(nextCell)) this.nextEditCell(nextCell);
			}else{
				//最后一个单元格触发事件
				if(this.hasListener('onLastEditorPressEnter')){
					var evtData = {
						source : this,
						cell: cell
					};					
					this.fireEvent('onLastEditorPressEnter', evtData);
				}
			}
		},
		editCell: function(cell){
			if(!cell) return;
			//这里还可以增加readonly规则的处理
			var cellIndex=$.jgrid.getCellIndex(cell), colDef = this.getColDef(cellIndex),
			$cell = $(cell), $tr = $cell.closest('tr'),	cellName = colDef.name,
			dataRow = $tr.prop('Row'), data = this.getData(), 
			readonly = 'rn'!==cellName?(data?data.getReadonly(cellName, dataRow):false):true;
			//禁止编辑---增加当编辑器自身html有输出editor时
			if(!colDef || !colDef.editable || readonly || colDef.multiRowEditor || !dataRow) return false;
			//正在编辑直接返回
			if(this._editCell && this._editCell.cell===cell) return true;
			this.editStop();
			var t = this.getCellEditors(),hasEditor = false, domNodes=[];
			$(t).children("div[col="+cellName+"]").children().each(function(){
				$(this).addClass('x-grid-editer');
				domNodes.push(this);
				hasEditor = true;
			});
			if(hasEditor){
				this._editCell = {
					cell: cell,
					row: dataRow,
					cellIndex: cellIndex,
					cellName: cellName
				};
				if((this.isTreeGrid() && cellName === this.getGridParam('expandColumn'))){
					this._editCell['isTreeExpandCol'] = true;
					this._editCell['html'] = $cell.html();
				}

				$cell.addClass('x-grid-editing').empty();
				$.each(domNodes,function(i,v){
					cell.appendChild(v);
				});
				var self = this;
				this._eventHandles['cell_edit_keydown'] = function(evt){
					//up:38 down:40 left:37 right:39 Enter:13 esc:27
					switch(evt.keyCode) {
						case 38: break;
						case 40: return false;
						case 27: break;
						case 13: 
							if(evt.target.tagName.toUpperCase()==='TEXTAREA' || self.isGroupingField(cellName)) return;
							self.nextEditCell(cell);
							return false;
					}
				};
				//如果只有一个节点默认进入,可以考虑优化成进入input、textarea、select等组件
				if($cell.children().size()===1) $cell.children().addClass('x-edit-focusin');
				$cell.on('keydown',this._eventHandles['cell_edit_keydown']).find('.x-edit-focusin').focus();
				return true;
			}
		},
		_isParentComp: function(comp){
			if(!comp) return true;
			if(comp instanceof justep.ViewComponent){
				var domNode = comp.domNode,ret=false;
				this.$domNode.parents().each(function(){
					if(domNode===this){
						ret = true;
						return false;
					}
				});
				return ret;
			}
		},
		_initBindEvent : function(){
			var data = this.getData(), isTreeGrid = this.isTreeGrid();
			var self = this,model = this.getModel();
			if(isTreeGrid && 'true'==this.getGridParam('dragable')){
				this.$domNode.on('mousedown.'+this._idPrefix, 'tr.jqgrow', function(event){
					var tr = event.currentTarget;
					var row = $(tr).prop('Row');
					self.__dragData = {tr:tr,row:row,y:event.pageY,x:event.pageX};
				}).on('mouseup.'+this._idPrefix, 'tr.jqgrow', function(event){
					if(self.__dragData && self.__dragData.isStart){
						var dragData = self.__dragData;
						var tr = event.currentTarget;
						var row = $(tr).prop('Row');
						if(row && dragData.row && row.data===dragData.row.data){
							var row1 = (dragData.row instanceof TreeGridRow)?dragData.row._row:dragData.row;
							var row2 = (row instanceof TreeGridRow)?row._row:row;
							row.data.moveRowTo(row1, row2);
						}
					}
				});
				$('body').on('mousemove.'+this._idPrefix, function(event){
					if(self.__dragData){
						var dragData = self.__dragData;
						var dragStart = Math.max(Math.abs(dragData.y-event.pageY),Math.abs(dragData.x-event.pageX))>8;
						if(dragStart && !dragData.isStart){
							var $Root = model?$(model.getRootNode()):$('body');
							var name = dragData.row.val(self.getGridParam('expandColumn'));
							$Root.append("<div class='x-grid-grp-drag-item'><span>"+name+"</span><i/></div>");
							dragData.curGbox = $Root.children('.x-grid-grp-drag-item');
							dragData.isStart = true;
						}
						if(dragData.curGbox){
							dragData.curGbox.offset({top:event.pageY,left:event.pageX});
							if($(event.target).closest("tr.jqgrow").length === 1){
								dragData.curGbox.children('i').css({color:'green'}).addClass('icon-ios7-checkmark-outline').removeClass('icon-ios7-minus-outline');
							}else{
								dragData.curGbox.children('i').css({color:'red'}).addClass('icon-ios7-minus-outline').removeClass('icon-ios7-checkmark-outline');
							}
						}
						return false;
					}
				}).on('mouseup.'+this._idPrefix, function(event){
					if(self.__dragData){
						var dragData = self.__dragData;
						if(dragData.isStart) dragData.curGbox.remove();
						delete self.__dragData;
					}
				});
			}
			this.$domNode.jqGrid('bindKeys');
			this._eventHandles['cell_edit_click'] = function(evt){
				if(evt.originalEvent && !evt.originalEvent.$Grid_Edit_Cell_Click) self.editStop();
			};
			$('body').on('click',this._eventHandles['cell_edit_click']);
			if(this.autoWidth || this.autoHeight){
				this._eventHandles['resize'] = function(evt){
					self.autoSize();
				};
				$(window).on('resize', this._eventHandles['resize']);
				//接受模型的onResize事件进行grid大小变化
				this._eventHandles['model_resize'] = function(evt) {
					if (self._isParentComp(evt?evt.source:undefined))
						self.autoSize();
				};
				this.getModel().on("onResize", this._eventHandles['model_resize'], this);
			}
			this.$domNode.on('jqGridBeforeSelectRow', function(evt,rowid){
				if(self.hasListener('onBeforeRowSelect')){
					rowid = self.ID2DataRowID(rowid);
					var oRowID = self.ID2DataRowID(self.lastsel);
					var evtData = {
							source : self,
							originalRowID : oRowID,
							originalRow:data?data.getRowByID(oRowID):null,
							rowID : rowid,
							row:data?data.getRowByID(rowid):null,
							cancel : false
					};					
					self.fireEvent('onBeforeRowSelect', evtData);
					return !evtData.cancel;
				}
			}).click(function(evt){
				var td = evt.target;
				var ptr = $(td, self.domNode.rows).closest("tr.jqgrow");
				if(ptr.length === 0 ){return;}
				var evtData = {
						source : self,
						domEvent: evt,
						row: ptr.prop('Row'),
						rowID : self.ID2DataRowID(ptr.attr('id'))
					};					
				self.fireEvent('onRowClick', evtData);

				//编辑处理
				if(td.tagName.toUpperCase()!='TD') td = $(td).closest('td')[0];
				if(self.directEdit){
					if(self.editCell(td,ptr.prop('Row')))
						if(evt.originalEvent) evt.originalEvent.$Grid_Edit_Cell_Click = true;
				}
				//禁止在编辑状态时，点击退出编辑状态
				if(self._editCell && self._editCell.cell===td && evt.originalEvent) evt.originalEvent.$Grid_Edit_Cell_Click = true;
			}).dblclick(function(evt){
				var td = evt.target;
				var ptr = $(td, self.domNode.rows).closest("tr.jqgrow");
				if(ptr.length === 0 ){return;}
				var evtData = {
						source : self,
						domEvent: evt,
						row: ptr.prop('Row'),
						rowID : self.ID2DataRowID(ptr.attr('id'))
					};					
				self.fireEvent('onRowDblClick', evtData);

				//编辑处理
				if(!self.directEdit){
					if(td.tagName.toUpperCase()!='TD') td = $(td).closest('td')[0];
					if(self.editCell(td,ptr.prop('Row'))) return false;
				}else if(isTreeGrid){
					if(self.isExpanded(evtData.rowID)) self.collapseRow(evtData.rowID); 
					else self.expandRow(evtData.rowID);
				}
			}).on('jqGridReloaded',function(){
				self.fireEvent('onReload', {source:self});
			}).on('jqGridRowCheck',function(evt,rowid,checked){
				if(self.hasListener('onRowCheck')){
					//多选勾选前事件，可以使用cancel取消
					var dataRowid = self.ID2DataRowID(rowid);
					var evtData = {
							source:self,
							rowID:dataRowid,
							row:data?data.getRowByID(dataRowid):null,
							checked:checked,
							cancel:false
					};
					self.fireEvent('onRowCheck', evtData);
					return !evtData.cancel;
				}
			}).on('jqGridRowChecked',function(evt,rowid,checked){
				var rowID = self.ID2DataRowID(rowid);
				var row = data?data.getRowByID(rowID):null;
				//处理级联
				if(data && self.getGridParam('cascade')){
					if(row){
						var children = data.getChildren(row);
						if(children)
							for(var i=0;i<children.length;i++){
								self.setRowChecked(children[i].getID(),checked);
							}
						self._cascadeParent(row,checked);
					}
				}
				if(self.hasListener('onRowChecked')){
					//多选勾选事件
					self.fireEvent('onRowChecked', {source:self,rowID:rowID,row:row,checked:checked});
				}
			}).on('jqGridSelectAll',function(evt,rowids,checked){
				if(self.hasListener('onRowCheckedAll')){
					//多选勾选事件
					self.fireEvent('onRowCheckedAll', {source:self,checked:checked});
				}
			}).on('jqGridGroupingAppend jqGridGroupingDelete',function(evt,evtData){
				self.autoSize(true);
			});
			
			if(this.getGridParam('moveColumn')){
				this.$domNode.on('jqGridColumnDragMoveEnd',function(evt,index,to){
					self.moveColTo(index,to);
				});
			}
			if(this.getGridParam('headerMenu')){
				$(this.domNode.grid.hDiv).on('contextmenu',function(event){
					event.preventDefault();
					var td = event.target;
					var ci = $.jgrid.getCellIndex(td);
					var menu = self.getHeadMenu();
					if(menu){
						var headerMenu = self.getGridParam('headerMenu');
						headerMenu = headerMenu?headerMenu.split(','):[];
						menu.anchor = td;
						menu.direction = 'left-bottom';
						$.each(self._headMenuItems,function(n,v){
							if(headerMenu.indexOf(n)>=0){
								if($.isArray(v))
									$.each(v,function(i,btn){
										btn.$domNode.show();
									});
							}else{
								if($.isArray(v))
									$.each(v,function(i,btn){
										btn.$domNode.hide();
									});
							} 
						});
						menu._colName = self.getColName(ci);
						menu.show();
					}
				});
			}
			if(isTreeGrid){
				//派发渲染tree的图标事件
				this.$domNode.on('jqGridRenderTreeIcon',function(evt,evtData){
					if(self.hasListener('onTreeIconRender')){
						evtData.source = self;
						evtData.rowID = self.ID2DataRowID(evtData.rowID);
						evtData.row = data.getRowByID(evtData.rowID);
						self.fireEvent('onTreeIconRender',evtData);
					}
				}).on('jqGridCollapseRow',function(evt,rowid){
					if(self.hasListener('onCollapseRow')){
						var evtData = {source: self,
								rowID: rowid,
								row: data.getRowByID(rowid)};
						self.fireEvent('onCollapseRow',evtData);
					}
				}).on('jqGridExpandRow',function(evt,rowid){
					if(self.hasListener('onExpandRow')){
						var evtData = {source: self,
								rowID: rowid,
								row: data.getRowByID(rowid)};
						self.fireEvent('onExpandRow',evtData);
					}
				});
			}
			if(data){
				var colModel = this.getGridParam('colModel');
				//排序逻辑
				var serverSort = this.getGridParam('serverSort');
				this.$domNode.on('jqGridSortCol', function(evt,sortName, colIdx, sortOrder, lastSortIdx){
					if(serverSort){
						if(colModel[lastSortIdx]) data.setOrderBy(colModel[lastSortIdx].name);
						var colDef = colModel[colIdx];
						if(colDef){//特殊逻辑，这里设置的排序优先级最高
							data.setOrderBy(colDef.name);//清除原orderBy
							data.orderBys.unshift({relation:colDef.name,type:'asc'===sortOrder?1:0});
						}
						data.refreshData({async:true});
						return "stop";
					}
				});
				if(isTreeGrid){
					var treeOps = this.getGridParam('treeReader');
					var treeIcons = this.getGridParam('treeIcons');
					this.$domNode.on('jqGridExpandNode',function(evt,evtData){
						//展开行处理，加载数据，根据是否加载数据控制tree叶子节点显示
						self.setSelection(evtData.rowID);//选中行
						if(virtualRootID===evtData.rowID)return;
						var row = data.getRowByID(evtData.rowID);
						if (!data.isLoaded(row)){
							var confirmRefresh = data.confirmRefresh;
							self._appendData = true;
							try{
								data.confirmRefresh = false;
								data.refreshData({
									parent : row,
									append: true
								});
							}finally{
								data.confirmRefresh = confirmRefresh;
								self._appendData = false;
							}
							self.domNode.p._appendData = self._getDatas(row);
							self.domNode.p.insertBefore = false;
							if(!row.rows || row.rows.get().length<=0){
								//没有数据的时候控制行显示成叶子节点
								evtData.row[treeOps['leaf_field']] = true;
								$("div.treeclick", evtData.tr).removeClass(treeIcons.minus+" tree-minus");
							}
						}
					}).on('jqGridRenderTreeVirtualRow',function(evt,evtData){
						var row = data.getRowByID(evtData.row[treeOps['parent_id_field']]);
						$(evtData.tr.cells[evtData.expCol])
							.attr("colspan",colModel.length)
							.addClass("x-grid-tree-more");
						$(evtData.tr)
							.on('click',function(evt){
								var offset = data.getOffset(row);
								self._appendData = true;
								try{
									data.loadNextPageData({
										append : true,
										parent : row
									});
								}finally{
									self._appendData = false;
								}
								self.domNode.p._appendData = self._getDatas(row,offset);
								self.domNode.p.treeANode = evtData.tr.rowIndex;
								self.domNode.p.insertBefore = true;
								self.reload();
								if(!data.hasMore(row)){
									$(evtData.tr).remove();
								}
								return false;
						}).children("td:lt("+evtData.expCol+"),td:gt("+evtData.expCol+")").remove();
					});
				}
				data.on(Data.EVENT_VALUE_CHANGED, function(event){
					if(self.isGroupingField(event.col))
						self.reload();//如果有分组并且修改的列是分组列通过刷新grid进行渲染
					else{
						if(self._editCell && event.col===self._editCell.cellName && event.row===self._editCell.row){
							self._processFooter();
							return;
						}
						var rid = event.source.getRowID(event.row);
						var values = {};
						values[event.col] = Data.convert(event.value,event.source.defCols[event.col].type);
						values.oper = 'update';
						self.$domNode.jqGrid('setRowData', self._idPrefix+rid, values);
					}
					self._processFooter();
				});
				data.on(Data.EVENT_INDEX_CHANGED,function(event){
					//if(!self.isMultiSelect()){
						var rid = event.source.getRowID(event.row);
						self.setSelection(rid);
					//}
				});
				data.on(Data.EVENT_DATA_CHANGE,function(event){
					var rows,i;
					if(event.selfChanged
							&& (event.type === 'clear'
								|| event.type === 'refresh'
									|| event.type === 'exchangeRow'
									|| event.type === 'moveRow'
									|| event.type === 'remove'
										|| event.type === 'new'
											|| event.type === 'slaveDataChanged')){
						if(event.type === 'remove'){
							self.deleteRow(data.getRowID(event.row));
						}else if(event.type === 'moveRow' && self.isTreeGrid()){
							self.moveRowTo(event.row1, event.row2, event.after);
						}else if(event.type === 'new' && !self.isGrouping()){//分组只能重新刷新
							rows = event.rows;
							for(i=0;i<rows.length;i++){
								self.addRow(rows[i]);
							}
						}else if(event.type === 'slaveDataChanged'){
							if(self._eventHandles['__roload__']) window.clearTimeout(self._eventHandles['__roload__']);
							self._eventHandles['__roload__'] = window.setTimeout(function(){self.reload(self._getDatas());self._eventHandles['__roload__']=null;},10);
						}else if(!self._appendData){
							self.refresh();
						}
						self._processFooter();
					}
				});
			}
		},
		
		// 更新
		update : function(value, bindingContext) {
			//目前没有
		},
		_cascadeParent: function(row,checked){
			if(row instanceof Data.Row){
				var parent = row.parent();
				if(parent instanceof Data.Row){
					var children = parent.data.getChildren(parent);
					if(children){
						for(var i=0;i<children.length;i++){
							if(checked!==this.isChecked(children[i].getID()))
								//子全选中，父选中，有一个不选中父不选中
								if(checked) return;
								else break;
						}
						this.setRowChecked(parent.getID(),checked,false);
						this._cascadeParent(parent,checked);
					}
				}
			}
		},
		isMultiSelect : function(){
			return this.getGridParam('multiselect');
		},
		getSelection : function(){
			var ret = this.getGridParam('selrow');
			ret = this.ID2DataRowID(ret);
			return ret;
		},
		setSelection : function(rowid){
			this.$domNode.jqGrid('setSelection',this._idPrefix+rowid);
		},
		getCheckeds: function(){
			var ret = null;
			if(this.isMultiSelect()){
				ret = this.getGridParam('selarrrow').slice();
				if(ret){
					if($.isArray(ret)){
						for(var i=0; i<ret.length; i++){
							ret[i] = this.ID2DataRowID(ret[i]);
						}
					}
				}
			}
			return ret;
		},
		getCheckedRows: function(){
			var ret = null;
			if(this.isMultiSelect()){
				var ids = this.getGridParam('selarrrow').slice();
				ret = [];
				if(ids){
					if($.isArray(ids)){
						for(var i=0; i<ids.length; i++){
							ret[i] = $(this.$domNode.jqGrid('getGridRowById',ids[i]), this.domNode.rows).closest("tr.jqgrow").prop('Row');
						}
					}
				}
			}
			return ret;
		},
		isGroupingField: function(col){
			var grouping = this.getGridParam('grouping');
			var grp = this.getGridParam('groupingView');
			return grouping && $.isArray(grp.groupField) && $.inArray(col,grp.groupField)>-1;
		},
		isChecked: function(rowid){
			var pt = this.getRowByID(rowid);
			if(pt)
				return $.inArray(pt.id,this.domNode.p.selarrrow)!==-1;
		},
		setRowChecked: function(rowid,checked,onsr){
			onsr = onsr === false ? false : true;
			var pt = this.getRowByID(rowid);
			if(pt){
				var b = $.inArray(pt.id,this.domNode.p.selarrrow)===-1;
				checked = !!checked;
				if(checked===b)
					this.$domNode.jqGrid('setRowChecked',this._idPrefix+rowid,onsr);
			}
		},
		setHeadCheckBox: function(checked){
			this.domNode.setHeadCheckBox(checked);
		},
		selectVirtualRoot: function(){
			this.setSelection(virtualRootID);
		},
		autoSize: function(force){
			if (this._autoSizeHandel)
				window.clearTimeout(this._autoSizeHandel);
			var self = this, b = force;
			this._autoSizeHandel = window.setTimeout(function(){
				if(self.$parent.is(':hidden')){
					self._autoSizeHandel = null;
					return;
				}
				var overflow = self.$parent[0].style.overflow,resize=false;
				self.$parent[0].style.overflow = "visible";
				try{
					if(self.autoHeight){
						var h = self.$parent.height();
						if(h!=self._parentHeight || b){//判断旧的高度
							self._parentHeight = h;
							self.setHeight(h);//两个像素边框
							resize=true;
						}
					}
					if(self.autoWidth){
						var w = self.$parent.width();
						if(w!=self._parentWidth || b){//判断旧的宽度
							self._parentWidth = w;
							self.setWidth(w);//两个像素边框
							resize=true;
						}
					}
					if(resize){
						//还原树形垂直滚动条
						self.setGridParam({'_hasScrollWidth':false});
					}
					var frozenColumnCount = self.getGridParam('frozenColumnCount');
					if('number'===typeof(frozenColumnCount) && frozenColumnCount>0){
						//刺激固定列重新计算
						self.destroyFrozenColumns();
						self.setFrozenColumns();
					}
				}finally{
					self._autoSizeHandel = null;
					self.$parent[0].style.overflow = overflow;
				}
			},200);//延迟高宽计算
		},
		reload : function(data){
			this.editStop();
			if(data)this.$domNode.jqGrid('setGridData',data);
			//清除相关状态
			this.domNode.grid.prevRowHeight = null;
			this.domNode.p.page = 1;
			this.$domNode.trigger("reloadGrid");
			this.autoSize();
		},
		refresh: function(){
			var chs = this.getCheckeds();
			this.domNode.p.insertBefore = false;//还原插入模式
			this.reload(this._getDatas());
			if($.isArray(chs)){
				var me = this;
				$.each(chs,function(i,v){
					me.setRowChecked(v, true, false);
				});
			}
		},
		isExpanded: function(rowid){
			var pos = this.domNode.p._index[rowid];
			return this.domNode.p.data[pos][_treeExpCols.expanded_field];
		},
		_expandRow: function(rowid,expand){
			if(this.isExpanded(rowid)!=expand)
				$(this.getRowByID(rowid)).find("div.treeclick").click();			
		},
		expandRow: function(rowid){
			this._expandRow(rowid,true);
		},
		_expandLevel: function(children,level,i){
			if($.isArray(children) && level>i){
				var grid = this;
				$.each(children, function(j,v){
					grid.expandRow(v.getID());
					var row = v;
					var rows = row.rows.peek();
					if($.isArray(rows) && rows.length>0){
						grid._expandLevel(rows,level,i+1);
					}
				});
			}
		},
		expandLevel: function(level){
			if(this.isTreeGrid() && level>0){
				var i=0;
				if(this.useVirtualRoot){
					this.expandRow(virtualRootID);
					i++;
				}
				var data = this.getData();
				if(data.isTree()){
					var rows = data.datas.peek();
					this._expandLevel(rows,level,i);
				}
			}
		},
		expandAll: function(){
			if(this.isTreeGrid()){
				if(this.useVirtualRoot) this.expandRow(virtualRootID);
				var data = this.getData();
				if(data.isTree()){
					var grid = this;
					data.each(function(param){
						grid.expandRow(param.row.getID());
					});
				}
			}
		},
		collapseAll: function(){
			if(this.isTreeGrid()){
				var data = this.getData();
				if(data.isTree()){
					var rowIDs = [];
					if(this.useVirtualRoot) rowIDs.push(virtualRootID);
					data.each(function(param){
						if(param.row.hasChildren()) rowIDs.push(param.row.getID());
					});
					for(var i=rowIDs.length-1; i>=0; i--){
						this.collapseRow(rowIDs[i]);
					}
				}
			}
		},
		collapseRow: function(rowid){
			this._expandRow(rowid,false);
		},
		expandByIDPath: function(path){
			var list;
			if(typeof path=='string'){
				path = justep.String.trim(path);
				if(path === "") return false;
				if(path.charAt(0)==='/') path = path.substring(1);
				list = path.split("/");
			}else if($.isArray(path)) list = path; 
			else return false;
			for(var i=0;i<list.length;i++){
				this.expandRow(list[i]);
			}
		},
		getRowByID: function(rowid){
			return this.$domNode.jqGrid('getGridRowById',this._idPrefix+rowid);
		},
		getDataRow: function(node){
			return $(node, this.domNode.rows).closest("tr.jqgrow").prop('Row');
		},
		getGridParam: function(name){
			return this.$domNode.jqGrid('getGridParam',name);
		},
		setGridParam: function(param){
			this.$domNode.jqGrid('setGridParam',param);
		},
		isTreeGrid: function(){
			return this.getGridParam('treeGrid');
		},
		isTree: function(){
			return this.isTreeGrid() && 'tree'===this.getGridParam('appearance');
		},
		isGrouping: function(){
			return this.getGridParam('grouping');
		},
		deleteRow: function(rowid){
			var isTreeGrid = this.isTreeGrid(),tr,parent,treeOps,treeIcons;
			if(isTreeGrid){
				tr = this.getRowByID(rowid);
				parent = (tr && tr.Row)?tr.Row.parent():null;
			}
			this.$domNode.jqGrid("delRowData",this._idPrefix+rowid,true);
			//增加tree时子删除完后修改父的显示状态
			if(isTreeGrid && parent && !parent.hasChildren()){
				treeOps = this.getGridParam('treeReader');
				treeIcons = this.getGridParam('treeIcons');
				parent[treeOps['leaf_field']] = true;
				tr = this.getRowByID(parent.getID());
				$("div.treeclick", tr).removeClass(treeIcons.minus+" tree-minus");
			}
		},
		moveRowTo: function(r1,r2,after){
			if(this.isTreeGrid()){
				var id1 = r1.getID();
				var id2 = r2.getID();
				this.$domNode.jqGrid('moveNode',id1,id2,after);
			}
		},
		addRow: function(r){
			var rid = r.data.getRowID(r),tr;
			if(this.isTreeGrid()){
				var parent = r.parent(), pid = null, 
					treeExpCols = _treeExpColArray.slice(0);
				if(parent){
					pid = r.data.getRowID(parent);
					this.expandRow(pid);//先展开行在进行数据增加，依赖data请求数据的同步操作
					var treeOps = this.getGridParam('treeReader');
					if(parent[treeOps['leaf_field']]){
						var treeIcons = this.getGridParam('treeIcons');
						parent[treeOps['leaf_field']] = false;
						tr = this.getRowByID(parent.getID());
						$("div.treeclick", tr).addClass(treeIcons.minus+" tree-minus");
					}
				}else if(this.useVirtualRoot){
					pid = virtualRootID;
				}
				if(!this.getRowByID(rid)){
					tr = new TreeGridRow(r,treeExpCols);
					this.$domNode.jqGrid("addChildNode",rid,pid,tr,true);
				}
			} else {
				this.$domNode.jqGrid("addRowData",rid,r);
			}
		},
		hideCol: function(col){
			var colDef = this.getColDef(this.getColIndex(col));
			if(!colDef.hidden){
				this.$domNode.jqGrid('hideCol',col);
				this.autoSize(true);
			}
		},
		showCol: function(col){
			var colDef = this.getColDef(this.getColIndex(col));
			if(colDef.hidden){
				this.$domNode.jqGrid('showCol',col);
				this.autoSize(true);
			}
		},
		groupBy: function(col){
			this.$domNode.jqGrid('groupingAppend',col);
		},
		groupByRemove: function(col){
			this.$domNode.jqGrid('groupingDelete',col);
		},
		setCaption: function(caption){
			this.$domNode.jqGrid('setCaption',caption);
		},
		setLabel: function(colname, label, css, attr){
			this.$domNode.jqGrid('setLabel', colname, label, css, attr);
		},
		setCell: function(rowid,col,css,attr){
			this.$domNode.jqGrid('setCell',this._idPrefix+rowid,col,'',css,attr);
		},
		getCell: function(rowid,col){
			var pos;
			if(isNaN(col)) {
				var colModel = this.getGridParam('colModel');
				$(colModel).each(function(i){
					if (this.name === col) {
						pos = i;return false;
					}
				});
			} else {pos = parseInt(col,10);}
			if(pos>=0) {
				var ind = this.getRowByID(rowid); 
				if (ind){
					var tcell = $("td:eq("+pos+")",ind);
					return tcell.size()>0?tcell[0]:undefined;
				}
			}
		},
		setColWidth: function(col,width){
			this.$domNode.jqGrid('colWidth',col,width);
		},
		getColWidth: function(col){
			var index = this.getColIndex(col);
			var def = this.getColDef(index);
			return def?def.width:0;
		},
		getHeaderHeight: function(){
			var h = $(this.domNode.grid.cDiv).outerHeight(true);
			if(this.getGridParam('useGroupbar')) {
				h = h + $(this.domNode.grid.gDiv).outerHeight(true);
			}
			h = h + $(this.domNode.grid.hDiv).outerHeight(true);
			if(this.getGridParam('toppager')) {
				h = h + $(this.domNode.grid.topDiv).outerHeight(true);
			}
			var p = this.getGridParam('toolbar');
			if(p[0] === true) {
				if(p[1] !== "bottom") {
					h = h + $(this.domNode.grid.uDiv).outerHeight(true);
				}
			}
			return h;
		},
		getFooterHeight: function(){
			var h = $(this.domNode.grid.sDiv).outerHeight(true);
			return h;
		},
		setHeight: function(height){
			var h = height-this.getHeaderHeight()-this.getFooterHeight()-2;
			this.$domNode.jqGrid('setGridHeight',h>0?h:0);
		},
		getHeight: function(){
			return $(this.domNode.grid.bDiv).outerHeight(true)+this.getHeaderHeight()+this.getFooterHeight()+2;
		},
		setWidth: function(width){
			this.$domNode.jqGrid('setGridWidth',width-2);
		},
		getWidth: function(){
			return this.domNode.p.width;
		},
		destroyFrozenColumns: function(){
			this.$domNode.jqGrid('destroyFrozenColumns');
		},
		setFrozenColumns: function(){
			this.$domNode.jqGrid('setFrozenColumns');
		},
		setGroupHeaders: function(cfg){
			if(cfg && cfg.length>0){
				this.destroyGroupHeader();
				var ghl = cfg.length;
				for(var i=0;i<ghl;i++){
					var ghs = [],gh=cfg[i];
					for(var j=0;j<gh.length;j++){
						ghs.push({
							startColumnName:gh[j].startColumn,
							numberOfColumns:gh[j].columnCount,
							titleText:gh[j].titleText
						});
					}
					var o = {
						useColSpanStyle:true,
						rowspan:ghl+1,
						groupHeaders:ghs
					};
					this.$domNode.jqGrid('setGroupHeaders',o);
				}
			}
		},
		setFooterData: function(fData){
			this.$domNode.jqGrid('footerData','set',fData);
		},
		destroyGroupHeader: function(){
			this.$domNode.jqGrid('destroyGroupHeader');
		},
		getColName: function(index){
			return this.getColDef(index).name;
		},
		setRowCss: function(rowid,css){
			$(this.getRowByID(rowid)).css(css);
		},
		getColDef: function(index){
			var colModel = this.getGridParam('colModel');
			return colModel[index];
		},
		getCellIndex: function(cell){
			var td = cell;
			if(td.tagName.toUpperCase()!='TD') td = $(td).closest('td')[0];
			return $.jgrid.getCellIndex(td);
		},
		getColIndex: function(colName){
			return this.$domNode.jqGrid('getColIndex',colName);
		}
	});

	Grid.isVirtualRoot = function(rowid){
		return virtualRootID==rowid;
	};
	
	Grid.virtualRootID = virtualRootID;
	justep.Component.register(url, Grid);
	return Grid;
});