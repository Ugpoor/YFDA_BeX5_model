var cordova = require('cordova'),
    channel = require('cordova/channel'),
    exec = require('cordova/exec');
var scanCard = function() {
};

scanCard.prototype = {
	auth :function(name,successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'scanCard', 'auth', [name]);
	},
	checkAuth : function(successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'scanCard', 'checkAuth', []);
	},
	clearAuthentication : function(successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'scanCard', 'clearAuthentication', []);
	},
	takePicture : function(successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'scanCard', 'takePicture', []);
	},
	getCardByTime : function(second,successCallback, errorCallback) {
		exec(successCallback, errorCallback, 'scanCard', 'getCardByTime', [second]);
	},
	
	uploadPicture: function(uuid,successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'scanCard', 'uploadPicture',[uuid]);
    },

    getCardByUuid: function(uuids,successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'scanCard', 'getCardByUuid', [{"uuids":uuids}]);  
    },
    
    getCardPicture:function(uuid,arg,successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'scanCard', 'getCardPicture', [uuid,arg]);
    },
    
};


module.exports = new scanCard();



