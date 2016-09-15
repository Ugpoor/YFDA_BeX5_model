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
	Model.prototype.commentCustomRefresh = function(event) {
		var url = require.toUrl("./main/json/comment.json");
		allData.loadDataFromFile(url, event.source, true);
	};
	return Model;
});