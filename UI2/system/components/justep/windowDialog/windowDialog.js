/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	require("$UI/system/resources/system.res");
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Dialog = require("../dialog/dialog");
	var WindowContainer = require("../windowContainer/windowContainer");
	var RouteUtil = require("$UI/system/lib/route/routeUtil");
	var Mapping = require("./js/receiveMapping");
	var url = require.normalizeName("./windowDialog");
	var ComponentConfig = require("./windowDialog.config");
	
	var WindowDialog = Dialog.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		constructor : function(options) {
			this.src = '';
			this.process = '';
			this.activity = '';
			this.forceRefreshOnOpen = false;
			this._compose = null;
			this._composeOK = $.Deferred();
			this.callParent(options);
		},
		dispose : function() {
			if (this._compose){
				this._compose.free();
			}
			this.callParent();
		},
		doInit : function(value, bindingContext) {
			this.callParent(value, bindingContext);
			// 产生组件通讯的唯一标识,使用xid
			var xid = this.$domNode.attr('xid');
			if (!xid) {
				xid = justep.UUID.createUUID();
				this.$domNode.attr('xid', xid);
			}
			// 这里new
			// compose后因为父组件还没有完成，导致bind没有执行，所以在WindowContainer.LOAD_EVENT事件进行this._compose
			// = compose;
			var composeCfg = {
				owner : this,	
				src : this.src,
				process : this.process,
				activity : this.activity
			};
			composeCfg['xid'] = '_compose_' + xid + '_';
			this._compose = new WindowContainer(composeCfg);// , parentNode:
															// this._getBodyNode()[0]
			
			this._compose.on(WindowContainer.LOAD_EVENT, function() {
				this._loaded = true;
				this._composeOK.resolve();
				this.fireEvent(WindowContainer.LOAD_EVENT, {
					source : this
				});
				this.initRouter();
			}, this);
		},
		
		initRouter : function(){
			if(!this.routable){
				return;
			}
			this._compose.off('onRouteStatePublish');
			this._compose.on('onRouteStatePublish',function(event){
				this.addRouteInnerItem('', event.hashbang,event.isReplace);
			},this);
		},
		
		doRoute : function(name,param,routeState){
			if(!this.routable){
				return;
			}
			if(name === ""){
				var jsonParam,innerStateValue;
				var self = this;
				if(routeState == "enter"){
					if(RouteUtil.containeInnerState(param)){
						var paramValue = RouteUtil.getParamValue(param);
						innerStateValue = RouteUtil.getInnerStateValue(param);
						try{
							jsonParam = JSON.parse(paramValue);
						}catch(e){
						}
						this.open(jsonParam);
						if(this._composeOK){
							this._composeOK.done(function(){
								var innerModel = self._compose.getInnerModel();
								innerModel.postMessage({
									type:"routeState",
									newUrl:innerStateValue
								});
							});
						}
					}else{
						try{
							jsonParam = JSON.parse(param);
						}catch(e){
							
						}
						this.open(jsonParam);
					}
				}else if(routeState == "leave"){
					this.close();
				}else if(routeState == "update"){
					//update 情况只有innerModel的状态发生变化
					innerStateValue = RouteUtil.getInnerStateValue(param);
					if(this._composeOK){
						this._composeOK.done(function(){
							var innerModel = self._compose.getInnerModel();
							innerModel.postMessage({
								type:"routeState",
								newUrl:innerStateValue
							});
						});
					}
				}
			}
		},
		
		addRouteItem : function(type,params){
			if(!this.routable){
				return;
			}
			var $routeState = this.getModel().$routeState;
			var xid = this.$domNode.attr('xid');
			if(type == 'open'){
				try{
					var routeParams = $.extend(true,{},params);
					if(routeParams.params){
						delete routeParams.params.data;
					}
					$routeState.addState(xid,'',JSON.stringify(routeParams));
					$routeState.publishState();
				}catch(e){
					//JSON.stringify(param) error 
				}
			}else if(type == 'close'){
				$routeState.removeState(xid,'','');
				$routeState.publishState(true);
			}
		},
		
		addRouteInnerItem : function(type,hashbang,isReplace){
			if(!this.routable){
				return;
			}
			var $routeState = this.getModel().$routeState;
			var xid = this.$domNode.attr('xid');
			if(this.opened){
				$routeState.addInnerState(xid,'',hashbang);
				$routeState.publishState();
			}
			
		},
		
		
		propertyChangedHandler : function(key, oldVal, value) {
			switch (key) {
			case "src":
			case "process":
			case "activity":
				if (oldVal != value && this._inited){
					this._loaded = false;
					if(this._compose){
						this._compose.setSrc(this.src);
						this._compose.setProcess(this.process);
						this._compose.setActivity(this.activity);
					}
				}
				break;
			default:
				this.callParent(key, oldVal, value);
			}
		},
		receiverSend : function(data){
			if (data) {//判断投递给自己的消息才处理
				data.sender = data.source;
				data.source = this;
				this.fireEvent('onReceive', data);
				//增加mapping处理
				Mapping.receiveByMapping(this,data.data);
				this.fireEvent('onReceived', data);
			}
		},
		send : function(data) {
			if (data) {//判断投递给自己的消息才处理
				var evtData = {
					source : this,
					data: data
				};
				this.fireEvent('onReceive', evtData);
				//增加mapping处理
				Mapping.receiveByMapping(this, evtData.data);
				this.fireEvent('onReceived', evtData);
			}
		},
		render : function() {
			this.callParent();
		},
		_refresh : function(data){
			if(this._compose){
				this._composeOK = $.Deferred();
				this._compose.setSrc(this.src);
				this._compose.setProcess(this.process);
				this._compose.setActivity(this.activity);
				this._compose.refresh(null,data);
			}
		},
		_setDialogParam : function(option) {
		},
		getInnerModel : function(){
			return this._compose.getInnerModel();
		},
		_open: function(option){
			var data = option?option.data:undefined;
			var params = option?option.params:{};
			var evtData = {source:this,data:data,params:params};
			if(this.hasListener('onSend')){
				this.fireEvent('onSend', evtData);
				data = evtData.data;
				params = evtData.params;
			}
			if(!params) params = {};
			if(!params.data)params.data = data;
			//先显示对话框，后面逻辑有可能依赖对话框的大小
			if (option){
				this.set(option);
			}
			if (!justep.Bind.isBound(this._compose.domNode)) {
				var parentNode = this._getBodyNode()[0];
				//这里不舒服，不应该由windowDialog组件来控制内部的样式
				this._compose.setCSS({height: '100%',position: 'relative'});
				this._compose.setParams(params);
				justep.Component.addComponent(parentNode, this._compose);//通过把节点加入页面刺激compose刷新加载
			}else{
				if(this.forceRefreshOnOpen || !this._loaded){
					this._refresh(params);
				}else{//这里只是传递参数，不刺激重新加载
					this._compose.setParams(params);
					this._compose.load();
				}
			}
			if(this._composeOK){
				var self = this;
				this._composeOK.done(function() {// 使用promise机制等待页面刷新成功后
					self._setDialogParam(option);
					var innerModel = self._compose.getInnerModel();
					//投递变化信息给子窗口
					if(innerModel)innerModel.fireEvent('onResize',{source:self._compose});
				});
			}
		},
		
		open : function(option) {
			if (this._viewLoaded){
				this.callParent(option);
			}else{
				var me = this;
				var method = arguments.callee;
				var parentClass = method.$owner.superclass, methodName = method.$name;
				var parentFn = parentClass[methodName];
				var args = arguments;
				var fn = function(){
					parentFn.apply(me, args);
					me._viewLoaded = true;
					me._compose.off(WindowContainer.VIEW_LOAD_EVENT, fn);
				};
				this._compose.on(WindowContainer.VIEW_LOAD_EVENT, fn);
			}
			this._open(option);
		}
	});

	justep.Component.addOperations(WindowDialog, {
		open : {
			label : "",
			argsDef: [{name:'option',displayName:justep.Message.getMessage(justep.Message.JUSTEP231098)}],
			method : function(args) {
				return this.owner.open(args.option);
			}
		},
		close : {
			label : "",
			method : function(args) {
				return this.owner.close();
			}
		}
	});
	
	justep.Component.register(url, WindowDialog);
	return WindowDialog;
});