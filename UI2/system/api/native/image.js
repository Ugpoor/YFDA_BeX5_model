define(function(require) {
	require("cordova!cordova-plugin-camera");
	require("cordova!cordova-plugin-file");
	require("cordova!cordova-plugin-file-transfer");
	require("cordova!cordova-plugin-device");
	require("cordova!cordova-plugin-filepath");
	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var Image = Object.extend({
		constructor : function() {
			base.init([ 'chooseImage', 'previewImage', 'uploadImage', 'downloadImage' ]);
		},

		chooseImage : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.chooseImage.call(this, param);
			} else if (window.cordova) {
				var self = this;
				function getLocalPath(imageURI) {
					if (imageURI.indexOf('content:') == 0) {
						FilePath.resolveNativePath(imageURI, function(filePath) {
							Utils.successCallback(self, param, {
								errMsg : "chooseImage:ok",
								"localIds" : [ filePath ]
							});
						}, function(data) {
							Utils.errorCallback(self, param, {
								errMsg : "chooseImage:fail",
								'resultStr' : JSON.stringify(data)
							});
						});
					} else {
						Utils.successCallback(self, param, {
							errMsg : "chooseImage:ok",
							"localIds" : [ imageURI ]
						});
					}
					;
				}
				;
				navigator.camera.getPicture(getLocalPath, function(res) {
					Utils.errorCallback(self, param, {
						errMsg : "chooseImage:fail"
					});
				}, {
					"sourceType" : 0,
					"destinationType" : 1,
					"encodingType" : 0,
					"mediaType" : 0,
					"quality" : 0,
					"allowEdit" : false,
					"correctOrientation" : true,
					"saveToPhotoAlbum" : true
				});

			}
		},
		previewImage : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.previewImage.call(this, param);
			} else if (window.cordova) {
				Utils.successCallback(this, param, {
					'errMsg' : 'previewImage : ok',
					'resultStr' : "previewImage come soon !"
				});
			}
		},
		uploadImage : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.uploadImage.call(this, param);
			} else if (window.cordova) {
				var self = this;
				var localId = param && param.localId;
				if ((!localId)) {
					Utils.errorCallback(self, param, {
						'errMsg' : "uploadImage:fail",
						'resultStr' : "localId missing !"
					});
					return;
				}
				;

				var filename = localId.substring(localId.lastIndexOf("/") + 1);

				var successCallback = function(res) {
					Utils.successCallback(self, param, {
						'serverId' : JSON.stringify({
							"ownerID" : device.uuid,
							"storeFileName" : filename,
							"realFileName" : filename
						}),
						'errMsg' : "uploadImage:ok"
					});
				};
				var failCallback = function(res) {
					Utils.errorCallback(self, param, {
						'errMsg' : "uploadImage:fail",
						'resultStr' : res
					});
				};

				var ft = new FileTransfer();
				var params = {};
				params.fileName = filename;
				params.storeFileName = filename;
				params.ownerID = device.uuid;
				ft.upload(localId, location.origin + require.toUrl(base.config.uploadActionUrl), successCallback, failCallback, {
					"fileName" : filename,
					"params" : params
				})

			}
		},
		downloadImage : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.downloadImage.call(this, param);
			} else if (window.cordova) {
				var self = this;
				var serverId = param && param.serverId;
				var serverInfo = JSON.parse(serverId);
				var source = location.origin + require.toUrl(base.config.uploadActionUrl) + "?";
				var requestParam = "realFileName=" + serverInfo.realFileName + "&storeFileName=" + serverInfo.storeFileName + "&ownerID=" + serverInfo.ownerID + "&operateType=" + "download";

				var fullName = Utils.getCacheDirectoryPath(serverInfo.realFileName);
				var ft = new FileTransfer();
				ft.download(source + requestParam, fullName, function(entry) {
					ft.saveToAlbum(fullName, function(re) {
						Utils.successCallback(self, param, {
							'localId' : fullName,
							'errMsg' : "downloadImage:ok"
						});
					});
				}, function(err) {
					Utils.errorCallback(self, param, {
						'errMsg' : "downloadImage:fail",
						'resultStr' : err
					});
				});
			}
		},
		httpToAlbum : function(param) {
			var wx = base.getWx();
			if (wx) {
			} else if (window.cordova) {
				var self = this;
				var serverId = param && param.serverId;
				var filename = serverId.substring(serverId.lastIndexOf("/") + 1);
//				var dtd = Utils.getCacheDirectoryPath(filename);
//				dtd.done(function(fullName) {
//					var ft = new FileTransfer();
//					ft.download(serverId, fullName, function(entry) {
//						ft.saveToAlbum(fullName, function(re) {
//							Utils.successCallback(self, param, {
//								'localId' : re,
//								'errMsg' : "downloadImage:ok"
//							});
//						});
//					}, function(err) {
//						Utils.errorCallback(self, param, {
//							'errMsg' : "downloadImage:fail",
//							'resultStr' : err
//						});
//					});
//				}).fail(function(err) {
//					Utils.errorCallback(self, param, {
//						'errMsg' : "downloadImage:fail",
//						'resultStr' : err
//					});
//				});
				var fullName = Utils.getCacheDirectoryPath(filename);
				if (fullName){
					var ft = new FileTransfer();
					ft.download(serverId, fullName, function(entry) {
						ft.saveToAlbum(fullName, function(re) {
							Utils.successCallback(self, param, {
								'localId' : re,
								'errMsg' : "downloadImage:ok"
							});
						});
					}, function(err) {
						Utils.errorCallback(self, param, {
							'errMsg' : "downloadImage:fail",
							'resultStr' : err
						});
					});
				}else{
					Utils.errorCallback(self, param, {
						'errMsg' : "downloadImage:fail",
						'resultStr' : "fullName nil"
					});
				}
			}
		},


	});
	return new Image();

});
