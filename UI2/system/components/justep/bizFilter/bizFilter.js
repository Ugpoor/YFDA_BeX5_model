/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	// var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BizData = require("../data/bizData");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	var FilterUtils = require("./filterUtils");

	var url = require.normalizeName("./bizFilter");
	var ComponentConfig = require("./bizFilter.config");

	var FILTER_DIALOG = require.toUrl("$UI/system/components/justep/bizFilter/filterEditor.a");
	var PATTERN_DIALOG = require.toUrl("$UI/system/components/justep/bizFilter/filterPattern.a");
	
	var MENU_ITEM_CUSTOM = "custom";
	var MENU_ITEM_ALL = "all";
	var MENU_ITEM_MANAGE = "manage";
	var MENU_ITEM_PATTERN = "pattern";

	var BizFilter = justep.ViewComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},

		constructor : function(options) {
			this.callParent(options);
			this.filterData = "";
			this.filterCols = "";
			this.autoRefresh = true;
			this.process = "";
			this.activity = "";
		},

		dispose : function() {
			this.callParent();
		},

		buildTemplate : function(config) {
			if (!config) {
				config = {};
			}
			config.xid = config.xid ? config.xid : justep.UUID.createUUID();
			this.set(config);
			return '<span component="' + url + '" xid="' + config.xid + '"></span>';
		},

		getFilterData : function() {
			var data = this.getModel().comp(this.filterData);
			if (!data || !(data instanceof BizData))
				throw justep.Error.create(new justep.Message(justep.Message.JUSTEP234011));
			return data;
		},
		
		getProcess : function() {
			return this.process ? this.process : this.getModel().getContext().getProcess();
		},
		
		getActivity : function() {
			return this.activity ? this.activity : this.getModel().getContext().getActivity();
		},
		
		getInstance : function() {
			return this.$domNode.attr("xid");
		},
		
		getFilterDialog : function() {
			if (!this._filterDialog) {
				var self = this;
				this._filterDialog = new WindowDialog({
					"title" : "查询条件",
					"showTitle" : justep.Browser.isPC,
					"status" : justep.Browser.isPC ? "normal" : "maximize",
					"parentNode" : this.domNode,
					"src" : FILTER_DIALOG,
					"onReceive" : function(event) {
						self.onFilterDialogReceive(event);
					}
				});
			}
			return this._filterDialog;
		},

		onFilterDialogReceive : function(event) {
			this.filterJSON = event.data.filterJSON;
			this.filter(FilterUtils.getFilterStrByJSON(event.data.filterJSON));
		},

		getPatternDialog : function() {
			if (!this._patternDialog) {
				var self = this;
				this._patternDialog = new WindowDialog({
					"title" : "查询模板",
					"showTitle" : justep.Browser.isPC,
					"status" : justep.Browser.isPC ? "normal" : "maximize",
					"parentNode" : this.domNode,
					"src" : PATTERN_DIALOG,
					"onReceive" : function(event) {
						self.onPatternDialogReceive(event);
					}
				});
			}
			return this._patternDialog;
		},

		onPatternDialogReceive : function(event) {
			this.filterJSON = event.data.filterJSON;
			this.filter(FilterUtils.getFilterStrByJSON(event.data.filterJSON));
		},

		show : function() {
			this.getFilterDialog().open({
				"data" : {
					"filterContext" : {
						"instance" : this.getInstance(),
						"process" : this.getProcess(),
						"activity" : this.getActivity(),
						"filterData" : this.getFilterData(),
						"filterCols" : this.filterCols,
					},
					"openMode" : "editFilter",
					"filterJSON" : this.filterJSON
				}
			});

		},

		loadPattern : function() {
			this.getPatternDialog().open({
				"data" : {
					"filterContext" : {
						"instance" : this.getInstance(),
						"process" : this.getProcess(),
						"activity" : this.getActivity(),
						"filterData" : this.getFilterData(),
						"filterCols" : this.filterCols
					}
				}
			});

		},
		
		showMenu : function(anchor) {
			var popMenu = this.$domNode.children(".x-popMenu");
			var menu = popMenu.children(".x-menu");
			this._refreshMenuItems(menu);
			var popComp = this.getModel().comp(popMenu[0]);
			popComp.anchor = anchor;
			popComp.show();
		},
		
		_refreshMenuItems : function(menu) {
			if (menu.children().length === 0) {
				this._createMenuItem(menu, MENU_ITEM_CUSTOM, "自定义", "");
				this._createMenuItem(menu, MENU_ITEM_ALL, "所有数据", "");
				this._createMenuDivider(menu);
				this._createMenuItem(menu, MENU_ITEM_MANAGE, "查询模板...", "");
				
			}
			menu.children("[name='" + MENU_ITEM_PATTERN + "']").remove();
			var pattern = this._queryPattern();
			var self = this;
			pattern.each(function(param) {
				var row = param.row;
				var filter = FilterUtils.getFilterStrByJSON(row.val("sContent"));
				var text = "● " + row.val("sName");
				self._createMenuItem(menu, MENU_ITEM_PATTERN, text, filter);
			});
		},
		
		_onMenuItemClick : function(name, filter) {
			switch (name) {
			case MENU_ITEM_CUSTOM :
				this.show();
				break;
			case MENU_ITEM_ALL :
				this.filter("");
				break;
			case MENU_ITEM_MANAGE :
				this.loadPattern();
				break;
			case MENU_ITEM_PATTERN :
				this.filter(filter);
				break;
			}
		},
		
		_createMenuItem : function(menu, name, text, filter) {
			var self = this;
			var a = $("<a>", {
				"text" : text,
				"click" : function() {
					self._onMenuItemClick(name, filter);
				}
			});
			var item = $("<li>", {
				"class" : "x-menu-item",
				"name" : name 
			});
			a.appendTo(item);
			item.appendTo(menu);
		},
		
		_createMenuDivider : function(menu) {
			menu.append("<li class='x-menu-divider divider'/>");
		},
		
		_getPatternData : function() {
			if (!this._patternData) {
				this._patternData = new BizData(this.getModel(), {
					"xid" : justep.UUID.createUUID(),
					"defCols" : {
						"SA_FilterPattern" : {
							"type" : "String",
							"relation" : "SA_FilterPattern",
							"label" : "SA_FilterPattern"
						},
						"sName" : {
							"type" : "String",
							"relation" : "SA_FilterPattern.sName",
							"label" : "fString"
						},
						"sContent" : {
							"type" : "String",
							"relation" : "SA_FilterPattern.sContent",
							"label" : "fString"
						}
					},
					"idColumn" : "SA_FilterPattern",
					"queryAction" : "queryFilterPatternAction",
					"limit" : 10,
					"autoLoad" : false
				});
				var pathMatchFilter = FilterUtils.createPathMatchFilter("SA_FilterPattern.sOrgFID", this.getModel().getContext().getAllPersonMemberFIDs());
				this._patternData.setFilter("rangeFilter", "(SA_FilterPattern.sPerson = :operatorID()) OR (SA_FilterPattern.sPerson IS NULL AND SA_FilterPattern.sOrgFID IS NULL) OR (" + pathMatchFilter + ")");
				this._patternData.setFilter("instanceFilter", "SA_FilterPattern.sProcess = :process AND SA_FilterPattern.sActivity = :activity AND SA_FilterPattern.sInstance = :instance");
			}
			return this._patternData;
		},
		
		_queryPattern : function() {
			var data = this._getPatternData();
			data.filters.setStringVar("process", this.getProcess());
			data.filters.setStringVar("activity", this.getActivity());
			data.filters.setStringVar("instance", this.getInstance());
			data.refreshData({"async": false, "confirm": false});
			return data;
		},

		filter : function(filterStr) {
			if (this.hasListener("onFilter")) {
				this.fireEvent("onFilter", {
					"source" : this,
					"filter" : filterStr
				});
			} else {
				var data = this.getFilterData();
				data.setFilter(this.getFilterFlag(), filterStr);
				if (this.autoRefresh) {
					data.refreshData({"async": true});
				}
			}
		},

		getFilterFlag : function() {
			return FilterUtils.BIZ_FILTER_PREFIX + this.$domNode.attr("xid");
		}
	});

	justep.Component.addOperations(BizFilter, {
		"menu" : {
			label : justep.Message.getMessage(justep.Message.JUSTEP234010),
			icon : 'icon-android-search',
			init : function() {
			},
			method : function(args, ctx) {
				var anchor = ctx.$event.source.$domNode.attr("xid");
				return this.owner.showMenu(anchor);
			}
		},
		"show" : {
			label : justep.Message.getMessage(justep.Message.JUSTEP234010),
			icon : 'icon-android-search',
			init : function() {
			},
			method : function() {
				return this.owner.show();
			}
		},
		"loadPattern" : {
			label : justep.Message.getMessage(justep.Message.JUSTEP234012),
			icon : 'icon-android-search',
			init : function() {
			},
			method : function() {
				return this.owner.loadPattern();
			}
		},
	});

	justep.Component.register(url, BizFilter);
	return BizFilter;
});