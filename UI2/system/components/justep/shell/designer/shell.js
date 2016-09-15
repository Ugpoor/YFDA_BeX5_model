/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require('css!./css/shell').load();
	
	//var justep = require("$UI/system/lib/justep");
	var RTShell = require("$UI/system/components/justep/shell/shell");
	var RTShellImpl = require("$UI/system/components/justep/shell/shellImpl");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();
	

	var Shell = RTShell.extend({
		init : function(value, bindingContext) {
			var xid = this.$domNode.attr("xid");
			this.callParent();
			this.$domNode.addClass('x-shell').empty().append("<img align='absmiddle'/><span>" + (xid?xid:'') + "</span>");
		},
		bindEvent: function(){}
	});
	
	var ShellImpl = RTShellImpl.extend({
		init : function(value, bindingContext) {
			var xid = this.$domNode.attr("xid");
			this.callParent();
			this.$domNode.addClass('x-shellImpl').empty().append("<img align='absmiddle'/><span>" + (xid?xid:'') + "</span>");
		},
		createShellImpl: function(){},
		addPageMappings: function(){},
		setPageMapping: function(config){
			//编辑pageMapping
			var self = this;
			xuiService.openPage("$UI/system/components/justep/shell/designer/setPageMapping.w", {
				title : "页映射编辑",
				xml : config.nodeXml
			}, function(result) {
				xuiDoc.replaceChild(self, result.mapping.join(""), {
					jqCondition : "mapping",
					paintComponent : false
				});
			});
		}
	});

	return {
		'$UI/system/components/justep/shell/shell' : Shell,
		'$UI/system/components/justep/shell/shellImpl' : ShellImpl
	};
});