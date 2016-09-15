define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 返回上一页
	Model.prototype.backBtnClick = function(event) {
		justep.Shell.closePage();
	};

	Model.prototype.getImageUrl = function(row) {
		return require.toUrl(row.val('imgSrc'));
	};

	Model.prototype.open = function(event) {
		var row = event.bindingContext.$object;
		var url = "../2/template.w";
		justep.Shell.showPage(require.toUrl(url), {
			rowid : row.val("id")
		});
	};

	return Model;
});