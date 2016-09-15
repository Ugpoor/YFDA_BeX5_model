define(function(require) {

	var Model = function() {
		this.callParent();

	};

	Model.prototype.modelLoad = function(event) {
		this.callParent();

		this.comp("startAppWiz").val(this.getParent().edit);
	};

	Model.prototype.finish = function(wizard) {
		// 设置到父页面，供waittingDialog调用
		this.getParent().startAppWiz = this.comp("startAppWiz").get("checked") === true;
		this.getParent().openPage({
			id : "waittingDialog",
			url : "waittingDialog.w",
			fromId : "appInfo"
		});
		
		return true;
	};

	return Model;
});
