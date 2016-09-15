/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){
	var $=require('jquery'),
		Object = require("$UI/system/lib/base/object"),
		Observable = require("$UI/system/lib/base/observable"),
		URL = require('$UI/system/lib/base/url'),
		Browser = require('$UI/system/lib/base/browser'),
		_history = window.history,
		HashbangParser = require('./hashbangParser'),
		_lastChangeTimeStamp = new Date().getTime();
		
	
	var HashbangToken = "#!",
		StateSeriesSplitToken = "!",
		LeftBarcketToken = "(",
		RightBarcketToken = ")",
		SegmentSplitToken = "/";
	
	function ignoreVLS(url){
		return URL._removeVLS(url);
	};
	
	
	function convertToOldUrl(){
		var oldUrl = new URL(window.__justep.__ResourceEngine.url);
		var path = oldUrl.getPathname();
		var currentUrl = new URL(location.href);
		var search = currentUrl.getSearch();
		var hash = currentUrl.getHash();
		return path + search + hash;
	};
	
	
	
	
	
	
	var isSimulator = false;
	try{
		isSimulator = window.parent && window.parent.getOSName;
	}catch(err){
	}
	
	var Router = Object.extend({
		mixin:Observable,
		constructor: function(){
			this.callParent();
			Observable.prototype.constructor.call(this);
			this.checkRedirectParam();
			this.interceptLinkHash();
			this.polyfillStateApi();
			this.originUrl = location.href;
			this.ignoreVls();
			this.subscribeState();
			var self = this;
			setTimeout(function(){
				self.indexPageLoaded = true;
			},3000);
		}
	});
	
	
	Router.prototype.checkRedirectParam = function(){
		var currentUrl = new URL(location.href);
		if(currentUrl.getParam('_shareHash')){
			var _shareHash = currentUrl.getParam('_shareHash');
			currentUrl.setHash(_shareHash);
			currentUrl.removeParam('_shareHash');
			this.publishState({
				isReplace:true,
				hashbang:currentUrl.toString()
			});
		}
	};
	
	Router.prototype.polyfillStateApi = function(){
		if(typeof _history.pushState != 'function'){
			_history.pushState = function(){};
			_history.replaceState = function(){};
		}
	};
	
	Router.prototype.revertVls = function(){
		if(!Browser.isWeChat && !isSimulator){
			var url = convertToOldUrl();
			this.publishState({
				isIgnoreVersionPublish:true,
				isReplace:true,
				hashbang:url
			});
		}	
	};
	
	Router.prototype.ignoreVls = function(){
		if(!Browser.isWeChat && !isSimulator){
			var ignoreVersionUrl = ignoreVLS(location.pathname + location.search) + location.hash;
			this.publishState({
				isIgnoreVersionPublish:true,
				isReplace:true,
				hashbang:ignoreVersionUrl
			});
		}
	};
	
		
	Router.prototype.interceptLinkHash = function(){
		var self = this;
		$(document).on('click.routeState','a',function(event){
			var href = $(event.currentTarget).attr('href');
			if(href && href.indexOf('#!') == 0){
				event.preventDefault();
				var bindingContext = justep.Bind.contextFor(event.target);
				if(bindingContext){
					var $model = bindingContext.$model;
					if($model){
						$model.fireEvent('onRouteStatePublish',{
							hashbang: href,
							isReplace:false
						});
						$model.postMessage({
							type:"routeState",
							newUrl:href
						});
					}
				}
			}else if(href && href == '#'){
				event.preventDefault();
			}
		});
	};
	
	
	Router.prototype.subscribeState = function(){
		$(window).on('hashchange',$.proxy(function(event){
			_lastChangeTimeStamp = new Date().getTime();
			var e = event.originalEvent;
			var newUrl = e.newURL;
			var oldUrl = e.oldURL;
			if(newUrl == undefined){
				newUrl = location.href;
			}
			this.dispatchChange(newUrl,oldUrl);
		},this));
	};
	
	Router.prototype.dispatchChange = function(newUrl,oldUrl){
		this.rootModel.postMessage({
			type:"routeState",
			oldUrl:oldUrl,
			newUrl:newUrl
		});
	};
	
	Router.prototype.publishState = function(event){
		var currentTimeStamp = new Date().getTime();
		var isReplace = event.isReplace;
		if(currentTimeStamp - _lastChangeTimeStamp < 800){
			isReplace = true;
		}
		var hashbang = event.hashbang;
		if(!this.indexPageLoaded){
			//保证分享带路由情况可以第一次通过url分发正常，其他情况都是通过routeState通知到url中。
			if(hashbang == "" || hashbang === HashbangToken){
				if(typeof justep.Portal.getPortal() !== "undefined"){
					return;
				}else{
					hashbang = "";
				}
			}
			if(hashbang === ""){
				return;
			}
		}
		if(isReplace){
			this.publishState._lastState = hashbang;
			try{
				_history.replaceState(null,null,hashbang);
			}catch(e){
				console.log(e);
			}
		}else{
			if(this.publishState._lastState !== hashbang){
				this.publishState._lastState = hashbang;
				_lastChangeTimeStamp = currentTimeStamp;
				try{
					_history.pushState(null,null,hashbang);
				}catch(e){
					console.log(e);
				}
			}
		}
	};
	
	Router.prototype.setRootModel = function(model){
		var self = this;
		if(typeof this.rootModel == 'undefined'){
			this.rootModel = model;
			this.rootModel.on('onRouteStatePublish',function(event){
				this.publishState(event);
			},this);
			var originHref = location.href;
			//第一次进来理解url
			this.rootModel.on('onLoaded',function(event){
				self.dispatchChange(originHref,'');
				setTimeout(function(){
					//防止页面加载过慢 TODO:onLoaded机制要有自动保证的逻辑
					self.dispatchChange(originHref,'');
				},1000);
			},this);
		}
	};
    return new Router();
    
});