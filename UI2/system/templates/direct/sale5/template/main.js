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
	
	//菜单
	Model.prototype.menuContentActive = function(event){
		this.loadContainer("menuContainer", "channel/menu.w");
	};
	//商家
	Model.prototype.storeContentActive = function(event){
		this.loadContainer("storeContainer", "channel/store.w");
	};
	//关于
	Model.prototype.aboutContentActive = function(event){
		this.loadContainer("aboutContainer", "channel/about.w");
	};
	Model.prototype.loadContainer = function(container, url){
		var container = this.comp(container);
		var src = container.get("src");
		if (src != url) {
			container.set({"src" : url});
			container.refresh();
		} 
	};
	
	//促销活动
	Model.prototype.openPageClick = function(event){
		var pageName = $(event.currentTarget).attr("pagename"); 
		justep.Shell.showPage(pageName);
	};
	
	//菜单详细
	Model.prototype.menuDetailedClick = function(event){
		justep.Shell.showPage("detailed");
	};
	//店铺详细
	Model.prototype.storeDetailedClick = function(event){		
		justep.Shell.showPage("detailed");
	};
	
	return Model;
});