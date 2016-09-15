define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	//进入登录页
	Model.prototype.loginBtnClick = function(event){
		justep.Shell.showPage("login");
	};
	
	return Model;
});