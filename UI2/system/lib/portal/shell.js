define(function(require){
	var $ = require("jquery");
	var Browser = require('$UI/system/lib/base/browser');
	
	function checkImpl(){
		if(api.impl){
			return true;
		}
		return false;
	}
	
	var implDtd = $.Deferred();
	function setImpl(impl){
		if(!checkImpl()){
			api.impl = impl;
			implDtd.resolve(impl);
		}
	}
	
	function getImpl(){
		return implDtd.promise();
	}
	
	function DefaultImpl(){
	}
	
	
	DefaultImpl.prototype.noopImpl = function(){
		var dtd = $.Deferred();
		return dtd.promise();
	};
	
	DefaultImpl.prototype.closePage = function(){
		if(Browser.isWeChat){
			return WeixinJSBridge.call('closeWindow');
		}else if(Browser.isX5App){
			plugins.toast.showShortBottom("已经到最后不能返回了.");
		}else{
			return window.open("about:blank","_self").close();
		}
		
	};
	
	var defaultImpl = new DefaultImpl();
	
	function addShowPage(){
		var dtd = $.Deferred();
		//require('$UI/system/components/justep/windowOpener/windowOpener')
		require(['$UI/system/components/justep/windowOpener/windowOpener'],function(WindowOpener){
			DefaultImpl.prototype.showPage = function(url,data,options){
				if(typeof url === "object"){
					var urlParams = [];
					var params = url;
					url = url.url;
					delete params.url;
					$.each(params,function(key,value){
						if(key !== "xid" && key !== "extra"){
							if(value !== "undefined" && value !== "" && value !== undefined){
								urlParams.push(key + "=" + encodeURIComponent(value));
							}
						}
					});
					var urlParamStr = urlParams.join("&");
					if(urlParams.length > 0){
						if(url.indexOf("?") != -1){
							url = url + "&" + urlParamStr;
						}else{
							url = url + "?" + urlParamStr;
						}
					}
				}
				var option = {
					url : url,
					modal : "true",
					resizable : "true",
					status : "fullscreen"
				};
				/*if(Browser.isWeChat){
					window.open(url,"_self");
				}else{
					
				}*/
				var opener = new WindowOpener(option);
				opener.open({
					params:data
				});
				
			};
			dtd.resolve();
		});
		return dtd.promise();
	};
	
	var api = {
		setImpl: setImpl,
		getImpl: getImpl,
		loadPage:function(){
			if(checkImpl()){
				return api.impl.loadPage.apply(api.impl,arguments);
			}else{
				return defaultImpl.noopImpl(); 
			}
		},
		showPage:function(){
			var args = arguments;
			if(checkImpl()){
				return api.impl.showPage.apply(api.impl,arguments);
			}else{
				if(defaultImpl.showPage){
					return defaultImpl.showPage.apply(defaultImpl,arguments);
				}else{
					addShowPage().done(function(){
						return defaultImpl.showPage.apply(defaultImpl,args);
					});
				}
			}
		},
		showLeft : function(){
			if(checkImpl()){
				return api.impl.showLeft.apply(api.impl,arguments);
			}else{
				return defaultImpl.noopImpl(); 
			}
		},
		
		showRight : function(){
			if(checkImpl()){
				return api.impl.showRight.apply(api.impl,arguments);
			}else{
				return defaultImpl.noopImpl(); 
			}
		},
		
		closePage:function(){
			if(checkImpl()){
				return api.impl.closePage.apply(api.impl,arguments);
			}else{
				
				defaultImpl.closePage();
			}
		},
		setIsSinglePage:function(isSinglePage){
			if(checkImpl()){
				api.impl.isSinglePage = isSinglePage;
			}
		},
		getActivePageXid:function(){
			if(checkImpl()){
				return api.impl.getActivePageXid.apply(api.impl,arguments);
			}else{
				return "";
			}
		},
		on : function(){
			if(checkImpl()){
				return api.impl.on.apply(api.impl,arguments);
			}
		},
		off : function(){
			if(checkImpl()){
				return api.impl.off.apply(api.impl,arguments);
			}
		},
		fireEvent : function(){
			if(checkImpl()){
				return api.impl.fireEvent.apply(api.impl,arguments);
			}
		},
		addPageMappings : function(){
			if(checkImpl()){
				return api.impl.addPageMappings.apply(api.impl,arguments);
			}
		},
		showMainPage : function(){
			if(checkImpl()){
				return api.impl.showMainPage.apply(api.impl,arguments);
			}
		},
		removeMainPage:function(){
			if(checkImpl()){
				return api.impl.removeMainPage.apply(api.impl,arguments);
			}
		},
		closeAllOpendedPages:function(){
			if(checkImpl()){
				return api.impl.closeAllOpendedPages.apply(api.impl,arguments);
			}
		},
		closeAll:function(){
			if(checkImpl()){
				return api.impl.closeAll.apply(api.impl,arguments);
			}
		}
	};
	return api;
});