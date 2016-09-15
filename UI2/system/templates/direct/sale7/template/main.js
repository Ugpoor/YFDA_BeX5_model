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
	//通知公告
	Model.prototype.modelLoad = function(event) {
		var scrollAnimate = $('.x-grid-menu7-4');
		var horn = scrollAnimate.find('.cell');
		var speed = 300;
		var timer = 5000;
		scrollUp = function() {
			horn.animate({
				marginTop : -scrollAnimate.height()
			}, speed, function() {
				horn.find('.card:first').remove().appendTo(horn);
				horn.css({
					marginTop : 0
				});
			});
		};
		!scrollAnimate.length > 0 || setInterval(scrollUp, timer);

	};
	//数据加载
	Model.prototype.productDataCustomRefresh = function(event){
		var url = require.toUrl("./json/productData.json");
		var productData = event.source;
		$.getJSON(url, function(data) {
			productData.loadData(data);
		});
	};
	//导航打开页面
	Model.prototype.pageClick = function(event){
		var page = event.currentTarget.getAttribute('pagename');
		if (page)
			justep.Shell.showPage(page);
	};
	
	//进入详细页		
	Model.prototype.detailOpen = function(event){
		var row = event.bindingContext.$object;
		var url = "./1/template.w";
		justep.Shell.showPage(require.toUrl(url), {
			rowid : row.val("id")
		});
	};
	Model.prototype.open = function(event){
		var url = "./1/template.w";
		justep.Shell.showPage(require.toUrl(url), {
			rowid : 1
		});
	};
	
	
	return Model;
});