var exec = require('cordova/exec'), cordova = require('cordova');

module.exports = {

	token : {
		"access_token" : "",
		"userid" : ""
	},
	mediaType : {
		image : "image"
	},
	__httpGet : function(token, callback) {
		if (token && token.access_token && token.userid) {
			var url = "https://api.weibo.com/2/users/show.json?access_token=" + token.access_token + "&uid=" + token.userid;
			cordovaHTTP.get(url, {}, {}, callback, callback);
		} else {
			callback && callback({
				"error" : "access_token or userid missing"
			});
		}

	},
	getUserInfo : function(token, successCallback, errorCallback) {
		if (typeof token == 'function') {
			errorCallback = successCallback;
			successCallback = token;
		}
		var self = this;
		function responseCallback(response) {
			if ('200' == response.status) {
				var info = JSON.parse(response.data);
				if(info.name){
					successCallback(info);
				}else{
					errorCallback && errorCallback(info.error);
				}
				
			} else {
				errorCallback && errorCallback(response.error)
			}
		}

		if (token.access_token && token.userid) {
			successCallback(self.__httpGet({
				"access_token" : token.access_token,
				"userid" : token.userid
			}, responseCallback));
		} else {
			self.__httpGet({
				"access_token" : self.token.access_token,
				"userid" : self.token.userid
			}, responseCallback);
		}

	},

	ssoLogin : function(successCallback, errorCallback) {
		var self = this;
		exec(function(info) {
			self.token.access_token = info.access_token;
			self.token.userid = info.userid;
			successCallback(info);
		}, errorCallback, "Weibo", "ssoLogin", []);
	},
	logout : function(successCallback, errorCallback) {
		exec(successCallback, errorCallback, "Weibo", "logout", []);
	},
	shareToWeibo : function(successCallback, errorCallback, args) {	
	    if (!args.defaultText) {
	        args.defaultText = "";
	    }
	    if (!args.url) {
	        args.url = "";
	    }
	    if(!args.media){
	        //现在是旧版插件的逻辑，需要进行参数转换
	        if (!args.title) {
	            args.title = "";
	        }
	        if (!args.description) {
	            args.description = "";
	        }
	        if (!args.imageUrl) {
	            args.imageUrl = "";
	        }
	        media = {"type":"image","url":args.imageUrl,"description":args.description,"title":args.title};
	        args = {
	            "url" : args.url,
	            "defaultText" : args.defaultText,
	            "media" : media
	        };
	    }else{
	        //现在是新的插件的逻辑,已经传入了media参数，不需要转换,media.type可选值为image/audio/video	 
	    	if (!args.media.type) {
	        	errorCallback("未指定media类型");
	        	return;
	        } 
	        if (!args.media.url) {
	            args.media.url = "";
	        }
	        if (!args.media.description) {
	            args.media.description = "";
	        }
	        if (!args.media.title) {
	            args.media.title = "";
	        }	        	        
	    }
	    //至此，已经将参数整理完全。
	    if(args.media.type == "image"){
	        //用户需要分享图片,则必须先下载图片
	    	if(args.media.url.indexOf("http://")>-1 || args.media.url.indexOf("https://")>-1){
	            //此时用户传入一个图片的网络地址，需要下载到本地
	            var myDate = new Date();
	            cordovaHTTP.downloadFile(args.media.url,{},{},cordova.file.dataDirectory + "/" + myDate.getTime() + ".png",function(){
	                //此时下载成功，将本地路径返回
	                args.media.url = cordova.file.dataDirectory + "/" + myDate.getTime() + ".png";
	            },function(){
	                //下载图片失败，分享失败
	                errorCallback("下载图片失败");
	            });
	        }
	    }

		exec(successCallback, errorCallback, "Weibo", "shareToWeibo", [ args ]);
	},
	checkClientInstalled : function(successCallback, errorCallback) {
		exec(successCallback, errorCallback, "Weibo", "checkClientInstalled", []);
	}

};
