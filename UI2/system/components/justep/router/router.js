/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/
define(function(require) {
	var $ = require("jquery"), 
		Component = require("$UI/system/lib/base/component"), 
		justep = require('$UI/system/lib/justep'),
		url = require.normalizeName("./router");
	
	var ComponentConfig = require("./router.config");
	
	
	var Router = justep.ViewComponent.extend({
		constructor : function(options) {
			this.callParent(options);
			this.interceptXids = '';
		},
		buildTemplate: function(config){
			if(!config){
				config = {};
			}
			if(!config.xid){
				config.xid = "router";
			}
			var tpl = '<div component="$UI/system/components/justep/router/router" style="display:none"></div>';
			var tplNode = $(tpl).attr(config);
			return tplNode.get(0);
    	},
    	getConfig: function(){
    		return ComponentConfig;
    	},
        init: function(value, bindingContext){
        	this.callParent(value, bindingContext);
        	this.xid = this.$domNode.attr('xid');
        	this.$routeState = this.getModel().$routeState;
        	var event = {
            		source:this,
            		interceptXids:this.interceptXids
            	};
        	this.fireEvent('onInit',event);
        	this.interceptXids = event.interceptXids;
        	this.initRoute();
        },
        initRoute:function(){
        	this.$routeState.on('onRoute',function(event){
        		var xid = event.xid;
        		var interceptXidArray = this.interceptXids == ''? [] : this.interceptXids.split(',');  
        		if(xid in interceptXidArray || xid == this.xid){
        			var _event = event;
        			_event.source = this;
        			if(xid == this.xid){
        				_event.cancel = true;
        			}
        			this.fireEvent('onRoute',_event);
        		}
        	},this);
        },
        addRouteItem : function(name,param){
			this.$routeState.addState(this.xid,name,param);
		},
		removeRouteItem : function(name){
			this.$routeState.removeState(this.xid,name);
		},
		addRouteInnerItem : function(name,hashbang){
			this.$routeState.addInnerState(this.xid,name,hashbang);
		},
		publishState : function(isReplace){
			this.$routeState.publishState(isReplace);
		}
    });
		
	Component.register(url, Router);
	return Router;
});