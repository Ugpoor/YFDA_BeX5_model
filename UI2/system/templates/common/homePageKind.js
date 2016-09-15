define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var templateService = require("$UI/system/templates/common/js/templateService");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.modelLoad = function(event) {
		
		this.templateEngine = this.getParent().templateEngine;
		this.templateFile = this.templateEngine.config.items[0].file;
		var currentDir = this.templateEngine.getTargetPath();
		this.rootDir = currentDir.indexOf('UI2')==-1?currentDir.substring(0,currentDir.indexOf('UI')+2):currentDir.substring(0,currentDir.indexOf('UI2')+3);
	};
	
	Model.prototype.getTitle = function(wizard){
		return '首页生成选项';
	};
	
	Model.prototype.hasCancelBtn = function(wizard) {
		return true;
	};
	
	Model.prototype.hasBackBtn = function(wizard) {	
		return true;
	};
	
	Model.prototype.hasNextBtn = function(wizard) {
		return false;
	};
	
	Model.prototype.hasFinishBtn = function(wizard) {
		return true;
	};
	
	Model.prototype.backPage = function(wizard){
		wizard.back(this);
	};
	Model.prototype.validate = function(wizard) {
		if(this.comp('main').val() == 2 && this.comp('mainInput').val() === ""){
			alert("请选择自定义主页或默认生成主页");
			return false;
		}
		return true;
	};
	
	Model.prototype.finish = function(wizard) {
		var self = this;
		var a = this.templateEngine;
		
		var is0rNotHaveWing = this.comp('wing').val();
		var is0rNotHaveLeftMenu = this.comp('leftMenu').val();
		var is0rNotHaveMain = this.comp('main').val();
		
		if(is0rNotHaveWing == 1 && is0rNotHaveLeftMenu == 1 && is0rNotHaveMain == 1){
			self.templateEngine.templatePath = "$UI/system/templates/normal/homePage3";
		}
		if(is0rNotHaveWing == 1 && is0rNotHaveLeftMenu == 1 && is0rNotHaveMain == 2){
		
			self.templateEngine.templatePath = "$UI/system/templates/normal/homePage4";
		}
		if(is0rNotHaveWing == 1 && is0rNotHaveLeftMenu == 2 && is0rNotHaveMain == 1){
			self.templateEngine.templatePath = "$UI/system/templates/normal/homePage2";
		}
		if(is0rNotHaveWing == 1 && is0rNotHaveLeftMenu == 2 && is0rNotHaveMain == 2){
			self.templateEngine.templatePath = "$UI/system/templates/normal/homePage5";
		}
		if(is0rNotHaveWing == 2 && (is0rNotHaveLeftMenu == 2 || is0rNotHaveLeftMenu == 1) && is0rNotHaveMain == 2){
			self.templateEngine.templatePath = "$UI/system/templates/normal/homePage6";
		}
		
		var mainUrl = this.comp('mainInput').val();
		if(mainUrl != null && this.comp('main').val() == 2){
			this.templateEngine.addContext(this.templateFile, "main_page", mainUrl);
		}
		
	};

	Model.prototype.data6CustomNew = function(event){
		event.data = [{"wing":2,"leftMenu":2,"main":1}];
	};

	return Model;
});