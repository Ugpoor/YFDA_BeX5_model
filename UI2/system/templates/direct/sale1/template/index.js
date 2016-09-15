define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	
	var Model = function(){
		this.callParent();
		var self = this;
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main":{
					url : self.transUrl('./main.w')
				},
				"aboutUs":{
					url : self.transUrl('./channel/aboutUs.w')
				},
				"product":{
					url : self.transUrl('./channel/product.w')
				},
				"cases":{
					url : self.transUrl('./channel/cases.w')
				},
				"dynamic":{
					url : self.transUrl('./channel/dynamic.w')
				},
				"promotion":{
					url : self.transUrl('./channel/promotion.w')
				},
				"contactUs":{
					url : self.transUrl('./channel/contactUs.w')
				},
				"afterSales":{
					url : self.transUrl('./channel/afterSales.w')
				},
				"service":{
					url : self.transUrl('./channel/service.w')
				}
				
			}
		});
	};
	
	Model.prototype.modelLoad = function(event){
		justep.Shell.showPage("main");
	};
	
	Model.prototype.transUrl = function(url) {
		return require.toUrl(url);
	};

	return Model;
});