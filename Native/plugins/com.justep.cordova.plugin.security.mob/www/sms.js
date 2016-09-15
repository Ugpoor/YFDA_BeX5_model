	var cordova = require('cordova');
	var exec = require('cordova/exec');
	function SDK() {
	};
	
	SDK.prototype.init = function(appInfo,onSuccess,onError){
		  exec(onSuccess, onError, "PluginSMSSDK", "init", [appInfo]);
	};
	SDK.prototype.getInfo = function(onSuccess,onError){
		  exec(onSuccess, onError, "PluginSMSSDK", "getDeviceInfo", []);
	};
	SDK.prototype.send = function(phone,onSuccess,onError){
		  exec(onSuccess, onError, "PluginSMSSDK", "send", [phone]);
	};
	SDK.prototype.verify = function(phoneCode,onSuccess,onError){
		  exec(onSuccess, onError, "PluginSMSSDK", "verify", [phoneCode]);
	};
	
	SDK.install = function () {
		  if (!window.navigator) {
		    window.navigator = {};
		  }
		  
		  var _mob = window.navigator.mobsms = new SDK();
		  return window.navigator.mobsms;
		};

    cordova.addConstructor(SDK.install);
