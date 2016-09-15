define(function(require) {
	require("cordova!cordova-plugin-media");
	require("cordova!cordova-plugin-file");
	require("cordova!cordova-plugin-file-transfer");
	require("cordova!cordova-plugin-device");

	var Utils = require("./utils");
	var base = require('./base');
	var Object = require('$UI/system/lib/base/object');
	var Voice = Object.extend({
		constructor : function() {
			base.init([ 'startRecord', 'stopRecord', 'onVoiceRecordEnd', 'playVoice', 'pauseVoice', 'stopVoice', 'onVoicePlayEnd', 'uploadVoice', 'downloadVoice' ]);
			this.mediaRec = null;
			this.onVoicePlayEndCallback = null;
			this.onVoiceRecordEndCallback = null;
			this.onVoiceRecord = false;
		},
		startRecord : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.startRecord.call(this, param);
			} else if(window.cordova){
				var self = this;
				if (self.onVoiceRecord) {
					return;
				}
				;
				self.onVoiceRecord = true;

				var fileName = justep.Date.toString(new Date(), "yyyyMMddhhmmss") + ".wav";
//				var dtd = Utils.getCacheDirectoryPath(fileName);
//				dtd.done(function(fullName) {
//					fileName = fullName;
//					self.mediaRec = new Media(fileName, function(ref) {
//						Utils.successCallback(self, param, {
//							errMsg : "startRecord:ok",
//							"fileName" : [ ref ]
//						});
//					}, function(err) {
//						Utils.errorCallback(self, param, {
//							errMsg : "startRecord:fail",
//							"resultStr" : JSON.stringify(err)
//						});
//					});
//					self.mediaRec.startRecord();
//					setTimeout(function() {
//						if (self.onVoiceRecord && self.onVoiceRecordEndCallback) {
//							self.onVoiceRecordEndCallback({
//								"localId" : fileName
//							});
//						}
//						;
//						if (self.onVoiceRecord) {
//							self.onVoiceRecord = false;
//							self.mediaRec.stopRecord();
//						}
//					}, 60000);
//				}).fail(function(err) {
//					Utils.errorCallback(self, param, {
//						errMsg : "startRecord:fail",
//						"resultStr" : JSON.stringify(err)
//					});
//				});
				var fullName = Utils.getCacheDirectoryPath(fileName);
				if (fullName){
					fileName = fullName;
					self.mediaRec = new Media(fileName, function(ref) {
						Utils.successCallback(self, param, {
							errMsg : "startRecord:ok",
							"fileName" : [ ref ]
						});
					}, function(err) {
						Utils.errorCallback(self, param, {
							errMsg : "startRecord:fail",
							"resultStr" : JSON.stringify(err)
						});
					});
					self.mediaRec.startRecord();
					setTimeout(function() {
						if (self.onVoiceRecord && self.onVoiceRecordEndCallback) {
							self.onVoiceRecordEndCallback({
								"localId" : fileName
							});
						}
						;
						if (self.onVoiceRecord) {
							self.onVoiceRecord = false;
							self.mediaRec.stopRecord();
						}
					}, 60000);
				}else{
					Utils.errorCallback(self, param, {
						errMsg : "startRecord:fail",
						"resultStr" : "fullName nil"
					});
				}
			}
		},

		stopRecord : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.stopRecord.call(this, param);
			} else if(window.cordova){
				var self = this;
				if (!self.mediaRec) {
					Utils.errorCallback(self, param, {
						errMsg : "stopRecord:fail",
						"resultStr" : "missing mediaRec"
					});
					return;
				}
				;
				self.mediaRec.stopRecord();
				self.onVoiceRecord = false;
				Utils.successCallback(self, param, {
					errMsg : "stopRecord:ok",
					'localId' : self.mediaRec.src
				});
			}
		},

		onVoiceRecordEnd : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.onVoiceRecordEnd.call(this, param);
			} else if(window.cordova){
				this.onVoiceRecordEndCallback = param.complete;
			}
			;
		},

		playVoice : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.playVoice.call(this, param);
			} else if(window.cordova){
				var self = this;
				var id = param && param.localId || null;
				if (!id) {

					Utils.errorCallback(self, param, {
						errMsg : "playVoice:fail",
						"resultStr" : "missing mediaRec"
					});
					return;
				}
				this.mediaRec = new Media(id, function(optio) {
					if (self.onVoicePlayEndCallback) {
						self.onVoicePlayEndCallback({
							"localId" : id,
							errMsg : "playVoice:ok"
						});
					}
					;
				}, function(err) {
					Utils.errorCallback(self, param, {
						errMsg : "playVoice:fail",
						"resultStr" : JSON.stringify(err)
					});
				});
				this.mediaRec.play();
			}
		},
		pauseVoice : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.pauseVoice.call(this, param);
			} else if(window.cordova){
				if (!this.mediaRec) {
					Utils.errorCallback(self, param, {
						errMsg : "pauseVoice:fail",
						"resultStr" : "missing mediaRec"
					});
				} else {
					this.mediaRec.pause();
				}
			}
			;
		},
		stopVoice : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.stopVoice.call(this, param);
			} else if(window.cordova){
				if (!this.mediaRec) {
					Utils.errorCallback(self, param, {
						errMsg : "stopVoice:fail",
						"resultStr" : "missing mediaRec"
					});
				} else {
					this.mediaRec.stop();
				}
			}
			;
		},
		onVoicePlayEnd : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.onVoicePlayEnd.call(this, param);
			} else {
				this.onVoicePlayEndCallback = param.complete;
			}
			;
		},
		uploadVoice : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.uploadVoice.call(this, param);
			} else if(window.cordova){
				var self = this;
				var localId = param && param.localId;
				if (!localId) {
					Utils.errorCallback(self, param, {
						errMsg : "uploadVoice:fail",
						"resultStr" : "miss localId"
					});
					return;
				}
				;
				if ((localId === (this.mediaRec && this.mediaRec.src || "")) && this.onVoiceRecord) {
					return;
				}
				;
				if (localId === (self.mediaRec && self.mediaRec.src)) {
					self.mediaRec && self.mediaRec.release();
				}
				;
				var filename = localId.substring(localId.lastIndexOf("/") + 1);
				function successCallback(res) {
					Utils.successCallback(self, param, {
						'serverId' : JSON.stringify({
							"ownerID" : device.uuid,
							"storeFileName" : filename,
							"realFileName" : filename
						}),
						'errMsg' : "uploadVoice:ok"
					});
				}
				;
				function failCallback(res) {
					Utils.errorCallback(self, param, {
						errMsg : "stopVoice:fail",
						"resultStr" : JSON.stringify(res)
					});
				}
				;

				var ft = new FileTransfer();
				var params = {};
				params.fileName = filename;
				params.storeFileName = filename;
				params.ownerID = device.uuid;
				ft.upload(localId, location.origin + require.toUrl(base.config.uploadActionUrl), successCallback, failCallback, {
					"fileName" : filename,
					"params" : params
				});

			}
			;
		},
		downloadVoice : function(param) {
			var wx = base.getWx();
			if (wx) {
				wx.downloadVoice.call(this, param);
			} else if(window.cordova){
				var self = this;
				var serverId = param && param.serverId;
				if (!serverId) {

					Utils.errorCallback(self, param, {
						errMsg : "downloadVoice:fail",
						"resultStr" : "miss serverId"
					});
					return;

				}
				;
				var serverInfo = JSON.parse(serverId);
				var source = location.origin + require.toUrl(base.config.uploadActionUrl) + "?";
				var requestParam = "realFileName=" + serverInfo.realFileName + "&storeFileName=" + serverInfo.storeFileName + "&ownerID=" + serverInfo.ownerID + "&operateType=" + "download";

//				var dtd =  Utils.getCacheDirectoryPath(serverInfo.realFileName);
//				dtd.done(function(fullName) {
//					var ft = new FileTransfer();
//					ft.download(source + requestParam, fullName, function(entry) {
//						Utils.successCallback(self, param, {
//							'localId' : fullName,
//							'errMsg' : "downloadVoice:ok"
//						});
//					}, function(err) {
//						Utils.errorCallback(self, param, {
//							'errMsg' : "downloadVoice:fail",
//							'resultStr' : JSON.stringify(err)
//						});
//					});
//				}).fail(function(err) {
//					Utils.errorCallback(self, param, {
//						'errMsg' : "downloadVoice:fail",
//						'resultStr' : JSON.stringify(err)
//					});
//				});
				var fullName =  Utils.getCacheDirectoryPath(serverInfo.realFileName);
				if (fullName) {
					var ft = new FileTransfer();
					ft.download(source + requestParam, fullName, function(entry) {
						Utils.successCallback(self, param, {
							'localId' : fullName,
							'errMsg' : "downloadVoice:ok"
						});
					}, function(err) {
						Utils.errorCallback(self, param, {
							'errMsg' : "downloadVoice:fail",
							'resultStr' : JSON.stringify(err)
						});
					});
				}else{
					Utils.errorCallback(self, param, {
						'errMsg' : "downloadVoice:fail",
						'resultStr' : "fullName nil"	
					});
				}

			}
		},
	});
	return new Voice();
});
