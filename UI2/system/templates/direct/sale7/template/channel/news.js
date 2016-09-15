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
	
	Model.prototype.open = function(event) {
		var urlJson = {
			"latestNews" : "../4/latestNews.w",
			"professionNews" : "../4/professionNews.w",
			"news" : "../4/news.w"
		};
		var row = event.bindingContext.$object;
		var contents = this.comp("dataContents");
		var key = contents.getActiveXid();
		var url = urlJson[key];
		justep.Shell.showPage(require.toUrl(url), {
			rowid : row.val("id")
		});
	};
	
	return Model;
});