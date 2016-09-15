define(function(require){
	//var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Locker = require("$UI/system/components/justep/locker/locker");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.linePoint = function(event){
		justep.Util.hint("手势："+event.values);
	};
	
	Model.prototype.btnSetPasswordClick = function(event){
		this.comp('locker').set('mode',Locker.Modes.setPassword);
		this.comp('locker').clear();
	};
	
	Model.prototype.btnCheckClick = function(event){
		this.comp('locker').set('mode',Locker.Modes.check);
		this.comp('locker').clear();
	};
	
	Model.prototype.btnNormalClick = function(event){
		this.comp('locker').set('mode',Locker.Modes.normal);
		this.comp('locker').clear();
	};
	
	Model.prototype.setPasswordSuccess = function(event){
		//设置密码用于校验
		this.comp('locker').set('password',event.values);
	};
	return Model;
});