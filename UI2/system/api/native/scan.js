define(function(require) {
	require("cordova!phonegap-plugin-barcodescanner");
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var Scan = Object.extend({
		constructor : function() {
			base.init([ 'scanQRCode' ]);
		},
		scanQRCode : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.scanQRCode.call(this, param);
			} else if(window.cordova){
				if (!param) {
					Utils.errorCallback(this, param, {
						'errMsg' : 'scanQRCode : fail',
						'resultStr' : 'param missing'
					});
					return;
				}
				;
				cordova.plugins.barcodeScanner.scan(function(res) {
					var cancelled = res.cancelled;
					if (cancelled) {
						Utils.cancelCallback(this, param, {
							'errMsg' : 'scanQRCode : cancel'
						});
					} else {
						Utils.successCallback(this, param, {
							'errMsg' : 'scanQRCode : ok',
							'resultStr' : res.text
						});
					}
				}, function(res) {
					Utils.errorCallback(this, param, {
						'errMsg' : 'scanQRCode : fail',
						'resultStr' : JSON.stringify(res)
					});
				});
			}
		}
	});
	return new Scan();
});
