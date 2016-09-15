define(function(){
	var WxCpUtils = {};
	
	WxCpUtils.createMenuUrl = function(basePath,url,appid,configKey){
		var base64Url = btoa(url);
		var pageUrlEncoded = 'pageURL=' + base64Url;
		var x5Oauth2CallbackUrlPrefix = basePath + "/UI2/SA/weixin/oauth2Callback.j?configKey=" + configKey +"&";
		var x5Oauth2CallbackUrl = x5Oauth2CallbackUrlPrefix + pageUrlEncoded;
		var weixinRedictUrl = encodeURIComponent(x5Oauth2CallbackUrl);
		var weixinRedictUrlPrefix = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="
		var weixinRedictUrlSuffix = "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
		return weixinRedictUrlPrefix + weixinRedictUrl + weixinRedictUrlSuffix;
	};
	return WxCpUtils;
});