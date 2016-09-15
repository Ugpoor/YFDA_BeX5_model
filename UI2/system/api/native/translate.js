define(function(require) {
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var Translate = Object.extend({
		constructor : function() {
			base.init([ 'translateVoice' ]);
		},
		translateVoice : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.translateVoice.call(this, param);
			} else if(window.cordova){
				Utils.errorCallback(this, param, {
					'errMsg' : 'translateVoice : fail',
					'resultStr' :"translateVoice come soon !"
				});
			}
			;
		}
	});
	return new Translate();
});
