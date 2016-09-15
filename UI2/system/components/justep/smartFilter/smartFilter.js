/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BizData = require("../data/bizData");

	var url = require.normalizeName("./smartFilter");
	var ComponentConfig = require("./smartFilter.config");

	var SmartFilter = justep.ViewComponent
			.extend({
				getConfig : function() {
					return ComponentConfig;
				},

				constructor : function(options) {
					this.callParent(options);
					this.filterData = "";
					this.filterCols = "";
					this.caseSensitive = false;
					this.autoRefresh = true;
					this.autoRefreshMode = "input";

					this.searchText = justep.Bind.observable("").extend({
						rateLimit : {
							method : "notifyWhenChangesStop",
							timeout : 500
						}
					});
					var self = this;
					this.searchText.subscribe(function() {
						if (self.isDirectRefreshMode()) {
							self.filter();
						}
					});
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
					return justep.String
							.format(
									'<div class="input-group" component="{0}" xid="{1}" > '
											+ '    <span class="input-group-addon" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"><i class="icon-android-search"/></span> '
											+ '    <input type="text" class="form-control" data-bind="valueUpdate: [\'input\', \'afterkeydown\']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"/> '
											+ '    <span class="input-group-addon" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))" bind-visible="$model.comp($element.parentElement).searchText.get() != \'\'"><i class="icon-close-circled"/></span> '
											+ ' </div> ', url, config.xid);
				},

				onInputChange : function() {
					if (!this.isDirectRefreshMode()) {
						this.filter();
					}
				},

				isDirectRefreshMode : function() {
					return (this.autoRefresh && this.autoRefreshMode == "input");
				},

				getFilterData : function() {
					var data = this.getModel().comp(this.filterData);
					if (!data || !(data instanceof BizData)) {
						throw justep.Error.create(new justep.Message(justep.Message.JUSTEP234000));
					}
					return data;
				},

				refresh : function() {
					this.filter();
				},

				clear : function() {
					this.searchText.set("");
					if (!this.isDirectRefreshMode()) {
						this.filter();
					}
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

				getFilterFlag : function() {
					return "_SMART_FILTER_" + this.$domNode.attr("xid");
				},
				
				getFilterStr : function() {
					var searchText = this.searchText.get();
					if ($.trim(searchText) === "") {
						return "";
					}
					
					var bizData = this.getFilterData();
					var cols = $.trim(this.filterCols || this.getFilterData().getColumnIDs()).split(",");
					var text = $.trim(searchText.replace(/'/g, "''"));
					if (text.indexOf("%") == -1) {
						text = "%" + text + "%";
					}

					var col, relation, type, filter, filters = [];
					for ( var i = 0, len = cols.length; i < len; i++) {
						col = cols[i];
						if (!col || !bizData.defCols[col]) {
							continue;
						}
						relation = bizData.defCols[col].relation;
						if (relation == "EXPRESS") {
							continue;
						}

						type = bizData.defCols[col].type;
						if ($.inArray(type, [ "Date", "Time", "DateTime" ]) != -1) {
							relation = type + "ToString(" + relation + ")";
						}
						if (!this.caseSensitive) {
							text = text.toUpperCase();
							relation = "upper(" + relation + ")";
						}

						filter = relation + " LIKE '" + text + "'";
						filters.push(filter);
					}
					return "(" + filters.join(") OR (") + ")";
				}

			});
	justep.Component.register(url, SmartFilter);
	return SmartFilter;
});