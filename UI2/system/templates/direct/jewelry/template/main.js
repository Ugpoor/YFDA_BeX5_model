define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.toURL = function(imgUrl) {
		return imgUrl ? require.toUrl(imgUrl) : "";

	};

	Model.prototype.jewelryCustomRefresh = function(event) {
		var url = require.toUrl("./main/json/jewelry.json");
		allData.loadDataFromFile(url, event.source, true);
	};

	Model.prototype.image3Click = function(event) {
		this.openDetail();
	};

	Model.prototype.image2Click = function(event) {
		this.openDetail();
	};

	// 打开详情页
	Model.prototype.openDetail = function() {
		justep.Shell.showPage("detail");
	}
	return Model;
});