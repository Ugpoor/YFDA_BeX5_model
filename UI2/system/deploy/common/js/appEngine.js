define(function(require) {
	var templateService = require("$UI/system/templates/common/js/templateService");

	var appEngine = function(reqURL) {
		this.constructor(reqURL);
	};

	appEngine.prototype = {

		constructor : function(reqURL) {
			this.reqURL = reqURL;
			this.config = {};
		},

		loadConfig : function(projectName) {
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
					alert('加载应用配置失败，请检查目录“Native\\' + projectName + '”是否正常');
				}
			});
		},

		getPlugins : function(projectName) {
			var plugins = $.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/app/getRegPlugins.j?projectName=' + projectName),
				success : function(result) {
				},
				error : function(xhr, status, err) {
					alert('加载应用配置失败，请检查目录“Native\\' + projectName + '”是否正常');
				}
			});

			return plugins.responseJSON;
		},

		getDownloadInfo : function(projectName, appName) {
			var downloadInfo = $.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/package/getDownloadInfo.j?projectName=' + projectName + '&appName=' + appName),
				success : function(result) {
				},
				error : function(xhr, status, err) {
					alert('获取App下载信息失败');
				}
			});

			return downloadInfo.responseJSON;
		},

		getConfig : function() {
			return this.config;
		},

		build : function(async, checkStatusURL) {
			var self = this;
			$.ajax({
				async : async === true,
				data : JSON.stringify(this.getConfig()),
				dataType : 'json',
				contentType : 'application/json',
				processData : false,
				type : 'POST',
				url : require.toUrl(this.reqURL),
				success : function(result) {
					/* pack 时间太长， safari下60s会报错，这里直接返回并通过checkPacking监测 */
					if (result.code === 'BUSY') {
						var refreshID = window.setInterval(function() {
							var result = $.ajax({
								async : false,
								data : {},
								dataType : 'json',
								contentType : 'application/json',
								processData : false,
								type : 'POST',
								url :require.toUrl(checkStatusURL ? checkStatusURL : "$UI/system/deploy/package/checkPacking.j") 
							}).responseJSON;
							if (result.code !== 'BUSY') {
								window.clearInterval(refreshID);
								if (self.buildFinishedNotify) {
									self.buildFinishedNotify(result);
								}
							}

						}, 2000);
					} else {
						if (self.buildFinishedNotify) {
							self.buildFinishedNotify(result);
						}
					}
				},
				error : function(xhr, status, err) {
					if (self.buildFinishedNotify) {
						self.buildFinishedNotify({
							flag : false,
							message : err
						});
					}
				}
			});
		},

		closeDialog : function() {
			templateService.closeDialog();
		}

	};

	return appEngine;
});
