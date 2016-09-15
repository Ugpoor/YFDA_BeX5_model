define(function(require) {
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var WeixinMenu = Object.extend({
		constructor : function() {
			base.init([ 'closeWindow', 'hideOptionMenu', 'showOptionMenu','hideMenuItems','showMenuItems','hideAllNonBaseMenuItem','showAllNonBaseMenuItem']);
		},
		
		hideOptionMenu : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.hideOptionMenu.call(this, param);
			} else if(window.cordova){
				Utils.logCallback('hideOptionMenu()', false)('hideOptionMenu come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'hideOptionMenu:fail',
					'resultStr' : 'hideOptionMenu come soon!'
				});
			}
		},
		closeWindow:function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.closeWindow.call(this, param);
			} else if(window.cordova){
				Utils.logCallback('closeWindow()', false)('closeWindow come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'closeWindow:fail',
					'resultStr' : 'closeWindow come soon!'
				});
			}
		},
		showOptionMenu : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.showOptionMenu.call(this, param);
			} else if(window.cordova){
				Utils.logCallback('showOptionMenu()', false)('showOptionMenu come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'showOptionMenu:fail',
					'resultStr' : 'showOptionMenu come soon!'
				});
			}
		},
		hideMenuItems : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.hideMenuItems.call(this, param);
			} else if(window.cordova){
				Utils.logCallback('hideMenuItems()', false)('hideMenuItems come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'hideMenuItems:fail',
					'resultStr' : 'hideMenuItems come soon!'
				});
			}
		},
		showMenuItems : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.showMenuItems.call(this, param);
			} else if(window.cordova){
				Utils.logCallback('showMenuItems()', false)('showMenuItems come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'showMenuItems:fail',
					'resultStr' : 'showMenuItems come soon!'
				});
			}
		},
		hideAllNonBaseMenuItem : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.hideAllNonBaseMenuItem.call(this, param);
			} else if(window.cordova){
				Utils.logCallback('hideAllNonBaseMenuItem()', false)('hideAllNonBaseMenuItem come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'hideAllNonBaseMenuItem:fail',
					'resultStr' : 'hideAllNonBaseMenuItem come soon!'
				});
			}
		},
		showAllNonBaseMenuItem : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.showAllNonBaseMenuItem.call(this, param);
			} else if(window.cordova){
				Utils.logCallback('showAllNonBaseMenuItem()', false)('showAllNonBaseMenuItem come soon!');
				Utils.errorCallback(this, param, {
					errMsg : 'showAllNonBaseMenuItem:fail',
					'resultStr' : 'showAllNonBaseMenuItem come soon!'
				});
			}
		}
	});
	return new WeixinMenu();
});