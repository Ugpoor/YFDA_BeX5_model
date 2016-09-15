define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
		var context = this.getContext();
		var category11 = context.getRequestParameter("category");
		var number11 = context.getRequestParameter("number");
		category11 = category11.replace(/~/gm, "%");
		category11 = decodeURIComponent(category11);
		number11 = number11.replace(/~/gm, "%");
		number11 = decodeURIComponent(number11);
		this.comp('p1').setStringVar("category", category11);
		this.comp('p1').setStringVar("number", number11);
		this.comp('grid').refresh();
	};

	return Model;
});