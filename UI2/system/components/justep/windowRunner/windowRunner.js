/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var url = require.normalizeName("./windowRunner");

	var ComponentConfig = require("./windowRunner.config");

	var WindowRunner = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.src = '';
			this.process = '';
			this.activity = '';
			this.title = '';
			this.callParent(options);
		},
		dispose : function() {
			this.callParent();
		},
		buildTemplate : function(cfg) {
			if (!cfg)
				cfg = {};
			return '<span component="' + url + '" ' + (cfg.xid ? (' xid="' + cfg.xid + '" ') : '') + '>' + '</span>';
		},
		doInit : function(value, bindingContext) {
			this.callParent(value, bindingContext);
		},
		receiverSend : function(data){
			if (data) {//判断投递给自己的消息才处理
				data.sender = data.source;
				data.source = this;
				this.fireEvent('onReceive', data);
			}
		},
		send : function(data) {
			if (data) {//判断投递给自己的消息才处理
				var evtData = {
					source : this,
					data: data
				};
				this.fireEvent('onReceive', evtData);
			}
		},
		getContext : function() {
			return this.getModel().getContext();
		},
		_getPageOption: function(option){
			var ret = $.extend({},option);
			if(ret.src && !ret.url) ret.url = ret.src;
			delete ret.params;
			delete ret.data;
			delete ret.src;
			if(!ret.process) ret.process = this.process || this.getContext().getProcess(); 
			if(!ret.activity) ret.activity = this.activity || this.getContext().getActivity(); 
			if(!ret.title) ret.title = this.title; 
			if(!ret.url) ret.url = this.src; 
			return ret;
		},
		open : function(option) {
			var data = option?option.data:undefined;
			var params = option?option.params:{};
			if(option) this.set(option);
			else option = {};
			var evtData = {source:this,data:data,params:params};
			if(this.hasListener('onSend')){
				this.fireEvent('onSend', evtData);
				data = evtData.data;
				params = evtData.params;
			}
			if(!params) params = {};
			if(!params.data)params.data = data;
			var self = this;
			return justep.Shell.showPage(this._getPageOption(option),params,{owner:this}).then(function(param){
				var m = param.container.getInnerModel();
				self.fireEvent('onOpen', {source:self,innerModel:m});
			});
		},
		close : function() {
			var self = this;
			return justep.Shell.closePage(this._getPageOption()).then(function(){
				self.fireEvent('onClose', {source:self});
			});
		}
	});

	justep.Component.addOperations(WindowRunner, {
		open : {
			label : "",
			method : function(args) {
				return this.owner.open();
			}
		},
		close : {
			label : "",
			method : function(args) {
				return this.owner.close();
			}
		}
	});
	
	justep.Component.register(url, WindowRunner);
	return WindowRunner;
});