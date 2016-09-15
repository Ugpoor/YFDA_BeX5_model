/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");

	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var BizData = require("../data/bizData");
	var OrgKinds = require("$UI/system/service/org/orgKinds");

	var url = require.normalizeName("./orgFilter");
	var ComponentConfig = require("./orgFilter.config");
	
	var MYSELF = "_myself_";

	var OrgFilter = justep.ViewComponent
			.extend({
				getConfig : function() {
					return ComponentConfig;
				},

				constructor : function(options) {
					this.callParent(options);
					this.filterData = "";
					this.orgFIDCol = "";
					this.personIDCol = "";
					this.useMyself = false;
					this.defaultValue = "";
					this.autoRefresh = true;

					this.selectedValue = justep.Bind.observable("");
					this.selectedLabel = justep.Bind.observable("");

					var self = this;
					this.selectedValue.subscribe(function(newValue) {
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
					
					// TODO wj: 未完整实现
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

				getFilterData : function() {
					return this.getModel().comp(this.filterData);
				},

				getFilterFlag : function() {
					return "_ORG_FILTER_" + this.$domNode.attr("xid");
				},
				
				getFilterStr : function() {
					var data = this.getFilterData();
					var urlRelation = data.defCols[this.orgFIDCol].relation;
					var psnRelation = this.personIDCol ? data.defCols[this.personIDCol].relation : null;
					
					var fullIDs = this.selectedValue.get();
					fullIDs = fullIDs ? fullIDs : this._getDefaultFullIDs();
					if (!fullIDs) {
						return "";
					} 
					fullIDs = fullIDs.split(",");
					var filters = [], fullID, orgkind, filter;
					for (var i = 0, len = fullIDs.length; i < len; i++) {
						fullID = fullIDs[i];
						orgkind = fullID.substring(fullID.lastIndexOf(".") + 1);
						if (orgkind == "psn") {
							var personID = fullID.substring(0, fullID.lastIndexOf("."));
							filter = psnRelation ? "(" + psnRelation + " = '" + personID + "')" : "(" + urlRelation + " LIKE '%/" + personID + "@%')";   
						} else if (OrgKinds.isPersonMember(orgkind)) {
							var personID = fullID.substring(fullID.lastIndexOf("/") + 1);
							personID = personID.substring(0, personID.indexOf("@"));
							filter = psnRelation ? "(" + psnRelation + " = '" + personID + "')" : "(" + urlRelation + " = '" + fullID + "')";
						} else {
							filter = "(" + urlRelation + " LIKE '" + fullID + "%')";
						}
						filters.push(filter);
					};
					return filters.join(" OR ");
				},
				
				_getDefaultFullIDs : function() {
					var personID = this.getModel().getContext().getCurrentPersonID() + ".psn";
					return this.defaultValue == MYSELF ? personID : "";
				},
				
				_onShowOption : function(event) {
					var model = event.source.getModel();
					var self = model.comp(event.source.domNode.parentElement);
					if (self.useMyself) {
						var data = event.source.grid.getData();
						var personID = model.getContext().getCurrentPersonID() + ".psn";
						var personCode = model.getContext().getCurrentPersonCode();
						if (!data.getRowByID(personID)) {
							var row = data.loadData({
								"@type" : "table",
								"rows" : [{
									"SA_OPOrg" : personID,
									"sName" : "本人",
									"sCode" : personCode,
									"sFID" : personID,
									"sOrgKindID" : "psn",
									"sNodeKind" : "nkLeaf",
									"version" : 0
								}]
							}, true, null, 0)[0];
							data.to(row);
							event.source.grid.refresh();
						} 
					}
				},
				
				_getDefaultLabel : function() {
					return (this.defaultValue == MYSELF) ? "本人" : "";
				}

			});
	justep.Component.register(url, OrgFilter);
	return OrgFilter;
});