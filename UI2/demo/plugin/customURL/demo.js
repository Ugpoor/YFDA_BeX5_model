define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!cordova-plugin-customurlscheme");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();		
		this.eventName = new Date().getTime() + "";
		$(window).on('handleOpenURL.'+this.eventName,this.handleOpenURL);
	};
	//打开手机浏览器
	Model.prototype.openClick = function(event){
		window.open(require.toUrl("./test.w"), "_system");
	};
	
	Model.prototype.handleOpenURL = function(event,url){
		justep.Util.hint("接收到URL参数:  "+url );
//		justep.Util.hint("开发者现在可以根据接收到的URL参数进行不同的处理,在此并不在做展示");	
	};
	Model.prototype.modelUnLoad = function(event){
		$(window).off("handleOpenURL." + this.eventName);
	};
	
	Model.prototype.modelModelConstructDone = function(event){
		utils.showCode(this, "Model");
		utils.showCode(this, "handleOpenURL");
		utils.showCode(this, "modelUnLoad");
		utils.prettyPrint();
	};
	
	//该方法只为code界面的代码显示，并不实际运行
	Model.prototype.Model = function(event){	
//		this.eventName = new Date().getTime() + "";
//		$(window).on('handleOpenURL.'+this.eventName,this.handleOpenURL);
	};

	return Model;
});

