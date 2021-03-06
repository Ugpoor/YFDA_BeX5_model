var appAvailability = {
    
    check: function(urlScheme, successCallback, errorCallback) {
    	if(typeof urlScheme === "object"){
    		urlScheme = urlScheme.android;
    	}
    	
        cordova.exec(
            successCallback,
            errorCallback,
            "AppAvailability",
            "checkAvailability",
            [urlScheme]
        );
    },
    
    checkBool: function(urlScheme, callback) {
        cordova.exec(
            function(success) { callback(success); },
            function(error) { callback(error); },
            "AppAvailability",
            "checkAvailability",
            [urlScheme]
        );
    }
    
};

module.exports = appAvailability;