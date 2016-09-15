define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.btnOKClick = function(event) {
		if (this.check()) {
			var param = new biz.Request.ActionParam();
			param.setString("appLicense", this.comp('appLicense').val());
			var callback = function(data) {
				if (data.state) {
					var ret = data.response;
					alert("注册应用License完成！\n" + "开发商：" + ret['developer'] + "\n" + "应用：" + ret['app'] + "\n" + "有效期：" + ret['valid-date'] + "\n" + "允许使用人数：" + ret['user-count'] + "\n");
				} else {
					data.ignoreError = false;
				}
			};
			biz.Request.sendBizRequest({
				action : "regAppLicenseAction",
				parameters : param,
				context : this.getContext(),
				dataType : "application/json",
				callback : callback
			});
		}
	};

	Model.prototype.check = function() {
		if ('' == this.comp('appLicense').val())
			throw new Error('请输入应用License');
		return true;
	};

	return Model;
});