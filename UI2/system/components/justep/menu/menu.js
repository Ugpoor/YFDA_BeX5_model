/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {

	require("$UI/system/components/justep/common/res");
	require('css!./css/menu').load();

	var justep = require("$UI/system/lib/justep");
	var Component = require("$UI/system/lib/base/component");
	var ViewComponent = require("$UI/system/lib/base/viewComponent");
	var $ = require("jquery");
	var url = require.normalizeName("./menu");
	var Button = require("$UI/system/components/justep/button/button");

	var ComponentConfig = require("./menu.config");

	var Menu = ViewComponent.extend({
		baseCls : 'x-menu',
		constructor : function(options) {
			this.callParent(options);
		},
		getConfig : function() {
			return ComponentConfig;
		},
		buildTemplate : function(config) {
			var ret = $('<ul component="'+url+'" class="'+(config['class']||"x-menu dropdown-menu")+'"></ul>');
			if(config.xid) ret.attr('xid', config.xid);
			return ret;
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			this.$el = $(this.domNode);
		},
		addItem : function(config) {
			config = config || {};
			var li = $('<li class="x-menu-item"></li>')[0];
			justep.Component.addNode(this.domNode, li);
			justep.Util.apply(config, {
				parentNode : li,
				"class" : "btn btn-link"
			});
			return new Button(config);
		},
		removeItem : function(index) {
			var $li = this.$domNode.children("li:eq("+index+")");
			if($li.length>0) justep.Component.removeNode($li[0]);
		},
		itemSize : function() {
			return this.$domNode.children("li").length;
		},
		clear : function(){
			this.$domNode.children("li").each(function(){
				justep.Component.removeNode(this);
			});
		},
		addDivider : function() {
			$('<li class="x-menu-divider divider"></li>').appendTo(this.$el);
		}
	});

	Component.register(url, Menu);

	return Menu;
});