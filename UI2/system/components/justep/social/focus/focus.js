/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	require("css!./css/focus").load();
	require("$UI/system/resources/system.res");
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var url = require.normalizeName("./focus");
	var ComponentConfig = require("./focus.config");
	
	var STAR = "x-focus-star";
	var UNSTAR = "x-focus-unstar";

    var Focus = justep.BindComponent.extend({
    	constructor: function(options){
    		this.callParent(options);
    		this.value = 0;
    		this.data = "";
    		this.disabled = false;
    		this.process = "";
    		this.activity = "";
    		this.url = "";
    	},
    	
    	buildTemplate: function(config){
    		throw new Error("Focus don't support new operation");	
    	},
    	
    	getConfig: function(){
    		return ComponentConfig;
    	},
    	
    	doInit: function(value, bindingContext){
    		this.nameRef = value?value.nameRef:null;
    		var self = this;
    		this.$domNode.on("click", function(event){
    			if (!self.disabled){
    				var focus = ((self.value===1) ? 0 : 1);
    				var context = self.getModel().getContext();
    				var curProcess = null;
    				var curActivity = null;
    				if (self.process && self.activity){
    					curProcess = self.process;
    					curActivity = self.activity;
    				}else{
    					curProcess = context.getProcess();
    					curActivity = context.getActivity();
    				}
    				var curUrl = self.url || (curProcess.substring(0, curProcess.lastIndexOf("/")) + "/" + curActivity + ".a"); 
    				
    				var options = {};
    				options.action = "updateFocusAction";
    				options.context = context;
    				options.parameters = new biz.Request.ActionParam();
    				options.parameters.setString("name", self._getNameValue());
    				options.parameters.setString("fid", context.getCurrentPersonMemberFID());
    				options.parameters.setString("fname", context.getCurrentPersonMemberFNameWithAgent());
    				options.parameters.setString("data", self._getDataValue());
    				options.parameters.setInteger("focus", focus);
    				options.parameters.setString("process", curProcess);
    				options.parameters.setString("activity", curActivity);
    				options.parameters.setString("url", curUrl);
    				biz.Request.sendBizRequest(options);

    				self.set({"value": focus});
    				
    				
    			}else{
    				alert(new justep.Message(justep.Message.JUSTEP230097).getMessage());
    			}
    		});
    	},
    	
    	 dispose: function(){
         	this.$domNode.off("click", "**");
         	this.callParent();
         },    	
    	
    	doUpdate: function(value, bindingContext, allBindings){
        	this.nameRef = value?value.nameRef:null;
        	this.callParent(value, bindingContext, allBindings);
        },    	
    	
    	_getDataValue: function(){
    		if (this.data){
            	var dataComponent = this.getModel().comp(this.data);
            	var concept = dataComponent.idColumn;
            	return dataComponent.val(concept);
    		}else{
				var msg = new justep.Message(justep.Message.JUSTEP230098, this.$domNode.attr("xid") || "");
				throw justep.Error.create(msg);
    		}
    	},
    	
    	_getNameValue: function(){
    		if (!this.nameRef){
				var msg = new justep.Message(justep.Message.JUSTEP230099, this.$domNode.attr("xid") || "");
				throw justep.Error.create(msg);
    		}else{
    			return justep.Bind.utils.unwrapObservable(this.nameRef);	
    		}
    	},
    	
    	render: function(){
        	this.callParent();
        	if (this.value === 1){
        		this.$domNode.removeClass(UNSTAR);
        		this.$domNode.addClass(STAR);
        	}else{
        		this.$domNode.removeClass(STAR);
        		this.$domNode.addClass(UNSTAR);
        	}
    	},
    	
    	propertyChangedHandler: function(key, oldVal, value){
        	switch(key){
        		case "value":
                	if (oldVal != value) {
                		this.val2ref();
                		this.needRender = this._inited;
                	}
                	break;
        		default: this.callParent(key, oldVal, value);
        	}        	
        }    	
    });
    
    
    justep.Component.register(url, Focus);
    return Focus;
});