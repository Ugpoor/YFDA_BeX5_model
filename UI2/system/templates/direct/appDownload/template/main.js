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

	Model.prototype.hotSoftwareCustomRefresh = function(event) {
		var url = require.toUrl("./main/json/hostSoftware.json");
		allData.loadDataFromFile(url, event.source, true);
	};
	//点击图片打开新页
	Model.prototype.imgOpenDemo = function(event) {
		if (event) {
			var demo = $(event.target).attr('urlMapping');
			justep.Shell.showPage(demo);
		}
	};
	//点击按钮打开新页
	Model.prototype.btnOpenDemo = function(event) {
		var demo = event.source.$domNode.attr('urlMapping');
		justep.Shell.showPage(demo);
	};

	return Model;
});