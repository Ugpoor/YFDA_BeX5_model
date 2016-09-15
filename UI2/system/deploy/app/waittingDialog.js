define(function(require) {

	var Model = function() {
		this.callParent();
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

	Model.prototype._showBuildStatus = function(result) {
		if (result.flag && (result.code != "ERROR")) {
			if (this.getParent().startAppWiz) {
				this.getParent().openAppWiz();
			} else {
				this.appEngine.closeDialog();
			}
		} else {
			this.callParent(result);
		}
	};

	return Model;
});
