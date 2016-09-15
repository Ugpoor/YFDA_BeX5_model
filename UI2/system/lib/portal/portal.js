/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require){

	var portal = {};
	portal.getPortal = function(){
		try{
			var win = window;
			while (win) {
				if (win.isPortalWindow) {
					return win;
				}
				if(win == win.parent){
					break;
				}
				win = win.parent;
			}
		}catch(e){
			return null;
		}
	};
	
	portal.postMessage = function(name){
		var args = Array.prototype.slice.call(arguments);
		var win = this.getPortal();
		//portal model instance
		if(win){
			var obj;
			try{
				obj = win.justep.Bind.contextFor($(".window").get(0)).$model;
			}catch(e){}
			if(obj && obj[name]){
				args.shift();
				return obj[name].apply(obj, args);
			}
		}else if(win = window.parent){
			//为第三方提供通知
			var args2 = Array.prototype.slice.call(arguments);
			args2.shift();
			args2.push(window.location.href);
			var data = {type: 'portal', event: {name: name, args: args2}};/*这里是为了兼容IE9*/
			win.postMessage(JSON.stringify(data), '*');
		}
	};
	
	/*
	 * 系统注销
	 */
	portal.logout = function(config){
		return portal.postMessage('logout', config);
		/*
		//支持消息推送
		if (navigator && navigator.push && navigator.push.token && navigator.push.disConnect){
			navigator.push.disConnect();
		}
		*/
	};
	/*
	 * 提示超时, 是否注销系统
	 */
	portal.sessionTimeout = function(){
		return portal.postMessage('sessionTimeout');
	};
	
	portal.openWindow = function(url, options){
		return portal.postMessage('openPage', url, options);
	};
	
	portal.closeWindow = function(id){//TODO: id
		return portal.postMessage('closePage', id);
	};
	
	portal.getFuncIframe = function(id){//TODO: id
		return portal.postMessage('getFuncIframe', id);
	};
	
	portal.hasWindow = function(id){
		return portal.postMessage('hasPage', id);
	};
	
	portal.getWindowId = function(){
		return portal.postMessage('getPageId');
	};
	
	portal.gotoWindow = function(id){
		portal.postMessage('toPage', id);
	};
	
	portal.toggleMenu = function(){
		portal.postMessage('toggleMenu');
	};
	
	portal.setSkin = function(value){
		portal.postMessage('setSkin', value);
	};
	
	portal.setLang = function(value){
		portal.postMessage('setSLang', value);
	};
	
	portal.setDebug = function(value){
		portal.postMessage('setDebug', value);
	};
	
	/*兼容保留*/
	portal.refreshWindow = function(){
		this.closeWindow();
		this.openWindow.apply(this, arguments);
	};

	portal.startLoading = function(){
	};

	portal.stopLoading = function(){
	};
	
	portal.existWindow = function(id){
		return portal.hasWindow(id);
	};
	
	return portal;
});	
