/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = justep.ModelBase;
	
	var url = require.normalizeName("./windowReceiver");

	var ComponentConfig = require("./windowReceiver.config");

	var WindowReceiver = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.callParent(options);
		},
		dispose : function() {
			this.getModel().off(Model.PARAMS_RECEIVE_EVENT, this._doReceive, this);
			this.callParent();
		},
		buildTemplate : function(cfg) {
			if (!cfg)
				cfg = {};
			return '<span component="' + url + '" ' + (cfg.xid ? (' xid="' + cfg.xid + '" ') : '') + '>' + '</span>';
		},
		doInit : function(value, bindingContext) {
			this.getModel().on(Model.PARAMS_RECEIVE_EVENT, this._doReceive, this);
		},
		_doReceive : function(event){
			//事件放到onload后,保存接收的参数和target
			var model = this.getModel();
			if(justep.ModelBase.MODEL_STATUS_LOAD>model.getStatus()) model.on(justep.ModelBase.LOAD_EVENT, this.doReceive.bind(this, event));
			else this.doReceive(event);
		},
		getReceiveData: function(){
			return this.getModel().params;
		},
		doReceive : function(event) {
			if (event) {
				var evtData = $.extend({},event);
				evtData.data = this.getModel().params.data;
				evtData.source = this;
				evtData.sender = this.getModel().owner;
				this.fireEvent('onReceive', evtData);
			}
		},
		sendData : function(data) {
			var owner = this.getModel().owner;
			if (owner){
				if($.isFunction(owner.receiverSend))
					owner.receiverSend({
						source : this,
						data : data
					});
				else
					owner.send(data);
			} 	
		},
		windowEnsure : function(data) {
			var owner = this.getModel().owner;
			if (owner) {
				if($.isFunction(owner.receiverSend))
					owner.receiverSend({
						source : this,
						data : data
					});
				else
					owner.send(data);
				owner.close();
			} 
		},
		windowCancel : function() {
			if (this.getModel().owner){
				this.getModel().owner.close();
			} 
		}
	});

	justep.Component.addOperations(WindowReceiver, {
		windowCancel : {
			label : "",
			icon : 'icon-chevron-left',
			method : function(args) {
				return this.owner.windowCancel();
			}
		},
		windowEnsure : {
			label : "",
			argsDef: [{name:'data',displayName:'返回的数据'}],
			method : function(args) {
				return this.owner.windowEnsure(args.data);
			}
		},
		sendData : {
			label : "",
			argsDef: [{name:'data',displayName:'返回的数据'}],
			method : function(args) {
				return this.owner.sendData(args.data);
			}
		}
	});
	
	justep.Component.register(url, WindowReceiver);
	return WindowReceiver;
});