define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!com.justep.cordova.plugin.touchid");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
		this.callBack();
	};
	//回调方法
	Model.prototype.callBack = function(){
		this.success = function (result) {
			justep.Util.hint(result);
		};
		this.error = function (result) {
			justep.Util.hint(result);
		};
	};
	
	//检查是否支持指纹识别
	Model.prototype.checkClick = function(event){
		navigator.touchid.checkSupport(this.success, this.error);
	};
	//指纹识别
	Model.prototype.authenticateClick = function(event){
		navigator.touchid.authenticate(this.success, this.error,"请开始指纹识别：将手指放于home键，核对指纹。");
	};
	Model.prototype.modelModelConstructDone = function(event){
		utils.showCode(this, "checkClick");
		utils.showCode(this, "authenticateClick");
		utils.prettyPrint();
	};
	return Model;
});