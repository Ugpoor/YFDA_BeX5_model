define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require("cordova!at.modalog.cordova.plugin.cache");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.clearClick = function(event) {
		document.addEventListener('deviceready', onDeviceReady);
		function onDeviceReady() {
			var success = function(status) {
				alert('Message: ' + status);
			}

			var error = function(status) {
				alert('Error: ' + status);
			}
			window.cache.clear(success, error);
		}
	};

	return Model;
});