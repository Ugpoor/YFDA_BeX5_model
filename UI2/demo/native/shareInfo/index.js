define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("cordova!cordova-plugin-x-socialsharing");


	var Model = function() {
		this.callParent();
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	// 功能目录
	Model.prototype.popMenuBtnClick = function(event) {
		this.comp("popMenu").show();
	};


	Model.prototype.shareClick = function(event){
		var url = window.location.href;
		plugins.socialsharing.share("起步科技", null, null, url);
	};



	return Model;
});