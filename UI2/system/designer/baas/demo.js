define(function(require) {
	var docService = require("$UI/system/designer/baas/docService");//文档服务
	 
	var $ = require("jquery");

	var Model = function() {
		this.callParent();
	};
 
	Model.prototype.refreshBtnClick = function(event) {
		window.location.reload();
	};
 
	Model.prototype.button1Click = function(event){
		var content = docService.getContent();
		//console.log("===>"+content)
		docService.setContent("dafd");
	};
	return Model;
});
