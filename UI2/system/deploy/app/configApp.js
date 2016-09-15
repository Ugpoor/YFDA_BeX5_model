define(function(require) {

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.appEngine = this.getParent().appEngine;

		if (this.getParent().edit) {
			var config = this.appEngine.getConfig();
			this.comp("version").val(config.version);
			this.comp("packageName").val(config.packageName);
			this.comp("description").val(config.description);
			this.comp("extBrowser").val(config.extBrowser === true);
			this.comp("resEncryption").val(config.resEncryption === true);
		}
	};

	Model.prototype.getTitle = function(wizard) {
		return '配置应用信息';
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
		var version = this.comp("version").get("value");
		if (!version) {
			alert("“版本号”不能为空");
			return false;
		} else {
			var numbers = version.split('.');
			if (numbers.length != 3) {
				alert("“版本号”应该由点隔开的三部分构成");
				return false;
			}
			for ( var i = 0; i < numbers.length; i++) {
				if (numbers[i].match(/\d*/i) != numbers[i]) {
					alert("版本号中“" + numbers[i] + "”不是数字");
					return false;
				}
			}
		}

		var packageName = this.comp("packageName").get("value");
		if (!packageName) {
			alert("“应用包名”不能为空");
			return false;
		} else {
			if (packageName.indexOf(".") < 0) {
				alert("“应用包名”必须类似com.justep这样由包含.的字符串构成");
				return false;
			}
		}

		return true;
	};

	Model.prototype.nextPage = function(wizard) {
		if (this.validate()) {
			var config = this.appEngine.getConfig();
			config.version = this.comp("version").get("value");
			config.packageName = this.comp("packageName").get("value");
			config.description = this.comp("description").get("value");
			config.extBrowser = this.comp("extBrowser").get("checked") === true;
			config.resEncryption = this.comp("resEncryption").get("checked") === true;

			this.getParent().openPage({
				id : "configDeveloper",
				url : "configDeveloper.w",
				fromId : "configApp",
			});
		}
	};

	return Model;

});
