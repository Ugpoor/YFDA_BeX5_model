define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.openDemo = function(event) {
	  var demo = event.source.$domNode.attr("urlMapping");
	  justep.Shell.showPage(demo);
	};

	return Model;
});
