define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.firstBtnClick = function(event){
		justep.Shell.showPage("main");
	};
	Model.prototype.couBtnClick = function(event){
		justep.Shell.showPage("course");
	};
	Model.prototype.teBtnClick = function(event){
		justep.Shell.showPage("teachers");
	};
	Model.prototype.foBtnClick = function(event){
		justep.Shell.showPage("forum");
	};
	Model.prototype.aboutBtnClick = function(event){
		justep.Shell.showPage("about");
	};
	return Model;
});
