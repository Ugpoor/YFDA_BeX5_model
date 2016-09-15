define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	//图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};
	
	//数据加载
	Model.prototype.productDataCustomRefresh = function(event){
		var url = require.toUrl("../json/productData.json");
		var productData = event.source;
		$.getJSON(url, function(data) {
			productData.loadData(data);
		});
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