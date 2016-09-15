define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	Model.prototype.getImageUrl = function(url){
		return require.toUrl("../img/"+url);
	};
	Model.prototype.loginBtnClick = function(event){
		justep.Shell.showPage("login");
	};

	Model.prototype.menuBtnClick = function(event){
		justep.Shell.showPage("main");
	};

	return Model;
});