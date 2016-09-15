define(function(require) {
	var Uploader = require('$UI/system/components/justep/uploader/uploader');
	var bind = require("bind");

	var Model = function() {
		this.callParent();

		this.cerTitle = [];
		for ( var i = 0; i < 4; i++) {
			this.cerTitle[i] = bind.observable("");
		}
	};

	Model.prototype.modelLoad = function(event) {
		this.appEngine = this.getParent().appEngine;

		var self = this;
		var config = this.appEngine.getConfig();

		function onStart(event) {
			event.file.data = {
				appID : self.getParent().appEngine.getConfig().appID,
				filename : this.filename
			};
		}

		function onSuccess(event) {
			this.newFile = true;
			self._refreshUploaderTitle(this);
		}

		this.uploaders = [];
		this.uploaderFiles = [ 'ios.developer.p12', 'ios.developer.mobileprovision', 'ios.distribution.p12', 'ios.distribution.mobileprovision' ];
		for ( var i = 0; i < this.uploaderFiles.length; i++) {
			this.uploaders[i] = new Uploader(this.getElementByXid(this.uploaderFiles[i].replace(/\./g, '_')), {
				actionUrl : require.toUrl('$UI/system/deploy/app/uploadFile.j')
			});
			this.uploaders[i].filename = this.uploaderFiles[i];
			this.uploaders[i].index = i;
			self._refreshUploaderTitle(this.uploaders[i]);
			this.uploaders[i].on('onStart', onStart);
			this.uploaders[i].on('onSuccess', onSuccess);
		}

		if (this.getParent().edit) {
			this.init = true;
			try {
				this.comp("province").val(config.province);

				this.comp("area").val(config.area);
				this.comp("company").val(config.company);
				this.comp("author").val(config.author);
				this.comp("homePage").val(config.homePage);
				this.comp("email").val(config.email);
				this.comp("genAndroid").val(config.genAndroid === true);
				this.comp("genIOSDev").val(config.genIOSDev === true);
				this.comp("genIOSDis").val(config.genIOSDis === true);
				this.comp("androidPassword").val(config.androidPassword);
				this.comp("iosDevloperPassword").val(config.iosDevloperPassword);
				this.comp("iosDistributionPassword").val(config.iosDistributionPassword);
			} finally {
				this.init = false;
			}
		}
	};

	Model.prototype._refreshUploaderTitle = function(uploder) {
		if (this._fileExists(uploder.filename, uploder.newFile)) {
			this.cerTitle[uploder.index].set("更换" + uploder.filename);
		} else {
			this.cerTitle[uploder.index].set("选择" + uploder.filename);
		}
	};

	Model.prototype._fileExists = function(filename, newFile) {
		var config = this.appEngine.getConfig();
		var url = '$UI/system/deploy/app/fileExists.j?appID=' + config.appID + '&projectName=' + config.projectName + '&filename=' + filename + '&newFile=' + newFile + '&edit=' + this.getParent().edit;
		var result = $.ajax({
			async : false,
			contentType : 'application/json',
			processData : false,
			type : 'GET',
			url : require.toUrl(url),
			success : function(result) {
			},
			error : function(xhr, status, err) {
				result = false;
			}
		}).responseJSON.flag;

		return result;
	};

	Model.prototype.getTitle = function(wizard) {
		return '配置开发者信息和证书';
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
		if ((this.comp("genAndroid").get("checked") === true)) {
			if (!this.comp("androidPassword").val()) {
				if (!confirm("“Android证书密码”未设置，如果不设置，将不能生成Android应用，是否继续？")) {
					return false;
				} else {
					this.comp("genAndroid").val(false);
					this.comp("genAndroidKey").val(false);
				}
			} else if (this.comp("androidPassword").val().length < 6) {
				alert("Android密码长度必须大于6位");
				return false;
			}
		}

		if ((this.comp("genIOSDev").get("checked") === true)
				&& (!this.comp('iosDevloperPassword').val() || (this.cerTitle[0].get().substr(0, 2) === '选择') || (this.cerTitle[1].get().substr(0, 2) === '选择'))) {
			if (!confirm("“IOS开发证书密码”未设置或未选择开发证书文件，如果不设置，将不能生成IOS开发模式应用，是否继续？")) {
				return false;
			} else {
				this.comp("genIOSDev").val(false);
			}
		}

		if ((this.comp("genIOSDis").get("checked") === true)
				&& (!this.comp('iosDistributionPassword').val() || (this.cerTitle[2].get().substr(0, 2) === '选择') || (this.cerTitle[3].get().substr(0, 2) === '选择'))) {
			if (!confirm("“IOS发布证书密码”未设置或未选择发布证书文件，如果不设置，将不能生成IOS发布模式应用，是否继续？")) {
				return false;
			} else {
				this.comp("genIOSDis").val(false);
			}
		}

		return true;
	};

	Model.prototype.nextPage = function(wizard) {
		if (this.validate()) {
			var config = this.appEngine.getConfig();

			config.province = this.comp("province").val();
			config.area = this.comp("area").val();
			config.company = this.comp("company").val();
			config.author = this.comp("author").val();
			config.homePage = this.comp("homePage").val();
			config.email = this.comp("email").val();
			config.genAndroid = this.comp("genAndroid").get("checked") === true;
			config.genIOSDev = this.comp("genIOSDev").get("checked") === true;
			config.genIOSDis = this.comp("genIOSDis").get("checked") === true;
			config.androidPassword = this.comp("androidPassword").val();
			config.iosDevloperPassword = this.comp("iosDevloperPassword").val();
			config.iosDistributionPassword = this.comp("iosDistributionPassword").val();
			config.genAndroidKey = this.comp("genAndroidKey").get("checked") === true;

			this.getParent().openPage({
				id : "selectImage",
				url : "selectImage.w",
				fromId : "configDeveloper",
				refresh : true
			});
		}
	};

	Model.prototype.androidPasswordKeypress = function(event) {
		if (!this.init) {
			this.comp("genAndroid").val(true);
			this.comp("genAndroidKey").val(true);
		}
	};

	Model.prototype.iosDevloperPasswordKeypress = function(event) {
		if (!this.init) {
			this.comp("genIOSDev").val(true);
		}
	};

	Model.prototype.iosDistributionPasswordKeypress = function(event) {
		if (!this.init) {
			this.comp("genIOSDis").val(true);
		}
	};

	return Model;

});
