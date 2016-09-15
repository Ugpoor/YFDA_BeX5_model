define(function(require){
	var $ = require("jquery");
	require("cordova!cordova-plugin-statusbar");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.showClick = function(event){
		StatusBar.show();
	};
	Model.prototype.hideClick = function(event){
		StatusBar.hide();
	};
	Model.prototype.setBackBroundColorClick = function(event){
		StatusBar.backgroundColorByName("white");
	};
	Model.prototype.showWebViewClick = function(event){
		StatusBar.overlaysWebView(true);
	};
	Model.prototype.hideWebViewClick = function(event){
		StatusBar.overlaysWebView(false);
	};
	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this,"showClick").showCode("hideClick").showCode("setBackBroundColorClick").showCode("showWebViewClick").showCode("hideWebViewClick").prettyPrint();
	};
	return Model;
});