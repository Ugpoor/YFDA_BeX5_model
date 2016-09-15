/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var BizData = require("$UI/system/components/justep/data/bizData");
	var GridSelect = require("$UI/system/components/justep/gridSelect/gridSelect");

	var url = require.normalizeName("./gridFilter");
	var ComponentConfig = require("./gridFilter.config");

	var GridFilter = justep.ViewComponent
			.extend({
				getConfig : function() {
					return ComponentConfig;
				},

				constructor : function(options) {
					this.callParent(options);
					this.filterData = "";
					this.filterCol = "";
					this.defaultValue = null;
					this.autoRefresh = true;

					this.selectedValue = justep.Bind.observable("");
					this.selectedLabel = justep.Bind.observable("");
					var self = this;
					this.selectedValue.subscribe(function() {
						self.filter();
					});
				},

				buildTemplate : function(config) {
					if (!config) {
						config = {};
					}
					config.xid = config.xid ? config.xid : justep.UUID.createUUID();
					this.set(config);
					
					var domNode = $(justep.String.format('<div component="{0}" xid="{1}"></div>', url, config.xid));
					
					var gridSelectConfig = config["gridSelect"];
					gridSelectConfig["bind-ref"] = "$model.comp($element.parentElement).seletedValue";
					gridSelectConfig["bind-labelRef"] = "$model.comp($element.parentElement).seletedLabel";
					gridSelectConfig["parentNode"] = domNode[0];
					new GridSelect(gridSelectConfig["parentNode"]);
					
					return domNode;
				},

				init : function(value, bindingContext) {
					this.callParent(value, bindingContext);
					var data = this.getFilterData();
					if (this.defaultValue && data) {
						var event = function() {
							data.off(Data.EVENT_REFRESHDATA_BEFORE, event, this);
							var bak = this.autoRefresh;
							this.autoRefresh = false;
							try {
								this.filter();
							} finally {
								this.autoRefresh = bak;
							}
						}
						data.on(Data.EVENT_REFRESHDATA_BEFORE, event, this);
					}
				},

				propertyChangedHandler : function(key, oldVal, value) {
					switch (key) {
					case "defaultValue":
						if (oldVal != value) {
							this._defaultValueExpr = null;
						}
						break;
					default:
						this.callParent(key, oldVal, value);
					}
				},

				getFilterData : function() {
					return this.getModel().comp(this.filterData);
				},
				
				getGridSelect : function() {
					var dom = $("[component='$model/UI2/system/components/justep/gridSelect/gridSelect']", this.$domNode)[0];
					return this.getModel().comp(dom);
				},

				filter : function() {
					if (this.hasListener("onFilter")) {
						this.fireEvent("onFilter", {
							"source" : this
						});
					} else {
						var data = this.getFilterData();
						data.setFilter(this.getFilterFlag(), this.getFilterStr());
						if (this.autoRefresh) {
							data.refreshData({"async": true});
						}
					}
				},

				getDefaultValue : function() {
					if(this.defaultValue && typeof(this.defaultValue) == 'string') {
						if(!this._defaultValueExpr) {
							this._defaultValueExpr = new justep.Express(this.defaultValue);
						}
						var ctx = justep.Bind.contextFor(this.domNode);
						return justep.Express.eval(this._defaultValueExpr, ctx.$object, ctx);
					}
				},
				
				getFilterFlag : function() {
					return "_GRID_FILTER_" + this.$domNode.attr("xid");
				},

				getFilterStr : function() {
					var bizData = this.getFilterData();
					var relation = bizData.defCols[this.filterCol].relation;
					var values = this.selectedValue.get() || this.getDefaultValue();

					var gridSelect = this.getGridSelect();
					var multiSelect = gridSelect.optionCfg.multiselect;
					var separator = gridSelect.valueSeparator;
					
					
					if (!values || $.trim(values) === "") {
						return "";
					}
					
					separator = separator ? separator : ",";
					if (typeof(values) == "string") {
						if (multiSelect) {
							values = values.split(separator);  
						} else {
							values = [values];
						}
					}
					
					var filters = [];
					$.each(values, function(i, value) {
						value = value.replace(/'/g, "''");
						filters.push(relation + "='" + value + "'");
					});
					return "(" + filters.join(") OR (") + ")";
				}
			});
	
	justep.Component.register(url, GridFilter);
	return GridFilter;
});