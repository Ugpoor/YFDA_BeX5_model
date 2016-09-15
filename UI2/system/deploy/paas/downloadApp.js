define(function(require) {
	var templateService = require("$UI/system/templates/common/js/templateService");
	var xpaas = require("$UI/system/deploy/paas/xpaas");

	var Model = function() {
		this.callParent();
		this.xpaas = xpaas;
	};

	var STATE = {
		"activating" : "正在唤醒",
		"active" : "正常",
		"inactive" : "正常",
		"upgraded" : "升级完毕",
		"upgrading" : "升级中",
		"restarting" : "正在重启",
		"updating-active" : "升级中",
		"finishing-upgrade" : "升级中",
		"canceled-rollback" : "取消回滚",
		"canceled-upgrade" : "取消升级",
		"canceling-rollback" : "正在取消回滚",
		"canceling-upgrade" : "正在取消升级",
		"deactivating" : "取消唤醒中",
		"registering" : "注册中",
		"removed" : "移除",
		"removing" : "移除中",
		"requested" : "请求",
		"rolling-back" : "回滚中",
		"updating-inactive" : "静默升级中",
	};

	Model.prototype.modelLoad = function(event) {

		this.downloadFrame = document.createElement('iframe');
		this.downloadFrame.style.cssText = "display:none;";
		$("body").append(this.downloadFrame);

		this.appEngine = this.getParent().appEngine;
		this.config = this.appEngine.getConfig();
		var paasToken = this.config.paasToken, paasServiceID = this.config.paasServiceID, self = this;

		this.xpaas.loadAppByID(paasServiceID, function(res) {
			var app = res && res.object || {};
			if (app && app.path) {
				self.code = app.code;
				self.path = "http://" + app.path;
				self.androidURL = self.path + "/app.apk";
				self.iosURL = self.path + "/app.ipa";

				if ('1' == app.deployState) {
					$(self.getElementByXid("showUrl")).text(self.path);
					self.checkState();
				} else {
					$(self.getElementByXid("showUrl")).text("尚未部署！");
				}

			} else {
				$(self.getElementByXid("showUrl")).text("请检查CloudX5项目信息");
				self._refreshBarcode("error");
				alert("获取CloudX5信息出错！");
			}
		}, function(result) {
			alert("登录出错:" + JSON.stringify(result));
		});

	};

	Model.prototype._refreshBarcode = function(serverState) {

		var self = this;
		if ('active' == serverState || 'inactive' == serverState) {
			self.acitive = true;
			xpaas.checkApp(this.androidURL, function(res) {
				if ("true" != res.success) {
					$(self.getElementByXid("divAndroid")).text("尚未部署");
				} else {
					$(self.getElementByXid("divAndroid")).text(" ");
					self.comp('androidQR').set({
						"value" : self.androidURL
					});

				}
			}, function() {
				$(self.getElementByXid("divAndroid")).text("尚未部署");
			});
			xpaas.checkApp(this.iosURL, function(res) {
				if ("true" != res.success) {
					$(self.getElementByXid("divIOS")).text("尚未部署");
				} else {
					$(self.getElementByXid("divIOS")).text(" ");
					self.comp('iosQR').set({
						"value" : self.iosURL
					});
				}
			}, function() {
				$(self.getElementByXid("divIOS")).text(" ");
			});
		} else {
			$(self.getElementByXid("divAndroid")).text(" ");
			$(self.getElementByXid("divIOS")).text("");
		}

	};

	Model.prototype.howInstallLabelClick = function(event) {
		templateService.openBrowser("http://doc.wex5.com/how-install-apk-ipa/");
	};

	Model.prototype.openPaaSBtnClick = function(event) {
		templateService.openBrowser(templateService.getXCloudConsoleUrl() + "/x5/UI2/paas/pt/index.w?token=" //
				+ this.config.paasToken + "#!(/UI2/project/ptMainActivity.w)");
	};

	Model.prototype.showUrlClick = function(event) {
		var url = $(this.getElementByXid("showUrl")).text() || "";
		if (url.indexOf("http") == 0) {
			templateService.openBrowser(url);
		}
	};

	Model.prototype.checkState = function() {
		$(this.getElementByXid("showState")).text("正在获取状态……");
		this.comp('checkServerState').start();
	}

	Model.prototype.checkServerStateTimer = function(event) {

		if (!this.code) {
			event.source.stop();
			return;
		}
		var self = this;
		this.xpaas.checkState(this.config.paasServiceID, function(res) {
			var serverState = res.state;
			$(self.getElementByXid("showState")).text(serverState ? STATE[serverState] : "CloudX5端出错");
			event.source.stop();
			self._refreshBarcode(serverState);
		}, function(result) {
			$(self.getElementByXid("showState")).text("获取信息失败");
			event.source.stop();
		});
	};

	Model.prototype.getTitle = function(wizard) {
		return '部署信息';
	};

	Model.prototype.hasCancelBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasBackBtn = function(wizard) {
		return false;
	};

	Model.prototype.hasNextBtn = function(wizard) {
		return false;
	};

	Model.prototype.hasFinishBtn = function(wizard) {
		return false;
	};

	Model.prototype.finish = function() {
		return false;
	};

	Model.prototype.hasDownloadBtn = function(wizard) {
		return false;
	};

	Model.prototype.androidImageClick = function(event) {
		this.downloadFrame.src = this.androidURL;
	};

	Model.prototype.iosImageClick = function(event) {
		this.downloadFrame.src = this.iosURL;
	};

	return Model;
});
