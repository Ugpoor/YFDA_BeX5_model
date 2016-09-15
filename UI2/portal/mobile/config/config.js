define(function(require){

	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};

	Model.prototype.skinSaveBtnClick = function(event){
		var value = this.comp('skinSel').val();
		justep.Portal.setSkin(value);
	};

	Model.prototype.langSaveBtnClick = function(event){
		var value = this.comp('langSel').val();
		justep.Portal.setLang(value);
	};

	Model.prototype.toggleDebugChange = function(event){
		var value = this.comp('toggleDebug').val();
		justep.Portal.setDebug(value);
	};

	Model.prototype.modelLoad = function(event){
		var value = this.getContext().getSkin() || 'default';
		this.comp('skinSel').val(value);
		value = this.myStore('debug');
		this.comp('toggleDebug').val(value);
	};
	
	Model.prototype.store = function(name, value){
		if(value !== undefined){
			localStorage.setItem(name, value);		
		}else{
			value = localStorage.getItem(name);
			if(value === 'true') value = true;
			if(value === 'false') value = false;
			return value;
		}
	};
	Model.prototype.myStore = function(name, value){
		name = this.getContext().getCurrentPersonID() + '.' + name;
		return this.store(name, value);
	};

	return Model;
});