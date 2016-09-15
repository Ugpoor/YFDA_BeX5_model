define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	require("cordova!com.justep.cordova.plugin.qq");
	require("cordova!com.justep.cordova.plugin.weibo");
	require("cordova!com.justep.cordova.plugin.weixin.v3");

	var Model = function() {
		this.callParent();
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	// 进入注册页
	Model.prototype.registeredClick = function(event) {
		justep.Shell.showPage("registered");
	};

	Model.prototype.loginQQClick = function(event) {
		if (!navigator.qq) {
			justep.Util.hint("请安装最新版本(含插件)体验！");
			return;
		}
		;
		var self = this;
		function success(info) {
			navigator.qq.getUserInfo(function(info) {
				var user = {};
				user.accountType = "QQ";
				user.userid = info.userid;
				user.name = info.nickname || "NONAME";
				justep.Shell.userType.set(user.accountType);
				justep.Shell.userName.set(user.name);
				localStorage.setItem("userUUID", JSON.stringify(user));
				justep.Util.hint("登录成功");
				setTimeout(function() {
					justep.Shell.showPage("main");
				}, 3000);
			}, function(err) {
				justep.Util.hint("登录失败: " + err, {
					"type" : "danger"
				});
			});
		}
		;
		navigator.qq.ssoLogin(success, function(info) {
			alert("登录失败");
		});

	};

	Model.prototype.loginWeiboClick = function(event) {
		if (!navigator.weibo) {
			justep.Util.hint("请安装最新版本(含插件)体验！");
			return;
		}
		;

		var self = this;
		var onSuccess = function(info) {
			if (!info) {
				justep.Util.hint("登录失败 ", {
					"type" : "danger"
				});
				return;
			}
			var user = {};
			user.userid = info.id;
			user.accountType = "Weibo";
			user.name = info.name || "NONAME";

			justep.Shell.userType.set(user.accountType);
			justep.Shell.userName.set(user.name);
			localStorage.setItem("userUUID", JSON.stringify(user));
			justep.Util.hint("登录成功");

			setTimeout(function() {
				justep.Shell.showPage("main");
			}, 3000);

		}

		navigator.weibo.ssoLogin(function() {
			navigator.weibo.getUserInfo(function(ret) {
				onSuccess(ret);
			}, function(ret) {
				justep.Util.hint("登录失败了： " + ret, {
					"type" : "danger"
				});
			});
		}, function(info) {
			alert("登录失败:" + info);
		});
	};

	Model.prototype.loginWeixinClicked = function(event) {
		var self = this;
		if (!navigator.weixin) {
			justep.Util.hint("请安装最新版本(含插件)体验！");
			return;
		}
		;

		var weixin = navigator.weixin;

		function saveUser(data) {
			var user = {};
			user.userid = data.openid;
			user.accountType = "WX";
			user.name = data.nickname || "NONAME";
			justep.Shell.userType.set(user.accountType);
			justep.Shell.userName.set(user.name);
			localStorage.setItem("userUUID", JSON.stringify(user));
			justep.Util.hint("登录成功");
			setTimeout(function() {
				justep.Shell.showPage("main");
			}, 3000);
		}

		weixin.ssoLogin(function() {
			weixin.getUserInfo(saveUser, function(reason) {
				justep.Util.hint("登录失败: " + JSON.stringify(reason), {
					"type" : "danger"
				});
			});
		}, function(reason) {

			justep.Util.hint("登录失败: " + JSON.stringify(reason), {
				"type" : "danger"
			});
		});

	};

	Model.prototype.loginIsmBtn = function(event) {
		var phoneInput = this.comp("nameInput").val();
		var passwordInput = this.comp("passwordInput").val();
		var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		if (!reg.test(phoneInput)) {
			return;
		}
		;

		var userData = this.comp("baasData1");
		userData.clear();
		userData.filters.setVar("userPhone", phoneInput);
		userData.filters.setVar("password", passwordInput);
		userData.refreshData();
		if (userData.count() > 0) {
			justep.Util.hint("登录成功");
			justep.Shell.userType.set("ISM");
			justep.Shell.userName.set(phoneInput);
			localStorage.removeItem("userUUID");

			var user = {};
			user.userid = phoneInput;
			user.accountType = "ISM";
			user.name = phoneInput || "NONAME";
			localStorage.setItem("userUUID", JSON.stringify(user));

			setTimeout(function() {
				justep.Shell.closePage();
			}, 3000);
		} else {
			justep.Util.hint("用户或密码有误！", {
				"type" : "danger"
			});
		}

	};

	return Model;
});