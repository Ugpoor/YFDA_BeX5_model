define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.getImageUrl = function(url){
		return require.toUrl("../img/"+url);
	};
	
	Model.prototype.openDemo = function(event) {
	  var demo = event.source.$domNode.attr("urlMapping");
	  justep.Shell.showPage(demo);
	};
	
	Model.prototype.categoryClick = function(event){
		justep.Shell.showPage("parent");
	};
	return Model;
});