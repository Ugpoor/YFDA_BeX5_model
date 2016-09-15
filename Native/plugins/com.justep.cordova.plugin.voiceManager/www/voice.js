var cordova = require('cordova'), exec = require('cordova/exec');
module.exports = {
		Mode: {
	        NORMAL:  0, // 正常外放模式
	        CALL: 1, // 听筒模式
	        
	    },
	    
		setPlayMode:function(mode,onSuccess,onError){
			exec(onSuccess, onError, "voiceManager", "setPlayMode", [mode]);
		}			
};
