/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
/**
 * 1. 声明形使用 <div
 * component="$UI/system/components/justep/windowContainer/windowContainer"
 * src="" process="" activity=""/> 2. js动态创建 var WindowContainerClass =
 * require("$UI/system/components/justep/windowContainer/windowContainer"); var
 * windowContainer = new WindowContainerClass({parentNode: e,
 * src:"",process:"",activity:""});
 */
define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var composition = require("$UI/system/lib/base/composition");
	var url = require.normalizeName("./windowContainer");
	var ComponentConfig = require("./windowContainer.config");
	var RouteUtil = require('$UI/system/lib/route/routeUtil');
	var INNER_MODEL = "__inner-model__";

	var WindowContainer = justep.ViewComponent.extend({
		// 构造函数
		constructor : function(config) {
			this.__windowContainerInited = false;
			this.callParent(config);
			this.autoLoad = true;
			this.curSrc = "";
			this.src = "";
			this.process = "";
			this.activity = "";
			this._composeOK = $.Deferred();
			this.routable = false;
			this._isFirst = true;
			this.useCurrentProcessActivity = true;
		},

		controlsDescendantBindings : function() {
			return true;
		},

		dispose : function() {
			this.callParent();
		},

		getConfig : function() {
			return ComponentConfig;
		},

		// 动态创建组件
		buildTemplate : function(config) {
			var e = $("<div component='" + url + "' __component-context__='block' />");
			if (config) {
				this.src = config.src;
				this.process = config.process;
				this.activity = config.activity;
				if (config.hasOwnProperty("useCurrentProcessActivity")){
					this.useCurrentProcessActivity = config.useCurrentProcessActivity;
				}
				this.owner = config.owner;
				if (config.params && !justep.Util.isString(config.params)){
					this.params = config.params || null;
					delete config.params;
				}
				if (config.xid) {
					e.attr("xid", config.xid);
				}
			}
			return e;
		},

		// 组件初始化
		init : function(value, bindingContext) {
			this.__windowContainerInited = true;
			this.callParent(value, bindingContext);
			var params = this.params;
			if (!this.params && value && value.params){
				params = value.params;
			}
			if (this.autoLoad)
				this.refresh(null, params);
			else
				if (params)
					this.params = params;
		},
		
		setSrc : function(v) {
			this.set({
				src : v
			});
		},

		setProcess : function(v) {
			this.set({
				process : v
			});
		},

		setActivity : function(v) {
			this.set({
				activity : v
			});
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
						this.refresh(jsonParam.src,jsonParam.params);
						if(this._composeOK){
							this._composeOK.done(function(){
								var innerModel = self.getInnerModel();
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
						this.refresh(jsonParam.src,jsonParam.params);
					}
				}else if(routeState == "leave"){
				}else if(routeState == "update"){
					innerStateValue = RouteUtil.getInnerStateValue(param);
					if(this._composeOK){
						this._composeOK.done(function(){
							var innerModel = self.getInnerModel();
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
			if(type == 'load'){
				try{
					if(params){
						params = $.extend({},params);
						delete params.data;
					}
					$routeState.addState(xid,'',JSON.stringify(params));
					$routeState.publishState();
				}catch(e){
					//JSON.stringify(param) error 
				}
			}else if(type == 'destory'){
				$routeState.removeState(xid,'','');
				$routeState.publishState();
			}
		},
		
		addRouteInnerItem : function(type,hashbang,isReplace){
			if(!this.routable){
				return;
			}
			var $routeState = this.getModel().$routeState;
			var xid = this.$domNode.attr('xid');
			if(this.getInnerModel()){
				$routeState.addInnerState(xid,'',hashbang);
				$routeState.publishState(isReplace);
			}
		},
		
		refresh : function(url, params){
			this._load(url, params, true);
		},
		
		load : function(url, params){
			this._load(url, params, false);
		},
		
		_load : function(url, params, forceRefresh) {
			if (this.__windowContainerInited) {
				this._composeOK = $.Deferred();
				var src = url;
				if (src) this.set({"src": src});
				src = this.get("src");
				if (src) {
					params = params || this.params;
					var beforeEventData = {
							source: this,
							src: src,
							params: params,
							cancel: false
					};
					this.fireEvent(WindowContainer.BEFORE_LOAD_EVENT, beforeEventData);
					if (beforeEventData.cancel) return;
					this.params = params; 
					src = this._prepareSrc(src);
					this.addRouteItem("load",{src:src,params:this.params});
					if (forceRefresh || this._mustRefresh(src)){ 
						this._refresh(src, beforeEventData.params);
					}else{
						this._doSetParams(beforeEventData.params);
						this._composeOK.resolve();
					}
				}
			}
		},
		
		_doSetParams: function(params){
			var innerModel = null;
			try{
				innerModel = this.getInnerModel();
			}catch(e){};
			if (innerModel) innerModel.setParams(params);
		},
		
		_mustRefresh : function(src){
			if (!this.getInnerModel() || !this.curSrc || !src) return true;
			var url1 = new justep.URL(require.toUrl(src));
			var url2 = new justep.URL(require.toUrl(this.curSrc));
			if (url1.getPathname() == url2.getPathname()){
				for (var p in url1.params){
					if (url1.params.hasOwnProperty(p) ){
						if (!url2.params.hasOwnProperty(p) || (url1.params[p]!==url2.params[p])){
							return true;
						}
					}
				}
				
				for (var p in url2.params){
					if (url2.params.hasOwnProperty(p)){
						if (!url1.params.hasOwnProperty(p)){
							return true;
						}
					}
				}
				
				return false;
			}else{
				return true;
			}
		},
		
		
		_refresh : function(src, params){
			if (this._isFirst && this.$domNode.children().length > 0){
				
			}else{
				for ( var i = this.domNode.childNodes.length - 1; i >= 0; i--) {
					justep.Bind.removeNode(this.domNode.childNodes[i]);
				}
			}
			this._isFirst = false;
			if (!src) return;
			var newSrc = this._addDefaultParams(src);
			var settings = {
				activate : true,
				params: params,
				owner: this.owner || this
			};
			settings.model = newSrc;
			settings.preserveContext = true;
			var self = this;
			settings.loadError = function(err) {
				var evt = {
					source : self,
					err : err,
					cancel : false
				};
				self.fireEvent(WindowContainer.LOAD_ERROR_EVENT, evt);
				return evt.cancel;
			};
			settings.src = newSrc;
			settings.viewLoad = function(){
				self.curSrc = src; //缓存src, 为下次刷新做依据
				var dtd = $.Deferred();
				var evt = {
						source : self,
						cancel : false,
						dtd:dtd,
						async:false
				};
				self.fireEvent(WindowContainer.VIEW_LOAD_EVENT, evt);
				if(!evt.async){
					dtd.resolve();
				}
				return dtd.promise();
			};
			
			if (this.$domNode.children().length > 0){
				settings.view = this.$domNode.children()[0];
			}
			
			composition.compose(this.domNode, settings);
		},
		
		_prepareSrc : function(src) {
			if (src && this.useCurrentProcessActivity) {
				if ((src.indexOf("process=") == -1) && (src.indexOf("activity=") == -1)) {
					var process = this.get("process");
					var activity = this.get("activity");
					if (process && activity) {
						src += (src.indexOf("?") == -1) ? "?" : "&";
						src += "process=" + process + "&activity=" + activity;
					}
				}
			}

			return src;
		},
		
		_addDefaultParams : function(src){
			var ctx = this.getModel().getContext();
			if (src && ctx){
				if (ctx.getProcess && ctx.getActivity && this.useCurrentProcessActivity) {
					process = ctx.getProcess();
					activity = ctx.getActivity();
					if ((src.indexOf("process=") == -1) 
							&& (src.indexOf("activity=") == -1)
							&& process 
							&& activity) {
						src += (src.indexOf("?") == -1) ? "?" : "&";
						src += "process=" + process + "&activity=" + activity;
					}
				}
				
				if (ctx.getExecutor && (src.indexOf("executor=")==-1)) {
					var executor = ctx.getExecutor();
					if (executor) {
						src += (src.indexOf("?") == -1) ? "?" : "&";
						src += "executor=" + executor;
					}
				}
				if (ctx.getExecuteContext && (src.indexOf("executeContext=")==-1)){
					var executeContext = ctx.getExecuteContext();
					if (executeContext){
						src += (src.indexOf("?") == -1) ? "?" : "&";
						src += "executeContext=" + executeContext;
					}
				}
			}
			
			return src;
		},

		getInnerModel : function() {
			try{
				return justep.Bind.utils.domData.get(this.domNode, INNER_MODEL);	
			}catch(err){
				var msg = new justep.Message(justep.Message.JUSTEP230112);
				throw justep.Error.create(msg);
			}
		},

		loaded : function() {
			this.fireEvent(WindowContainer.LOAD_EVENT, {
				source : this
			});
			this._prepareRouteStateChannel();
			this._composeOK.resolve();
		},

		_prepareRouteStateChannel : function() {
			var self = this;
			this.getInnerModel().off('onRouteStatePublish');

			/**
			 * 第一次根据url进来时候 onRouteStatePublish的时机比起loaded先后顺序不确定
			 */
			var fireRouteStateChange = function(event) {
				if(self.routable){
					self.addRouteInnerItem('', event.hashbang,event.isReplace);
				}
				self.fireEvent("onRouteStatePublish", event);
				self._prepareRouteStateChannel._lastHashbang = event.hashbang;
			};
			this.getInnerModel().on("onRouteStatePublish", function(event) {
				fireRouteStateChange(event);
			}, this);
			
			fireRouteStateChange({
				isReplace : true,
				hashbang : this.getInnerModel().$routeState.toHashbang()
			});

		},
		
		send : function(data){
			//如果还有domNode, 表示没有销毁
			if (!this.isDestroy)
				this.fireEvent(WindowContainer.RECEIVE_EVENT, {source: this, data: data});
		},
		
		setParams : function(params){
			this.params = params;
		}
	});

	WindowContainer.RECEIVE_EVENT = "onReceive";
	WindowContainer.BEFORE_LOAD_EVENT = "onBeforeLoad";
	WindowContainer.LOAD_EVENT = "onLoad";
	WindowContainer.LOAD_ERROR_EVENT = "onLoadError";
	WindowContainer.VIEW_LOAD_EVENT = "onViewLoad";

	justep.Component.register(url, WindowContainer);
	return WindowContainer;
});