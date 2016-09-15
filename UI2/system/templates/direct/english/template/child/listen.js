define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl("../img/"+url);
	};
	
	return Model;
});