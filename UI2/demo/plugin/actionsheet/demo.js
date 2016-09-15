define(function(require) {
	var $ = require("jquery");
	require("cordova!cordova-plugin-actionsheet");
	var utils = require("$UI/demo/plugin/utils");

	// var demo = require('text!$UI2/demo/plugin/ActionSheet/demo.js');
	var Model = function() {
		this.callParent();
		this.callback = function(buttonIndex) {
			setTimeout(function() {
				justep.Util.hint('返回索引: ' + buttonIndex);
			}, 0);
		};

	};

	Model.prototype.showWithTitleClick = function(event) {
		var options = {
			'androidTheme' : window.plugins.actionsheet.ANDROID_THEMES.THEME_HOLO_LIGHT,
			'title' : '是否要分享该图片?',
			'buttonLabels' : [ '微信分享', 'QQ分享' ],
			'addCancelButtonWithLabel' : '取消',
			'androidEnableCancelButton' : true,
			'position' : [ 20, 40 ]
		};
		window.plugins.actionsheet.show(options, this.callback);
	};

	Model.prototype.showNoTitle = function(event) {
		var options = {
			'buttonLabels' : [ '微信分享', 'QQ分享' ]
		};
		window.plugins.actionsheet.show(options, this.callback);
	};

	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this, "showWithTitleClick").showCode( "showNoTitle").prettyPrint();
	};

	return Model;
});