define(function(require) {
	var $ = require("jquery");
	require("cordova!cordova-plugin-device");
	var Model = function() {
		this.callParent();

	};

	Model.prototype.clearInfo = function(event) {
		document.getElementById("cordovaSpan").innerHTML = "";
		document.getElementById("platform").innerHTML = "";
		document.getElementById("version").innerHTML = "";
		document.getElementById("uuid").innerHTML = "";
		document.getElementById("model").innerHTML = "";
		document.getElementById("manufacturer").innerHTML = "";

	};
	Model.prototype.getInfo = function(event) {
		document.getElementById("cordovaSpan").innerHTML = device.cordova;
		document.getElementById("platform").innerHTML = device.platform;
		document.getElementById("version").innerHTML = device.version;
		document.getElementById("uuid").innerHTML = device.uuid;
		document.getElementById("model").innerHTML = device.model;
		document.getElementById("manufacturer").innerHTML = device.manufacturer;
	};
	Model.prototype.modelModelConstructDone = function(event) {
		var utils = require("$UI/demo/plugin/utils");
		utils.showCode(this, "getInfo").prettyPrint();
	};
	return Model;
});