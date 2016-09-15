define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var Data = require("./data");
	var Baas = require("$UI/system/lib/base/baas");

		var Filter = function() {
			this.filterList = {};			
			this.variables = {};
		};
		
		Filter.prototype = {
			clear : function() {
				for (var o in this.filterList)
					delete this.filterList[o];
				this.clearVars();
			},
		
			clearVars : function() {
				this.variables = {};
			},
		
			getVar : function(name) {
				return this.variables[name];
			},
		
			setVar : function(name, ver) {
				return this.variables[name] = ver;
			},
		
			setFilter : function(name, filter) {
				this.filterList[name] = filter;
			},
		
			getFilter : function(name) {
				return this.filterList[name];
			},
		
			deleteFilter : function(name) {
				delete this.filterList[name];
			},
		
			toString : function() {
				var result = '';
				for (var o in this.filterList) {
					var filter = this.filterList[o];
					if (!filter)
						continue;
					result += result ? ' AND (' + filter + ')' : '(' + filter + ')';
				}
				return result;
			}
		};
	
	var BaasData = null;
	BaasData = Data.extend({
		constructor : function(model, config) {
			this.dataType = "json";
			// 创建filters对象
			this.filters = new Filter();
			this.callParent(model, config);
			this.clz = BaasData;
		},
		buildFilter : function() {
			return this.filters.toString();
		},
		getFilter : function(name) {
			return this.filters.getFilter(name);
		},
		setFilter : function(name, filter) {
			return this.filters.setFilter(name, filter);
		},
		getQueryAction : function() {
			return this.queryAction;
		},

		getNewAction : function() {
			return this.newAction;
		},

		getSaveAction : function() {
			return this.saveAction;
		},
		_initDefinition : function() {
			this.queryParam = {};
			this.newParam = {};
			this.saveParam = {};
			this.queryAction = this.definition.queryAction || "queryAction";
			this.newAction = this.definition.newAction || "";
			this.saveAction = this.definition.saveAction || "saveAction";
			this.tableName = this.definition.tableName || "";
			this.url = this.definition.url || "/action";

			this.callParent();
		},

		_createSaveParam : function(onlySelf) {
			this.saveParam.tables = [];
			var data = this.toJson({onlyChanged:true,excludeCalculateCol:true});
			this.saveParam.tables.push(data);
			if(!onlySelf){//当有从数据时构造参数一起保存
				var len = this.slaveDatas.length;
				for ( var i = 0; i < len; i++) {
					var slaveData = this.slaveDatas[i];
					if (slaveData)
						this.saveParam.tables.push(slaveData.toJson({onlyChanged:true,excludeCalculateCol:true}));
				}
			}
			var eventData = {
				'param' : this.saveParam,
				'source' : this
			};
			this.fireEvent(Data.EVENT_SAVEDATA_CREATEPARAM, eventData);
		},

		//增加userdata的tableName
		_rows2Json : function(rows,excludeCalculateCol,excludeCols,simple){
			var ret = this.callParent.apply(this, arguments);
			ret.userdata.tableName = this.tableName;
			return ret;
		},
		/**
		 * 执行保存的动作
		 * 
		 * @param {function}
		 *            callback 回调
		 * @param {boolean}
		 *            useTrans 使用事务，批提交，默认true
		 * @param {boolean}
		 *            ignoreInvalid 保存时忽略有效性校验，默认false
		 * @return {boolean}
		 */
		doSaveData : function(options) {
			if (!this.getSaveAction()) {
				var msg = new justep.Message(justep.Message.JUSTEP231024, this.id);
				throw justep.Error.create(msg);
			}

			var onlySelf = (options&&options.onlySelf)||false;
			var result = true;

			//保存从数据逻辑使用tables参数实现
			this._createSaveParam(onlySelf);

			var self = this;
			Baas.sendRequest({
				'url' : this.url,
				'action' : this.getSaveAction(),
				'params' : this.saveParam,
				'success' : function() {
					self._saveSuccess(null, options);
				},
				'error' : function(data){
					self._saveError(data, options);
				}
			});

			return {success:result,async:true};
		},

		_saveSuccess: function(data, options){
			var eventData = {
					source : this,
					data: data
			};
			this.doSaveAfter(true, options, eventData);
		},
		_saveError: function(data, options){
			// 派发error事件
			var eventData = {
				'errorType' : 'server',
				'errorNode' : data,
				'httpError' : data.httpError,
				'httpState' : data.httpState,
				'source' : this
			};
			var b = (options && options.onError && $.isFunction(options.onError)) || this.hasListener(Data.EVENT_SAVEDATA_ERROR);
			if (!b) {
				Baas.showError(data);
			}
			this.doSaveAfter(false, options, eventData);
		},

		getDeleteParam : function(rowList) {
			if (!rowList)
				return;
			var rows = [];
			var len = rowList.length;
			for ( var i = 0; i < len; i++) {
				var row = rowList[i];
				if (Data.STATE.NEW != this.getRowState(row)) {
					row = this._row2Json(row);
					row.userdata.recordState = Data.STATE.DELETE;
					rows.push(row);
				}
			}
			return rows.length>0?this._rows2Json(rows):null;
		},

		doDirectDeleteData : function(rows,options) {
			var param = this.getDeleteParam(rows);

			if (!param)
				return {success:true,async:false};

			var self = this;
			this.saveParam.tables = [param];

			if (param) {
				var result = true;
				// 虽然是异步写法，但是是按同步执行的
				Baas.sendRequest({
					'url' : this.url,
					'action' : this.getSaveAction(),
					'params' : this.saveParam,
					'success' : function() {
						var eventData = {
								'source' : self,
								'deleteRows' : rows
						};
						self.doDeleteAfter(true, options, eventData);
					},
					'error' : function(data){
						var onError = options?options.onError:null;
						var eventData = {
								'source' : self,
								'httpError' : data.httpError,
								'httpState' : data.httpState,
								'errorType' : 'server',
								'errorNode' : data
						};
						var b = (onError && $.isFunction(onError)) || self.hasListener(Data.EVENT_DELETEDATA_ERROR);
						if (!b) {
							Baas.showError(data);
						}
						self.doDeleteAfter(false, options, eventData);
					}
				});
				return {success:result,async:true};
			}
			return {success:true,async:false};
		},

		doRefreshData : function(options) {
			return this._doRefreshData(this.getOffset(options ? options.parent : null), this.limit, options);
		},
		
		_createRefreshParam : function(offset, limit, append, options) {
			this.queryParam.tableName = this.tableName;
			// 主从过滤处理
			if (this.master) {
				var masterData = this.master.masterData, masterRow = masterData.getCurrentRow();
				if (!masterRow)
					return false;
				if (masterData) {
					var masterRowId = masterData.getRowID(masterRow);
					var masterRelationName = this.defCols[this.master.relation].relation;
					this.queryParam.master = {field:masterRelationName,value:masterRowId};
				}else{
					delete this.queryParam.master;
				}
			}
			
			//树形数据处理
			if(this.isTree()){
				var treeOption = this.defTreeOption.option;
				this.queryParam.tree = {
						isDelayLoad: treeOption.isDelayLoad,
						parentField: treeOption.parentRelation,
						idField: this.idColumn
				};
				if(options.parent){
					this.queryParam.tree.parentValue = this.getRowID(options.parent);
				}else{
					this.queryParam.tree.rootFilter = treeOption.rootFilter;
				}
			}else delete this.queryParam.tree;

			var filter = this.buildFilter();
			if (filter)
				this.queryParam.filter = filter;
			else
				delete this.queryParam.filter;
			
			var hasVariable = false;
			$.each(this.filters.variables, function(n,v){
				hasVariable = true;
				return false;
			});
			if(!hasVariable) delete this.queryParam.variables;
			else this.queryParam.variables = this.filters.variables;
			this.queryParam.offset = offset;
			this.queryParam.limit = limit;

			this.queryParam.columns = Baas.getDataColumns(this);
			var o = this.getOrderBys();
			if (o)
				this.queryParam.orderBy = o;
			else
				delete this.queryParam.orderBy;

			var eventData = {
				'param' : this.queryParam,
				'source' : this,
				'offset' : offset,
				'limit' : limit,
				'options': options,
				'append' : !!append
			};
			this.fireEvent(Data.EVENT_REFRESHDATA_CREATEPARAM, eventData);
			return true;
		},

		_doRefreshData : function(offset, limit, options) {
			var onError = null, onSuccess = null, onLoad;
			if (options) {
				if ($.isFunction(options))
					onSuccess = options;
				else {
					onError = options.onError;
					onSuccess = options.onSuccess;
					onLoad = options.onLoad;
				}
			}

			if (!this.getQueryAction()) {
				var msg = new justep.Message(justep.Message.JUSTEP231028, this.id);
				throw justep.Error.create(msg);
			}
			if (!this._createRefreshParam(offset, limit, options ? options.append : false, options))
				return false;
			// var _me = this;
			// __checkMD5Code2__
			var self = this;
			Baas.sendRequest({
				'url' : this.url,
				'async' : options.async,
				'action' : this.getQueryAction(),
				'params' : this.queryParam,
				'success' : function(resultData) {
					var o = resultData;
					if (0 === offset) {// 需要放在前面
						var count = o.userdata['sys.count'];
						self.setTotal(count, options ? options.parent : null);
					}
					if (onLoad && $.isFunction(onLoad))
						onLoad({
							source : self,
							rows: o
						});
					self.loadData(o, options ? options.append : false, options ? options.parent : null);
					var eventData = {
							source : self,
							rows: o
					};
					self.doRefreshAfter(true, options, eventData);
				},
				'error' : function(resultData){
					var eventData = {
							'errorType' : 'server',
							'errorNode' : resultData.response,
							'httpError' : resultData.httpError,
							'httpState' : resultData.httpState,
							'source' : self
						};
					var b = (onError && $.isFunction(onError)) || self.hasListener(Data.EVENT_REFRESHDATA_ERROR);
					if (!b) {
						Baas.showError(resultData);
					}
					self.doRefreshAfter(false, options, eventData);
				}
			});
			
			return {success:true,async:true};
		}
	});

	return BaasData;
});