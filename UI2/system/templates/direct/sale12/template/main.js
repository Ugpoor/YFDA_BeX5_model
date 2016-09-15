define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.toUrl = function(param) {
		return require.toUrl(param);
	};

	Model.prototype.open = function(event) {
		var row = event.bindingContext.$object;
		var url = row.val('imgUrl');
		justep.Shell.showPage(require.toUrl(url));
	};

	return Model;
});