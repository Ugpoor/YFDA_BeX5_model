define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
	};
	
	//返回上一页
	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	//列表页
	Model.prototype.openClick = function(event){
		justep.Shell.showPage("product");
	};
	
	return Model;
});
