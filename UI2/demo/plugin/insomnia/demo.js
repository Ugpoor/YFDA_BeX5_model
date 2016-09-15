define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!cordova-plugin-insomnia");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
	//保持屏幕常亮
	Model.prototype.button1_3Click = function(event){
		plugins.insomnia.keepAwake(function(){
			justep.Util.hint("设置常亮成功");
		}, function(){
			justep.Util.hint("设置失败");
		});
	};
	
	//允许息屏
	Model.prototype.button2_4Click = function(event){
		plugins.insomnia.allowSleepAgain(function(){
			justep.Util.hint("设置成功");
		}, function(){
			justep.Util.hint("设置失败");
		});
	};
	Model.prototype.modelModelConstructDone = function(event){
		utils.showCode(this, "button1_3Click");
		utils.showCode(this, "button2_4Click");
		utils.prettyPrint();
	};
	return Model;
});