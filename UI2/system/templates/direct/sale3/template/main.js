define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.transUrl = function(row) {
		return require.toUrl('./img/' + row.val('imgName'));
	};

	Model.prototype.open = function(event) {
		var row = event.bindingContext.$object;
		var url = require.toUrl(row.val("imgUrl"));
		justep.Shell.showPage(url);
	};

	Model.prototype.openPageClick = function(event) {
		var row = event.bindingContext.$object;
		justep.Shell.showPage(row.val("pageName"));
	};

	return Model;
});