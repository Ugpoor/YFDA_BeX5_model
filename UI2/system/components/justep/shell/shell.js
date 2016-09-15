/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");
	var justep = require('$UI/system/lib/justep');
	var url = require.normalizeName("./shell");
	var ComponentConfig = require("./shell.config");

	require('$UI/system/resources/system.res');

	var MESSAGE_NAME = "sys_message";
	var events = [ "onBeforePageLoad", "onPageViewLoad", "onAfterPageLoad", "onPageActive", "onPageInactive", "onBeforePageClose", "onAfterPageClose" ];
	var Shell = justep.ViewComponent.extend({
		buildTemplate : function(config) {
			var msg = new justep.Message(justep.Message.JUSTEP230073, url);
			throw justep.Error.create(msg);
		},
		constructor : function(options) {
			this.callParent(options);
			this.receiveMessageType = undefined;
		},
		dispose : function() {
			//off bind的事件
			justep.Shell.off(MESSAGE_NAME, this._doRecvMsg, this);
			$.each(this._eventHandles,function(evtName, handle){
				justep.Shell.off(evtName, handle);
			});
			this.callParent();
		},
		getConfig : function() {
			return ComponentConfig;
		},
		init : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			this.bindEvent();
		},
		sendMessage : function(data,type) {
			justep.Shell.fireEvent(MESSAGE_NAME, {data:data,type:type});
		},
		bindEvent : function() {
			var self = this;
			// 通过promise绑定shell事件
			justep.Shell.getImpl().then(function() {
				justep.Shell.on(MESSAGE_NAME, self._doRecvMsg, self);
				self._eventHandles = {};
				$.each(events, function(i, evtName) {
					self._eventHandles[evtName] = self._doEvent.bind(self, evtName);
					justep.Shell.on(evtName, self._eventHandles[evtName]);
				});
			});
		},
		_doRecvMsg : function(msg) {
			if(this.receiveMessageType===undefined || msg.type===this.receiveMessageType){
				var evtData = {
						source : this,
						message : msg.data,
						type : msg.type
				};
				this.fireEvent('onMessage', evtData);
			}
		},
		_doEvent : function(evtName, evt) {
			evt = $.extend({}, evt);
			evt.source = this;
			this.fireEvent(evtName, evt);
		}
	});

	var callShellApi = function(api) {
		var args = $.makeArray(arguments).slice(1);
		return justep.Shell[api](args);
	};

	// 增加Shell上的api
	$.each(justep.Shell, function(n, o) {
		if ($.isFunction(o) && n!=='on' && n!=='off' && n!=='fireEvent')
			Shell.prototype[n] = callShellApi.bind(justep.Shell, n);
	});

	// 操作
	justep.Component.addOperations(Shell, {
		'sendMessage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231132),//"发送消息"
			argsDef : [ {
				name : 'msg',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231133),//'消息',
				required : true
			},{
				name : 'type',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231143)//'消息标识',
			} ],
			method : function(args) {
				return this.owner.sendMessage(args.msg,args.type);
			}
		},
		'loadPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231121),//"加载页"
			argsDef : [ {
				name : 'url',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231122),//'加载页url,类似  {url:"$UI/portal/index.w"} 或者 "$UI/portal/index.w"',
				required : true
			} ],
			method : function(args) {
				return justep.Shell.loadPage(args.url);
			}
		},
		'showPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231123),//'显示页',
			argsDef : [ {
				name : 'url',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231124),//'打开的页Url,类似  {url:"$UI/portal/index.w"} 或者 "$UI/portal/index.w"',
				required : true
			},{
				name : 'data',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231125)//'传递到页面的参数',
			} ],
			method : function(args) {
				return justep.Shell.showPage(args.url,args.data);
			}
		},
		'showLeft' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231126),//'显示左边栏',
			method : function(args) {
				return justep.Shell.showLeft();
			}
		},
		'showRight' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231127),//'显示右边栏',
			method : function(args) {
				return justep.Shell.showRight();
			}
		},
		'closePage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231128),//'关闭页面',
			argsDef : [ {
				name : 'url',
				displayName : justep.Message.getMessage(justep.Message.JUSTEP231129),//'关闭页Url,类似  {url:"$UI/portal/index.w"} 或者 "$UI/portal/index.w",缺省关闭当前页'
			} ],
			method : function(args) {
				return justep.Shell.closePage(args.url);
			}
		},
		'showMainPage' : {
			label : justep.Message.getMessage(justep.Message.JUSTEP231130),//'显示首页',
			method : function(args) {
				return justep.Shell.showMainPage();
			}
		}		
	});

	justep.Component.register(url, Shell);
	return Shell;
});