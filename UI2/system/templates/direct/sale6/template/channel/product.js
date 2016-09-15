define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	//返回上一页
	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};
	//图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};
	//进入详细页
	Model.prototype.open = function(event) {
		var row = event.bindingContext.$object;
		var url = "../1/template.w";
		justep.Shell.showPage(require.toUrl(url), {
			rowid : row.val("id")
		});
	};
	//分类页
	Model.prototype.classBtnClick = function(event){
		justep.Shell.showPage("class");
	};
	
	return Model;
});