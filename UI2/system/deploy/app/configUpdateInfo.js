define(function(require) {
	var Uploader = require('$UI/system/components/justep/uploader/uploader');
	var bind = require("bind");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.appEngine = this.getParent().appEngine;

		var config = this.appEngine.getConfig();
		if (this.getParent().edit) {
			this.comp("resourceVersion").val(config.resourceVersion);
			this.comp("resourceDownloadURL").val(config.resourceDownloadURL);
			this.comp("resourceAppVersion").val(config.resourceAppVersion);
			this.comp("androidChangeLog").val(config.androidChangeLog);
			this.comp("androidDownloadURL").val(config.androidDownloadURL);
			this.comp("iosChangeLog").val(config.iosChangeLog);
			this.comp("iosDownloadURL").val(config.iosDownloadURL);
		}
	};

	Model.prototype.getTitle = function(wizard) {
		return '配置更新信息';
	};

	Model.prototype.hasCancelBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasBackBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasNextBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasFinishBtn = function(wizard) {
		return false;
	};

	Model.prototype.validate = function() {
		return true;
	};

	Model.prototype.nextPage = function(wizard) {
		if (this.validate()) {
			var config = this.appEngine.getConfig();

			config.resourceVersion = this.comp("resourceVersion").val();
			config.resourceDownloadURL = this.comp("resourceDownloadURL").val();
			config.resourceAppVersion = this.comp("resourceAppVersion").val();
			config.androidChangeLog = this.comp("androidChangeLog").val();
			config.androidDownloadURL = this.comp("androidDownloadURL").val();
			config.iosChangeLog = this.comp("iosChangeLog").val();
			config.iosDownloadURL = this.comp("iosDownloadURL").val();

			this.getParent().openPage({
				id : "appInfo",
				url : "appInfo.w",
				fromId : "configUpdateInfo",
			});
		}
	};

	return Model;

});
