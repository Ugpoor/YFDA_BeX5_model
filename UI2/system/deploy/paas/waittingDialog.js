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

	Model.prototype.hasDownloadBtn = function(wizard) {
		return false;
	};

	Model.prototype.getSucessInfo = function(result) {
		return "部署成功";
	};

	Model.prototype.downloadPage = function(result) {
		alert("正在执行部署，请稍等。");
	};

	Model.prototype._showBuildStatus = function(result) {
		if (result.flag && (result.code != "ERROR")) {
			this.getParent().openPage({
				id : "downloadApp",
				url : "downloadApp.w",
				fromId : "deployInfo"
			});
		} else {
			this.callParent(result);
		}
	};
	return Model;
});
