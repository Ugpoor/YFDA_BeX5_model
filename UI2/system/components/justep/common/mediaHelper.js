define(function(requrie){
	require("cordova!cordova-plugin-httpd");
	require("cordova!com.justep.cordova.plugin.app.utils");
	require("cordova!cordova-plugin-file");
	var $ = require("jquery");
	var mountNum = 0;
	var helper = {
		mountLocalMedia : function(dom){
			var self = this;
			var player = $(dom).find('video,audio');
			if(navigator.appUtils && cordova && cordova.plugins && cordova.plugins.CorHttpd && window.resolveLocalFileSystemURL){
				$(dom).find('source').each(function(index,ele){
					var mediaUrl = new justep.URL(ele.src);
					var pathname = mediaUrl.getPathname();
					navigator.appUtils.getAssetsPath().done(function(assetsPath){
						window.resolveLocalFileSystemURL(assetsPath + pathname,function(dirEntry){
							//本地存在应该以本地优先
							self.startLocalServer().done(function(url){
								mountNum++;
								var serverUrl = new justep.URL(url);
								mediaUrl.port =  serverUrl.port;
								mediaUrl.hostname = serverUrl.hostname;
								mediaUrl.protocol = serverUrl.protocol;
								ele.src=  mediaUrl.toString();
								player.load();	
							});	
						},function(){
							//本地不存在不调整url
						});
					});
				});
			}
		},
		unmountLocalMedia : function(){
			mountNum--;
			if(mountNum === 0){
				this.stopServer();
			}
		},
		startLocalServer : function(wwwRootPath){
			var dfd = $.Deferred();
			if(cordova && cordova.plugins && cordova.plugins.CorHttpd){
				var httpd = cordova.plugins.CorHttpd;
				httpd.getURL(function(url) {
					if (url.length > 0) {
						dfd.resolve(url);
					} else {
						httpd.startServer({'www_root' : wwwRootPath,'port' : 9000 + parseInt(Math.random()*1000),'localhost_only' : !window.__justep.isDebug},function(url) {
							dfd.resolve(url);	
						},function(error) {
							dfd.reject('启动失败:' + error);
						});
					}
				},function(error){
					dfd.reject("启动失败:" + error);
				});				
			}else{
				dfd.reject("缺少插件");
			}
			return dfd.promise();
		},
		stopLocalServer : function(wwwRootPath){
			if(cordova && cordova.plugins && cordova.plugins.CorHttpd){
				var httpd = cordova.plugins.CorHttpd;
				httpd.stopServer();
			}
		}
	};
	return helper;
});