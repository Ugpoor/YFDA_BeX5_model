/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	require("$UI/system/components/justep/common/res");
	var Tabs = require("../tabs");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	var $ = require("jquery");
	require('css!./css/tabs').load();

	Tabs = Tabs.extend({
		init : function(value, bindingContext) {
			var result = this.callParent(value, bindingContext);
			this._initDesignStatus();
			return result;
		},

		_initDesignStatus : function() {
			$(">.x-panel", this.domNode).attr("d_selectable", "false");
			$(">.x-panel>.x-panel-top", this.domNode).attr("d_selectable", "false");
			$(">.x-panel>.x-panel-top>.nav", this.domNode).attr("d_selectable", "false");
			$(">.x-panel>.x-panel-top>.nav,>.x-panel>.x-panel-content>.x-contents", this.domNode).attr("d_canRemove", "false")
					.attr("d_resizable", "false");
			$(">.x-panel>.x-panel-top>.nav>li", this.domNode).attr("d_canRemove", "false").attr(
					"d_selectable", "false").attr("d_resizable", "false");
			$(">.x-panel>.x-panel-top>.nav>li>a", this.domNode).attr("d_y_resizable", "false");
		},

		set : function(config) {
			for ( var p in config) {
				if (p == 'label') {
					this.domNode.innerHTML = config[p];
					this._doResize();
				} else if (p == 'row-count') {
					this.buildRows(config[p]);
					this.$domNode.attr("row-count", config[p]);
				}
			}
		},

		addTab : function() {
			var self = this;
			var configs = [];
			var xid = xuiDoc.genaXId("tabContent");
			configs.push({
				componentName : "li",
				paintComponent : true,
				parentElementId : $(">.x-panel>.x-panel-top>.nav", this.domNode).attr("d_id"),
				autoSelect : false,
				templateContent : '"<li><a content="' + xid
						+ '">tab1</a></li>"'
			});
			xuiDoc.batchCreateComponent(configs, function() {
				self.setActiveTab($(">.x-panel>.x-panel-top>.nav>li:last", self.domNode));
				self.contents.add();
				self._initDesignStatus();
				self._doResize();
			});
		}
	});

	var TabItem = function(config) {
		this.domNode = this.templateNode = config.templateNode;
		this.domNode.setAttribute("tabindex", '0');
	};

	TabItem.prototype = {
		onRemove : function(event) {
			if ($("li", this.domNode.parentNode.parentNode).length == 1) {
				event.cancel = true;
			} else {
				event.cancel = true;
				var $domNode = $(this.domNode);
				var index = $domNode.parent().index();
				var tabs = this.ownerDesigner.getOwnerComponent(this.domNode.parentNode, '$UI/system/components/justep/tabs/tabs');
				var contentDId = tabs.contents.contents[index].$domNode.attr('d_id'); 
				xuiDoc.deleteComponent([ contentDId,
					$domNode.parent().attr("d_id") ]);
				tabs.contents.remove(index);
				window.setTimeout(function(){
					tabs._doResize();
				}, 10);
			}
		},
		set : function(config) {
			for ( var p in config) {
				if (p == 'label') {
					this.domNode.innerHTML = config[p];
				} else if (p == 'content') {
					this.domNode.setAttribute("content", config[p]);
				}
			}
		}
	};

	return {
		'$UI/system/components/justep/tabs/tabs' : Tabs,
		'$UI/system/components/justep/tabs/tabs#tabItem' : TabItem
	};

});