define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 图片路径转换
	Model.prototype.transUrl = function(row) {
		var url = (typeof row === "object") ? "./img/" + row.val("imageName") : row
		return require.toUrl(url);
	};

	Model.prototype.openPageClick = function(event) {
		var row = event.bindingContext.$object;
		var pagename = row.val("pagename");
		if (pagename) {
			justep.Shell.showPage(pagename);
		}
	};

	Model.prototype.contentstoClick = function(event) {
		var imgcontents = this.comp("imgcontents");
		var activeXid = imgcontents.getActiveXid();
		var content = imgcontents.getContent(activeXid);
		var url = $(content.$domNode).attr("url");
		if (url)
			justep.Shell.showPage(require.toUrl(url));
	};

	return Model;
});