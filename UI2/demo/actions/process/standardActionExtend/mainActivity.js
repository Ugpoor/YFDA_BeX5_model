define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.dProjectPlanNewCreateParam = function(event){
	

		event.defaultValues["fPlanName"] = "'计划1'";
		event.param.setString("myParam", "给我的自定义参数赋值");
	};

	return Model;
});