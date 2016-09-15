define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!com.justep.cordova.plugin.qq");
	require("cordova!com.justep.cordova.plugin.weibo");
	require("cordova!com.justep.cordova.plugin.weixin.v3");
	require("cordova!cordova-plugin-file");
	var utils = require("$UI/system/components/justep/common/utils");
	var Model = function() {
		this.callParent();
	};
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	Model.prototype.weiboClick = function(event) {
		function success(result) {
			alert(JSON.stringify(result));
		}
		function error(result) {
			alert(JSON.stringify(result));
		}
		var args = {};
/**		//这里是旧插件的逻辑 分享图片+网页
		args.url = "http://www.wex5.com";
		args.title = "这是title";
		args.description = "这是description";
		args.defaultText = "欢迎来到起步科技！";
		args.imageUrl = "http://bbs.wex5.com/data/attachment/block/c4/c448e8db99060f6f28ded2bcfdcc89d8.jpg";
**/
		//这里是新插件的写法 分享图片+网页
		args.url = "http://www.wex5.com";
		args.defaultText = "欢迎来到起步科技！";
		args.media = {
				type : "image",
				description : "这里是描述",
				title : "这里是title",
				url : "http://bbs.wex5.com/data/attachment/block/c4/c448e8db99060f6f28ded2bcfdcc89d8.jpg"
		};

		navigator.Weibo.shareToWeibo(success, error,args);
	};

	Model.prototype.qqClick = function(event) {
		function success(result) {
			alert(JSON.stringify(result));
		}
		function error(result) {
			alert(JSON.stringify(result));
		}
		var args = {};
		
		args.url = utils.getShareUrl(window.location.href);
		args.title =  "WeX5开发指南";
		args.description = "分享到qq";
		args.imageUrl = "http://wex5.com/cn/wp-content/uploads/2015/03/wen-xin-2.png";
		args.appName = "share";	
		navigator.QQ.shareToQQ(success, error, args);
	};

	Model.prototype.kongjianClick = function(event) {
		function success(result) {
			alert(JSON.stringify(result));
		}
		function error(result) {
			alert(JSON.stringify(result));
		}
		var args = {};
		args.url = location.href.split('#')[0];
		args.title =  "WeX5";
		args.description = "desc";
		args.imageUrl = ['http://wex5.com/cn/wp-content/uploads/2015/03/wen-xin-2.png'];
		args.appName = "";

		navigator.QQ.shareToQzone(success, error, args);
	};

	Model.prototype.weixinClick = function(event) {
		function success(result) {
			alert(JSON.stringify(result));
		}
		function error(result) {
			alert(JSON.stringify(result));
		}
		navigator.weixin.share({
			message : {
				title : "WeX5开发指南",
				description : "分享到微信",
				mediaTagName : "Media Tag Name(optional)",
				thumb : "http://wex5.com/cn/wp-content/uploads/2015/03/wen-xin-2.png",
				media : {
					// type: weixin.Type.WEBPAGE, // webpage
					webpageUrl : window.location.href
				// webpage
				}
			},
			scene : navigator.weixin.Scene.SESSION
		}, success, error);
	};

	Model.prototype.pengyouquanClick = function(event) {
		function success(result) {
			alert(JSON.stringify(result));
		}
		function error(result) {
			alert(JSON.stringify(result));
		}
		navigator.weixin.share({
			message : {
				title : "WeX5开发指南",
				description : "分享到微信",
				mediaTagName : "Media Tag Name(optional)",
				thumb : "http://wex5.com/cn/wp-content/uploads/2015/03/wen-xin-2.png",
				media : {
					// type: weixin.Type.WEBPAGE, // webpage
					webpageUrl : window.location.href
				// webpage
				}
			},
			scene : navigator.weixin.Scene.TIMELINE
		}, success, error);
	};

	Model.prototype.popMenu_btnClick = function(event) {
		this.comp("popMenu").show();
	};

	return Model;
});