define(function(require) {
	require("cordova!cordova-plugin-geolocation");
	require("cordova!com.justep.cordova.plugin.bmap");
	var bmap = require('$UI/system/components/justep/bmap/bmap');
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');

	var Geo = Object.extend({
		constructor : function() {
			base.init([ 'openLocation', 'getLocation' ]);
		},
		getLocation : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.getLocation.call(this, param);
			} else if (window.cordova) {
				var type = param && param.type || "wgs84";
				if (!type === 'wgs84') {
					Utils.errorCallback(this, param, {
						'errMsg' : 'getLocation : fail',
						'resultStr' : "火星坐标等暂不支持，可传入wgs84"
					});
					return;
				}
				;
				navigator.geolocation.getCurrentPosition(function(position) {
					var res = position.coords;
					res.speed = position.speed || "0.0";
					res.accuracy = position.accuracy || "150.0";
					res.errMsg = "getLocation:ok"
					Utils.successCallback(this, param, res);
				}, function(res) {
					Utils.errorCallback(this, param, {
						'errMsg' : 'getLocation : fail',
						'resultStr' : JSON.stringify(res)
					});
				});
			}
			;
		},
		openLocation : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.openLocation.call(this, param);
			} else if (window.cordova) {
				var latitude = param && param.latitude;
				var longitude = param && param.longitude;
				var name = param && param.name;
				var address = param && param.address;
				var scale = param && param.scale;
				var infoUrl = param && param.infoUrl;
				bmap.marker({
					location : "" + latitude + "," + longitude,
					title : name,
					content : address,
					src : base.config.appName
						
				});
			}
		}
	});
	return new Geo();
});
