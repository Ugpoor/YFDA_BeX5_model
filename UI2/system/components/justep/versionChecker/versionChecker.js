define(function(require) {
	var $ = require('jquery');
	var versionInfo;
	var Browser = require('$UI/system/lib/base/browser');
	var MsgDialog = require("$UI/system/components/justep/messageDialog/messageDialog");
	require("cordova!cordova-plugin-app-version");
	require("cordova!cordova-plugin-inappbrowser");
	require("cordova!cordova-plugin-x-toast");

	var parentNode = $('body').find('.window').get(0);

	var VersionChecker = function() {
		this.env = "browser";
		if (Browser.isX5App) {
			if (Browser.isAndroid) {
				this.env = "androidApp";
			}
			if (Browser.isIOS) {
				this.env = "iosApp";
			}
		}
		//this.env = "androidApp";

		this.versionMsg = new MsgDialog({
			parentNode : parentNode
		});
		var $domNode = this.versionMsg.$domNode;
		$domNode.find('.Yes').text('更新');
		$domNode.find('.No').text('忽略');
		this.versionMsg.on('onYes', function(event) {
			//下载
			this.download();
		}, this);
		this.versionMsg.on('onNo', function(event) {
			//忽略
			this.ignore();
		}, this);
		this.resourceInfo = window.__justep.versionInfo.resourceInfo;
		this.appInfo = window.__justep.versionInfo.appInfo;
	};

	VersionChecker.prototype.check = function() {
		if (this.resourceInfo) {
			this.checkResourceVersion();
		}
		if (this.appInfo) {
			this.checkAppVersion();
		}
	};
	
	VersionChecker.prototype.checkResourceVersion = function() {
		try {
			if (navigator.appUtils) {
				var versionInfo = window.__justep.versionInfo;
				var resourceDownlaodUrl = versionInfo.resourceInfo.downloadURL;
				var mode = versionInfo.resourceInfo.mode;
				var isNewVersion = versionInfo.resourceInfo.isNewVersion;
				var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + versionInfo.resourceInfo.indexURL;
				if(versionInfo.resourceInfo && versionInfo.resourceInfo.indexURL){
					if (mode === "1") {
						if (isNewVersion) {
							navigator.appUtils.updateAppResource(resourceDownlaodUrl).done(function() {
								navigator.appUtils.setIndexPageUrl(indexUrl);
							});
						} else {
							navigator.appUtils.setIndexPageUrl(indexUrl);
						}
					} else if (mode === "2") {
						navigator.appUtils.setIndexPageUrl(indexUrl);
						navigator.appUtils.updateAppResource(resourceDownlaodUrl);
					} else if (mode === "3") {
						navigator.appUtils.setIndexPageUrl(indexUrl);
					}
				}
			}
		} catch (updateError) {
		}
	};

	VersionChecker.prototype.checkAppVersion = function() {
		var self = this;
		if (cordova && cordova.getAppVersion) {
			cordova.getAppVersion.getVersionNumber(function(currentVersion) {
				if (self.appInfo[self.env] && self.versionCompare(currentVersion,
						self.appInfo[self.env].version) && window.localStorage && localStorage.getItem('versionIgnore') !== self.appInfo[self.env].version) {
					self.versionMsg.show({
						type : "YesNoCancel",
						title : "版本更新",
						message : self.appInfo[self.env].changeLog
					});
				}
			});
		}
	};
	
	VersionChecker.prototype.versionCompare = function(currentVersion,
			newVersion) {
		if (currentVersion && newVersion) {
			var currVerArr = currentVersion.split(".");
			var newVerArr = newVersion.split(".");
			var len = Math.max(currVerArr.length, newVerArr.length);
			for (var i = 0; i < len; i++) {
				var newVal = ~~newVerArr[i], curVal = ~~currVerArr[i];
				if (newVal < curVal) {
					return false;
				} else if (newVal > curVal) {
					return true;
				}
			}
		}
		return false;
	};
	

	VersionChecker.prototype.download = function() {
		window.open(this.appInfo[this.env].downloadURL, '_system');
	};

	VersionChecker.prototype.ignore = function() {
		if (window.localStorage) {
			localStorage.setItem('versionIgnore', this.appInfo[this.env].version);
		}
	};

	return new VersionChecker();
});