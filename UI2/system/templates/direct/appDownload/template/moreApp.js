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
	Model.prototype.returnClick = function(event) {
		this.close();
	};
	Model.prototype.appCustomRefresh = function(event) {
		var url = require.toUrl("./main/json/app.json");
		allData.loadDataFromFile(url, event.source, true);
	};
	return Model;
});