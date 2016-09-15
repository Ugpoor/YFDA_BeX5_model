define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require("cordova!cordova-plugin-file");
	require("cordova!cordova-plugin-fastrde-downloader");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.initdownloaderClick = function(event) {
		var fileName = downloader.get("http://yourhost.de/some.zip", "3f4ea2219aa321ef5cd3143ea33076ab");
		justep.Util.hint("文件"+fileName + "下载成功");
	};

	Model.prototype.multidownClick = function(event) {
		var fileNames = downloader.getMultipleFiles([ {
			url : "http://yourhost.de/some1.zip"
		}, {
			url : "http://yourhost.de/some2.zip"
		}, {
			url : "http://yourhost.de/some3.zip"
		} ]);
		justep.Util.hint("文件some1.zip,some2.zip,some3.zip下载成功!");
	};

	Model.prototype.modelLoad = function(event) {
		downloader.init({
			folder : "apptest",
			unzip : true,
			check : true

		});
	};

	Model.prototype.button1Click = function(event){
		var isInitialized = window.downloader.isInitialized();
		justep.Util.hint("isInitiallized:"+isInitialized);
	};

	return Model;
});