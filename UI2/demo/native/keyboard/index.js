define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require("cordova!cordova-plugin-keyboard");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.showshowkeyboardClick = function(event) {
		window.Keyboard.show();//显示软键盘
	};

	Model.prototype.hiddenkeyboardClick = function(event) {
		window.Keyboard.hide();
	};

	Model.prototype.disShrinkViewClick = function(event){
		window.Keyboard.shrinkView(true);
	};

	return Model;
});