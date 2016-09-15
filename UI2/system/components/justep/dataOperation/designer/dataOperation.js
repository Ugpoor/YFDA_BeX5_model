/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require('css!./css/operation').load();
	
	//var justep = require("$UI/system/lib/justep");
	var bind = require("bind");
	var Component = require("$UI/system/lib/base/component");
	var RTDataOperation = require("$UI/system/components/justep/dataOperation/dataOperation");
	//var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	//var xuiDoc = xuiService.getXuiDoc();
	
	var DataOperation = RTDataOperation.extend({
		constructor : function(config) {
			if (config && config.templateNode) {
				this._bind(config.templateNode);
			}
			this.callParent(config);
		},
		init : function(value, bindingContext) {
			var xid = this.$domNode.attr("xid");
			this.$domNode.addClass('x-operation').empty().append("<img align='absmiddle'/><span>" + (xid?xid:'') + "</span>");
			var model = this.getModel();
			model.registerComponent(xid, this);
			model.resolvedComponent(xid);
		},
		_bind : function(element) {
			bind.utils.domData.set(element, Component.BIND_NAME, this);
			this.domNode = element;
			this.$domNode = $(this.domNode);
			bind.utils.domNodeDisposal.addDisposeCallback(element, this.dispose.bind(this));
		},
		_init: function(){
			//没有实现，设计时和运行时差异
		}
	});
	
	return {
		'$UI/system/components/justep/dataOperation/dataOperation' : DataOperation
	};
});