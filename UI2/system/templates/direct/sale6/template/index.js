define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	
	var Model = function(){
		this.callParent();
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main":{
					url : this.transUrl('./main.w')
				},
				"news":{
					url : this.transUrl('./channel/news.w')
				},
				"product":{
					url : this.transUrl('./channel/product.w')
				},
				"promotion":{
					url : this.transUrl('./channel/promotion.w')
				},
				"contactUs":{
					url : this.transUrl('./channel/contactUs.w')
				},
				"aboutUs":{
					url : this.transUrl('./channel/about.w')
				},
				"class":{
					url : this.transUrl('./channel/class.w')
				},
				"detailed":{
					url : this.transUrl('./channel/detailed.w')
				}
			}
		});
	};
	Model.prototype.transUrl = function(url) {
		return require.toUrl(url);
	};
	
	Model.prototype.modelLoad = function(event){
		justep.Shell.showPage("main");
	};

	return Model;
});