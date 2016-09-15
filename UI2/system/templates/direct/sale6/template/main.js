define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	//产品中心
	Model.prototype.productClick = function(event){
		justep.Shell.showPage("product");
	};
	//促销活动
	Model.prototype.promotionClick = function(event){
		justep.Shell.showPage("promotion");
	};
	//最新动态
	Model.prototype.newsClick = function(event){
		justep.Shell.showPage("news");
	};
	//联系我们
	Model.prototype.contactUsClick = function(event){
		justep.Shell.showPage("contactUs");
	};
	//关于我们
	Model.prototype.aboutUsClick = function(event){
		justep.Shell.showPage("aboutUs");
	};
	//分类
	Model.prototype.menuClick = function(event){
		justep.Shell.showPage("class");
	};
	//进入详细页
	Model.prototype.open = function(event){
		//justep.Shell.showPage("detailed");
		var row = event.bindingContext.$object;
		var url = "./1/template.w";
		justep.Shell.showPage(require.toUrl(url), {
			rowid : row.val("id")
		});
	};
	
	
	return Model;
});