define([ 'require', '$UI/system/lib/base/observable', '$UI/system/lib/base/object', '$UI/system/templates/common/js/templateService', '$UI/system/components/designerCommon/js/webSocketMng' ],
		function(require, Observable, Object, templateService, webSocket) {
			var targetPath = webSocket.getRequestParameter("targetPath");
			var nativePath = templateService.getNativePath();
			var appPath = targetPath.substr(nativePath.length + 1);
			appPath = appPath.replace(/\\/g, '/');
			var projectName = appPath.split('/')[0];

			var XPaaS = Object.extend({
				mixins : Observable,
				constructor : function() {
					var self = this;
					this.callParent();
					Observable.prototype.constructor.call(this);
					self.__loadConfig(projectName);

					if (!self.config) {
						return;
					}

					var appPath = nativePath + "/" + projectName + "/";
					this.baas = {
						"name" : "baas.java.tar.gz",
						"file" : appPath + "dist/paas/baas.java.tar.gz",
						"published" : function() {
							return self.config.paasDistFiles.indexOf(this.name) > -1; // todo
						},
						"fileExist" : function() {
							return templateService.fileExists(appPath + "dist/paas/" + this.name)
						},

					};
					this.ui = {
						"name" : self.config.mode == '3' ? "model.tar.gz" : "www.tar.gz",
						"published" : function() {
							return self.config.paasDistFiles.indexOf(this.name) > -1;
						},
						"fileExist" : function() {
							var exist = self.config.mode == '3' ? true : templateService.fileExists(appPath + "www" + self.config.webPath + "/www.zip");
							return exist;
						},
					};
					this.app = {
						"name" : "app.tar.gz",
						"file" : appPath + "dist/paas/app.tar.gz",
						"published" : function() {
							return self.config.paasDistFiles.indexOf(this.name) > -1;
						},
						"fileExist" : function() {
							return templateService.fileExists(appPath + "dist/app.apk") || templateService.fileExists(appPath + "dist/app.ipa")
						},

					};
					this.sql = {
						"name" : "sql.tar.gz",
						"published" : function() {
							return self.config.paasDistFiles.indexOf(this.name) > -1;
						}
					};
				},
				__loadConfig : function(projectName) {
					var self = this;
					$.ajax({
						async : false,
						contentType : 'application/json',
						processData : false,
						type : 'GET',
						url : require.toUrl('$UI/system/deploy/app/getAppConfig.j?projectName=' + projectName),
						success : function(result) {
							self.config = result;
						},
						error : function(xhr, status, err) {
							debugger;
						}
					});
				},
				__requestUIserver : function(url, successCallback, failCallback, async) {
					var self = this;
					var data = $.ajax({
						async : async === false ? false : true,
						contentType : 'application/json',
						processData : false,
						type : 'GET',
						url : require.toUrl(url),
						success : function(result) {
							successCallback && successCallback(result);
						},
						error : function(xhr, status, err) {
							failCallback && failCallback(err);
						}
					});
					return data.responseJSON;
				},

				login : function(token, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=login&token=' + token, function(result) {
						if (result.paasToken) {
							successCallback(result.paasToken);
						} else {
							failCallback && failCallback(result.msg);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					}, false)
				},

				checkApp : function(path, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=checkApp&path=' + path, function(result) {
						successCallback(result);
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				loadProject : function(successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadProject', function(result) {
						if (result.totalNum > 0) {
							successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},
				loadProjectByServiceID : function(serviceID, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadProject&serviceID=' + serviceID, function(result) {
						if (result.success == true) {
							successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				loadApp : function(projectId, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadApp&projectId=' + projectId, function(result) {
						if (result.totalNum > 0) {
							successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				loadAppByID : function(paasServiceID, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=loadApp&paasServiceID=' + paasServiceID, function(result) {
						if (result.success == true) {
							successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				checkState : function(serviceID, successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=state&serviceID=' + serviceID, function(result) {
						if (result.object) {
							successCallback(result.object);
						} else {
							failCallback && failCallback(result.msg);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},

				templateInfo : function(successCallback, failCallback) {
					this.__requestUIserver('$UI/system/deploy/paas/xPaasInfo.j?option=templateInfo', function(result) {
						if (result.success == true) {
							successCallback(result);
						} else {
							failCallback && failCallback(result);
						}
					}, function(xhr, status, err) {
						failCallback && failCallback(err);
					})
				},
			});
			return new XPaaS();
		});
