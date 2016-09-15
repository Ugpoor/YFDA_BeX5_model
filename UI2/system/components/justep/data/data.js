/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Bind = justep.Bind;
	var Model = justep.ModelBase;
	var Expr = justep.Express;
	var Rules = require("./js/rules");
	var ExtendType = require("./js/extendType");

	require("$UI/system/lib/bind/bind.validation");
	require('$UI/system/resources/system.res');

	var Row = justep.Object.extend({
		constructor : function(data, row) {
			this.data = data;
			this.row = row;
		},
		ref : function(name) {
			var col = this.row[name];
			return col?col.value:undefined;
		},
		val : function(name, value) {
			if (arguments.length == 1)
				return this.data.getValue(name, this);
			else
				this.data.setValue(name, value, this);
		},
		oval : function(name){
			return this.data.getOriginalValue(name, this);
		},
		label : function(name) {
			return this.data.label(name);
		},
		parent : function() {
			return this.row.userdata ? this.row.userdata.parent : undefined;
		},
		index: function(){
			return this.data.getRowIndex(this);
		},
		hasChildren : function(){
			return this.rows && this.rows.get().length>0;
		},
		getChildren : function(){
			return this.children();
		},
		children : function(){
			return this.rows?this.rows.get():undefined;
		},
		getID: function(){
			return this.data.getRowID(this);
		},
		assign: function(row,cols){
			if(row instanceof Row){
				var col, ref;
				if($.isArray(cols)){
					for(var i=0; i<cols.length; i++){
						col = cols[i];
						ref = row.ref(col);
						if(Bind.isObservable(ref))
							this.val(col, ref.peek());
					}
				}else{
					for(col in this.data.defCols){
						ref = row.ref(col);
						if(Bind.isObservable(ref))
							this.val(col, ref.peek());
					}
				}
			}
		},
		cancelUpdates : function(noFireEvent){
			var data = this.data;
			data.disableRecordChange();
			try {// 特殊删除，解决关联计算触发问题
				var row = this.row,b=false;
				var recordState = row.userdata.recordState;
				if (Data.STATE.EDIT == recordState) {
					b=true;
					for ( var k in data.defCols) {
						var def = data.defCols[k];
						//要判断是不是有计算规则,UI计算列
						if (!data.isUICalculateCol(k) && !(def.calculate instanceof Expr) && row[k].changed){
							row[k].changed = 0;
							row[k].value.set(row[k].originalValue);
						}
					}
				}else if (Data.STATE.NEW == recordState) {
					b=true;
					data.remove(row);
				}
				if(b){
					row.userdata.recordState = Data.STATE.NONE;
					if(!noFireEvent){
						var eventData = {};
						eventData.source = data;
						eventData.changedSource = data;
						eventData.type = 'cancel';
						eventData.selfChanged = true;
						data.doDataChanged(eventData);
					}
				}
			} finally {
				data.enabledRecordChange();
			}
		}, 
		toJson : function(option) {
			option = option || {};
			return this.data._row2Json(this,option.excludeCalculateCol,option.excludeCols,option.format==='simple');			
		}
	});

	var date2Val = function(v){
		return v instanceof Date?justep.Date.toString(v, justep.Date.STANDART_FORMAT_SHOT):v; 
	};
	
	var time2Val = function(v){
		return v instanceof Date?justep.Date.toString(v, justep.Date.STANDART_TIME_FORMAT):v; 
	};
	
	var dateTime2Val = function(v){
		return v instanceof Date?justep.Date.toString(v, justep.Date.STANDART_FORMAT):v; 
	};

	var Data = justep.ModelComponent
			.extend({
				constructor : function(model, config) {
					this.callParent();

					this.clz = Data;
					this.autoLoad = false;
					this.autoNew = false;
					this.isMainData = false;
					this.delim = ",";
					this.versionRelation = "version";
					this.updateMode = 'whereVersion';
					this.distinct = null;
					// tree定义
					this.defTreeOption = {
						'isTree' : false
					};
					this.orderBys = [];
					this.userdata = {};

					this.directDeleteMode = false;// 是否直接删除，默认false
					this.confirmDelete = true;
					this.confirmDeleteText = justep.Message.getMessage(justep.Message.JUSTEP231000);

					this.confirmRefresh = true;
					this.confirmRefreshText = justep.Message.getMessage(justep.Message.JUSTEP231001);

					this.offset = 0;
					this.limit = 20;
					this.dataType = 'json';
					// var self = this;

					this.xid = config ? config.xid : "";

					// this.indexParent = null;
					// this.index = -1;//this.indexParent+this.index唯一定位一行
					this.currentRow = Bind.observable();

					this.datas = this.allDatas = Bind.observableArray();
					this.allDatas.owner = this;
					this.setTotal(0);

					this.deleteDatas = Bind.observableArray();
					this.slaveDatas = [];
					this.isModified = Bind.observable(false);
					this._isModelConctructed = Bind.observable(false);
					this.clientFilter = "";
					this._clientFilterExpr = Bind.observable();
					// 错误监听,修改机制不整体监控规则计算
					// this.errors =
					// Bind.validation.group(this.allDatas,{enable:this.isModified});
					// this._selfValid = Bind.observable(true);
					// this.errors.subscribe(function (errors) {
					// self._selfValid.set(errors.length === 0);
					// });
					// 数据修改
					this.isChanged = function() {
						return this.isSelfChanged() || this.isSlaveChanged();
					};

					this._init(model, config);
				},
				_getSelfValid : function(force) {
					var ret = true;
					this.eachAllByPeek(function(data) {
						var row = data.row, state = row.row.userdata.recordState;
						if(force) row.row.userdata.isModified.set(true);
						if (force || Data.STATE.NEW == state || Data.STATE.EDIT == state) {
							for ( var k in data.data.defCols) {
								var v = row.ref(k);
								if (v && Bind.isObservable(v.isValid) && !v.isValid.get()) {
									ret = false;
									data.cancel = true;
									break;
								}
							}
						}
					},this);
					return ret;
				},
				_getSelfInvalidInfo : function(force) {
					var ret = [];
					this.eachAllByPeek(function(data) {
						var row = data.row, state = row.row.userdata.recordState;
						if(force) row.row.userdata.isModified.set(true);
						if (force || Data.STATE.NEW == state || Data.STATE.EDIT == state) {
							for ( var k in data.data.defCols) {
								var v = row.ref(k);
								if (v && Bind.isObservable(v.error)) {
									var err = v.error.get();
									if (err)
										ret.push(err);
								}
							}
						}
					},this);
					return ret.join(';');
				},
				getReadonly : function(col, row) {
					if (col && row) {
						var obsv = row.ref(col);
						if (obsv && obsv.readonly && obsv.readonly.used)
							return obsv.readonly.computed.get();
						else
							return this.readonly.get();
					} else
						return this.readonly.get();
				},
				setClientFilter: function(filter){
					this.clientFilter = filter;
					var filterExpr = null;
					if (filter && 'string' == typeof (filter))
						filterExpr = new Expr(filter);
					this._clientFilterExpr.set(filterExpr);
				},
				clone : function(xid) {
					var cfg = $.extend({}, this.definition);
					cfg.xid = xid || Data.UUID();
					delete cfg.master;
					delete cfg.autoLoad;
					delete cfg.autoNew;
					return new this.clz(this.getModel(), cfg);
				},
				_dispose : function(o) {
					if (Bind.isObservable(o)) {
						o.extend({
							validatable : false,
							readonly : false
						});
						if (o.getSubscriptionsCount() > 0) {
							o._subscriptions.change = [];
						}
					} else if (Bind.isComputed(o)) {
						o.extend({
							validatable : false,
							readonly : false
						});
						if (o.target) {
							this._dispose(o.target);
							delete o.target;
						}
						o.dispose();
					} else if (Bind.validation.utils.isObservableArray(o)) {
						var rows = o.get(), i = 0;
						for (; i < rows.length; i++) {
							var r = rows[i].row;
							if (r.userdata && r.userdata.isModified)
								this._dispose(r.userdata.isModified);
							for ( var col in this.defCols) {
								this._dispose(r.ref(col));
							}
						}
						o.destroyAll();
					}
				},
				dispose : function() {
					Data.unRegisterData(this.getModel(), this.xid);

					this._dispose(this.readonly);
					this._dispose(this.index);
					this._dispose(this.indexParent);
					this._dispose(this.currentRow);
					this._dispose(this.isModified);
					this._dispose(this._clientFilterExpr);
					// this._dispose(this._selfValid);
					this._dispose(this.allDatas);
					this._dispose(this.deleteDatas);

					delete this.readonly;
					delete this.index;
					delete this.indexParent;
					delete this.currentRow;
					delete this.isModified;
					delete this._clientFilterExpr;
					// delete this['_selfValid'];
					delete this.allDatas;
					delete this.deleteDatas;
				},
				cancelUpdates : function(){
					var changed = this.isSelfChanged();
					this.eachAllByPeek(function(param){
						param.row.cancelUpdates(true);
					},this);
					var len = this.slaveDatas.length;
					for ( var i = 0; i < len; i++) {
						this.slaveDatas[i].cancelUpdates();
					}
					if(changed){
						var eventData = {};
						eventData.source = this;
						eventData.changedSource = this;
						eventData.type = 'cancel';
						eventData.selfChanged = true;
						this.doDataChanged(eventData);
					} 
				},
				createErrorValue : function(value) {
					return Data.createErrorValue(value);
				},
				getContext : function() {
					return this.getModel().getContext();
				},
				label : function(name) {
					var def = this.defCols[name];
					return def ? ((def.label!==undefined && def.label!==null)?def.label:name) : '';
				},
				_setLoaded : function(v, parent) {
					if (!parent) {
						this.loaded = v;
					} else {
						if (!parent.row.userdata)
							parent.row.userdate = {};
						parent.row.userdata._loaded = v;
					}
				},
				open : function() {
					if (!this.isLoaded())
						this.refreshData();
				},
				isLoaded : function(parent) {
					if (!parent || (this.defTreeOption.isTree && !this.defTreeOption.option.isDelayLoad))
						return this.loaded;
					else
						return parent.row.userdata && parent.row.userdata._loaded ? parent.row.userdata._loaded : false;
				},
				hasMore : function(parent){
					if (this.limit == -1) return false;
					var rows = parent?(parent.rows?parent.rows.get():[]):this.datas.get();
					return this.getTotal(parent)>rows.length;
				},
				getTotal : function(parent) {
					if (this.limit !== -1){
						if (!parent)
							return this.total.get();
						else
							return parent.row.userdata && parent.row.userdata._total ? parent.row.userdata._total.get() : 0;
					}else return this.getCount(parent); 
				},
				setTotal : function(v, parent) {
					if (!parent) {
						if (!this.total)
							this.total = Bind.observable();
						this.total.set(v);
					} else {
						if (!parent.row.userdata)
							parent.row.userdata = {};
						if (!parent.row.userdata._total)
							parent.row.userdata._total = Bind.observable();
						parent.row.userdata._total.set(v);
					}
				},
				getOffset : function(parent) {
					if (!parent)
						return this.offset;
					else
						return parent.row.userdata && parent.row.userdata._offset ? parent.row.userdata._offset : 0;
				},
				setOffset : function(v, parent) {
					if (!parent) {
						this.offset = v;
					} else {
						if (!parent.row.userdata)
							parent.row.userdata = {};
						parent.row.userdata._offset = v;
					}
				},
				ref : function(name, row) {
					if (this._inited) {
						if (typeof (row) !== 'object')
							row = this.getCurrentRow();
						return row ? row.ref(name) : (new Data.NullValue());
					} else
						return (new Data.NullValue());
				},
				val : function(name, row) {
					return this.getValue(name, row);
				},
				_eachAll : function(callback, caller, parent, peek) {
					if ('function' !== typeof (callback))
						return;
					var fn = peek?"peek":"get";
					var allItems = !parent ? this.allDatas[fn]() : (Bind.isObservable(parent.rows) ? parent.rows[fn]() : []);
					var len = allItems.length;
					for ( var i = 0; i < len; i++) {
						var param = {
							index : i,
							row : allItems[i],
							cancel : false,
							parent : parent,
							data : this
						};
						callback.call(caller || param.row, param);
						if (param.cancel)
							return;
						if (Bind.isObservable(param.row.rows))
							if(!this._eachAll(callback, caller, param.row, peek)) return;
					}
					return true;
				},
				_each : function(callback, caller, parent, peek) {
					this._eachAll(callback, caller, !parent ? {
						rows : this.datas
					} : parent, peek);
				},
				eachAllByPeek : function(callback, caller, parent) {
					return this._eachAll(callback, caller, parent, true);
				},
				eachByPeek : function(callback, caller, parent) {
					this._each(callback, caller, parent, true);
				},
				eachAll : function(callback, caller, parent) {
					return this._eachAll(callback, caller, parent);
				},
				each : function(callback, caller, parent) {
					this._each(callback, caller, parent);
				},
				getChildren : function(parent){
					return !parent?this.datas.get():(Bind.isObservable(parent.rows) ? parent.rows.get() : []);
				},
				isSelfChanged : function() {
					var ret = false;
					this.eachAllByPeek(function(data) {
						var state = data.row.row.userdata.recordState;
						if (Data.STATE.NEW == state || Data.STATE.EDIT == state) {
							ret = true;
							data.cancel = true;
						}
					});
					return ret || this.deleteDatas.peek().length > 0;
				},
				isSlaveChanged : function() {
					var len = this.slaveDatas.length;
					for ( var i = 0; i < len; i++) {
						if (this.slaveDatas[i].isChanged())
							return true;
					}
					return false;
				},
				_bindClientFilter: function(){
					if(!(this.master && this.master.xid) && this.clientFilter)
						this.datas = this._filterBy();
				},
				_bindMaster : function() {// 不支持多次绑定
					if (this.master && !this.master.masterData && this.master.xid) {
						this.master.masterData = Data.$(this.getModel(), this.master.xid);
						if (this.master.masterData) {
							this.master.masterData.slaveDatas.push(this);
							this.byMaster = {};
							// 主从过滤
							this.datas = this._filterBy();
							this.setTotal(0);
							//增加从数据变化的事件
							this.datas.subscribe(function(datas) {
								var eventData = {};
								eventData.source = this;
								this.fireEvent(Data.EVENT_SLAVEDATAS_CHANGED, eventData);
								eventData.changedSource = this;
								eventData.type = 'slaveDataChanged';
								eventData.selfChanged = true;
								this.doDataChanged(eventData);
							}, this);
							// 生成主data index监听
							this.master.masterData.currentRow.subscribe(function(row) {
								if (undefined === row)
									return;
								var rid = this.master.masterData.getRowID(row);
								if (!this.byMaster[rid])
									this.byMaster[rid] = {};
								this.byMaster[rid].current = this.getCurrentRow(true);
								this.byMaster[rid].offset = this.getOffset();
								this.byMaster[rid].total = this.getTotal();
							}, this, "beforeChange");
						}
					}
				},
				_clientFilter: function(allItems){
					var ret = [];
					var filterExpr = this._clientFilterExpr.get();
					if (filterExpr instanceof Expr){
						for ( var i = 0; i < allItems.length; i++) {
							var current = allItems[i];
							var ctx = {
									$model : this.getModel(),
									$data : this,
									$row : current
							};
							if (Expr.eval(filterExpr, current, ctx))
								ret.push(current);
						}
					}else ret = allItems;
					return ret;
				},
				_createReadonly : function() {
					if (typeof (this.definition.readonly) == 'string')
						this.definition.readonly = new Expr(this.definition.readonly);
					var modelContext = this.getContext();
					this.readonly = Bind.computed(function() {
						var ctx = {
							$model : this.getModel(),
							$data : this
						};
						//延迟全局readonly计算到model创建完成后
						var isModelConctructed = this._isModelConctructed.get();
						if(!isModelConctructed) return false;
						else return (modelContext && 'function'===typeof(modelContext.isReadonlyMode) && modelContext.isReadonlyMode()) || (this.definition.readonly instanceof Expr ? Expr.eval(this.definition.readonly, this, ctx) : this.definition.readonly);
					}, this);
				},
				_init : function(model, config) {
					if (!model || !config)
						return;
					this.setModel(model);
					this.definition = config;
					// 创建data的只读
					this._createReadonly();
					this._initDefinition();
					// bind事件
					this.attachEvents(config.events);
					var func = function() {
						this._bindClientFilter();
						this._bindMaster();

						// 注册
						Data.registerData(model, this.xid, this);

						var eventData = {
							'source' : this
						};
						this.fireEvent(Data.EVENT_CREATE, eventData);

						// 标记组件初始化完成
						this.getModel().resolvedComponent(this.xid);
						this._inited = true;
					};

					var self = this;
					var doModelConstructing = function(ev) {
						self._isModelConctructed.set(true);
						
						//处理扩展类型
						self._initExtendType();
						
						if (self.autoNew && !self.master)
							self.newData();
						else if (self.autoLoad && !self.master){
							self.open();// 如果是从data依赖主data的自动加载
						}
					};

					if(!model.isConctructed())model.on(Model.MODEL_CONSTRUCTING_EVENT, doModelConstructing);
					else doModelConstructing();

					func.call(self);
					
					/*
					if (!this.master || this.master.masterData || !this.master.xid) {
					    func.call(self);
					} else {// 有依赖的主data
						model.componentPromise(this.master.xid).then(function() {
							func.call(self);
						}, function(error) {// data[xid=self.xid]初始化失败，error
							var msg = new justep.Message(justep.Message.JUSTEP231078, self.xid, error);
							throw justep.Error.create(msg);
						});
					}
					*/
				},
				/**
				 * 进行定义信息处理 definition格式： {'queryAction' : "**QueryAction",
				 * 'newAction' : "**CreateAction", saveAction : "**SaveAction",
				 * dataModel : "...", concept : "{'sa_org概念名' : 'p 概念别名',...}",
				 * idColumn : "'列名，也就是列别名'", limit : 20, directDelete : true,
				 * confirmDelete : false, confirmDeleteText : "", confirmRefresh :
				 * false, confirmRefreshText : "", offset : 0, updateMode :
				 * "whereVersion", orderBys : "{'relation':0,'relation':1}",
				 * filters : "{'filterID':filter,...}", defaultValues :
				 * "{'relation别名' : '默认值',...}", defCols : "{'relation
				 * 别名':{'type 类型':'String','relation
				 * 名':'p.sName','label':'','define':'ksql中的define'}}", master :
				 * "{'id':'data id','relation':'relation name'}" treeOption :
				 * "{'delayLoad':true,'parentRelation':'父子关联的relation','rootFilter':'','nodeKindRelation':'','nodeLevelRelation':''}" }
				 */
				_initDefinition : function() {
					this.dataModel = this.definition.dataModel || "";

					if (this.definition.autoLoad)
						this.autoLoad = true;
					if (this.definition.autoNew)
						this.autoNew = true;

					if (this.definition.limit)
						this.limit = this.definition.limit;
					if (this.definition.offset)
						this.setOffset(this.definition.offset);

					if (this.definition.directDelete)
						this.directDeleteMode = this.definition.directDelete;// 是否直接删除，默认false

					if (this.definition.confirmDelete === false)
						this.confirmDelete = false;
					if (this.definition.confirmDeleteText)
						this.confirmDeleteText = this.definition.confirmDeleteText;

					if (this.definition.confirmRefresh === false)
						this.confirmRefresh = false;
					if (this.definition.confirmRefreshText)
						this.confirmRefreshText = this.definition.confirmRefreshText;

					if (this.definition.filterRelations)
						this.defFilterRelations = this.definition.filterRelations;

					if (this.definition.updateMode)
						this.updateMode = this.definition.updateMode;
					// 处理默认的排序orderBys
					// 格式[{'relation':'sName','type':1},...]
					if(this.definition.orderBys)
						this.orderBys = this.definition.orderBys;
					//前端过滤属性
					if(this.definition.clientFilter)
						this.setClientFilter(this.definition.clientFilter);
					// 处理定义的filter
					// 格式{'filterID':filter,...}
					var filters = this.definition.filters;
					for ( var o in filters)
						this.setFilter(o, filters[o]);
					// 处理relation定义
					// 格式{'sa_org概念名' : 'p 概念别名',...}
					this.concept = this.definition.concept;
					this.idColumn = this.definition.idColumn;
					// 格式{'relation别名' : '默认值',...}
					this.defaultValues = this.definition.defaultValues;
					this._initDefCols();
					this._initRules();
					// 格式{'统计relation 别名':realtion}
					this.defAggCols = this.definition.defAggCols;
					// 主从关系赋值
					// 格式{'id':'data id','relation':'relation
					// name','autoLoad':true}
					this.master = this.definition.master;
					// 树的属性赋值
					// treeOption :
					// "{'delayLoad':true,	'parentRelation':'父子关联的relation','rootFilter':'','nodeKindRelation':'','nodeLevelRelation':''}"
					if (this.definition.treeOption) {
						this.defTreeOption.isTree = true;
						this.defTreeOption.option = this.definition.treeOption;
					}else this.defTreeOption.option = {};
				},
				getTreeOption : function() {
					return this.defTreeOption.option;
				},
				_initExtendType : function(){
					for (var o in this.defCols) {
						ExtendType.getExtendTypeObjectByColDef(this, this.defCols[o]);
					}
				},
				_initDefCols : function() {
					// 格式{'relation 别名':{'type
					// 类型':'string','relation 名':'p.sName','label':''}}
					// 当relation=EXPRESS或STATISTICAL时type取值为OBJECT
					this.defCols = this.definition.defCols;
				},
				_initRules : function() {
					for ( var o in this.defCols) {
						var rules = this.defCols[o].rules;
						if (rules && !Bind.validation.utils.isObservableArray(rules)) {// 如果是isObservableArray说明已经处理过了
							var rlist = [];
							for ( var ruleName in rules) {
								// 特殊处理readonly和calculate，实现逻辑特殊
								if ('readonly' == ruleName || 'calculate' == ruleName) {
									(this.defCols[o])[ruleName] = rules[ruleName];
									delete rules[ruleName];
									continue;
								}
								var params = rules[ruleName];
								if (params && (params.message || params.onlyIf)) {
									rlist.push({
										rule : ruleName,
										message : params.message,
										params : Bind.validation.utils.isEmptyVal(params.params) ? true : params.params,
										condition : params.onlyIf
									});
								} else {
									rlist.push({
										rule : ruleName,
										params : params.params?params.params:params
									});
								}
							}

							if (rlist.length > 0)
								this.defCols[o].rules = Bind.observableArray(rlist);
							else
								delete this.defCols[o].rules;
						}
					}
				},
				addRule: function(col,rule){
					var colDef = this.defCols[col];
					if(colDef){
						if(colDef.rules) colDef.rules.push(rule);
						else colDef.rules = Bind.observableArray([rule]);
					}
				},
				//没有实现filter相关方法，在子类中实现
				buildFilter : function() {
					return '';
				},
				getFilter : function(name) {
					return '';
				},
				setFilter : function(name, filter) {
					return '';
				},
				setOrderBy : function(relation, type) {
					if(this.isUICalculateCol(relation)) return;//计算列不支持orderBY
					var o = this._getOrderBy(relation);
					if (null !== type && undefined !== type){
						if(o) o.type = type;
						else this.orderBys.push({relation:relation,type:type});
					}else{
						if(o){
							var i = this.orderBys.indexOf(o);
							if(i>=0) this.orderBys.splice(i,1);
						}
					}
				},
				_getOrderBy : function(relation) {
					var ret;
					$.each(this.orderBys, function(i,v){
						if(v.relation==relation){
							ret = v;
							return false;
						} 
					});
					return ret;
				},
				/**
				 * 获取排序
				 * 
				 * @param {string}
				 *            relation
				 * @return {int} OrderBy的类型0:DESC/1:ASC
				 */
				getOrderBy : function(relation) {
					var ret = this._getOrderBy(relation);
					return ret?ret.type:ret;
				},
				clearOrderBy : function() {
					this.orderBys = [];
				},
				getOrderBys : function() {
					var result = '';
					for ( var i=0;i<this.orderBys.length;i++) {
						var o = this.orderBys[i];
						result += (result !== '' ? ',' : '') + o.relation + (0 === o.type ? ' DESC' : ' ASC');
					}
					return result;
				},
				sort: function(callback){
					this.allDatas.sort(callback);
					var eventData = {
							source : this,
							changedSource : this,
							type : 'sort',
							selfChanged : true
						};
					this.doDataChanged(eventData);
				},
				exchangeRow : function(row1,row2){
					var index1 = this.allDatas.indexOf(row1);
					if(index1<0) return;
					var index2 = this.allDatas.indexOf(row2);
					if(index2<0) return;
					this.allDatas.splice(index1,1,row2);
					this.allDatas.splice(index2,1,row1);
					var eventData = {
							source : this,
							changedSource : this,
							row1:row1,
							row2:row2,
							type : 'exchangeRow',
							selfChanged : true
						};
					this.doDataChanged(eventData);
				},
				moveRowTo : function(row1,row2,after){
					if(row1 && row2){
						var datas1 = (row1.parent()&&row1.parent().rows) || row1.data.allDatas;
						var datas2 = (row2.parent()&&row2.parent().rows) || row2.data.allDatas;
						var index1 = datas1.indexOf(row1);
						if(index1<0) return;
						var index2 = datas2.indexOf(row2);
						if(index2<0) return;
						if(after) index2++; 
						datas1.splice(index1,1);
						datas2.splice(index2,0,row1);
						row1.row.userdata.parent = row2.row.userdata.parent;
						var p = this.getParentRelation();
						if(p) row1.val(p, row2.val(p));
						this.doDataChanged({
							source : row2.data,
							row1 : row1,
							row2 : row2,
							after : after,
							changedSource : row2.data,
							type : 'moveRow',
							selfChanged : true							
						});
					}
				},
				getResultRelations : function() {
					var result = null;
					for ( var o in this.defCols) {
						if (!this.isUICalculateCol(o))
							result = null !== result ? (result + this.delim + o) : o;
					}
					return result;
				},
				getColumnIDs : function() {
					var result = null;
					for ( var o in this.defCols) {
						result = null !== result ? (result + this.delim + o) : o;
					}
					return result;
				},
				/**
				 * 返回查询的统计relation
				 */
				getAggRelations : function() {
					var result = "";
					for ( var o in this.defAggCols) {
						result += ("" !== result) ? (this.delim + o) : o;
					}
					return result;
				},
				doDataChanged : function(eventData) {
					var eData = {};
					if (this.hasListener(Data.EVENT_DATA_CHANGE)) {
						justep.Util.apply(eData, eventData);
						this.fireEvent(Data.EVENT_DATA_CHANGE, eData);
					}
					if (this.master && this.master.masterData) {
						var masterData = this.master.masterData;
						if (masterData) {
							eData = $.extend({}, eventData);
							eData.source = masterData;
							eData.selfChanged = false;
							masterData.doDataChanged(eData);
						}
					}
				},
				attachEvents : function(events) {
					if (!events)
						return;
					if (typeof events == 'string') {
						events = eval('(' + events + ')');
					}
					if (!events)
						return;
					for ( var o in events) {
						var func = events[o];
						if (typeof func == 'string')
							//lzg 忽略 with用法
							/*jshint -W085 */
							with (this.getModel() || window) {
							/*jshint +W085 */
								func = eval('(' + func + ')');
							}
						if (typeof(func) === 'function' || (func && func.operation))
							this.on(o, func, this.getModel());
					}
				},
				_clear : function(parent) {
					// 清空data代码
					//当前行是parent的子才进行重置当前行
					if(!parent || this.isChild(this.getCurrentRow(true), parent))
						this.currentRow.set();

					var arrayRows, row = null;
					if (!parent) {
						arrayRows = this.allDatas.get();
						for (row in arrayRows) {
							this._clear(arrayRows[row]);
						}
						this.allDatas.removeAll();
						this.deleteDatas.removeAll();
					} else {
						if (parent.rows) {
							arrayRows = parent.rows.get();
							for (row in arrayRows) {
								this._clear(arrayRows[row]);
							}
							parent.rows.removeAll();
						}
						var dels = this.deleteDatas.get();
						for(var i=0;i<dels.length;i++){//删除子
							if(this.isChild(dels[i], parent))
								this.deleteDatas.splice(i,1);
						}
					}
				},
				isChild: function(row,parent){
					if(!row) return false;
					var p = row.parent();
					if(p===parent) return true;
					if(p) return this.isChild(p, parent);
					else return false;
				},
				clear : function(parent) {
					// 清空data代码
					this._clear(parent);

					var eventData = {};
					eventData.source = this;
					eventData.changedSource = this;
					eventData.type = 'clear';
					eventData.selfChanged = true;
					eventData.parent = parent;
					this.doDataChanged(eventData);
				},
				_reloadDefByUserData : function(userdata, parent) {
					if (!parent)
						justep.Util.apply(this.userdata, userdata);
					if (typeof userdata === 'object') {
						if (userdata.hasOwnProperty('sys.loaded'))
							this._setLoaded(userdata['sys.loaded'], parent);
						if (userdata.hasOwnProperty('sys.count'))
							this.setTotal(userdata['sys.count'], parent);
						if (userdata.hasOwnProperty('sys.offset'))
							this.setOffset(userdata['sys.offset'], parent);
					}
				},
				_rows2indexMapping : function(parent){
					var ret = {};
					var rows = parent?parent.rows:this.allDatas;
					if(rows && Bind.validation.utils.isObservableArray(rows)){
						rows = rows.peek();
						for(var i=0;i<rows.length;i++){
							var row = rows[i];
							var idRef = row.ref(this.idColumn);
							if(Bind.isObservable(idRef)) ret[idRef.peek()] = row;
						}
					}
					return ret;
				},
				loadData : function(data, append, parent, index, override) {
					index = undefined === index?-1:index;
					var ret = [];
					//增加json数组支持
					if($.isArray(data)) data = {rows:data};
					if (data && ('table' == data['@type'] || $.isArray(data.rows))) {
						if (!append) {
							this._clear(parent);
						}
						this._reloadDefByUserData(data.userdata, parent);
						var indexMapping = override?this._rows2indexMapping(parent):{};
						var rows = data.rows ? data.rows : [], retRow = [];
						for ( var i = 0; i < rows.length; i++) {
							var row = $.extend(true,{},rows[i]);
							if (row.userdata && row.userdata.id) {
								row[this.idColumn] = row.userdata.id;
								delete row.userdata.id;
							}
							var r = this.add(row, parent, true, true);
							var idRef = r.ref(this.idColumn), rid;
							if(Bind.isObservable(idRef)) rid = idRef.peek();
							var orgRow = indexMapping[rid];
							if(orgRow){
								orgRow.assign(r); 
								orgRow.userdata = r.userdata;
							}else{
								retRow.push(r);
								if(override && rid!==undefined) indexMapping[rid] = r;
							}
							ret.push(r);
							if (row.rows) {
								ret.push.apply(ret, this.loadData(row, append, r));
							}
						}
						if (!parent) {
							if (-1 == index)
								this.allDatas.push.apply(this.allDatas, retRow);
							else
								this.allDatas.splice.apply(this.allDatas, [ index, 0 ].concat(retRow));
						} else {
							if (!parent.rows)
								parent.rows = Bind.observableArray(retRow);
							else {
								if (-1 == index)
									parent.rows.push.apply(parent.rows, retRow);
								else
									parent.rows.splice.apply(parent.rows, [ index, 0 ].concat(retRow));
							}
						}
					}
					return ret;
				},
				isExist : function(id) {
					return this.exist(id);
				},
				exist : function(id) {
					var ret = false;
					this.eachByPeek(function(evt) {
						if (id == this.getRowID(evt.row)) {
							evt.cancel = true;
							ret = true;
						}
					}, this);
					return ret;
				},
				getUserData : function(name, row) {
					return row ? row.row.userdata[name] : this.userdata[name];
				},
				getAggregateValue : function(name,parent){
					return this.getUserData(name,parent);
				},
				setUserData : function(name, v, row) {
					var userdata = row ? row.row.userdata : this.userdata;
					userdata[name] = v;
				},
				find : function(fields, values, First, CaseInsensitive, PartialKey, all) {
					var res = [];
					var len = 0;
					if (values && fields)
						len = values.length > fields.length ? fields.length : values.length;
					if (len > 0) {
						var func = all ? "eachAll" : "each";
						this[func](function(data) {
							var ok = true;
							var r = data.row;
							for ( var i = 0; i < len; i++) {
								var v = this.getValue(fields[i], r);
								if (typeof (v) === 'string') {
									v = !CaseInsensitive ? v : v.toLowerCase();
									var value = !CaseInsensitive ? values[i] : (values[i] + '').toLowerCase();
									ok = ok && (!PartialKey ? v == value : v.indexOf(value) != -1);
								} else
									ok = values[i] == v;
								if (!ok)
									break;
							}
							if (ok) {
								res.push(r);
								if (First)
									data.cancel = true;
							}
						}, this);
					}
					return res;
				},
				isValid : function(force) {
					return this._getSelfValid(force) && (function() {
						for ( var i = 0; i < this.slaveDatas.length; i++)
							if (!this.slaveDatas[i].isValid(force))
								return false;
						return true;
					}).call(this);
				},
				getInvalidInfo : function(force) {
					var ret = [];
					var info = this._getSelfInvalidInfo(force);
					if(info) ret.push(info);
					for ( var i = 0; i < this.slaveDatas.length; i++){
						var sinfo = this.slaveDatas[i].getInvalidInfo(force);
						if(sinfo) ret.push(sinfo);
					}					
					return ret.join("\n");
				},
				convert : function(v, t) {
					return Data.convert(v, t);
				},
				//生成过滤计算,包括主从计算和前端过滤
				_filterBy : function() {
					var ret,i;
					if (this.master){
						ret = Bind.computed(function() {
							var mData = this.master.masterData;
							var isModelConctructed = this._isModelConctructed.get();
							var mr = mData.getCurrentRow(), mrid = mData.getRowID(mr), 
							allItems = this.allDatas.get();
							if (undefined === mr || null === mr || !isModelConctructed){//没有主记录时初始化所有状态
								this.currentRow.set(null);
								this.setTotal(0);
								this.setOffset(0);
								return [];
							}
							var byMaster = this.byMaster[mrid];
							
							// 根据主加载当前的数据
							if (!byMaster || !byMaster.loaded) {
								var eventData = {
										source : this,
										masterRow: mr,
										loaded : Data.STATE.NEW === mData.getRowState(mr)
								};
								this.fireEvent(Data.EVENT_LOAD_SLAVEDATA, eventData);
								// 这里目前没有处理autoNew
								if (!eventData.loaded && this.autoLoad && Data.STATE.NEW !== mData.getRowState(mr)) {
									eventData.loaded = this._refreshData({
										append : true,
										offset : 0
									});
								}
								if (byMaster){
									byMaster.loaded = eventData.loaded;
								}else{
									this.byMaster[mrid] = {
											loaded : eventData.loaded,
									};
								}
							}
							//查找从数据
							var matchingItems = [];
							for ( i = 0; i < allItems.length; i++) {
								var current = allItems[i];
								if (Bind.unwrap(current.ref(this.master.relation).get()) === mrid)
									matchingItems.push(current);
							}
							//数据过滤
							if(this.clientFilter){
								matchingItems = this._clientFilter(matchingItems);								
							}
							//设置状态,设置当前行不加入到计算链
							if (byMaster && byMaster.loaded) {
								this.currentRow.set((!byMaster.current && matchingItems.length > 0)?matchingItems[0]:byMaster.current);
								byMaster.offset!==undefined?this.setOffset(byMaster.offset):'';
								byMaster.total!==undefined?this.setTotal(byMaster.total):'';
							} else if (matchingItems.length > 0){
								this.currentRow.set(matchingItems[0]);
							} else this.currentRow.set(null);//没有数据修改当前行为null
							return matchingItems;
						}, this);
						ret.owner = this;
						return ret;
					}else if(this.clientFilter){
						ret = Bind.computed(function() {
							var isModelConctructed = this._isModelConctructed.get();
							if (!isModelConctructed)
								return [];
							var allItems = this.allDatas.get();
							//数据过滤
							var currentRow;
							if(this.clientFilter){
								allItems = this._clientFilter(allItems);
								var crow = this.getCurrentRow(true);
								$.each(allItems, function(i,row){
									if(row===crow){
										currentRow = crow;
										return false;
									}
								});
							}
							
							//设置状态
							if(currentRow)
								this.currentRow.set(currentRow);
							if (allItems.length > 0){
								this.currentRow.set(allItems[0]);
							} else this.currentRow.set(null);//没有数据修改当前行为null
							
							return allItems;
						}, this);
						ret.owner = this;
						return ret;						
					}else return this.allDatas;
				},
				// 绑定规则
				bindRules : function(target, rules, isModified, ctx) {
					if (rules) {
						target.extend({
							validatable : {
								enable : true,
								rules : rules,
								isModified : isModified,
								ctx : ctx
							}
						});
					}
					return target;
				},
				_doReadonly : function(readonlyExpr, ctx) {
					return this.readonly.get() || ((readonlyExpr instanceof Expr) && Expr.eval(readonlyExpr, ctx.$row, ctx));
				},
				// 绑定规则
				bindReadonly : function(target, readonlyDef, ctx) {
					ctx.caller = this;
					target.extend({
						readonly : {
							readonlyFN : this._doReadonly,
							readonlyDef : readonlyDef,
							ctx : ctx
						}
					});
					return target;
				},
				// 绑定计算
				bindCalculate : function(target, calcExpr, context) {
					var interceptor = Bind.computed({
						read : function() {
							if (!this._inited)
								return '';// data没有初始化完成不进行计算
							var currentValue = target.peek();
							// {$model:this.getModel(),$data:this,$row:r,$rowID:rowid,$col:col}
							var newValue = Expr.eval(calcExpr, context.$row, context);
							if (newValue !== currentValue) {//延迟触发计算的valueChaned
								window.setTimeout(function(){target.set(newValue);},1);
							}
							return newValue;
						},
						write : function(v) {
							target.set(v);
						}
					}, this);
					interceptor.target = target;
					return interceptor;
				},
				getParentRelation : function() {
					return !this.defTreeOption.isTree ? '' : this.defTreeOption.option.parentRelation;
				},
				// 还可以做数据的格式转换
				bindValueChange : function(v, option) {
					var interceptor = Bind.observable(v);
					interceptor.subscribe(function(evt) {//变化中
						if (evt.newValue !== evt.oldValue) {
							evt.source = option.data;
							evt.row = option.row;
							evt.col = option.col;
							option.handler.call(option.caller, evt);
						}
					}, null, "changing");
					interceptor.subscribe(function(val) {//变化后
						var evt = {
							source: option.data,
							row: option.row,
							col: option.col,
							value: val
						};
						option.handler.call(option.caller, evt, true);
					});
					return interceptor;
				},
				disableRecordChange : function() {
					this._disableRecordChange = true;
				},
				enabledRecordChange : function() {
					this._disableRecordChange = false;
				},
				canRecordChange : function() {
					return !this._disableRecordChange;
				},
				// col可以是列名或者列定义
				isCalculateCol : function(col) {
					if (col) {
						if ('string' === typeof (col))
							col = this.defCols[col];
						if ('object' === typeof (col)) {
							return "EXPRESS" === col.relation || "STATISTICAL" == col.relation;
						}
					}
				},
				isUICalculateCol : function(col) {
					if (col) {
						if ('string' === typeof (col))
							col = this.defCols[col];
						if ('object' === typeof (col)) {
							return !col.isBiz && ("EXPRESS" === col.relation || "STATISTICAL" == col.relation);
						}
					}
				},
				_doValueChange : function(event,isChanged) {
					// 不记录变化
					if (event.col===this.versionRelation || !this.canRecordChange())
						return;
					if(!isChanged){
						this.fireEvent(Data.EVENT_VALUE_CHANGE, event);
						if (!this.isCalculateCol(event.col) && event.oldValue !== event.newValue) {
							var row = event.row;
							if (row) {
								var recordState = row.row.userdata.recordState;
								if (recordState !== Data.STATE.NEW) {
									var col = row.row[event.col];
									if (1 !== col.changed) {// 目前暂时不支持修改回原值后状态复原，原因BIND从组件写回的数据全部变成了str
										col.originalValue = event.oldValue;
										row.row.userdata.recordState = Data.STATE.EDIT;
										col.changed = 1;
										row.row.userdata.isModified.set(true);
										this.isModified.set(true);
									}
								}
							}
						}
					}else{
						this.fireEvent(Data.EVENT_VALUE_CHANGED, event);
						event.changedSource = this;
						event.type = 'valueChanged';
						event.selfChanged = true;
						this.doDataChanged(event);
					}

					if (Data.debug)
						console.log("行[" + event.rowID + "]列[" + event.col + "]changed," + "old:" + event.oldValue + ",newValue:" + event.newValue);
				},
				getRowByID : function(id, all) {
					if (id !== undefined && id !== null) {
						var r=null, func = !all ? 'each' : 'eachAll';
						this[func](function(evt) {
							if (id == this.getRowID(evt.row)) {
								evt.cancel = true;
								r = evt.row;
							}
						}, this);
						return r;
					}else return this.getCurrentRow(true);
				},
				getValue : function(col, row) {
					if (!row)
						row = this.getCurrentRow();
					var cc = row?row.ref(col):undefined;
					var colDef = this.defCols?this.defCols[col]:null;
					return this.convert(Bind.isObservable(cc)? cc.get() : cc, colDef?colDef.type:'String');
				},
				getOriginalValue : function(col, row) {
					if (!row)
						row = this.getCurrentRow();
					var cc = row?row.row[col]:undefined;
					var colDef = this.defCols?this.defCols[col]:null;
					return this.convert(cc.originalValue, colDef?colDef.type:'String');
				},
				setValue : function(col, value, row) {
					if (!row)
						row = this.getCurrentRow(true);
					var cc = row?row.ref(col):undefined;
					var colDef = this.defCols[col],
						type = colDef?colDef.type:'String';
					if(Bind.isObservable(cc)){
						if(type==='DateTime') value = dateTime2Val(value);
						else if(type==='Date') value = date2Val(value);
						else if(type==='Time') value = time2Val(value);
						cc.set(value);
					}
				},
				getValueByID : function(col, id) {
					var row = this.getRowByID(id, true);
					if(row)
						return this.getValue(col, row);
				},
				setValueByID : function(col, value, id) {
					var row = this.getRowByID(id, true);
					if(row)
						this.setValue(col, value, row);
					else{
						var msg = new justep.Message(justep.Message.JUSTEP231105, id);//id=''的数据不存在
						throw justep.Error.create(msg);
					} 
				},
				getRowState : function(row) {
					return (row && row.row.userdata && row.row.userdata.recordState) ? row.row.userdata.recordState : Data.STATE.NONE;
				},
				setRowState : function(row, state) {
					if (row && row.row.userdata){
						row.row.userdata.recordState = state;
						//刺激规则运算
						if(state===Data.STATE.NEW || state===Data.STATE.EDIT && Bind.isObservable(row.row.userdata.isModified))
							row.row.userdata.isModified.set(true);
					}
				},
				getRowID : function(r) {
					if(r===undefined) r = this.getCurrentRow(true);
					return r ? r.ref(this.idColumn).get() : undefined;
				},
				getRowIndex: function(r){
					var datas = this.datas.get();
					return $.isArray(datas)?datas.indexOf(r):-1;
				},
				to : function(row) {
					if (typeof (row) == 'string')// 当时string时认为是id
						row = this.getRowByID(row);
					if ((row instanceof Data.Row || row===undefined || row===null) && row!==this.getCurrentRow(true)) {
						var eventData = {
							source : this,
							row : row,
							originalRow : this.getCurrentRow(true),
							cancel : false
						};
						this.fireEvent(Data.EVENT_INDEX_CHANGING, eventData);
						if (eventData.cancel)
							return;
						this.currentRow.set(row);
						this.fireEvent(Data.EVENT_INDEX_CHANGED, eventData);
					}
				},
				getCount : function(parent) {
					if (!this.defTreeOption.isTree)
						return this.datas.get().length;
					else {
						var len = 0;
						this.eachByPeek(function() {
							len++;
						}, this, parent);
						return len;
					}
				},
				next : function() {
					var crow = this.getCurrentRow(true), isNext = false;
					this.eachByPeek(function(evt) {
						if (isNext) {
							this.to(evt.row);
							evt.cancel = true;
							isNext = false;
						}
						if (evt.row == crow)
							isNext = true;
					}, this);
				},
				pre : function() {
					var crow = this.getCurrentRow(true), preRow = null;
					this.eachByPeek(function(evt) {
						if (evt.row == crow) {
							if (null !== preRow)
								this.to(preRow);
							evt.cancel = true;
							preRow = null;
						}
						preRow = evt.row;
					}, this);
				},
				first : function() {
					this.to(this.getFirstRow());
				},
				last : function() {
					this.to(this.getLastRow());
				},
				getFirstRow : function() {
					var datas = this.datas.get();
					if (datas.length > 0)
						return datas[0];
					else
						return null;
				},
				getLastRow : function() {
					var datas = this.datas.get();
					if (datas.length > 0)
						return this._lastRow(datas);
					else
						return null;
				},
				getCurrentRow : function(peek) {
					return this.currentRow[peek?'peek':'get']();
				},
				getCurrentRowID : function(){
					return this.getRowID(this.getCurrentRow(true));
				},
				_lastRow : function(rows) {
					var len = rows.length, ret = rows[len - 1];
					if (len>0 && ret.rows)
						return this._lastRow(ret.rows.get());
					else
						return ret;
				},
				isLeaf : function(row) {
					if (this.defTreeOption.isTree && row) {
						return row.row[this.defTreeOption.option.nodeKindRelation] ? (Data.NODE_KIND_LEAF == row.ref(
								this.defTreeOption.option.nodeKindRelation).get()) : false;
					} else
						return true;
				},
				isTree : function(){
					return this.defTreeOption && this.defTreeOption.isTree;
				},
				/**
				 * 创建新的数据, 可以同时创建多行数据 兼容支持原来的3个参数写法index, parent, rows
				 * 
				 * @method newData
				 * @param [options]
				 *            可以设置默认值, 父, 如果创建多条数据可以设置默认值为默认值数组 参数结构
				 *            {defaultValues: [{column1: (value), column2:
				 *            (value), ...},{...},...], parent: ({Data.Row}),
				 *            onSuccess: ({Function}), onError: ({Function})}
				 * @returns {Array(String)} rows
				 */
				newData : function(options) {
					var index = -1, parent = null, rows = null, onSuccess = null, onError = null;
					var async = false;
					var eventData = {
						'cancel' : false,
						'option': options,
						'options': options,
						'source' : this
					};
					this.fireEvent(Data.EVENT_NEWDATA_BEFORE, eventData);
					if (eventData.cancel)
						return null;

					if (arguments.length == 1 && typeof (options) == 'object') {
						// options
						index = options.hasOwnProperty('index') ? options.index : index;
						parent = options.parent;
						rows = options.defaultValues;
						onSuccess = options.onSuccess;
						onError = options.onError;
					}

					var data = null;

					if (this.hasListener(Data.EVENT_NEWDATA)) {
						eventData = {
							data : data,
							option: options,
							options: options,
							async: false,
							source : this
						};
						this.fireEvent(Data.EVENT_NEWDATA, eventData);
						data = eventData.data;
						async = eventData.async;
						if(data){
							for ( var i=0; i<data.length; i++) {
								var rr = data[i];
								if (!rr.userdata)
									rr.userdata = {};
								rr.userdata.recordState = Data.STATE.NEW;
							}
						}
					} else {
						data = this.doNewData(rows, options);
					}

					if (!data)
						return null;

					rows = this.loadData(data, true, parent, index);
					
					//修改当前行，修改tree相关字段值
					if (rows.length > 0){
						if(this.isTree()){//tree情况处理，设置节点类型
							var treeOp = this.getTreeOption();
							if(treeOp.nodeKindRelation){
								for(var j=0;j<rows.length;j++){
									var r = rows[j];
									r.val(treeOp.nodeKindRelation, Data.NODE_KIND_LEAF);
								}
								if(parent) parent.val(treeOp.nodeKindRelation,'');
							}
						}

						this.to(rows[0]);
					}

					eventData = {
						'rows' : rows,
						'option': options,
						'options': options,
						'source' : this
					};
					this.fireEvent(Data.EVENT_NEWDATA_AFTER, eventData);
					eventData.changedSource = this;
					eventData.type = 'new';
					eventData.selfChanged = true;
					this.doDataChanged(eventData);
					this._setLoaded(true, parent);

					if (onSuccess && $.isFunction(onSuccess))
						onSuccess({
							'source' : this,
							'option': options,
							'options': options,
							'rows' : rows
						});

					return rows;
				},
				doNewAfter: function(){
					
				},
				/**
				 * 产生新的数据
				 * 
				 * @return {object}
				 *         包含id(行数据id)，version(数据版本)，state(数据状态)，colValues(列值数组)，返回null或者undefined表示操作失败
				 */
				doNewData : function(rows, options) {
					// 需要在派生类中重新实现
					if (!rows || rows.length <= 0)
						rows = [ {} ];
					var ret = {
						rows : [],
						userData : {},
						"@type" : "table"
					};

					for ( var i=0; i<rows.length; i++) {
						var r = rows[i];
						if (!r.userdata)
							r.userdata = {};
						r.userdata.recordState = Data.STATE.NEW;
						ret.rows.push(r);
					}
					return ret;
				},
				//保存时启动批事务的api
				_beginBatch: function(){
					return true;
				},
				_cancelBatch: function(){
					return true;
				},
				_endBatch: function(){
					return true;
				},
				/**
				 * 业务数据保存方法
				 * 
				 * @param [options]
				 *            可以设置成功失败的回调 参数结构 {ignoreInvalid: true, onSuccess:
				 *            ({Function}), onError: ({Function})}
				 * @return {boolean}
				 */
				saveData : function(options) {
					var onSuccess = null, onError = null, useTrans = true, ignoreInvalid = false;
					var async = false,promise;

					if (arguments.length == 1 && typeof (options) == 'object') {
						// options
						ignoreInvalid = !!options.ignoreInvalid;
						if (undefined !== options.useTrans)
							useTrans = !!options.useTrans;
						onSuccess = options.onSuccess;
						onError = options.onError;
						options = $.extend({},options);
					}
					var result = false;

					if (!this.isChanged())
						return true;

					if (!ignoreInvalid && !this.isValid()) {
						throw justep.Error.create(this.getInvalidInfo());
					}

					if (false !== useTrans) {
						if (!this._beginBatch()) {
							var msg = new justep.Message(justep.Message.JUSTEP231019);
							throw justep.Error.create(msg);
						}
					}

					try {
						var eventData = {
							cancel : false,
							source : this,
							options : options
						};
						this.fireEvent(Data.EVENT_SAVEDATA_BEFORE, eventData);
						if (eventData.cancel) {
							if (false !== useTrans)
								this._cancelBatch();
							return false;
						}

						if (this.hasListener(Data.EVENT_SAVEDATA)) {
							eventData = {
								cancel: false,
								source: this,
								async: false,
								promise: promise,
								options: options
							};
							this.fireEvent(Data.EVENT_SAVEDATA, eventData);
							async = eventData.async;
							result = !eventData.cancel;
							promise = eventData.promise;
						} else {
							var ret = this.doSaveData(options);

							if($.isPlainObject(ret)){//支持异步刷新返回
								result = ret.success;
								async = ret.async;
								promise = ret.promise;
							}else result = ret;
						}
						
						if (!result) {
							if (false !== useTrans)
								this._cancelBatch();
							return false;
						}

						if(promise && $.isFunction(promise.then)){
							var self = this;
							promise.then(function(){
								self.doSaveAfter(true, options);
							},function(){
								self.doSaveAfter(false, options);
							});
						}else if(!async){
							this.doSaveAfter(result, options);
						}
						
						eventData = {
							cancel : false,
							options: options,
							source : this
						};
						this.fireEvent(Data.EVENT_SAVEDATA_AFTER, eventData);
						if (eventData.cancel) {
							if (false !== useTrans)
								this._cancelBatch();
							return false;
						}
					} catch (e) {
						if (false !== useTrans)
							this._cancelBatch();
						var msg = new justep.Message(justep.Message.JUSTEP231020, (e.message || e));
						throw justep.Error.create(msg);
					}

					if (false !== useTrans) {
						this._endBatch();
					}

					return true;
				},
				/**
				 * 级联的从数据保存
				 */
				doSlaveDataSave : function() {
					var len = this.slaveDatas.length;
					for ( var i = 0; i < len; i++) {
						var slaveData = this.slaveDatas[i];
						if (slaveData && !slaveData.saveData({useTrans:false, ignoreInvalid:true}))
							return false;
					}
					return true;
				},
				/**
				 * 执行保存的动作
				 * 
				 * @param {function}
				 *            callback 回调
				 * @return {boolean}
				 */
				doSaveData : function(options) {
					var onlySelf = (options&&options.onlySelf)||false;
					//保存从数据
					return onlySelf||this.doSlaveDataSave();
				},
				doSaveAfter : function(success, options, params){
					options = options || {};
					params = params || {};
					var onError = options.onError;
					var onSuccess = options.onSuccess;
					if(!params.source) params.source = this;
					if(success){
						this.applyUpdates(params, options);
						//派发保存成功后事件
						if (onSuccess && $.isFunction(onSuccess))
							onSuccess(params);
						this.fireEvent(Data.EVENT_SAVE_COMMIT, params);
					}else{
						if (onError && $.isFunction(onError)) {
							onError(params);
						}
						if (this.hasListener(Data.EVENT_SAVEDATA_ERROR)) {
							this.fireEvent(Data.EVENT_SAVEDATA_ERROR, params);
						}
					}					
				},
				/**
				 * 保存成功后whereVersion的模式进行version自动加一
				 */
				applyUpdates : function(data,options){
					// 更新版本字段和状态不触发事件和状态变化
					this.disableRecordChange();
					try {// 特殊删除，解决关联计算触发问题
						var delList = this.deleteDatas.get();
						if(delList && $.isArray(delList))delList.splice(0, delList.length);
						this.eachAllByPeek(function(data) {
							var row = data.row.row;

							var recordState = row.userdata.recordState;
							if (this.updateMode == 'whereVersion') {
								if (Data.STATE.EDIT == recordState) {
									var versionRelation = this.getVersionColumn();
									if (versionRelation && row[versionRelation]) {
										var iVer = parseInt(row[versionRelation].value.peek(),10) + 1;
										row[versionRelation].value.set(iVer);
									}
								}
							}
							if (Data.STATE.EDIT == recordState || Data.STATE.NEW == recordState) {
								for ( var col in this.defCols) {
									row[col].changed = 0;
									row[col].originalValue = row[col].value.peek();
								}
							}

							row.userdata.recordState = Data.STATE.NONE;
						}, this);
						
					} finally {
						this.enabledRecordChange();
					}
				},
				getVersionColumn : function() {
					return this.versionRelation;
				},
				/**
				 * 加载下一页的数据
				 */
				loadNextPageData : function(options) {
					if (this.limit == -1)
						return;
					// 目前没有支持树局部加载数据
					options = options || {append:true};
					return this.isLoaded() ? this._refreshData(options) : this.refreshData(options);
				},
				/**
				 * 加载所有数据
				 */
				loadAllPageData : function(options) {
					options = options || {};
					// 目前没有支持树局部加载数据
					if (this.limit == -1 && !this.isLoaded())
						return this.refreshData(options);
					//if(this.isLoaded()) return;
					var total = this.getTotal(options.parent), offset = this.getOffset(options.parent);
					if (total <= offset)
						return;
					if (total < 1)
						return;
					var limit = this.limit;
					try {
						options.append = true;
						options.limit = total;
						return this._refreshData(options);
					} finally {
						this.limit = limit;
					}
				},
				/**
				 * 加载第N页数据
				 */
				loadPageData : function(pageIndex, options) {
					if (this.limit == -1 || 1 == pageIndex)
						return this.refreshData(options);
					options = options || {};
					pageIndex = pageIndex < 1 ? 1 : pageIndex;
					options.offset = (pageIndex - 1) * this.limit;
					options.append = false;
					return this._refreshData(options);
				},
				refreshData : function(options) {
					options = options || {};
					if (this.definition.offset)
						options.offset = this.definition.offset;
					else
						options.offset = 0;
					options.append = options.append!==true?false:true;
					// if(this.defTreeOption.isTree)
					// options.parent = null;
					return this._refreshData(options);
				},
				_clsSlaveDatasState : function(){
					var slaveDatas = this.slaveDatas;
					if($.isArray(slaveDatas))
						$.each(slaveDatas,function(i,slaveData){
							slaveData._clear();
							slaveData._clsSlaveDatasState();
							slaveData.byMaster = {};
						});
				},
				_confirm: function(text,onOK,onCancel,native){
					if(!native){
						justep.Util.confirm(text,onOK,onCancel);
					}else{
						if(confirm(text)) onOK&&onOK();
						else onCancel&&onCancel();
					}
				},
				_refreshData : function(options) {
					var result = false, async = false, promise;

					var cRow = this.getCurrentRow(true);
					var oldRowID = cRow?this.getRowID(cRow):null;

					var eventData = {
						cancel : false,
						options : options,
						source : this
					};
					this.fireEvent(Data.EVENT_REFRESHDATA_BEFORE, eventData);
					if (eventData.cancel)
						return false;

					options = $.extend({},options);

					var func = function(){
						if (options && 'number' == typeof (options.offset))
							this.setOffset(options.offset, options.parent);
						if (options && 'number' == typeof (options.limit))
							this.limit = options.limit;
						var _offset = this.getOffset(options ? options.parent : null);
						//传递记录的状态
						options._sys_ = {oldRowID:oldRowID,offset:_offset};
						//清除主从关联的记录
						if(this.master && this.master.masterData && !options.append){
							this.byMaster = {};
							//这里不爽，由于从data计算会循环刺激这里特殊指定
							var mData = this.master.masterData;
							var mr = mData.getCurrentRow(true), mrid = mData.getRowID(mr); 
							this.byMaster[mrid]={loaded:true};
						}
						if (this.hasListener(Data.EVENT_REFRESHDATA)) {
							eventData = {
									cancel : false,
									limit : this.limit,
									offset : this.getOffset(options.parent),
									options : options,
									async: async,
									promise: null,
									source : this
							};
							this.fireEvent(Data.EVENT_REFRESHDATA, eventData);
							async = eventData.async;
							result = !eventData.cancel;
							promise = eventData.promise;
						} else {
							var ret = this.doRefreshData(options);
							if($.isPlainObject(ret)){//支持异步刷新返回
								result = ret.success;
								async = ret.async;
								promise = ret.promise;
							}else result = ret;
						}
						
						if(promise && $.isFunction(promise.then)){
							var self = this;
							promise.then(function(){
								self.doRefreshAfter(true, options);
							},function(){
								self.doRefreshAfter(false, options);
							});
						}else if(!async){
							this.doRefreshAfter(result, options);
						}
					}.bind(this);
					
					var confirmRefresh = this.confirmRefresh;
					if(options && undefined!==options.confirm) confirmRefresh = options.confirm;
					
					if(options && options.append) func();
					else if(this.isChanged() && confirmRefresh) this._confirm(this.confirmRefreshText,func,null,!async);
					else func();

					return result;
				},
				doRefreshAfter : function(success, options, params){
					params = params || {};
					if(!params.source) params.source = this;
					if (!options){
						var _offset = this.getOffset(options ? options.parent : null);
						options = {_sys_:{offset:_offset}};
					}
					var onError = options.onError;
					var onSuccess = options.onSuccess;
					var eventData;
					
					if (success) {
						//如果不是增量刷新清除从数据的加载状态
						if(!options.append) this._clsSlaveDatasState();
						this._setLoaded(true, options ? options.parent : null);
						if (!(options && options.append)) {
							var oldRowID = options._sys_.oldRowID;
							var r = oldRowID!==null?this.getRowByID(oldRowID):null;
							if (!r)
								this.first();
							else if (r)
								this.to(r);
						}
						if (this.limit != -1)
							this.setOffset(options._sys_.offset + this.limit, options ? options.parent : null);
						eventData = {
								limit : this.limit,
								offset : this.getOffset(options ? options.parent : null),
								options : options,
								source : this,
								success : success,
								changedSource : this,
								type : 'refresh',
								selfChanged : true,
						};
						this.doDataChanged(eventData);

						if (onSuccess && $.isFunction(onSuccess))
							onSuccess(params);
					}else{
						if (onError && $.isFunction(onError)) {
							onError(params);
						}
						if (this.hasListener(Data.EVENT_REFRESHDATA_ERROR)) {
							this.fireEvent(Data.EVENT_REFRESHDATA_ERROR, params);
						}
					}
					eventData = {
							limit : this.limit,
							offset : this.getOffset(options ? options.parent : null),
							options : options,
							source : this,
							success : success
						};
					this.fireEvent(Data.EVENT_REFRESHDATA_AFTER, eventData);
				},
				/**
				 * 执行数据刷新的动作
				 */
				doRefreshData : function(options) {
					if (this.definition.initData) {// 加载初始数据
						this.loadData({
							rows : eval("(" + this.definition.initData + ")"),
							'@type' : 'table'
						});
					}
					return true;
				},
				deleteAllData: function(){
					var rows = this.datas.peek();
					if($.isArray(rows)){
						rows = rows.slice(0);
						var ret = this.deleteData(rows);
						var eventData = {};
						eventData.source = this;
						eventData.changedSource = this;
						eventData.type = 'clear';
						eventData.selfChanged = true;
						this.doDataChanged(eventData);
						return ret;
					}return true;
				},
				deleteData : function(rows, options) {
					var result = false, async = (options&&options.async)||false,promise;

					rows = rows ? rows : [ this.getCurrentRow(true) ];
					if(rows instanceof Data.Row) rows = [rows]; 

					var eventData = {
						'cancel' : false,
						'source' : this,
						'option' : options,
						'options': options,
						'deleteRows' : rows
					};
					this.fireEvent(Data.EVENT_DELETEDATA_BEFORE, eventData);
					if (eventData.cancel)
						return false;
					

					var confirmDelete = this.confirmDelete;
					if(options && undefined!==options.confirm) confirmDelete = options.confirm;
					
					options = $.extend({},options);
					options._sys_ = {rows:rows};
					
					var func = function(){
						if (this.hasListener(Data.EVENT_DELETEDATA)) {
							eventData = {
								cancel : false,
								source : this,
								option : options,
								options: options,
								async: async,
								promise: null,
								deleteRows : rows
							};
							this.fireEvent(Data.EVENT_DELETEDATA, eventData);
							async = eventData.async;
							result = !eventData.cancel;
							promise = eventData.promise;
						} else {
							var i = 0;
							var row, total;
							if (!this.directDeleteMode) {// 做删除标记
								async = false;
								if (!rows)
									return false;
								for (i = rows.length-1; i >= 0; i--) {
									row = rows[i];
									if (Data.STATE.NEW != this.getRowState(row)) {
										this.setRowState(row, Data.STATE.DELETE);
										this.deleteDatas.push(row);
										//更新total
										total = this.getTotal(row.row.userdata.parent) - 1;
										this.setTotal(total >= 0 ? total : 0, row.row.userdata.parent);
									}
									// 删除数据
									this.remove(row);
								}
								
								result = true;
							} else {// 直接后台删除
								options = $.extend({},options);
								var oldSuccessFn = options.onSuccess,me=this; 
								options.onSuccess = function(params){
									for (i = 0; i < rows.length; i++) {
										var row = rows[i];
										var total = me.getTotal(row.row.userdata.parent) - 1;
										me.setTotal(total >= 0 ? total : 0, row.row.userdata.parent);
										me.remove(row);
									}
									if('function'===typeof(oldSuccessFn)) oldSuccessFn(params);
								};
								var ret = this.doDirectDeleteData(rows, options);
								
								if($.isPlainObject(ret)){//支持异步删除返回
									result = ret.success;
									async = ret.async;
									promise = ret.promise;
								}else result = ret;
							}
						}
						if(promise && $.isFunction(promise.then)){
							var self = this;
							promise.then(function(){
								self.doDeleteAfter(true, options);
							},function(){
								self.doDeleteAfter(false, options);
							});
						}else if(!async){
							this.doDeleteAfter(result, options);
						}
					}.bind(this);
					
					if(confirmDelete) this._confirm(this.confirmDeleteText,func,null,!async);
					else func();

					return result;
				},
				doDeleteAfter : function(success, options, params){
					params = params || {};
					if(!params.source) params.source = this;
					var onError = options.onError;
					var onSuccess = options.onSuccess;
					
					if (success) {
						if (onSuccess && $.isFunction(onSuccess))
							onSuccess(params);
					}else{
						if (onError && $.isFunction(onError)) {
							onError(params);
						}
						if (this.hasListener(Data.EVENT_DELETEDATA_ERROR)) {
							this.fireEvent(Data.EVENT_DELETEDATA_ERROR, params);
						}
					}
					var eventData = {
							'source' : this,
							'deleteRows' : options._sys_.rows
						};
					this.fireEvent(Data.EVENT_DELETEDATA_AFTER, eventData);
					eventData.changedSource = this;
					eventData.type = 'delete';
					eventData.selfChanged = true;
					this.doDataChanged(eventData);
				},
				doDirectDeleteData : function(ids,options) {
					return {success:true,async:false};
				},
				_bindValue : function(r, col, rowid) {
					if (!$.isPlainObject(r.row[col]))//这里需要注意，如果修改col为对象需要修改
						r.row[col] = {
							changed : 0,
							value : r.row[col],
							originalValue : null
						};

					r.row[col].value = this.bindValueChange(r.row[col].value, {
						data : this,
						handler : this._doValueChange,
						caller : this,
						rowID : rowid,
						row : r,
						col : col
					});
				},
				_bindRule : function(r, col, rowid){
					var def = this.defCols[col];
					if (def.calculate) {
						if (typeof (def.calculate) == 'string')
							def.calculate = new Expr(def.calculate);
						if (def.calculate instanceof Expr)
							r.row[col].value = this.bindCalculate(r.row[col].value, def.calculate, {
								$model : this.getModel(),
								$data : this,
								$row : r,
								$rowID : rowid,
								$col : col
							});
					}

					this.bindRules(r.row[col].value, def.rules, r.row.userdata.isModified, {
						$model : this.getModel(),
						$data : this,
						$row : r,
						$rowID : rowid,
						$col : col
					});
					if (typeof (def.readonly) == 'string')
						def.readonly = new Expr(def.readonly);
					this.bindReadonly(r.row[col].value, def.readonly, {
						$model : this.getModel(),
						$data : this,
						$row : r,
						$rowID : rowid,
						$col : col
					});
					r.row[col].value.define = {
						data : this,
						row : r,
						col : col,
						defCol : def
					};
				},
				add : function(row, parent, disableCursor, nopush) {
					row = row || {};
					var type;
					for ( var k in this.defCols) {
						type = this.defCols[k].type;
						if(type==='DateTime') row[k] = dateTime2Val(row[k]);
						else if(type==='Date') row[k] = date2Val(row[k]);
						else if(type==='Time') row[k] = time2Val(row[k]);
						else row[k] = row[k];// 添加数据列，保证存在列对应的域
					}
					if (this.master && !row[this.master.relation]) {
						row[this.master.relation] = this.master.masterData.getRowID(this.master.masterData.getCurrentRow(true));
					}
					var rowid = row[this.idColumn];
					if (typeof (rowid) === 'object')
						rowid = rowid.value;
					var r = row;
					if (!r.userdata)
						r.userdata = {};
					if (parent && !Bind.isObservable(parent.rows))
						parent.rows = Bind.observableArray();
					r.userdata.parent = parent;
					var b = r.userdata.recordState == Data.STATE.NEW || r.userdata.recordState == Data.STATE.EDIT;
					r.userdata.isModified = Bind.observable(b);
					if (b)
						this.isModified.set(true);

					r = new Row(this, r);
					for (k in this.defCols) {
						this._bindValue(r, k, rowid);
					}
					for (k in this.defCols) {
						this._bindRule(r, k, rowid);
					}
					if (!nopush)
						if (!parent)
							this.allDatas.push(r);
						else
							parent.rows.push(r);
					if (!disableCursor)
						this.to(r);
					return r;
				},
				remove : function(row) {
					row = row ? row : this.getCurrentRow(true);
					var parent = row.row.userdata.parent, datas = !parent ? this.allDatas : parent.rows, index = datas.indexOf(row), len = datas
							.get().length;
					if (index >= 0 && index < len) {
						var isCurrent = row === this.getCurrentRow(true), _datas = !parent ? this.datas : parent.rows, _index = Bind.utils.arrayIndexOf(
								_datas.get(), row);
						datas.splice(index, 1);
						//增加remove删除事件
						var eventData = {};
						eventData.source = this;
						eventData.changedSource = this;
						eventData.type = 'remove';
						eventData.row = row;
						eventData.selfChanged = true;
						this.doDataChanged(eventData);

						if (isCurrent) {
							var size = this.getCount();
							len = _datas.get().length;
							if (size <= 0)
								this.to(null);
							else if (_index < len)
								this.to(_datas.get()[_index]);
							else if (_index >= len && len > 0)
								this.to(_datas.get()[_index - 1]);
							else
								this.to(parent);// 如果没有子了定位到parent
						}
						if(parent && _datas.get().length<=0 && this.isTree()){//tree情况处理，设置节点类型
							var treeOp = this.getTreeOption();
							if(treeOp.nodeKindRelation){
								if(parent)parent.val(treeOp.nodeKindRelation, Data.NODE_KIND_LEAF);
							}
						}
					}
				},
				_masterFilter : function(val, row) {
					if (!this.master)
						return true;
					else {
						var mdata = this.master.masterData;
						if (row) {
							var v = row.ref(mdata.idColumn);
							if (Bind.isObservable(v))
								return val === v.get();
						}
					}
				},
				_setTreeFilter : function(treeFilter) {
					this.setFilter('_treeFilter_', treeFilter);
				},
				_aggregate : function(type, col, filterCallback, all) {
					var datas = !all?this.datas.get():this.allDatas.get();
					var ret = 0.0, len = 0, min = null, max = null;
					var isFilter = filterCallback && (typeof (filterCallback) == 'function');
					var masterRow = typeof (filterCallback) == 'object' ? filterCallback : undefined;
					for ( var i = 0; i < datas.length; i++) {
						var id = this.master ? datas[i].ref(this.master.relation).get() : null;
						if ((!isFilter && masterRow === undefined) || (isFilter && filterCallback({
							'source' : this,
							'data' : this,
							'row' : datas[i]
						})) || (masterRow !== undefined && this._masterFilter(id, masterRow))) {
							len++;
							if(col){
								var colDef = this.defCols[col];
								var v = this.convert(datas[i].ref(col).get(), colDef.type);
								if(v===undefined || v===null || v instanceof Data.ErrorValue) continue; 
								ret = justep.Number.accAdd(ret,v);
								max = max === null ? v : (max < v ? v : max);
								min = min === null ? v : (min > v ? v : min);
							}
						}
					}
					if ('count' === type)
						return len;
					else if ('avg' === type)
						return justep.Number.accDiv(ret, len);
					else if ('sum' === type)
						return ret;
					else if ('min' === type)
						return min;
					else if ('max' === type)
						return max;
				},
				Count : function(filterCallback) {
					return this._aggregate("count", null, filterCallback);
				},
				countByAll : function(filterCallback) {
					return this._aggregate("count", null, filterCallback, true);
				},
				count : function(filterCallback) {
					return this._aggregate("count", null, filterCallback);
				},
				Avg : function(col, filterCallback) {
					return this._aggregate("avg", col, filterCallback);
				},
				avgByAll : function(col, filterCallback) {
					return this._aggregate("avg", col, filterCallback, true);
				},
				avg : function(col, filterCallback) {
					return this._aggregate("avg", col, filterCallback);
				},
				Sum : function(col, filterCallback) {
					return this._aggregate("sum", col, filterCallback);
				},
				sumByAll : function(col, filterCallback) {
					return this._aggregate("sum", col, filterCallback, true);
				},
				sum : function(col, filterCallback) {
					return this._aggregate("sum", col, filterCallback);
				},
				Min : function(col, filterCallback) {
					return this._aggregate("min", col, filterCallback);
				},
				minByAll : function(col, filterCallback) {
					return this._aggregate("min", col, filterCallback, true);
				},
				min : function(col, filterCallback) {
					return this._aggregate("min", col, filterCallback);
				},
				Max : function(col, filterCallback) {
					return this._aggregate("max", col, filterCallback);
				},
				maxByAll : function(col, filterCallback) {
					return this._aggregate("max", col, filterCallback, true);
				},
				max : function(col, filterCallback) {
					return this._aggregate("max", col, filterCallback);
				},
				getChangedIDs : function(type, delim) {
					var rows = this.getChangedRows(type),ids=[];
					if($.isArray(rows))
						$.each(rows,function(i,row){
							ids.push(row.getID());
						});
					return ids.join(delim||',');
				},
				getChangedRows : function(type) {
					if (Data.STATE.DELETE === type) {
						return this.deleteDatas.peek();
					}
					var ret = [];
					this.eachAllByPeek(function(param){
						var row = param.row;
						if(type==this.getRowState(row))
							ret.push(row);
					},this);
					return ret;
				},
				_row2Json : function(row,excludeCalculateCol,excludeCols,simple) {
					var ret = {};
					for ( var k in this.defCols) {
						var isExcludeCol = $.isArray(excludeCols)?($.inArray(k,excludeCols)>-1):false;
						if ((simple || (!simple && k !== this.idColumn)) && (!isExcludeCol && (!excludeCalculateCol||(excludeCalculateCol && !this.isUICalculateCol(k)))))
							ret[k] = !simple?row.row[k]:row.ref(k);
					}
					ret.userdata = $.extend({},row.row.userdata);					
					if(!simple) ret.userdata.id = row.row[this.idColumn];
					delete ret.userdata.parent;
					return Bind.toJS(ret);
				},
				_rows2Json : function(rows,excludeCalculateCol,excludeCols,simple) {
					var relationAlias = '', relationTypes = '', relations = '';
					for ( var col in this.defCols) {
						var isExcludeCol = $.isArray(excludeCols)?($.inArray(col,excludeCols)>-1):false;
						if (col !== this.idColumn && (!isExcludeCol && (!excludeCalculateCol||(excludeCalculateCol && !this.isUICalculateCol(col))))) {
							var defcol = this.defCols[col];
							relationAlias += ('' !== relationAlias ? (',' + col) : col);
							relationTypes += ('' !== relationTypes ? (',' + defcol.type) : defcol.type);
							relations += ('' !== relations ? (',' + defcol.define) : defcol.define);
						}
					}
					return {
						"@type" : "table",
						rows : rows,
						userdata : $.extend(this.userdata,{
							idColumnDefine : this.defCols[this.idColumn].define,
							idColumnName : this.idColumn,
							idColumnType : this.defCols[this.idColumn].type,
							model : this.dataModel,
							relationAlias : relationAlias,
							relationTypes : relationTypes,
							relations : relations,
							updateMode : this.updateMode
						})
					};
				},
				toJson : function(option) {
					var changed=false,excludeCalculateCol=false,excludeCols=[],simple=false;
					if(arguments.length==1&&typeof(option)=='object'){
						changed=option.onlyChanged;
						excludeCalculateCol=option.excludeCalculateCol;
						excludeCols=option.excludeCols||[];
						simple=option.format==='simple';
					}else{//兼容原2个参数
						if(arguments.length>=1)	changed = arguments[0];
						if(arguments.length>=2)	excludeCalculateCol = arguments[1];
					}
					var rows = [];
					this.eachAllByPeek(function(data) {
						var row = data.row;
						var recordState = row.row.userdata.recordState;
						if (!changed || Data.STATE.EDIT == recordState || Data.STATE.NEW == recordState || Data.STATE.DELETE == recordState) {
							rows.push(this._row2Json(row,excludeCalculateCol,excludeCols,simple));
						}
					}, this);
					// 删除的数据
					var delDatas = this.deleteDatas.get();
					if (delDatas.length > 0) {
						var len = delDatas.length;
						for ( var i = 0; i < len; i++) {
							rows.push(this._row2Json(delDatas[i],excludeCalculateCol,excludeCols,simple));
						}
					}
					return this._rows2Json(rows,excludeCalculateCol,excludeCols,simple);
				}
			});

	Data.Row = Row;
	Data.registerData = function(model, xid, data) {
		if (model instanceof Model) {
			model[xid] = data;
			model.registerComponent(xid, data);
		}
	};

	Data.unRegisterData = function(model, xid) {
		if (model instanceof Model) {
			model.unRegisterComponent(xid);
			delete model[xid];
		}
	};

	Data.$ = function(model, xid) {
		return model instanceof Model ? model.getComponent(xid) : null;
	};

	Data.each = function(model, callback) {
		if (!model || !$.isFunction(callback))
			return;
		for ( var s in model) {
			var o = model[s];
			if (o instanceof Data) {
				var eventData = {
					data : o,
					cancel : false
				};
				callback(eventData);
				if (eventData.cancel)
					return;
			}
		}
	};

	Data.UUID = function() {
		return justep.UUID.createUUID();
	};

	Data.STATE = {
		'NEW' : 'new',
		'DELETE' : 'delete',
		'EDIT' : 'edit',
		'NONE' : 'none'
	};

	// 其他事件＝＝＝＝＝＝＝＝＝＝＝＝＝＝
	Data.EVENT_CREATE = "onCreate";
	Data.EVENT_CUSTOM_SORT = "onCustomSort";
	// 数据值变化
	Data.EVENT_VALUE_CHANGE = "onValueChange";
	Data.EVENT_VALUE_CHANGED = "onValueChanged";
	Data.EVENT_DATA_CHANGE = "onDataChange";
	Data.EVENT_INDEX_CHANGED = "onIndexChanged";
	Data.EVENT_INDEX_CHANGING = "onIndexChanging";
	Data.EVENT_LOAD_SLAVEDATA = "onLoadSlave";
	Data.EVENT_SLAVEDATAS_CHANGED = "onSlaveDatasChanged";
	// 新增业务数据的事件＝＝＝＝＝＝＝＝＝
	Data.EVENT_NEWDATA_ERROR = "onNewError";
	Data.EVENT_NEWDATA_CREATEPARAM = "onNewCreateParam";
	Data.EVENT_NEWDATA_BEFORE = "onBeforeNew";
	Data.EVENT_NEWDATA = "onCustomNew";
	Data.EVENT_NEWDATA_AFTER = "onAfterNew";
	// 删除业务数据的事件＝＝＝＝＝＝＝＝＝
	Data.EVENT_DELETEDATA_ERROR = "onDeleteError";
	Data.EVENT_DELETEDATA_BEFORE = "onBeforeDelete";
	Data.EVENT_DELETEDATA = "onCustomDelete";
	Data.EVENT_DELETEDATA_AFTER = "onAfterDelete";
	// 刷新业务数据的事件＝＝＝＝＝＝＝＝＝
	Data.EVENT_REFRESHDATA_ERROR = "onRefreshError";
	Data.EVENT_REFRESHDATA_CREATEPARAM = "onRefreshCreateParam";
	Data.EVENT_REFRESHDATA_BEFORE = "onBeforeRefresh";
	Data.EVENT_REFRESHDATA = "onCustomRefresh";
	Data.EVENT_REFRESHDATA_AFTER = "onAfterRefresh";
	// 保存业务数据的事件＝＝＝＝＝＝＝＝＝
	Data.EVENT_SAVEDATA_ERROR = "onSaveError";
	Data.EVENT_SAVEDATA_CREATEPARAM = "onSaveCreateParam";
	Data.EVENT_SAVEDATA_BEFORE = "onBeforeSave";
	Data.EVENT_SAVEDATA = "onCustomSave";
	Data.EVENT_SAVEDATA_AFTER = "onAfterSave";
	// 保存事务启动后
	Data.EVENT_SAVE_COMMIT = "onSaveCommit";
	Data.LOAD_TREE_ROOT = "___tree___root___";
	Data.NODE_KIND_LEAF = "nkLeaf";

	var date2String = function(){
		return justep.Date.toString(this, 'yyyy-MM-dd'); 
	};
	
	var dateTime2String = function(){
		return justep.Date.toString(this, 'yyyy-MM-dd hh:mm:ss'); 
	};

	var time2String = function(){
		return justep.Date.toString(this, 'hh:mm:ss'); 
	};

	Data.convert = function(v, t) {
		if (t == 'String') return v;
		var errorValue;
		if (-1 < $.inArray(t, [ 'Integer', 'Long' ]) && typeof (v) === 'string'){
			errorValue = Data.createErrorValue(v);
			v = justep.String.toInt(v, errorValue);
		}else if (-1 < $.inArray(t, [ 'Double', 'Float', 'Decimal']) && typeof (v) === 'string'){
			errorValue = Data.createErrorValue(v);
			v = justep.String.toFloat(v, errorValue);
		}else if (t == 'Date' && typeof (v) === 'string' && v) {
			v = justep.Date.fromString(v, "yyyy-MM-dd");
			if (!v){
				errorValue = Data.createErrorValue(v);
				v = errorValue;
			}else 
				v.toString = date2String;
		} else if (t == 'DateTime' && typeof (v) === 'string' && v) {
			v = justep.Date.fromString(v, "yyyy-MM-ddThh:mm:ss.fff");
			if (!v){
				errorValue = Data.createErrorValue(v);
				v = errorValue;
			}else
				v.toString = dateTime2String;
		}
		return v;
	};

	Data.str2time = function(v){
		v = justep.Date.fromString(v, "hh:mm:ss.fff");
		if (!v){
			var errorValue = Data.createErrorValue(v);
			v = errorValue;
		}else
			v.toString = time2String;
		return v;
	};
	
	Data.ErrorValue = justep.Object.extend({
		constructor : function(value) {
			this.value = value;
		},
		toString : function() {
			return NaN;
		}
	});
	
	Data.createErrorValue = function(value) {
		var ret = new Data.ErrorValue(value);
		return ret;
	};

	Data.NullValue = justep.BindComponent.NullValue;
	//规则
	Data.Rules = Rules;

	//操作
	justep.Component.addOperations(Data, {
		'save' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231003),
			icon : 'glyphicon glyphicon-floppy-disk',
			init : function() {
				var op = this, data = this.owner, canSave = function() {
					op.setEnable(!data.getReadonly() && data.isChanged());
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, canSave);
				this.owner.on(Data.EVENT_SAVE_COMMIT, canSave);
				this.owner.on(Data.EVENT_INDEX_CHANGED, canSave);
			},
			method : function(args) {
				return this.owner.saveData();
			}
		},
		'delete' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231005),
			icon : 'icon-minus',
			init : function() {
				var op = this, data = this.owner, canDel = function() {
					setTimeout(function(){
						op.setEnable(!data.getReadonly() && data.getCount() > 0 && !!data.getCurrentRow(true));
					},1);
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, canDel);
				this.owner.on(Data.EVENT_INDEX_CHANGED, canDel);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, canDel);
			},
			argsDef : [ {
				name : 'rows',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231083)
			} ],
			method : function(args) {
				return this.owner.deleteData(args.rows,{async:true});
			}
		},
		'new' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231006),
			icon : 'icon-plus',
			init : function() {
				var op = this, data = this.owner, canNew = function() {
					setTimeout(function(){
						op.setEnable(!data.getReadonly());
					},1);
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, canNew);
				this.owner.on(Data.EVENT_INDEX_CHANGED, canNew);
			},
			argsDef : [ {
				name : 'defaultValues',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231084)
			},
			{
				name : 'index',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231096)
			}],
			method : function(args) {
				return this.owner.newData(args);
			}
		},
		'newChild' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231008),
			icon : 'icon-plus',
			init : function() {
				var op = this, data = this.owner, canNew = function() {
					setTimeout(function(){
						op.setEnable(data.isTree()&&!data.getReadonly()&&!!data.getCurrentRow(true));
					},1);
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, canNew);
				this.owner.on(Data.EVENT_INDEX_CHANGED, canNew);
			},
			argsDef : [ {
				name : 'defaultValues',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231084)
			} ],
			method : function(args) {
				args.parent = this.owner.getCurrentRow(true);
				return this.owner.newData(args);
			}
		},
		'newBrother' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231009),
			icon : 'icon-plus',
			init : function() {
				var op = this, data = this.owner, canNew = function() {
					setTimeout(function(){
						op.setEnable(data.isTree()&&!data.getReadonly()&&!!data.getCurrentRow(true));
					},1);
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, canNew);
				this.owner.on(Data.EVENT_INDEX_CHANGED, canNew);
			},
			argsDef : [ {
				name : 'defaultValues',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231084)
			} ],
			method : function(args) {
				var crow = this.owner.getCurrentRow(true);
				if(crow)
					args.parent = crow.parent();
				return this.owner.newData(args);
			}
		},
		'refresh' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231007),
			icon : 'icon-refresh',
			method : function(args) {
				return this.owner.refreshData({async:true});
			}
		},
		'firstRow' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231086),
			icon : 'icon-chevron-left',
			init : function() {
				var op = this, data = this.owner, can = function() {
					var len = data.getCount();
					op.setEnable(len > 1 && data.getFirstRow()!==data.getCurrentRow(true));
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_INDEX_CHANGED, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function() {
				return this.owner.first();
			}
		},
		'prevRow' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231010),
			icon : 'icon-chevron-left',
			init : function() {
				var op = this, data = this.owner, can = function() {
					var len = data.getCount();
					op.setEnable(len > 1 && data.getFirstRow()!==data.getCurrentRow(true));
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_INDEX_CHANGED, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function() {
				return this.owner.pre();
			}
		},
		'nextRow' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231011),
			icon : 'icon-chevron-right',
			init : function() {
				var op = this, data = this.owner, can = function() {
					var len = data.getCount();
					op.setEnable(len > 1 && data.getLastRow()!==data.getCurrentRow(true));
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_INDEX_CHANGED, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function() {
				return this.owner.next();
			}
		},
		'lastRow' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231087),
			icon : 'icon-chevron-right',
			init : function() {
				var op = this, data = this.owner, can = function() {
					var len = data.getCount();
					op.setEnable(len > 1 && data.getLastRow()!==data.getCurrentRow(true));
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_INDEX_CHANGED, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function() {
				return this.owner.last();
			}
		},
		'loadPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231097),
			icon : '',
			argsDef : [ {
				name : 'pageIndex',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231061)
			} ],
			method : function(args) {
				var data = this.owner;
				var pageIndex = isNaN(args.pagrIndex)||'number'!=typeof(args.pagrIndex)?1:args.pagrIndex;
				return data.loadPageData(pageIndex,{async:true});
			}
		},
		'firstPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231064),
			icon : 'icon-chevron-left',
			init : function() {
				var op = this, data = this.owner, can = function() {
					op.setEnable(data.limit!=-1 && data.getOffset()>data.limit);
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function(args) {
				return this.owner.loadPageData(1,{async:true});
			}
		},
		'prevPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231015),
			icon : 'icon-chevron-left',
			init : function() {
				var op = this, data = this.owner, can = function() {
					op.setEnable(data.limit!=-1 && data.getOffset()>data.limit);
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function(args) {
				var data = this.owner;
				var pageIndex = data.getOffset()/data.limit - 1;
				return data.loadPageData(pageIndex,{async:true});
			}
		},
		'nextPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231014),
			icon : 'icon-chevron-right',
			init : function() {
				var op = this, data = this.owner, can = function() {
					op.setEnable(data.limit!=-1 && data.getOffset()<=data.getTotal());
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function(args) {
				var data = this.owner;
				var pageIndex = data.getOffset()/data.limit + 1;
				return data.loadPageData(pageIndex,{async:true});
			}
		},
		'lastPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231065),
			icon : 'icon-chevron-right',
			init : function() {
				var op = this, data = this.owner, can = function() {
					op.setEnable(data.limit!=-1 && data.getOffset()<=data.getTotal());
				};
				this.owner.on(Data.EVENT_DATA_CHANGE, can);
				this.owner.on(Data.EVENT_SLAVEDATAS_CHANGED, can);
			},
			method : function(args) {
				var data = this.owner,mod=data.getTotal()%data.limit;
				var pageIndex = Math.round(data.getTotal()/data.limit-0.5) + (mod===0?0:1);
				return data.loadPageData(pageIndex,{async:true});
			}
		},
		'loadNextPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231012),
			icon : 'icon-chevron-right',
			method : function() {
				return this.owner.loadNextPageData({async:true});
			}
		},
		'loadAllPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231013),
			icon : 'icon-chevron-right',
			method : function() {
				return this.owner.loadAllPageData({async:true});
			}
		}
	});
	
	Data.getColDef = function(ref){
		if(ref && ref['define']){
			//define = {data,row,col,defCol}
			var refDef = ref['define'];
			return refDef.defCol;
		}
	};

	//扩展类型
	Data.ExtendType = ExtendType;
	
	Data.registerExtendType = ExtendType.registerExtendType;
	
	Data.unregisterExtendType = ExtendType.unregisterExtendType;
	
	Data.getEditor = ExtendType.getEditor;
	
	Data.getExtendTypeClass = ExtendType.getExtendTypeClass;
	
	Data.getExtendTypeObject = ExtendType.getExtendTypeObject;
	
	return Data;
});