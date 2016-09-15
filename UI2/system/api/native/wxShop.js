define(function(require) {
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var WeixinShop = Object.extend({
		constructor : function() {
			base.init([ 'openProductSpecificView','addCard','chooseCard','openCard' ]);
		},
		openProductSpecificView : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.openProductSpecificView.call(this, param);
			} else {
				Utils.logCallback('openProductSpecificView()',false)('openProductSpecificView come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'openProductSpecificView:fail',
					'resultStr' : 'openProductSpecificView come soon!'
				});
			}
		},
		addCard : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.addCard.call(this, param);
			} else {
				Utils.errorCallback(this, param, {
					errMsg : 'addCard:fail',
					'resultStr' : 'addCard come soon!'
				});
			}
		},
		openCard : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.openCard.call(this, param);
			} else {
				Utils.errorCallback(this, param, {
					errMsg : 'openCard:fail',
					'resultStr' : 'openCard come soon!'
				});
			}
		},
		chooseCard : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.chooseCard.call(this, param);
			} else {
				Utils.errorCallback(this, param, {
					errMsg : 'chooseCard:fail',
					'resultStr' : 'chooseCard come soon!'
				});
			}
		},
	});
	return new WeixinShop();
});
