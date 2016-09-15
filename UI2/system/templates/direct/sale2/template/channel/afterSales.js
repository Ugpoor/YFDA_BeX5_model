define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	//返回上一页
	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.open = function(event) {
		var row = event.bindingContext.$object;
		var url = "../5/template.w";
		justep.Shell.showPage(require.toUrl(url),{rowid:row.val("id")});
	};

	return Model;
});