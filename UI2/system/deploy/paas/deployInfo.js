define(function(require) {
	var xpaas = require("$UI/system/deploy/paas/xpaas");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.xpaas = xpaas;
		this.enableBaas = true;
		this.enableUI = true;
		this.enableAPP = true;

		this.baasPublish = justep.Bind.observable(true);
		this.uiPublish = justep.Bind.observable(true);
		this.sqlPublish = justep.Bind.observable(true);
		this.appPublish = justep.Bind.observable(true);

		this.baasPublished = justep.Bind.observable(0);
		this.uiPublished = justep.Bind.observable(0);
		this.sqlPublished = justep.Bind.observable(0);
		this.appPublished = justep.Bind.observable(0);

		this.compileBaaS = justep.Bind.observable(true);
		this.compileUI = justep.Bind.observable(true);
		this.packApp = justep.Bind.observable(true);

	};

	Model.prototype.modelLoad = function(event) {
		this.appEngine = this.getParent().appEngine;
		this.getParent().comp("cancelBtn").set({
			label : "关闭"
		});
		this.getParent().comp("finishBtn").set({
			label : "部署"
		});
		var self = this;
		xpaas.loadAppByID(this.appEngine.getConfig().paasServiceID, function(res) {
			if (res && res.object) {
				xpaas.cloud = res.object;
				xpaas.config.paasDistFiles = xpaas.cloud.dist || "";
				self.comp('serverURL').set({
					value : xpaas.config.serverURL + (('1' == xpaas.cloud.deployState) ? "" : "【未部署】")
				});
				self.baasPublish.set(xpaas.baas.published());
				self.sqlPublish.set(xpaas.sql.published());
				self.appPublish.set(xpaas.app.published());

				self.baasPublished.set(xpaas.baas.published() ? 1 : 0);
				self.uiPublished.set(xpaas.ui.published() ? 1 : 0);
				self.sqlPublished.set(xpaas.sql.published() ? 1 : 0);
				self.appPublished.set(xpaas.app.published() ? 1 : 0);

				self.fileExistBaas = xpaas.baas.fileExist();
				self.fileExistAPP = xpaas.app.fileExist();
				self.fileExistWWW = xpaas.ui.fileExist();

				self.getParent().hasDownloadBtn.set('1' == xpaas.cloud.deployState ? true : false);
				self.getParent().hasFinishBtn.set(true);
			} else {
				self.comp('serverURL').set({
					value : "当前Web服务地址没有关联到CloudX5，如需部署到CloudX5，请在“编辑本地App”里面设置正确的Web服务地址。"
				});
				self.comp('serverURL').domNode.style.color = 'red';
			}
		}, function(err) {
			self.comp('serverURL').set({
				value : "当前Web服务地址没有关联到CloudX5，如需部署到CloudX5，请在“编辑本地App”里面设置正确的Web服务地址。"
			});
			self.comp('serverURL').domNode.style.color = 'red';
		})
	};

	Model.prototype.hasBackBtn = function(wizard) {
		return false;
	};

	Model.prototype.hasNextBtn = function(wizard) {
		return false;
	};

	Model.prototype.downloadPage = function(wizard) {
		this.getParent().openPage({
			id : "downloadApp",
			url : "downloadApp.w",
			fromId : "deployInfo"
		});
	};

	Model.prototype.finish = function() {
		if (!this.__comfirm()) {
			return;
		}
		this.__setConfig();
		this.getParent().openPage({
			id : "waittingDialog",
			url : "waittingDialog.w?",
			fromId : "deployInfo"
		});
		return true;
	};

	Model.prototype.getTitle = function(wizard) {
		return '选择部署的资源';
	};

	Model.prototype.__setConfig = function() {
		var config = this.appEngine.getConfig();
		config.paasDistFiles = "";

		if (this.baasPublish.get()) {
			config.paasDistFiles = xpaas.baas.name;
			config.compileBaaS = true;
		} else {
			config.compileBaaS = false;
		}

		if (this.uiPublish.get()) {
			var ui = xpaas.ui.name;
			config.paasDistFiles = config.paasDistFiles.length == 0 ? ui : config.paasDistFiles + "," + ui;
			if (config.model == '3') {
				config.compileUI = true;
			} else {
				config.compileUI = false;
			}
		} else {
			config.compileUI = false;
		}
		if (this.appPublish.get()) {
			config.paasDistFiles = config.paasDistFiles.length == 0 ? xpaas.app.name : config.paasDistFiles + "," + xpaas.app.name;
			config.packApp = false;
		} else {
			config.packApp = false;
		}
		if (this.sqlPublish.get()) {
			config.paasDistFiles = config.paasDistFiles.length == 0 ? xpaas.sql.name : config.paasDistFiles + "," + xpaas.sql.name
		}
	}
	Model.prototype.__comfirm = function() {
		var config = this.appEngine.getConfig();
		if (config.mode == '4') {
			alert("模式4不支持CloudX5");
			return false;
		}
		if (!config.paasServiceID || "" === config.paasServiceID) {
			alert("当前服务地址不是CloudX5服务，请先在 “编辑本地App” 中配置CloudX5信息");
			return false;
		}

		if (!this.baasPublish.get() && !this.uiPublish.get() && !this.sqlPublish.get() && !this.appPublish.get()) {
			alert("请选择要部署的资源");
			return false;
		}

		if (config.mode == '1' || config.mode == '2') {
			if (this.uiPublish.get() && !this.fileExistWWW) {
				alert("请先执行“编译使用到的UI资源”生成www" + config.webPath + "目录，才能部署UI");
				return false;
			}
		}

		if (this.appPublish.get() && !this.fileExistAPP) {
			alert("请先执行“生成本地App包”，才能发布App");
			return false;
		}

		if (!xpaas.ui.published() && !this.uiPublish.get()) {
			alert("请部署UI资源，才能正常启动服务！");
			return false;
		}
		return true;
	}

	Model.prototype.baasPublishChange = function(event) {

	};

	Model.prototype.uiPublishChange = function(event) {

	};

	Model.prototype.appPublishChange = function(event) {

	};

	return Model;
});
