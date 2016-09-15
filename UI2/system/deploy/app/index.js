/* ------------------------------------------------------------ 
向导主调度

主页面（wizard）接口：
	openPage = function(params)
	back = function(currentModel)
	refreshWizardPageStatus = function()

子页面接口:
	getTitle = function(wizard)
	hasCancelBtn = function(wizard)
	hasBackBtn = function(wizard)		
	hasNextBtn = function(wizard)
	hasFinishBtn = function(wizard)
	nextPage = function(wizard)
	finish = function(wizard)
------------------------------------------------------------ */

define(function(require) {
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var bind = require("bind");
	var Component = require("$UI/system/lib/base/component");
	var WindowContainer = require("$UI/system/components/justep/windowContainer/windowContainer");
	var AppEngine = require("$UI/system/deploy/common/js/appEngine");
	var webSocket = require("$UI/system/components/designerCommon/js/webSocketMng");
	var templateService = require("$UI/system/templates/common/js/templateService");
	var xpaas = require("$UI/system/deploy/paas/xpaas");

	var Model = function() {
		this.callParent();
		this.title = bind.observable("");
		this.hasCancelBtn = bind.observable(true);
		this.hasBackBtn = bind.observable(false);
		this.hasNextBtn = bind.observable(true);
		this.hasFinishBtn = bind.observable(false);
		this.currentContainer = null;
		this.pageIdx = 0;
	};

	Model.prototype.login = function(token) {
		var config = this.appEngine.getConfig();
		if (token && token !== "") {
			xpaas.login(token, function success(paasToken) {
				config.paasToken = paasToken;
			}, function fail(msg) {
				// alert("登录失败，原因："+msg);
				config.paasToken = "";
			});
		} else {
			// alert("未登录将无法使用CloudX5相关功能");
			config.paasToken = "";
		}
	};

	Model.prototype.modelLoad = function(event) {
		this.edit = webSocket.getRequestParameter("edit") == 'true';
		this.appEngine = new AppEngine('$UI/system/deploy/app/createApp.j' + (this.edit ? '?edit=true' : ''));
		this.targetPath = webSocket.getRequestParameter("targetPath");
		this.nativePath = templateService.getNativePath();
		if (this.edit) {
			var appPath = this.targetPath.substr(this.nativePath.length + 1);
			appPath = appPath.replace(/\\/g, '/');
			var projectName = appPath.split('/')[0];
			this.appEngine.loadConfig(projectName);
		}
		var config = this.appEngine.getConfig();
		if (this.edit) {
			this.comp("appName").val(config.appName);
		} else {
			config.appID = justep.UUID.createUUID();
			config.genAndroid = true;
			config.genIOSDis = true;
			config.compileUI = true;
			config.platform = "android";
			config.releaseMode = "release";
		}
		var self = this;
		this.appEngine.buildFinishedNotify = function(result) {
			self.buildFinished = true;
			self.buildResult = result;
			if (self.buildFinishedNotify) {
				self.buildFinishedNotify(result);
			}
			if (result.flag && result.code != "ERROR") {
				templateService.refreshFile(self.nativePath);
				templateService.selectFile(self.nativePath + '/' + self.appEngine.getConfig().projectName);
			}
		};
		var token = self.getContext().getRequestParameter("token");
		$.ajax({
			async : false,
			contentType : 'application/json',
			processData : false,
			type : 'GET',
			url : require.toUrl('$UI/system/deploy/paas/xPaasInfo.j?option=set&paasConsoleURL=' + templateService.getXCloudConsoleUrl()),
			success : function(result) {
				self.login(token);
				self.openPage({
					id : "selectMode",
					url : "selectMode.w",
					fromId : "index"
				});
			},
			error : function(xhr, status, err) {
				self.openPage({
					id : "selectMode",
					url : "selectMode.w",
					fromId : "index"
				});
			}
		});
	};

	/*
	 * @param {Object} 形如：{url: url, id: id, fromId: formId, refresh: false)
	 * @returns {void}
	 */
	Model.prototype.openPage = function(params) {
		var containers = $(".container");
		for (var i = 0; i < containers.length; i += 1) {
			containers[i].style.display = "none";
		}
		var id = params.id || "page_" + (this.pageIdx++);
		var refresh = params.refresh;
		var fromId = params.fromId;
		var containerNode = document.getElementById(id);
		if (!containerNode) {
			this.currentContainer = this._createContainer(id, params.url, fromId);
			containerNode = this.currentContainer.domNode;
		} else {
			this.currentContainer = Component.getComponent(containerNode);
			if (refresh) {
				this.currentContainer.refresh(null, null, true);
			} else {
				this._initWizardPage(this.currentContainer);
			}
		}
		containerNode.style.display = "block";
		if (this.currentContainer.getInnerModel() && this.currentContainer.getInnerModel().init) {
			this.currentContainer.getInnerModel().init();
		}
	};

	Model.prototype.back = function(currentModel) {
		var fromId = currentModel.getContext().getRequestParameter("fromId");
		this.openPage({
			id : fromId
		});
	},

	Model.prototype.refreshWizardPageStatus = function() {
		this._initWizardPage(this.currentContainer);
	};

	Model.prototype.finish = function() {
		var config = this.appEngine.getConfig();
		if (!config.appName) {
			alert("“应用名”不能为空");
			return;
		}

		var appDir = this.nativePath + "/" + config.projectName;
		if ((!this._confirmFileExistsNeeded(appDir) || confirm("新建的应用名“" + config.projectName + "”已经存在，是否覆盖？如果覆盖原始目录将清空。")) && this.currentContainer.getInnerModel().finish(this)) {
			this.appEngine.build(true);
		}
	};

	Model.prototype._containerLoaded = function(event) {
		this._initWizardPage(event.source);

	};

	Model.prototype._initWizardPage = function(container) {
		this.title.set(container.getInnerModel().getTitle());
		this.hasBackBtn.set(container && container.getInnerModel().hasBackBtn());
		this.hasNextBtn.set(container && container.getInnerModel().hasNextBtn());
		this.hasFinishBtn.set(container && container.getInnerModel().hasFinishBtn());
	};

	Model.prototype._createContainer = function(id, src, fromId) {
		src = require.toUrl(src + (src.indexOf("?") != -1 ? "&" : "?") + "id=" + id + (fromId ? ("&fromId=" + fromId) : ""));
		var container = new WindowContainer({
			parentNode : this.getElementByXid("containerParent"),
			src : src,
			onLoad : this._containerLoaded.bind(this)
		});
		$(container.domNode).attr('id', id);
		$(container.domNode).addClass('container');
		return container;
	};

	Model.prototype._confirmFileExistsNeeded = function(appDir) {
		return !this.edit && templateService.fileExists(appDir);
	};

	Model.prototype.cancelBtnClick = function(event) {
		this.appEngine.closeDialog();
	};

	Model.prototype.backBtnClick = function(event) {
		if (this.currentContainer.getInnerModel().backPage) {
			this.currentContainer.getInnerModel().backPage(this);
		}
		this.back(this.currentContainer.getInnerModel());
	};

	Model.prototype.nextBtnClick = function(event) {
		if (this.currentContainer.getInnerModel()) {
			this.currentContainer.getInnerModel().nextPage(this);
		}
	};

	Model.prototype.finishBtnClick = function(event) {
		var config = this.appEngine.getConfig();
		config.appName = this.comp("appName").get("value");
		if (!this.edit) {
			config.projectName = config.appName;
		}
		this.finish();
	};

	Model.prototype.openAppWiz = function(wizard) {
		var href = window.location.href;
		var url = href.substring(href.indexOf("?") + 1);
		var params = url.split("&");
		for (var i = 0; i < params.length; i++) {
			if (params[i].indexOf('targetPath=') === 0) {
				params[i] = 'targetPath=' + this.nativePath + '/' + this.appEngine.getConfig().projectName;
				break;
			}
		}
		window.location.href = "../package/index.w?" + params.join('&');
	};

	return Model;
});
