define(function(require) {
	require("cordova!com.justep.cordova.plugin.qq");
	require("cordova!com.justep.cordova.plugin.weixin.v3");
	var justep = require("$UI/system/lib/justep");
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var Share = Object.extend({
		constructor : function() {
			base.init([ 'onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo', 'onMenuShareQZone' ]);
			this.timelineParam = null;
			this.appMessageParam = null;
			this.qqParam = null;
			this.weiboParam = null;
			this.qzoneParam = null;
		},
		shareTo : function(param) {
			var wx = base.getWx();
			var self = this;
			if (wx) {
				justep.Util.hint(base.config.wxShareHintMsg);
			} else if (window.cordova) {
				var scene = param && param.scene;
				if (scene) {
					if (scene == 'timeline') {
						self.__shareToTimeline();
					} else if (scene == 'appessage') {
						self.__shareToAppMessage();
					} else if (scene == 'qq') {
						self.__shareToQQ();
					} else if (scene == 'weibo') {
						self.__shareToWeibo();
					} else if (scene == 'qzone') {
						self.__shareToQZone();
					} else {
						Utils.errorCallback(self, param, {
							'errMsg' : 'shareTo : fail',
							'resultStr' : 'scene可以是timeline，appessage，qq，qzone '
						});
					}
				} else {
					Utils.errorCallback(self, param, {
						'errMsg' : 'shareTo : fail',
						'resultStr' : '缺少参数scene'
					});
				}

			}
		},
		__shareToTimeline : function() {
			var self = this;
			if (!self.timelineParam) {
				Utils.errorCallback(self, self.appMessageParam, {
					'errMsg' : 'shareToTimeline : fail',
					'resultStr' : '请先设置分享参数'
				});
				return;
			}
			var self = this;
			var title = self.timelineParam && self.timelineParam.title;
			var link = self.timelineParam && self.timelineParam.link;
			var imgUrl = self.timelineParam && self.timelineParam.imgUrl;
			var desc = self.timelineParam && self.timelineParam.desc;
			navigator.weixin.share({
				message : {
					title : title,
					description : desc || "",
					mediaTagName : "",
					thumb : imgUrl,
					media : {
						type : navigator.weixin.Type.WEBPAGE,
						webpageUrl : link
					}
				},
				scene : navigator.weixin.Scene.TIMELINE
			}, function successCallback(res) {
				Utils.successCallback(self, self.timelineParam, {
					"errMsg" : "shareToTimeline:ok",
					"resultStr" : JSON.stringify(res)
				});
			}, function failCallback(res) {
				Utils.errorCallback(self, self.timelineParam, {
					'errMsg' : "shareToTimeline:fail",
					'resultStr' : JSON.stringify(res)
				});
			});

		},
		__shareToAppMessage : function() {
			var self = this;
			if (!self.appMessageParam) {
				Utils.errorCallback(self, self.appMessageParam, {
					'errMsg' : 'shareToAppMessage : fail',
					'resultStr' : '请先设置分享参数'
				});
				return;
			}
			var self = this;
			var title = self.appMessageParam && self.appMessageParam.title;
			var link = self.appMessageParam && self.appMessageParam.link;
			var imgUrl = self.appMessageParam && self.appMessageParam.imgUrl;
			var desc = self.appMessageParam && self.appMessageParam.desc;

			navigator.weixin.share({
				message : {
					title : title,
					description : desc || "",
					mediaTagName : "",
					thumb : imgUrl,
					media : {
						type : navigator.weixin.Type.WEBPAGE,
						webpageUrl : link
					}
				},
				scene : navigator.weixin.Scene.SESSION
			}, function successCallback(res) {
				Utils.successCallback(self, self.appMessageParam, {
					errMsg : "shareToAppMessage:ok",
					'resultStr' : JSON.stringify(res)
				});
			}, function failCallback(res) {
				Utils.errorCallback(self, self.appMessageParam, {
					'errMsg' : "shareToAppMessage:fail",
					'resultStr' : JSON.stringify(res)
				});
			});
		},
		__shareToQQ : function() {
			var self = this;
			var param = self.qqParam;
			if (!param) {
				Utils.errorCallback(self, param, {
					'errMsg' : 'shareToQQ : fail',
					'resultStr' : 'param missing'
				});
				return;
			} else {
				var title = param.title || "test";
				var desc = param && param.desc || "desc";
				var link = param.link || "link";
				var imgUrl = param.imgUrl || "url";

				var args = {};
				args.url = link;
				args.title = title;
				args.description = desc;
				args.imageUrl = imgUrl;
				args.appName = base.config.appName;
				navigator.QQ.shareToQQ(function successCallback(res) {
					Utils.successCallback(self, param, {
						errMsg : "shareToQQ:ok",
						'resultStr' : JSON.stringify(res)

					});
				}, function failCallback(res) {
					Utils.errorCallback(self, param, {
						'errMsg' : "shareToQQ:fail",
						'resultStr' : JSON.stringify(res)
					});
				}, args);
			}
		},

		__shareToWeibo : function() {
			var self = this;
			var param = self.qqParam;
			Utils.errorCallback(self, param, {
				'errMsg' : 'shareToWeibo : fail',
				'resultStr' : 'shareToWeibo not support yet.'
			});
		},
		__shareToQZone : function() {
			var self = this;
			var param = self.qqParam;
			if (!param) {
				Utils.errorCallback(self, param, {
					'errMsg' : 'shareToQZone : fail',
					'resultStr' : 'param missing'
				});
				return;
			} else {
				var title = param && param.title;
				var link = param && param.link;
				var imgUrl = param && param.imgUrl;
				var desc = param && param.desc;
				var args = {};
				args.url = link;
				args.title = title;
				args.description = desc;
				args.imageUrl = [ imgUrl ];
				args.appName = base.config.appName;
				navigator.QQ.shareToQzone(function successCallback(res) {
					Utils.successCallback(self, param, {
						errMsg : "shareToQZone:ok",
						'resultStr' : JSON.stringify(res)

					});
				}, function failCallback(res) {
					Utils.errorCallback(self, param, {
						'errMsg' : "shareToQZone:fail",
						'resultStr' : JSON.stringify(res)
					});
				}, args);
			}
		},

		onMenuShareTimeline : function(param) {
			var wx = base.getWx();
			var self = this;
			if (wx) {
				wx.onMenuShareTimeline.call(self, param);
			} else if (window.cordova) {
				self.timelineParam = param;
			}
			;
		},

		onMenuShareAppMessage : function(param) {
			var wx = base.getWx();
			var self = this;
			if (wx) {
				wx.onMenuShareAppMessage.call(self, param);
			} else if (window.cordova) {
				self.appMessageParam = param;

			}
			;
		},

		onMenuShareQQ : function(param) {
			var wx = base.getWx();
			var self = this;
			if (wx) {
				wx.onMenuShareQQ.call(self, param);
			} else if (window.cordova) {
				this.qqParam = param;
			}
			;
		},

		onMenuShareWeibo : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.onMenuShareWeibo.call(this, param);
			} else if (window.cordova) {
				this.weiboParam = param;
			}
			;
		},

		onMenuShareQZone : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.onMenuShareQZone.call(this, param);
			} else if (window.cordova) {
				this.qzoneParam = param;
			}
			;
		},
	});
	return new Share();
});
