define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.getImageUrl = function(url){
		return require.toUrl("../img/"+url);
	};
	return Model;
});