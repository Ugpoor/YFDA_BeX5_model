define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var context = this.getContext();
		var companyName = context.getRequestParameter("Company-Name");
		var productName = context.getRequestParameter("Product-Name");
		var categoryName = context.getRequestParameter("Category-Name");

		if (companyName) {
			companyName = companyName.replace(/~/gm, "%");
			companyName = decodeURIComponent(companyName);
		}
		if (productName) {
			productName = productName.replace(/~/gm, "%");
			productName = decodeURIComponent(productName);
		}

		if (categoryName) {
			categoryName = categoryName.replace(/~/gm, "%");
			categoryName = decodeURIComponent(categoryName);
		}
		this.comp('p1').setStringVar("company", companyName);
		this.comp('p1').setStringVar("product", productName);
		this.comp('p1').setStringVar("category", categoryName);
		this.comp('report').refresh();
	};

	return Model;
});