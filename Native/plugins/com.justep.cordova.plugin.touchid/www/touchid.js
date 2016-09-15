
var exec = require("cordova/exec");

module.exports = {
	     authenticate : function (successCallback, errorCallback, text){
			if (!text) {
		        text = "Please authenticate via TouchID to proceed";
		    }
		    exec(successCallback, errorCallback, "TouchID", "authenticate", [text]);
			
		},
		
		checkSupport : 	function (successCallback, errorCallback) {
		    exec(successCallback, errorCallback, "TouchID", "checkSupport");
		}
};