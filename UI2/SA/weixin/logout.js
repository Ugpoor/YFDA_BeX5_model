define(function(require){
	var justep = require("$UI/system/lib/justep");
	var $ = require('jquery');
	require("$UI/system/lib/biz");
	var URL = require("$UI/system/lib/base/url");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.model1ModelConstructDone = function(event){
		var currentURL = new URL(location.href);
		var configKey = currentURL.getParam("configKey");
		var self = this;
		var readyFunc = function onBridgeReady() {
			var weixinUserID = self.getContext().getCurrentPersonCode();
			//alert(weixinUserID);
			var logoutUrl = require.toUrl('$UI/portal/DoLogout.j');
	        $.ajax({
	            type: "POST",
	            processData: false,
	            url:  logoutUrl,
	            cache:false,
	            async: false
	        });
	        var logoutMsgUrl = require.toUrl('$UI/SA/weixin/logout.j?weixinUserID='+weixinUserID+"&configKey="+configKey);
	        $.ajax({
	            type: "POST",
	            processData: false,
	            url:  logoutMsgUrl,
	            cache:false,
	            async: false
	        });
			WeixinJSBridge.call('closeWindow');
		}
		if (typeof WeixinJSBridge === "undefined") {
		  document.addEventListener('WeixinJSBridgeReady', readyFunc, false);
		} else {
		  readyFunc();
		}
	};
	return Model;
});