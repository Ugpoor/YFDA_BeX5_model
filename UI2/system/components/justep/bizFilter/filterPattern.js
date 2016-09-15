define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.btnNewPublicPatternClick = function(event){
		this.comp("filterDialog").open({
			data : {
				"filterContext" : this.filterContext,
				"openMode" : "newPattern",
				"isPublicPattern" : true
			}
		});
	};
	return Model;
});