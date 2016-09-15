var cordova = require('cordova'), exec = require('cordova/exec');

var Push = function() {
};

Push.prototype.connect = function(successCB, errorCB, options) {
	var self = this;
	exec(function(result) {
		console.log(result);
		self.connected = true;
		self.token = result;
		successCB();
	}, function() {
		self.connected = false;
		errorCB && errorCB();
	}, "PushPlugin", "connect", [ {
		"options" : options
	} ]);
};

Push.prototype.onMessage = function(msg) {
	try {
		if (typeof msg === "object") {
			msg = JSON.stringify(msg);
		}
	} catch (e) {
	}
	;
	var ev = null;
	if (typeof CustomEvent === "function") {
		ev = new CustomEvent("pushMessage");
		ev.data = msg;
	} else {
		ev = document.createEvent('Event');
		ev.initEvent('pushMessage', true, true);
		ev.data = msg;
	}
	document.dispatchEvent(ev);
};

Push.prototype.disConnect = function() {
	this.connected = false;
	exec(null, null, "PushPlugin", "disconnect", []);
};

var push = new Push();
module.exports = push;