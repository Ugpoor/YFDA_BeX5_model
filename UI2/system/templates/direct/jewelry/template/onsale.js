define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.transURL = function(imgUrl) {
		return imgUrl ? require.toUrl(imgUrl) : "";

	};

	Model.prototype.jewelryCustomRefresh = function(event) {
		var url = require.toUrl("./main/json/jewelry2.json");
		allData.loadDataFromFile(url, event.source, true);
	};

	// 打开详情页
	Model.prototype.li1Click = function(event) {
		justep.Shell.showPage("detail");
	};

	return Model;
});