/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("css!./css/relativeOrg").load();
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var url = require.normalizeName("./relativeOrg");
	var ComponentConfig = require("./relativeOrg.config");
	var MessageDialog = require("$UI/system/components/justep/messageDialog/messageDialog");
	var OrgDialog = require("$UI/system/components/justep/org/orgDialog");
	var Data = require("$UI/system/components/justep/data/data");
	
	var ADD_ACTION_CLASS = ".x-img-list-add";
	var REMOVE_ACTION_CLASS = ".x-img-list-remove";
	var CHANGE_ACTION_CLASS = ".x-img-list-change";
	var REMOVE_ITEM_ACTION_CLASS = ".x-img-list-remove-item";
	var REMOVE_ALL_ACTION_CLASS = ".x-img-list-remove-all";
	var IMG_LIST_CLASS = ">.x-img-list";
	

	var RelativeOrg = justep.ViewComponent.extend({
		constructor : function(options) {
			this.callParent(options);
			this.data = "";
			this.groupName = "";
			this.groupID = "";
			this.filter = "";
			this.statusEnabled = true;
			this.multiSelection = false;
			this.multiValue = false;
			this.readonly = "";
			this.socialData = "";
			this.process = "";
			this.activity = "";
			this.url = "";

			this._statusSummary = justep.Bind.observable("");
			this._btnStatus = justep.Bind.observable("");
		},

		buildTemplate : function(config) {
			throw new Error("RelativeOrg don't support new operation");
		},

		getConfig : function() {
			return ComponentConfig;
		},

		_saveSocialDataEvent : function() {
			this.saveData();
		},

		init : function(value, bindingContext, allBindings) {
			this.callParent(value, bindingContext, allBindings);

			var self = this;
			this.getModel().componentPromise(this.data).done(function(data) {
				data.un("onAfterSave", self._saveSocialDataEvent, self.getSocialDataComponent());
				data.on("onAfterSave", self._saveSocialDataEvent, self.getSocialDataComponent());
				data.currentRow.subscribe(function(row) {
					self.refresh();
				});

			});

			this.getModel().componentPromise(this.socialData).done(function(data) {
				data.on("onBeforeRefresh", function(event) {
					var filterName = "__roFilter__";
					var roFilter = "(SA_Social.sTypeID='RelativeOrg') and (SA_Social.sValidState=1)";
					var oldRoFilter = data.getFilter(filterName);
					if (oldRoFilter !== roFilter) {
						data.setFilter(filterName, roFilter);
					}
				});
			});

			var listNode = this.$domNode.find(IMG_LIST_CLASS)[0];
			this.getModel().componentPromise(listNode).done(function(list) {
				//这个计算只是为了将list中的数据计算到_statusSummary中
				justep.Bind.computed(function() {
					var value = "";
					var rows = list.getForeachData();
					if (rows) {
						var readedNumber = 0;
						for ( var i = 0; i < rows.length; i++) {
							var number = rows[i].val("sMessageNumber") || 0;
							if (number === 0)
								readedNumber++;
						}
						value = "已阅人数（" + readedNumber + "/" + rows.length + "）";
					}

					self._statusSummary.set(value);
				});
			});

			this.$domNode.on("click", ADD_ACTION_CLASS, function(event) {
				var dialog = self._getOrgDialog();
				dialog.open({
					data : {
						selected : {
							kind : 'sName',
							value : []
						},
						multiSelection : self.multiSelection
					}
				});
			});
			this.$domNode.on("click", REMOVE_ACTION_CLASS, function(event) {
				self._btnStatus.set("removeAll");
				event.stopPropagation(); //阻止事件冒泡, 从而不触发domNode上的click
			});
			this.$domNode.on("click", CHANGE_ACTION_CLASS, function(event) {
				var dialog = self._getOrgDialog();
				dialog.open({
					data : {
						selected : {
							kind : 'sName',
							value : []
						},
						multiSelection : self.multiSelection
					}
				});
			});
			this.$domNode.on("click", REMOVE_ITEM_ACTION_CLASS, function(event) {
				var row = justep.Bind.contextFor(event.target).$object;
				row.data.deleteData([ row ]);
				self._fireChangeEvent();
				
				if (self.getRows().length === 0){
					self._reset();
				}
				event.stopPropagation(); //阻止事件冒泡, 从而不触发domNode上的click
			});
			this.$domNode.on("click", REMOVE_ALL_ACTION_CLASS, function(event) {
				if (!self._msgDialog) {
					self._msgDialog = new MessageDialog({
						parentNode : self.domNode
					});
					self._msgDialog.on("onOK", function() {
						self._clearList();
						self._reset();
						self._fireChangeEvent();
					});
				}
				self._msgDialog.show({
					type : "OKCancel",
					title : "提示",
					message : "确认清空所有吗？"
				});
				event.stopPropagation(); //阻止事件冒泡, 从而不触发domNode上的click
			});
			
			this.$domNode.on("click", IMG_LIST_CLASS, function(event) {
				if (self._btnStatus.get()){
					var list = self.$domNode.find(IMG_LIST_CLASS)[0];
					if ((list === event.target) || ($(list).find(event.target).length > 0)){
						self._reset();
					}
				}
			});
		},

		_fireChangeEvent : function() {
			this.fireEvent(RelativeOrg.CHANGE, {
				source : this,
				value : this.getRows()
			});
		},

		dispose : function() {
			this.$domNode.off("click", "**");
			this.callParent();
		},

		update : function(value, bindingContext, allBindings) {
			this.callParent(value, bindingContext, allBindings);
			this.nameRef = value ? value.nameRef : null;
			if (this.nameRef) {
				var name = this._getNameValue();
				var rows = this.getRows();
				for ( var i = 0; i < rows.length; i++) {
					rows[i].ref("sName").set(name);
				}
			}

		},

		_getNameValue : function() {
			if (!this.nameRef) {
				var msg = new justep.Message(justep.Message.JUSTEP230100, this.$domNode.attr("xid") || "");
				throw justep.Error.create(msg);
			} else {
				return justep.Bind.utils.unwrapObservable(this.nameRef);
			}
		},
		
		_getSelectedFIDs: function(){
			var result = [];
			var rows = this.getRows();
			for (var i=0; i<rows.length; i++){
				result.push(rows[i].val("sOrgFID"));
			}
			return result;
		},

		_getOrgDialog : function(action) {
			if (!this._orgDialog) {
				this._orgDialog = new OrgDialog({
					//parentNode : this.domNode, 由于将对话框放到当前组件下titleBar会出问题
					parentNode : this.getModel().getRootNode(),
					includeOrgKind: "psm"
				});
				var self = this;
				this._orgDialog.on("onReceive", function(evt) {
					var content = {
						rows : [],
						userdata : {
							model : "/system/data"
						}
					};
					var rows = evt.data || [];
					var context = self.getModel().getContext();
					var curProcess = null;
					var curActivity = null;
					if (self.process && self.activity) {
						curProcess = self.process;
						curActivity = self.activity;
					} else {
						curProcess = context.getProcess();
						curActivity = context.getActivity();
					}
					var fids = self._getSelectedFIDs();
					var curUrl = self.url || (curProcess.substring(0, curProcess.lastIndexOf("/")) + "/" + curActivity + ".a");
					for ( var i = 0; i < rows.length; i++) {
						if (self.multiSelection && (fids.indexOf(rows[i].val("sFID")) !== -1)){
							continue;
						}
						content.rows.push({
							SA_Social : justep.UUID.createUUID(),
							sTypeID : "RelativeOrg",
							sTypeName : "相关人",
							sCreatorID : context.getCurrentPersonID(),
							sCreatorName : context.getCurrentPersonMemberNameWithAgent(),
							sCreatorFID : context.getCurrentPersonMemberFID(),
							sCreatorFName : context.getCurrentPersonMemberFNameWithAgent(),
							sProcess : curProcess,
							sActivity : curActivity,
							sURL : curUrl,
							sOrgFID : rows[i].val("sFID"),
							sOrgFName : rows[i].val("sFName"),
							sOrgName : rows[i].val("sName"),
							sOrgID : rows[i].val("SA_OPOrg"),
							sPersonID : rows[i].val("sOrgKindID") == 'psm' ? rows[i].val("sPersonID") : "",
							sPersonName : rows[i].val("sOrgKindID") == 'psm' ? rows[i].val("sName") : "",
							sName : self._getNameValue(),
							sData1 : self._getValue(),
							sGroupID : self.groupID,
							sGroupName : self.groupName,
							sMessageNumber : 1,
							sValidState : 1,
							version : 0,
							sActive : 0,
							sCreateTime : justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT),
							userdata : {
								recordState : Data.STATE.NEW
							}
						});
					}
					if (content.rows.length === 0) return;
					
					var modify = rows.length > 0;
					var dataObj = self.getSocialDataComponent();
					if (!self.multiSelection) {
						self._clearList();
						modify = true;
					}

					dataObj.loadData(content, true);

					if (modify)
						self._fireChangeEvent();
				}, this);

			}

			return this._orgDialog;
		},

		_clearList : function() {
			this.getSocialDataComponent().deleteData(this.getRows());
		},

		_reset : function() {
			this._btnStatus.set("");
		},

		refresh : function() {
			var dc = this.getSocialDataComponent();
			var filterName = "__dataFilter__";
			var curDataFilter = dc.getFilter(filterName);
			var dataFilter = this._getDataFilter();
			if (curDataFilter !== dataFilter) {
				dc.setFilter(filterName, dataFilter);
				dc.refreshData({confirm: false});
			}

			var listNode = this.$domNode.find(IMG_LIST_CLASS)[0];
			var list = justep.Component.getComponent(listNode);
			if (list) {
				list.refresh();
			}
		},

		_getDataFilter : function() {
			var dataComponent = this.getModel().comp(this.data);
			var concept = dataComponent.idColumn;
			var type = dataComponent.defCols[concept].type;
			var value = dataComponent.val(concept);
			if (type === "String") {
				value = "'" + (value || "") + "'";
			}
			return "SA_Social.sData1=" + value;
		},

		_getValue : function() {
			var dataComponent = this.getModel().comp(this.data);
			var concept = dataComponent.idColumn;
			return dataComponent.val(concept);
		},

		getSocialDataComponent : function() {
			var xid = this.socialData;
			return this.getModel().comp(xid);
		},

		getRows : function() {
			var rows = [];
			var listNode = this.$domNode.find(IMG_LIST_CLASS)[0];
			var list = justep.Component.getComponent(listNode);
			if (list) {
				var items  = list.getForeachData() || [];
				if (!this.multiSelection && this.multiValue){
					//单选多值时, 只返回当前编辑的行
					for (var i=0; i<items.length; i++){
						if (items[i].data.getRowState(items[i]) === Data.STATE.NEW){
							rows.push(items[i]);
						}
					}
				}else{
					rows = items;
				}
			}
			return rows;
		},

		saveSocialData : function() {
			this.getSocialDataComponent().saveData();
		},

		/**以下方法需要通过ko提供给子节点使用*/
		getStatusSummary : function() {
			return this._statusSummary.get();
		},
		
		getBtnStatus : function(){
			return this._btnStatus.get();
		},

		isStatusEnabled : function() {
			return this.statusEnabled;
		},

		isReadonly : function() {
			if (this.readonly) {
				if (this.readonly && ('string' == typeof (this.readonly)))
					this.readonly = new justep.Express(this.readonly);
				var ctx = justep.Bind.contextFor(this.domNode);
				return justep.Express.eval(this.readonly, ctx.$object, ctx);
			} else {
				return false;
			}
		}
	});

	RelativeOrg.CHANGE = "onChange";

	justep.Component.register(url, RelativeOrg);
	return RelativeOrg;
});