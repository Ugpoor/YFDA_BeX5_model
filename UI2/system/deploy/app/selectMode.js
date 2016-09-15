define(function(require) {

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.appEngine = this.getParent().appEngine;
		this.paasToken = this.appEngine.getConfig().paasToken;
		if (this.getParent().edit) {
			var config = this.appEngine.getConfig();
			this.comp("modeRadioGroup").val(config.mode);
		} else {
			this.comp("modeRadioGroup").val("1");
		}
	};

	Model.prototype.getTitle = function(wizard) {
		return '选择应用模式';
	};

	Model.prototype.hasCancelBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasBackBtn = function(wizard) {
		return false;
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
			config.mode = this.comp("modeRadioGroup").get("value");

			this.getParent().openPage({
				id : "selectAppResources",
				url : "selectAppResources.w",
				fromId : "selectMode",
			});
		}
	};

	return Model;

});
