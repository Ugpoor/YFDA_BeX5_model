define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("$UI/system/lib/cordova/cordova");
	require("cordova!cordova-plugin-camera");
	require("cordova!cordova-plugin-file-opener2");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.openFileClick = function(event) {
		// /storage/sdcard1/微云保存的文件/JavaScript完全学习手册.pdf application/pdf  image/vnd.ms-photo
		// 第一个参数为文件路径，第二个参数为文件的MIMEType
		var data = this.comp("data");
		var imgURI = data.getValue("imageURI");
		if (!imgURI) {
			justep.Util.hint("请先拍照");
			return false;
		}
		cordova.plugins.fileOpener2.open(imgURI, "image/vnd.dece.graphic", {
			error : function() {
				justep.Util.hint("打开应用失败！");
			},
			success : function() {
				justep.Util.hint("打开应用成功！");
			}
		});
	};

	Model.prototype.uninstallClick = function(event) {
		var unpackageId = this.comp("data").getValue("unpackageId");
		if (!unpackageId) {
			return false;
		}
		cordova.plugins.fileOpener2.uninstall(unpackageId, {
			error : function(err) {
				justep.Util.hint('Error status: ' + e.status + ' - Error message: ' + e.message);
			},
			success : function() {
				justep.Util.hint("uninstall successfully");
			}
		})
	};

	Model.prototype.checkappinstallClick = function(event) {
		var ispackageid = this.comp("data").val("ispackageid");
		cordova.plugins.fileOpener2.appIsInstalled(ispackageid, {
			success : function(res) {
				if (res.status === 0) {
					justep.Util.hint('该app不存在');
				} else {
					justep.Util.hint('该app存在');
				}
			}
		});
	};

	Model.prototype.takePhoneClick = function(event) {
		var data = this.comp("data");
		function onSuccess(imageURI) {
			data.setValue("imageURI", imageURI);
		}
		function onFail(message) {
			justep.Util.hint("失败：" + message);
		}
		navigator.camera.getPicture(onSuccess, onFail, {
			quality : 50
		});
	};

	return Model;
});