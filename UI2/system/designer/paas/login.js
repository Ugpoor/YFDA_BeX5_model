define(function(require) {
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer");
	var Dialog = require("$UI/system/components/justep/dialog/dialog");
	var MD5 = require("$UI/system/lib/base/md5");
	var templateService = require("$UI/system/templates/common/js/templateService");

	var $ = require("jquery");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event) {
		var result = {};
		if (this.currentCompose) {
			var innerModel = this.currentCompose.getInnerModel();
			if (innerModel && innerModel.beforeOkAction) {
				var msg = innerModel.beforeOkAction();
				if (msg) {
					alert(msg);
					return;
				}
			}
			if (innerModel && innerModel.getReturnValue) {
				result.returnValue = innerModel.getReturnValue();
			}
		}
		xuiService.pageOkAction(result);
	};

	Model.prototype.cancelBtnClick = function(event) {
		xuiService.pageCloseAction();
	};

	Model.prototype.refreshBtnClick = function(event) {
		window.location.reload();
	};

	Model.prototype.modelLoad = function(event) {

	};

	Model.prototype.createCompose = function(src) {
		var src = require.toUrl(src);
		var compose = new WindowContainer({
			parentNode : this.getElementByXid("composeParent"),
			src : src
		});
		$(compose.domNode).addClass('compose');
		return compose;
	};

	Model.prototype.loginClick = function(event) {
		var name = $(this.getElementByXid("name")).val();
		var password = $(this.getElementByXid("password")).val();
		if (!name || !password) {
			alert("用户名或密码不能为空！");
			return;
		}

		var remember = true;// this.comp("remember").val() ;
		var noDisplay = this.comp("noDisplay").val();
		var self = this;
		if (remember === undefined || remember === '') {
			remember = false;
		}
		if (noDisplay === undefined || noDisplay === '') {
			noDisplay = false;
		}
		var md5 = new MD5();
		var pswmd5 = md5.hex_md5_salt(password);
		console.log(JSON.stringify({
			userName : name,
			password : pswmd5,
			remember : remember,
			noDisplay : noDisplay
		}));
		xuiService.loginPaas({
			userName : name,
			password : pswmd5,
			remember : remember,
			noDisplay : noDisplay
		}, function(result) {
			if (result.status == '1') {
				xuiService.pageCloseAction();
			}
		});
	};

	Model.prototype.rememberChange = function(event) {

	};
	Model.prototype.noDisplayChange = function(event) {
		var noDisplay = this.comp("noDisplay").val();
		xuiService.loginPaas({
			noDisplay : noDisplay
		}, function(result) {
			if (result.status == '0') {
				alert(result.message);
			}
		});
	};
	Model.prototype.noDisplayClick = function(event) {

	};
	Model.prototype.a1Click = function(event) {

	};
	Model.prototype.regBtnClick = function(event) {
		window.location.href = templateService.getXCloudConsoleUrl() + "/x5/UI2/SA/OPM/register/PTRegisterActivity.w"
	};
	return Model;
});
