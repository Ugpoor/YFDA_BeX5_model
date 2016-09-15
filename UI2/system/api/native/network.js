define(function(require) {
	require("cordova!cordova-plugin-network-information");
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var Network = Object.extend({
		constructor : function() {
			base.init([ 'getNetworkType' ]);
		},
		getNetworkType : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.getNetworkType.call(this, param);
			} else if (window.cordova) {
				var type = navigator.connection.type;
				if (type == 'unknown') {
					Utils.errorCallback(this, param, {
						'errMsg' : 'getNetworkType : fail',
						'networkType' : 'none'
					});
				} else {
					Utils.successCallback(this, param, {
						'errMsg' : 'getNetworkType : ok',
						'networkType' : type
					});
				}
			}
		}
	});
	return new Network();
});