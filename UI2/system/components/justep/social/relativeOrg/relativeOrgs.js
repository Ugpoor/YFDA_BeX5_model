/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("css!./css/relativeOrg").load();
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var url = require.normalizeName("./relativeOrgs");
	var ComponentConfig = require("./relativeOrgs.config");
	var MessageDialog = require("$UI/system/components/justep/messageDialog/messageDialog");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");

	var RelativeOrgs = justep.ViewComponent.extend({
		constructor : function(options) {
			this.callParent(options);
			this.data = "";
			this.socialData = "";
			this.process = "";
			this.activity = "";
			this.url = "";
		},

		buildTemplate : function(config) {
			throw new Error("RelativeOrgs don't support new operation");
		},

		getConfig : function() {
			return ComponentConfig;
		},

		init : function(value, bindingContext, allBindings) {
			this.callParent(value, bindingContext, allBindings);

			var self = this;
			this.getModel().componentPromise(this.data).done(function(data) {
				data.on("onIndexChanged", function(event) {
					self.refresh();
				});
			});

			//初始化完之后, 将dialog移到window节点下, 解决ios手机上titleBar不显示的bug
			var $dialog = null;
			justep.Bind.utils.domNodeReady.addReadyCallback(this.domNode, function(){
				var dialogNode = $(".x-ro-dialog", self.domNode)[0];
				dialogId = dialogNode.getAttribute("id");
				if (!dialogId){
					dialogId = justep.UUID.createUUID().toString();
					dialogNode.setAttribute(dialogId);
				}
				self.domNode.removeChild(dialogNode);
				var root = self.getModel().getRootNode();
				root.insertBefore(dialogNode, root.firstChild);
				
				
				$dialog = $("#" + dialogId);
				
				$dialog.on("click", ".x-ros-dialog-ok", function(event) {
					self.getSocialDataComponent().saveData();
				});

				$dialog.on("click", ".x-ros-dialog-cancel", function(event) {
					self.getSocialDataComponent().refreshData({confirm: false});
				});
			});
			this.$domNode.on("click", ">.x-img-more", function(event) {
				self.getModel().comp($dialog[0]).open(); 
			});			

			/*
			this.$domNode.on("click", ">.x-img-more", function(event) {
				self.getModel().comp(self.$domNode.find(">.x-ro-dialog")[0]).open();
			});

			this.$domNode.on("click", ".x-ros-dialog-ok", function(event) {
				self.getSocialDataComponent().saveData();
			});

			this.$domNode.on("click", ".x-ros-dialog-cancel", function(event) {
				self.getSocialDataComponent().refreshData({confirm: false});
			});
			*/
		},

		dispose : function() {
			this.$domNode.off("click", "**");
			this.callParent();
		},

		refresh : function() {
			var dc = this.getSocialDataComponent();
			if (!dc)
				return;

			var filterName = "__dataFilter__";
			var curDataFilter = dc.getFilter(filterName);
			var dataFilter = this._getDataFilter();
			if (curDataFilter !== dataFilter) {
				dc.setFilter(filterName, dataFilter);
				dc.refreshData({confirm: false});
			}

			var listNodes = this.$domNode.find(">.x-ros-item>.x-list");
			for ( var i = 0; i < listNodes.length; i++) {
				var list = justep.Component.getComponent(listNodes[i]);
				if (list) {
					list.refresh();
				}
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

		getSocialDataComponent : function() {
			return this.getModel().comp(this.socialData);
		}
	});

	justep.Component.register(url, RelativeOrgs);
	return RelativeOrgs;
});