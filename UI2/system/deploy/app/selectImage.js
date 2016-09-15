define(function(require) {
	var Uploader = require('$UI/system/components/justep/uploader/uploader');
	var templateService = require("$UI/system/templates/common/js/templateService");
	var bind = require("bind");

	var Model = function() {
		this.callParent();
		
		this.orientation = bind.observable("default");
	};

	Model.prototype.modelLoad = function(event) {
		this.appEngine = this.getParent().appEngine;
		var config = this.appEngine.getConfig();
		var self = this;

		this.iconUploader = new Uploader(this.getElementByXid("iconCol"), {
			actionUrl : require.toUrl('$UI/system/deploy/app/uploadFile.j')
		});
		this.iconUploader.on('onStart', function(event) {
			event.file.data = {
				appID : config.appID,
				filename : "icon.png",
			};
		});
		this.iconUploader.on('onSuccess', function(event) {
			config.newIcon = true;
			self._setImageSrc("iconImage", 'icon.png', true);
		});
		$(this.iconUploader.inputElement).attr("accept", "image/png");

		this.splashPortUploader = new Uploader(this.getElementByXid("splashPortCol"), {
			actionUrl : require.toUrl('$UI/system/deploy/app/uploadFile.j')
		});
		this.splashPortUploader.on('onStart', function(event) {
			event.file.data = {
				appID : config.appID,
				filename : "splash-port.png",
			};
		});
		this.splashPortUploader.on('onSuccess', function(event) {
			config.newSplashPort = true;
			self._setImageSrc("splashPortImage", 'splash-port.png', true);
		});
		$(this.splashPortUploader.inputElement).attr("accept", "image/png");

		this.splashLandUploader = new Uploader(this.getElementByXid("splashLandCol"), {
			actionUrl : require.toUrl('$UI/system/deploy/app/uploadFile.j')
		});
		this.splashLandUploader.on('onStart', function(event) {
			event.file.data = {
				appID : config.appID,
				filename : "splash-land.png",
			};
		});
		this.splashLandUploader.on('onSuccess', function(event) {
			config.newSplashLand = true;
			self._setImageSrc("splashLandImage", 'splash-land.png', true);
		});
		$(this.splashLandUploader.inputElement).attr("accept", "image/png");

		this._setImageSrc("iconImage", 'icon.png', false);
		this._setImageSrc("splashPortImage", 'splash-port.png', false);
		this._setImageSrc("splashLandImage", 'splash-land.png', false);
		
		if (this.getParent().edit) {
			this.orientation.set(config.orientation);
		}
	};

	Model.prototype.getOrientationItems = function($object) {
		var values = [];
		values.push({
			"value" : "default",
			"displayName" : "默认"
		});
		values.push({
			"value" : "all",
			"displayName" : "自动旋转"
		});
		values.push({
			"value" : "portrait",
			"displayName" : "竖向"
		});
		values.push({
			"value" : "landscape",
			"displayName" : "横向"
		});
		return values;
	};

	Model.prototype._setImageSrc = function(xid, filename, newImage) {
		var config = this.appEngine.getConfig();
		var url = '$UI/system/deploy/app/image.j?appID=' + config.appID + '&projectName=' + config.projectName + '&filename=' + filename + '&newImage=' + newImage + '&edit=' + this.getParent().edit
				+ '&r=' + Math.random();
		$(this.getElementByXid(xid)).attr('src', require.toUrl(url));
	};

	Model.prototype.getTitle = function(wizard) {
		return '设置屏幕选项';
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

	Model.prototype.nextPage = function(wizard) {
		var config = this.appEngine.getConfig();
		config.orientation = this.orientation.get();
	
		this.getParent().openPage({
			id : "selectPlugins",
			url : "selectPlugins.w",
			fromId : "selectImage",
		});
	};

	Model.prototype.selectImageBtnChange = function(event) {
		this.getElementByXid("uploadBtn").click();
	};

	Model.prototype.selectImageBtnSelect = function(event) {
		alert('select');
	};

	Model.prototype.howUpdateImageLabelClick = function(event) {
		templateService.openBrowser("http://docs.wex5.com/android-ios-image-guide/");
	};

	return Model;
});
