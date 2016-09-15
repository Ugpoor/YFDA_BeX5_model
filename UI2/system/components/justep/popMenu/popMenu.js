/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	require("$UI/system/components/justep/common/res");
	require('css!./css/popMenu').load();
	var Component = require("$UI/system/lib/base/component");
	var PopOver = require("../popOver/popOver");
	var url = require.normalizeName("./popMenu");
	var ComponentConfig = require("./popMenu.config");
	var Menu = require("$UI/system/components/justep/menu/menu");

	var PopMenu = PopOver.extend({
		baseCls: 'x-popMenu',
		overlayCls: 'x-popMenu-overlay',
		contentCls: 'x-popMenu-content',
		autoHidable: true,
		constructor: function(){
			this.callParent();
		},
		getConfig: function(){
			return ComponentConfig;
		},
		buildTemplate: function(config){
		    /*
			<div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu">
	    	  <div class="x-popMenu-overlay"/>
    	  	  <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content">
			  </ul>
			</div>
			*/
			var ret = $('<div component="'+url+'" class="'+(config['class']||this.baseCls)+'">'
			    	+'<div class="'+this.overlayCls+'"/>'
					+'</div>');
			if(config.xid) ret.attr('xid', config.xid);
			new Menu({parentNode:ret[0],'class':"x-menu dropdown-menu "+this.contentCls});
			return ret;
        },
        init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			var me = this;
			this.$content.click(function(){
				if(me.autoHidable)
					me.hide();
			});
		},
		getInnerMenu: function(){
			return this.getModel().comp(this.$domNode.children('ul.'+this.contentCls)[0]);
		},
		propertyChangedHandler: function(key, oldVal, value){
			switch(key){
			default:
			}
			this.callParent(key, oldVal, value);
		}
    });
	
	Component.register(url, PopMenu);
	return PopMenu;
});