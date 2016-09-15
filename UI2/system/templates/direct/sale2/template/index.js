define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');

	var Model = function() {
		this.callParent();
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main" : {
					url : this.transUrl('./main.w')
				},
				"aboutUs" : {
					url : this.transUrl('./channel/aboutUs.w')
				},
				"product" : {
					url : this.transUrl('./channel/product.w')
				},
				"cases" : {
					url : this.transUrl('./channel/cases.w')
				},
				"dynamic" : {
					url : this.transUrl('./channel/dynamic.w')
				},
				"promotion" : {
					url : this.transUrl('./channel/promotion.w')
				},
				"contactUs" : {
					url : this.transUrl('./channel/contactUs.w')
				},
				"afterSales" : {
					url : this.transUrl('./channel/afterSales.w')
				},
				"service" : {
					url : this.transUrl('./channel/service.w')
				},
				"enterprise" : {
					url : this.transUrl('./channel/enterprise.w')
				},
				"content1" : {
					url : this.transUrl('./contents/content1.w')
				},
				"content2" : {
					url : this.transUrl('./contents/content2.w')
				},
				"content3" : {
					url : this.transUrl('./contents/content3.w')
				},
				"content4" : {
					url : this.transUrl('./contents/content4.w')
				}

			}
		});
	};

	Model.prototype.modelLoad = function(event) {
		justep.Shell.showPage("main");
	};

	Model.prototype.transUrl = function(url) {
		return require.toUrl(url);
	};

	return Model;
});