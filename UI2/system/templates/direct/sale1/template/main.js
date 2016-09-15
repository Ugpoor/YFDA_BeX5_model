define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	// 图片路径转换
	Model.prototype.transUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.openPageClick = function(event) {
		var pageName = event.currentTarget.getAttribute('pagename');
		if (pageName)
			justep.Shell.showPage(pageName);
	};

	return Model;
});