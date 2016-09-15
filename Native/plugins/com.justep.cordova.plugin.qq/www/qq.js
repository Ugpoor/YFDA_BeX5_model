var exec = require('cordova/exec'), cordova = require('cordova');

module.exports = {
	token : {
		"access_token" : "",
		"openid" : ""
	},
	errMsg : "",

	getUserInfo : function(callback, fail) {
		var self = this;
		var token = self.token;
		self.__getParam(function(param) {
			if (token && token.access_token && token.openid) {
				var url = "https://graph.qq.com/user/get_user_info?" + "access_token=" + self.token.access_token + "&" + "oauth_consumer_key=" + JSON.parse(param).qq_app_id + "&" + "openid="
						+ self.token.openid + "&format=json";
				cordovaHTTP.get(url, {}, {}, function(response) {
					var data = JSON.parse(response.data);
					if ('200' == response.status) {
						if (data.nickname) {
							callback(data);
						} else {
							self.errMsg = response.data; // todo what
							fail && fail(self.errMsg);
						}

					} else {
						self.errMsg = response.data; // todo what
						fail && fail(self.errMsg);
					}

				}, function(response) {
					self.errMsg = response.error;
					fail && fail(self.errMsg);

				});
			} else {
				self.errMsg = "access_token or openid missing";
				fail && fail(self.errMsg);
			}
		}, function(message) {
			self.errMsg = message;
			fail && fail(self.errMsg);
		});
	},
	__getParam : function(successCallback, errorCallback, args) {
		exec(successCallback, errorCallback, "QQ", "getParam", []);
	},
	ssoLogin : function(successCallback, errorCallback, args) {
		var self = this;
		if (args == null || args == undefined) {
			args = 0;
		}
		exec(function(info) {
			self.token.access_token = info.access_token;
			self.token.openid = info.userid;
			successCallback(info);
		}, errorCallback, "QQ", "ssoLogin", [ args ]);
	},
	logout : function(successCallback, errorCallback) {
		exec(successCallback, errorCallback, "QQ", "logout", []);
	},

	shareToQQ : function(successCallback, errorCallback, args) {
		if (args == null || args == undefined) {
			args = {};
		}
		if (args.url == null || args.url == undefined) {
			args.url = "";
		}
		if (args.title == null || args.title == undefined) {
			args.title = "";
		}
		if (args.description == null || args.description == undefined) {
			args.description = "";
		}
		if (args.imageUrl == null || args.imageUrl == undefined) {
			args.imageUrl = "";
		}
		if (args.appName == null || args.appName == undefined) {
			args.appName = "";
		}
		exec(successCallback, errorCallback, "QQ", "shareToQQ", [ args ]);
	},
	shareToQzone : function(successCallback, errorCallback, args) {
		if (args == null || args == undefined) {
			args = {};
		}
		if (args.url == null || args.url == undefined) {
			args.url = "";
		}
		if (args.title == null || args.title == undefined) {
			args.title = "";
		}
		if (args.description == null || args.description == undefined) {
			args.description = "";
		}
		if (args.imageUrl == null || args.imageUrl == undefined) {
			args.imageUrl = [];
		}
		exec(successCallback, errorCallback, "QQ", "shareToQzone", [ args ]);
	},
	addToQQFavorites : function(successCallback, errorCallback, args) {
		if (args == null || args == undefined) {
			args = {};
		}
		if (args.url == null || args.url == undefined) {
			args.url = "";
		}
		if (args.title == null || args.title == undefined) {
			args.title = "";
		}
		if (args.description == null || args.description == undefined) {
			args.description = "";
		}
		if (args.imageUrl == null || args.imageUrl == undefined) {
			args.imageUrl = "";
		}
		if (args.appName == null || args.appName == undefined) {
			args.appName = "";
		}
		exec(successCallback, errorCallback, "QQ", "addToQQFavorites", [ args ]);
	},
	checkClientInstalled : function(successCallback, errorCallback) {
		exec(successCallback, errorCallback, "QQ", "checkClientInstalled", []);
	}

};
