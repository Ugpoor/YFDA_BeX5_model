define(function(require) {
	var $ = require("jquery");
	require("cordova!com.plugins.shortcut");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.createShortcutClick = function(event) {
		window.plugins.Shortcut.CreateShortcut("x5快捷方式", function(res) {
			justep.Util.hint("创建成功");
		}, function(res) {
			justep.Util.hint("创建失败：" + res);
		});

	};

	Model.prototype.modelModelConstructDone = function(event) {
		var utils = require("$UI/demo/plugin/utils");
		utils.showCode(this, "createShortcutClick").prettyPrint();
	};

	return Model;
});