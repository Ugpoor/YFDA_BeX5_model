define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.toUrl = function(row) {
		return require.toUrl(row.val("imgSrc"));
	};

	Model.prototype.open = function(event) {
		var url = $(event.currentTarget).attr("url");
		if (!url) {
			url = event.bindingContext.$object.val("menuUrl");
		}
		justep.Shell.showPage(require.toUrl(url));
	};

	return Model;
});