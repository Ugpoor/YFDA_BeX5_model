define(function(require){
	var $ = require("jquery");
	var Component = require("$UI/system/lib/base/component");
	var _Array = require("$UI/system/lib/base/array");
	var URL = require("$UI/system/lib/base/url");
	var CommonUtils = require("$UI/system/components/justep/common/utils"),
		RouteUtil = require('$UI/system/lib/route/routeUtil'),
		WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer"),
		shell = require("./shell"),
		Object = require("$UI/system/lib/base/object"),
		Observable = require("$UI/system/lib/base/observable");
	var ShellImpl = Object.extend({
		mixins:Observable,
		constructor: function(model,options){
			this.callParent();
			Observable.prototype.constructor.call(this);
			if(shell.impl){
				throw new Error('shell不支持嵌套');
			}else{
				shell.setImpl(this);
			}
			this.ownerModel = model;
			this.openedPageHistory = [];
			this.isSinglePage = false;
			this.useDefaultExitHandler = true;
			this.mainPageXid = options.mainPageXid || null;
			this.uninterceptXids = [];
			this.pageMappings = options.pageMappings || {};
			this.formatePageMappings();
			if(this.pageMappings['main'] && this.mainPageXid == null){
				this.mainPageXid = 'main';
			}
			var self = this;
			this.errorHandler = options.errorHandler || function(event,xid){
				setTimeout(function(){
					self.closePage(xid);
				},1000);
			};
			this.contentsXid = options.contentsXid || 'contents';
			this.wingLeftXid = options.wingLeftXid || 'left';
			this.wingRightXid = options.wingRightXid || 'right';
			this.wingXid = options.wingXid || 'wing';
			this.$routeState = this.ownerModel.$routeState;
			this.initRoute();
			this.init();
		}
	});
	
	ShellImpl.prototype.init = function(params){
		this.ownerModel.on('onModelConstructDone',function(){
			this.mainPageLoadDtd = this.ownerModel.getLoadedDeferred();
			this.pagesComp = this.ownerModel.comp(this.contentsXid);
			this.wingComp = this.ownerModel.comp(this.wingXid);
			this.wingLeftComp = this.ownerModel.comp(this.wingLeftXid);
			this.wingRightComp = this.ownerModel.comp(this.wingRightXid);
			if(this.useDefaultExitHandler){
				this.initDoubleClickExitApp();
			}
		},this);
	};
	
	ShellImpl.prototype.initDoubleClickExitApp = function(){
		var self = this;
		CommonUtils.attachDoubleClickExitApp(function(){
			if(self.pagesComp.getActiveIndex() === 0){
				return true;
			}
			return false;
		});
	};
	
	ShellImpl.prototype.addPageMappings = function(pageMappings){
		this.pageMappings = $.extend(pageMappings,this.pageMappings);
		this.formatePageMappings();
	};
	
	ShellImpl.prototype.formatePageMappings = function(){
		$.each(this.pageMappings,function(key,value){
			$.each(value,function(_key,_value){
				if(_key === "url"){
					value['url'] = require.normalizeName(_value);
				}
			});
		});
	};
	
	
	ShellImpl.prototype.showMainPage = function(data,options){
		if(this.mainPageXid){
			return this.showPage(this.mainPageXid,data,options);
		}else{
			var dtd = $.Deferred();
			dtd.resolve();
			return dtd.promise();
		}
	};
	
	ShellImpl.prototype.refineParam = function(params){
		if(typeof params === "object"){
			$.each(params,function(key,value){
				if(typeof value === "undefined" || value === "undefined"){
					delete params[key];
				}
			});
		}
		return params;
	};
	
	ShellImpl.prototype.formatParam = function(params){
		var urlParams = [];
		var url = "";
		/**
		 * 兼容参数 类型 
		 * 1. json对象
		 *     有可能是功能树上点击进来 先根据参数看是否能匹配到pagesMapping 
		 * 2. string  先假设是xid根据pagesMappings查询，查询不到假设为url
		 */
		if(typeof params === "string"){
			if(this.pageMappings[params] === undefined){
				url = params;
				url = require.normalizeName(url);
				var urlParsed = new URL(url);
				var _params = $.extend(urlParsed.params,{url:urlParsed.getPathname()});
				params = _params;
			}else{
				var pageParams = this.pageMappings[params];
				pageParams.xid = params;
				params = pageParams;
			}
		}
		
		if(typeof params === "object"){
			if(params.url){
				params.url = require.normalizeName(params.url);
			}
			$.each(this.pageMappings,function(key,value){
				if(params.xid === key || params.url === key){
					value.xid = key;
					params = value;
					return;
				}
				
				var match = true;
				$.each(value,function(_keyv,_valuev){
					if(params[_keyv] !== _valuev && _keyv !== "extra" && _keyv !== "xid"){
						match = false;
					}
				});
				
				$.each(params,function(_key,_value){
					if(value[_key] !== _value && _key !== "extra" && _key !== "params"){
						match = false;
					}
				});
				
				if(match){
					params.xid = key;
					return;
				}
			});
		}
		
		$.each(params,function(key,value){
			if(key !== "url" && key !== "xid" && key !== "extra"){
				if(value !== "undefined" && value !== "" && value !== undefined){
					urlParams.push(key + "=" + encodeURIComponent(value));
				}
			}else if(key === "url"){
				url = value;
			}
		});
		var urlParamStr = urlParams.join("&");
		if(urlParams.length > 0){
			if(url.indexOf("?") != -1){
				params.url = url + "&" + urlParamStr;
			}else{
				params.url = url + "?" + urlParamStr;
			}
		}
		params.xid = params.xid || params.url;
		return params;
	};
	
	ShellImpl.prototype.loadPage = function(params,viewLoadCallback,data,owner){
		params = this.formatParam(params);
		
		var eventData = {
			data:params,
			cancel:false
		};
		this.fireEvent("onBeforePageLoad",eventData);
		if(eventData.cancel){
			return $.Deferred().promise();
		}
		var url = params.url;
		var xid = params.xid;
		
		var self = this;
		var container,pageLoaded = false,parentNode;
		if(this.wingComp && xid === this.wingLeftXid){
			container = this.wingLeftComp;
			 if(container.innerContainer){
				 pageLoaded = true;
			 }else{
				 parentNode = container.$domNode.get(0);
			 }
		}else if(this.wingComp && xid === this.wingRightXid){
			container = this.wingRightComp;
			 if(container.innerContainer){
				pageLoaded = true;
			 }else{
				parentNode = container.$domNode.get(0);
			 }
		}else{
			 container = this.pagesComp.getContent(xid);
			 if(container){
				 pageLoaded = true;
			 }else{
				 container = this.pagesComp.add({xid: xid});
			 }
			 parentNode = container.$domNode.get(0);
		}
		var dtd = $.Deferred();
		if(!pageLoaded){
			var compose = new WindowContainer({
				parentNode: parentNode,
				src: url,
				useCurrentProcessActivity: false,
				params:data,
				owner:owner?owner:{
					send:function(){},
					close:function(){
						self.closePage(xid);
					}
				},
				onViewLoad: function(event){
					var pageViewLoadEventData = {
						data:params
					};
					self.fireEvent("onPageViewLoad",pageViewLoadEventData);
					self._bindActiveEventAfterViewLoaded(container,params,xid,compose);
					viewLoadCallback && viewLoadCallback(event);
				},
				onLoad: function(){
					self._bindActiveEventAfterModelLoaded(container,params,xid,compose);
					self._bindInactiveEvent(container,params,xid,compose);
					
					var pageLoadEventData = {
						data:params,
						cancel:false,
						container:compose
					};
					self.fireEvent("onAfterPageLoad",pageLoadEventData);
					
					dtd.resolve({
						container:compose
					});
				},
				onLoadError: function(event){
					self.errorHandler && self.errorHandler(event,xid); 
					dtd.reject(event);
				}
			});
			container.innerContainer = compose;
		}else if(!container.innerContainer){
			//优化方案 可以预加载windowContainer 这个时候windowContainer和content不是动态创建的
			if(parentNode.children[0]){
				var mainCompose = Component.getComponent(parentNode.children[0]);
				container.innerContainer = mainCompose;
				self._bindActiveEvent(container,params,xid,mainCompose);
				self._bindInactiveEvent(container,params,xid,mainCompose);
				
				var pageLoadEventData = {
					data:params,
					cancel:false,
					container:mainCompose
				};
				self.fireEvent("onAfterPageLoad",pageLoadEventData);
				dtd.resolve({
					container:mainCompose
				});
			}
		}else{
			if(container && container.innerContainer){
				dtd.resolve({
					container:container.innerContainer
				});
			}else{
				dtd.resolve({
					container:container
				});
			}
		}
		return dtd.promise();
	};
	
	
	ShellImpl.prototype._bindActiveEventAfterViewLoaded = function(container,params,xid,compose){
		var self = this;
		var activeCallback = function(){
			var eventParams = params;
			if(self.pageMappings[xid]){
				eventParams = self.pageMappings[xid]; 
			}
			var activeEventData = {
				source:self,
				data:{
					xid:xid,
					params:eventParams
				},
				container:compose
			};
			self.fireEvent('onPageActive',activeEventData);
		};
		container.on("onActive", activeCallback);
	};
	
	ShellImpl.prototype._bindActiveEventAfterModelLoaded = function(container,params,xid,compose){
		var self = this;
		var activeCallback = function(){
			var eventParams = params;
			if(self.pageMappings[xid]){
				eventParams = self.pageMappings[xid]; 
			}
			var activeEventData = {
				source:self,
				data:{
					xid:xid,
					params:eventParams
				},
				container:compose
			};
			if(compose.getInnerModel()){
				self.subscribeChange(xid);
				compose.getInnerModel().fireEvent('onActive',activeEventData);
			}
		};
		container.on("onActive", activeCallback);
	};
	
	/**
	 * 考虑到w3c实现页面onload 和 visibilitychange 的机制为
	 * 页面第一次加载 触发onload事件 visibilitychange事件第一次不触发
	 * 所以 .w页面第一次不出onActivity事件。
	 * 所以需要吧和contents绑定的onActive事件拆分为2个 
	 * 一个在viewLoad时候绑定 这样viewload后页面切换 切换触发发shell的pageActive事件
	 * 一个在modelLoad时候绑定，这样页面modelLoad不会出发onActive事件。
	 * 
	 */
	ShellImpl.prototype._bindActiveEvent = function(container,params,xid,compose){
		this._bindActiveEventAfterViewLoaded(container,params,xid,compose);
		this._bindActiveEventAfterModelLoaded(container,params,xid,compose);
	};
	
	ShellImpl.prototype._bindInactiveEvent = function(container,params,xid,compose){
		var self = this;
		var activeCallback = function(){
			var eventParams = params;
			if(self.pageMappings[xid]){
				eventParams = self.pageMappings[xid]; 
			}
			var activeEventData = {
				source:self,
				data:{
					xid:xid,
					params:eventParams
				},
				container:compose
			};
			
			self.fireEvent('onPageInactive',activeEventData);
			if(compose.getInnerModel()){
				compose.getInnerModel().fireEvent('onInactive',activeEventData);
			}
		};
		container.on("onInactive", activeCallback);
	};
	
	
	
	ShellImpl.prototype.closeAllOpendedPages = function(){
		var self = this;
		var closeAllDtd = $.Deferred();
		var _openedPages = self.getOpenedPages();
		if(_openedPages.length === 0){
			closeAllDtd.resolve();
		}else{
			this.showMainPage().done(function(){
				self.openedPageHistory = [self.mainPageXid];
				
				$.each(_openedPages,function(index,url){
					if(url !== self.mainPageXid){
						self.closePage(url,false,self.mainPageXid);
					}
				});
				closeAllDtd.resolve();
			}).fail(function(){
				closeAllDtd.reject();
			});
		}
		return closeAllDtd.promise();
	};
	
	
	ShellImpl.prototype.closeAll = function(){
		var self = this;
		var closeAllDtd = $.Deferred();
		var _openedPages = self.getOpenedPages();
		if(_openedPages.length === 0){
			closeAllDtd.resolve();
		}else{
			self.openedPageHistory = [];
			$.each(_openedPages,function(index,url){
				if(url !== self.mainPageXid){
					self.closePage(url,false);
				}
			});
			closeAllDtd.resolve();
		}
		return closeAllDtd.promise();
	};
	
	
	ShellImpl.prototype.closePage = function(url,isDeepClose,toPageXid,keepPage){
		
		if(typeof url === "object"){
			toPageXid = url.toPageXid;
			isDeepClose = url.isDeepClose;
			keepPage = url.keepPage;
			url = url.url;
		}
		
		//TODO 不支持wing left right 的删除
		var self = this;
		var closePageDtd = $.Deferred();
		if(this.animating){
			closePageDtd.reject();
			return closePageDtd.promise();
		}
		
		this.animating = true;
		if(!url){
			url = this.openedPageHistory[this.openedPageHistory.length-1];
		}
		if(!this.pageMappings[url]){
			url = require.normalizeName(url);
		}
		var _currentPageHistory = this.openedPageHistory.reverse(); 
		$.each(_currentPageHistory,function(index,data){
            if(url === data){
            	_currentPageHistory.splice(index,1);
            	if(isDeepClose !== true){
            		return false;
            	}
            }
        });
		this.openedPageHistory = _currentPageHistory.reverse();
		var removePageXid = url;
		if(!toPageXid){
			toPageXid = this.openedPageHistory[this.openedPageHistory.length-1];
			if(toPageXid ===  url){
				$.each(this.openedPageHistory.reverse(),function(index,data){
		            if(url != data){
		            	toPageXid = data;
		            	return false;
		            }
		        });
				
			}
		}
		var container = this.getContainerByXid(removePageXid); 
		
		var pageCloseEventData = {
			data:{
				closePageXid:removePageXid,
				toPageXid:toPageXid,
				closePageUrl:url
			},
			container:container
		};
		self.fireEvent("onBeforePageClose",pageCloseEventData);
		
		if(toPageXid !== undefined){
			var loadPromise = this.loadPage({url:toPageXid});
			loadPromise.then(function(){
				if(keepPage){
					self.showPage(toPageXid).done(function(){
						self.animating = false;
					});;
				}else{
					self.removePage(removePageXid, toPageXid).done(function(){
						self.animating = false;
					});
				}
				var pageCloseEventData = {
					data:{
						closePageXid:removePageXid,
						toPageXid:toPageXid,
						closePageUrl:url
					}
				};
				self.fireEvent("onAfterPageClose",pageCloseEventData);
				closePageDtd.resolve();
			});
		}else{
			if(keepPage){
				this.showPage(toPageXid).done(function(){
					self.animating = false;
				});
			}else{
				this.removePage(removePageXid, toPageXid).done(function(){
					self.animating = false;
					
				});
			}
			var pageCloseEventData = {
				data:{
					closePageXid:removePageXid,
					toPageXid:toPageXid,
					closePageUrl:url
				}
			};
			self.fireEvent("onAfterPageClose",pageCloseEventData);
			closePageDtd.resolve();
		}
		setTimeout(function(){
			if(self.animating === true){
				self.animating = false;
				console && console.warn("restore closing state by timeout");
			}
		},500);
		return closePageDtd.promise();
	};
	
	
	ShellImpl.prototype.removeMainPage = function(){
		var pagesComp = this.pagesComp;
		var content = pagesComp.getContent(this.mainPageXid);
		_Array.remove(pagesComp.contents, content);
		Component.removeComponent(content);
	};
	
	ShellImpl.prototype.removePage = function(index, to){
		var dfd = $.Deferred();
		if(index === undefined)
			index = this.pagesComp.active;
		if(typeof index == 'string')
			index = this.pagesComp.getIndexByXid(index);
		if(typeof to == 'string')
			to = this.pagesComp.getIndexByXid(to);
		var length = this.pagesComp.getLength();
		if(length>1){
			var me = this.pagesComp;
			this.pagesComp.to(to || 0, function(){
				if(index != 0){
					var content = me.contents[index];
					_Array.remove(me.contents, content);
					Component.removeComponent(content);
				}
				dfd.resolve();
			});
		}else{
			dfd.resolve();
		}
		return dfd.promise();
	},
	
	ShellImpl.prototype._afterShowPage = function(xid){
		var dtd = $.Deferred();
		if(xid === this.wingLeftXid && this.wingLeftComp && this.wingLeftComp.innerContainer){
			dtd.resolve({
				container:this.wingLeftComp.innerContainer
			});
		}else if(xid === this.wingRightXid && this.wingRightComp && this.wingRightComp.innerContainer){
			dtd.resolve({
				container:this.wingRightComp.innerContainer
			});
		}else{
			var _content = this.pagesComp.getContent(xid);
			if(_content && _content.innerContainer){
				dtd.resolve({
					container:_content.innerContainer
				});
			}else{
				dtd.resolve();
			}
		}
		return dtd.promise();
	};
	
	ShellImpl.prototype.showLeft = function(){
		return this.showPage(this.wingLeftXid);
	};
	
	ShellImpl.prototype.showRight = function(){
		return this.showPage(this.wingRightXid);
	};
	
	//提供更好理解的api
	ShellImpl.prototype.showPage = function(url,data,options){
		if(typeof data === "string"){
			try{
				data = JSON.parse(data);
			}catch(e){};
		}
		var blankOptions = {};
		var options = options || blankOptions;
		var owner = options.owner;
		delete options.owner;
		if(typeof url == "string"){
			url = {url:url};
		}
		if(options != blankOptions){
			return this.preShowPage($.extend(url,{extra:options}),data,owner);
		}else{
			return this.preShowPage(url,data,owner); 
		}
		
	};
	
	ShellImpl.prototype.preShowPage = function(params,data,owner){
		if(params === this.wingLeftXid || params === this.wingRightXid){
			var _xid = params;
			params = {xid:_xid};
		}else{
			params = this.formatParam(params);
		}
		var xid = params.xid || params.url;
		var self = this;
		var showPageDtd = $.Deferred();
		
		if(this.animating){
			showPageDtd.reject();
			return showPageDtd.promise();
		}
		this.animating = true;
		if(this.wingComp){
			 this.wingComp.hideLeft();
			 this.wingComp.hideRight();
		}
		if(xid === this.wingLeftXid || xid === this.wingRightXid || (this.pagesComp.has(xid) && this.pagesComp.getContent(xid).innerContainer)){
			showPageDtd = this._showPage(params,data).then(function(xid){
				return self._afterShowPage(xid);
			});
		}else{
			var loadPromise = this.loadPage(params,function(event){
				event.async = true;
				var viewLoadDtd = event.dtd;
				/**
				 * 可以在这里订阅的原因是
				 * 在contents中先调用回调函数
				 * 然后才触发自己的onActive事件
				 * 收到content的onActive事件才会出发windowContainer的onActive事件，这个时候内部routestate才会publish 
				 * 
				 */
				self.subscribeChange(xid);
				self.pagesComp.to(xid,function(){
					viewLoadDtd.resolve();
				});
			},data,owner);
			showPageDtd = loadPromise.then(function(data){
				return self._showPage(params).then(function(xid){
					return self._afterShowPage(xid);
				});
			});
		}
		showPageDtd.then(function(data){
			self.animating = false;
			if(xid === self.mainPageXid){
				self.mainPageLoadDtd.resolve();
			}
		});
		setTimeout(function(){
			if(self.animating === true){
				self.animating = false;
				console && console.warn("restore closing state by timeout in showpage");
			}
		},500);
		return showPageDtd;
	};
	
	ShellImpl.prototype._showPage = function(params,data){
		var dtd = $.Deferred();
		var self = this;
		var xid = params.xid || params.url;
		if(xid === this.wingLeftXid){
			if(this.wingComp){
				this.wingComp.showLeft(function(){
					dtd.resolve(xid);
				});
			}else{
				dtd.reject(xid);
			}
		}else if(xid === this.wingLeftXid){
			if(this.wingComp){
				this.wingComp.showRight(function(){
					dtd.resolve(xid);
				});
			}else{
				dtd.reject(xid);
			}
		}else{
			var currentXid =  this.pagesComp.getActiveXid();
			var destContent =  this.pagesComp.getContent(xid);
			if(destContent && destContent.innerContainer && destContent.innerContainer.load && data){
				destContent.innerContainer.setParams(data);
				destContent.innerContainer.load();
			}
			self.subscribeChange(xid);
			if(xid === currentXid){
				this._showCenterPageAfter(xid,dtd);
			}else{
				this.pagesComp.to(xid,function(){
					/**
					 *  如果为首页情况，
					 *  在addContent时候 在contents的回调用获取currentActiveXid 是空的 
					 *  所以需要放到 to之后。 
					 */
					self.subscribeChange(xid);
					self._showCenterPageAfter(xid,dtd);
				});
			}
		}
		return dtd.promise();
	};
	
	ShellImpl.prototype._showCenterPageAfter = function(xid,dtd){
		var self = this;
		self.openedPageHistory.push(xid);
		if(!self.mainPageXid){
			self.mainPageXid = xid;
		}
		if(self.isSinglePage){
			self._removeOtherPages();
		}
		dtd.resolve(xid);
	};
	
	
	
	ShellImpl.prototype.getOpenedPages = function(){
		var pages = [];
		var contents = this.pagesComp.contents;
		for(var i = 0; i< contents.length; i++){
			var content = contents[i];
			pages.push(content.xid);
		}
		return pages;
	};
	
	
	ShellImpl.prototype._removeOtherPages = function(){
		var contents = [];
		var activeIndex = this.pagesComp.active;
		for(var i = 0; i< this.pagesComp.contents.length; i++){
			var content = this.pagesComp.contents[i];
			if(i === activeIndex) {
				contents.push(content);
			}else{
				if(content.xid === this.mainPageXid){
					contents.push(content);
				}else{
					Component.removeComponent(content);
				}
			}
		}
		this.pagesComp.contents = contents;
		if(contents.length === 2){
			this.pagesComp.active = 1;
		}else{
			this.pagesComp.active = 0;
		}
	},
	
	ShellImpl.prototype.getContainerByXid = function(xid){
		var $page = this.getPageByXid(xid);
		if($page && $page.innerContainer){
			return $page.innerContainer;
		}
		return null;
	};
	
	
	ShellImpl.prototype.getPageByXid = function(xid){
		var $page = this.pagesComp.getContent(xid);
		return $page;
	};
	
	ShellImpl.prototype.getActivePage = function(){
		var activeXid = this.pagesComp.getActiveXid();
		var $active = this.pagesComp.getContent(activeXid);
		return $active;
	};
	
	ShellImpl.prototype.getActivePageXid = function(){
		var activeXid = this.pagesComp.getActiveXid();
		return activeXid;
	};
	
	ShellImpl.prototype.dispatchChange = function(innerStateValue){
		var $active = this.getActivePage();
		if ($active && $active.innerContainer && $active.innerContainer.getInnerModel()) {
			$active.innerContainer.getInnerModel().postMessage({
				type : "routeState",
				newUrl : innerStateValue
			});
		}
	};

	ShellImpl.prototype.subscribeChange = function(){
		for ( var i in this.pagesComp.contents) {
			var content = this.pagesComp.contents[i];
			if (content.innerContainer) {
				content.innerContainer.off('onRouteStatePublish');
			}
		}
		var $active = this.getActivePage();
		if ($active && $active.innerContainer) {
			$active.innerContainer.on('onRouteStatePublish', function(event) {
				this.addRouteItem($active.xid, $active.innerContainer.params);
				this.addRouteInnerItem($active.xid, event.hashbang, event.isReplace);
			}, this);
		}
	};
	
	ShellImpl.prototype.addRouteItem = function(xid, params){
		if(params){
			if(typeof params === "string"){
				try{
					params = JSON.parse(params);
				}catch(e){
					params = {};
				}
			}
			var routeParams = $.extend({},params);
			delete routeParams.data;
			this.$routeState.addState(xid, '', JSON.stringify(routeParams));
		}
	};
	
	ShellImpl.prototype.addRouteInnerItem = function(xid, hashbang, isReplace){
		this.$routeState.addInnerState(xid, '', hashbang);
		this.$routeState.publishState(isReplace);
	};
	
	ShellImpl.prototype.clearRouteItem = function() {
		this.$routeState.clearState();
	};
	
	ShellImpl.prototype.removeRouteItem = function(xid, name) {
		this.$routeState.removeState(xid, name);
	};

	ShellImpl.prototype.initRoute = function() {
		var self = this;
		this.$routeState.on('onRoute', function(event) {
			self.doRoute(event);
		}, this);
	};

	ShellImpl.prototype.doPagesRoute = function(event) {
		var self = this;
		var dtd = event.dtd;
		var innerStateValue;
		event.cancel = true;
		if (event.routeState == 'leave') {
			var leaveXid = event.xid;
			var $leave = this.pagesComp.getContent(leaveXid);
			if ($leave) {
				$leave.off('onRouteStatePublish');
			}
			dtd.resolve();
		} else if (event.routeState == 'enter') {
			event.async = true;
			var paramValue = RouteUtil.getParamValue(event.param);
			innerStateValue = RouteUtil.getInnerStateValue(event.param);
			var xid = event.xid;
			var activeXid = this.pagesComp.getActiveXid();
			if (activeXid == xid) {
				this.dispatchChange(innerStateValue);
				dtd.resolve();
			} else {
				var showPromise = this.showPage(xid,paramValue);
				showPromise.then(function() {
					dtd.resolve();
					self.dispatchChange(innerStateValue);
					self.closePage({
						toPageXid:xid,
						url :activeXid
					});
				});
			}
		} else if (event.routeState == 'update') {
			innerStateValue = RouteUtil.getInnerStateValue(event.param);
			this.dispatchChange(innerStateValue);
			dtd.resolve();
		}
	};
	
	/**
	 * 后续支持wing的路由能力
	ShellImpl.prototype.doWingRoute = function(event) {
		var self = this;
		var dtd = event.dtd;
		event.cancel = false;
		if (event.routeState == 'leave') {
			
		} else if (event.routeState == 'enter') {
			event.async = true;
			var paramValue = RouteUtil.getParamValue(event.param);
			var innerStateValue = RouteUtil.getInnerStateValue(event.param);
			var xid = event.xid;
			var activeXid = this.pagesComp.getActiveXid();
			if (activeXid == xid) {
				this.dispatchChange(innerStateValue);
			} else {
				var showPromise = this.showPage({url:xid});
				showPromise.then(function() {
					dtd.resolve();
					self.dispatchChange(innerStateValue);
				});
			}
		} else if (event.routeState == 'update') {
			var innerStateValue = RouteUtil.getInnerStateValue(event.param);
			this.dispatchChange(innerStateValue);
			dtd.resolve();
		}
	};
	*/

	ShellImpl.prototype.doRoute = function(event) {
		if(event.xid !== this.wingXid && this.uninterceptXids.indexOf(event.xid) === -1){
			var fakeEvent = {
				xid : event.xid,
				name : event.name,
				param : event.param,
				routeState : event.routeState,
				dtd : event.dtd
			};
			event.cancel = true;
			event.async = true;
			this.doPagesRoute(fakeEvent);
		}
	};
	
	return ShellImpl;
});