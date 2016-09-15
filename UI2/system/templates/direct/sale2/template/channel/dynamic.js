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
	
	Model.prototype.getImageUrl = function(row) {
		return require.toUrl(row.val('imgUrl'));
	};
	
	Model.prototype.open = function(event) {
		var urlJson = {"latestNews" : "../4/latestNews.w","professionNews" : "../4/professionNews.w","news" : "../4/news.w"};
		var row = event.bindingContext.$object;
		var contents = this.comp("dataContents");
		var key = contents.getActiveXid();
		var url = urlJson[key];
		justep.Shell.showPage(require.toUrl(url),{rowid : row.val('id')});
	};
	
	return Model;
});