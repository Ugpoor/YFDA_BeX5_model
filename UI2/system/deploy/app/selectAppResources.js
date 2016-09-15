define(function(require) {
	var loadTreeJs = require("$UI/system/components/designerCommon/tree/tree");
	var templateService = require("$UI/system/templates/common/js/templateService");
	var xpaas = require("$UI/system/deploy/paas/xpaas");

	loadTreeJs($);

	var TemplateType = {
		"JAVA" : "5",
		"UISERVER" : "2"
	};

	var Model = function() {
		this.callParent();
		this.xpaas = xpaas;

	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		this.appEngine = this.getParent().appEngine;
		var config = this.appEngine.getConfig();
		this.paasToken = config.paasToken;
		if (this.paasToken) {
			self.paasSelected = (config.paasServiceID && "" !== config.paasServiceID) ? true : false;
			self.paasApp = {
				"serverURL" : "",
				"webPath" : "",
				"indexURL" : "",
				"id" : ""
			};
			this.xpaas.templateInfo(function(json) {
				self.templateInfo = json.object || [];
			})
		}

		var tree = $(this.getElementByXid("uiResDirsTree"));
		tree.jqxTree('clear');
		tree.jqxTree({
			source : this._getChildren("$UI", "$UI"),
			hasThreeStates : true,
			checkboxes : true
		});
		tree.on('expand', function(event) {
			self._expandDir(event.args.element);
		});

		tree.on('dblclick', function(event) {
			var item = tree.jqxTree('getItem', event.target.parentElement);
			if (item) {
				self.comp("indexURL").val("/" + item.value);
			}
		});
		tree.on('checkChange', function(event) {
			var selected = [];
			var items = tree.jqxTree('getCheckedItems');
			var value;
			for (var i = 0; i < items.length; i++) {
				if ('Loading...' != items[i].label) {
					value = items[i].value;

					var parentIncluded = false;
					var parent = items[i].parentElement;
					var parentItem;
					while (parent !== null) {
						parentItem = tree.jqxTree('getItem', parent);
						if (parentItem.checked) {
							parentIncluded = true;
							break;
						}
						parent = parentItem.parentElement;
					}
					if (!parentIncluded) {
						selected.push(value);
					}
				}
			}

			self.comp("uiResDirs").val(selected.join(','));
		});

		this._recalcHeight();
		$(window).resize(function() {
			self._recalcHeight();
		});

		if (this.getParent().edit) {
			this.comp("serverURL").val(config.serverURL);
			this.comp("indexURL").val(config.indexURL);

			if (config.uiResDirs !== '') {
				var uiResDirs = config.uiResDirs.split(',');
				var treeItems = tree.jqxTree('getItems');
				var expandDir = function() {
					var item = this;
					if (item.value == curPath) {
						self._expandDir(item.element);
						treeItems = tree.jqxTree('getItems');
						return;
					}
				};

				var checkItem = function() {
					var item = this;
					if (item.value == uiResDirs[i]) {
						tree.jqxTree('checkItem', item.element, true);
						return;
					}
				};

				for (var i = 0; i < uiResDirs.length; i++) {
					var path = uiResDirs[i].split('/');
					for (var j = 1; j <= path.length; j++) {
						var curPath = path.slice(0, j).join('/');
						$.each(treeItems, expandDir);
					}

					$.each(treeItems, checkItem);
				}
			}
		}

		this.init();
	};

	Model.prototype._recalcHeight = function() {
		var height = $("body").height() - $(this.getElementByXid("serverDiv")).height() - 210;
		var tree = $(this.getElementByXid("uiResDirsTree"));
		tree.height(height);
		tree.css('visibility', 'visible');
	};

	Model.prototype.init = function() {
		this.comp("popMenu").hide();
		var config = this.appEngine.getConfig();
		if (config.mode === "1") {
			$(this.getElementByXid("serverURLLabel")).text("Web服务地址：");
		} else if (config.mode === "2") {
			$(this.getElementByXid("serverURLLabel")).text("Web服务地址：");
		} else if (config.mode === "3") {
			$(this.getElementByXid("serverURLLabel")).text("UIServer服务地址：");
		} else if (config.mode === "4") {
			$(this.getElementByXid("serverURLLabel")).text("网站地址：");
		} else {
			$(this.getElementByXid("serverURLLabel")).text("服务地址：");
		}

		this.comp("indexURLLabelInput").domNode.style.display = config.mode === "4" ? "none" : "";
		this.comp("webPathLabelInput").domNode.style.display = config.mode === "4" ? "none" : "";
		this.getElementByXid("uiResDiv").style.display = config.mode === "4" ? "none" : "";

		if (config.mode === "3") {
			if (this.paasSelected) {
				this.comp("webPath").val("/x5/UI2");
				this.comp("webPath").$domNode.attr("readonly", true);
				this.comp("selectWebPathButton").$domNode.attr("disabled", true);
			} else {
				this.comp("webPath").val(config.webPath ? config.webPath : "/x5/UI2");
				this.comp("webPath").$domNode.attr("readonly", false);
				this.comp("selectWebPathButton").$domNode.attr("disabled", false);
			}
		} else {
			this.comp("webPath").val(config.webPath ? config.webPath : "");
			this.comp("webPath").$domNode.attr("readonly", false);
			this.comp("selectWebPathButton").$domNode.attr("disabled", false);
		}

		var modeChanged = xpaas.config && xpaas.config.mode !== config.mode ? true : false;
		if (modeChanged) {
			this.comp("serverURL").val("");
		}

	};

	Model.prototype.getTitle = function(wizard) {
		return '设置服务地址和选择UI资源';
	};

	Model.prototype._getChildren = function(path, baseDir) {
		var data = {
			'function' : 'getFiles',
			'params' : {
				path : path,
				baseDir : baseDir,
				fileTypes : [ '.w' ],
				blackList : [ 'system' ]
			}
		};
		var result = $.ajax({
			async : false,
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "json",
			type : 'POST',
			url : require.toUrl("$UI/system/templates/common/templateHelper.j"),
			success : function(result) {
			},
			error : function(xhr, status, err) {
			}
		}).responseJSON;
		if (result && result.flag) {
			return result.files;
		} else {
			return [];
		}
	};

	Model.prototype._expandDir = function(parent) {
		var tree = $(this.getElementByXid("uiResDirsTree"));
		var $element = $(parent);
		var loader = false;
		var loaderItem = null;
		var children = $element.find('ul:first').children();
		$.each(children, function() {
			var item = tree.jqxTree('getItem', this);
			if (item && item.label == 'Loading...') {
				loaderItem = item;
				loader = true;
				return false;
			}
		});
		if (loader) {
			var files = this._getChildren("$UI/" + tree.jqxTree('getItem', parent).value, "$UI");
			tree.jqxTree('addTo', files, $element[0]);
			tree.jqxTree('removeItem', loaderItem.element);
		}
	};

	Model.prototype.hasCancelBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasBackBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasNextBtn = function(wizard) {
		return true;
	};

	Model.prototype.hasFinishBtn = function(wizard) {
		return false;
	};

	Model.prototype.validate = function() {
		var mode = this.appEngine.getConfig().mode;
		if (mode !== "4" && !this.comp("indexURL").get("value")) {
			alert("“首页”不能为空");
			return false;
		}

		if (this.appEngine.getConfig().mode !== "4") {
			var serverURL = this.comp("serverURL").get("value");
			if (serverURL && (serverURL.length > 0) && (serverURL[serverURL.length - 1] === '/')) {
				var serverURLLabel = $(this.getElementByXid("serverURLLabel")).text();
				// 去除冒号
				serverURLLabel = serverURLLabel.substring(0, serverURLLabel.length - 1);
				alert("“" + serverURLLabel + "”不能以“/”结尾");
				return false;
			}

			var webPath = this.comp("webPath").get("value");
			if (webPath && (webPath.length > 0) && (webPath[0] !== '/')) {
				alert("“Web路径”必须以“/”开始");
				return false;
			}

			var indexURL = this.comp("indexURL").get("value");
			if (indexURL && (indexURL.length > 0) && (indexURL[0] !== '/')) {
				alert("“首页”必须以“/”开始");
				return false;
			}

			if (((mode === "1") || (mode === "2")) && webPath && ((webPath === "/x5") || (webPath.substr(0, 4) === "/x5/"))) {
				alert("“模式”" + mode + "的Web路径不能为/x5或者/x5/xx，否则与tomcat的UIServer路径冲突");
				return false;
			}
			if (webPath !== "/x5/UI2" && mode === "3") {
				if (confirm("web路径不是“/x5/UI2”！ 点击确定重新设置。")) {
					return false;
				}
			}

		}

		return true;
	};

	Model.prototype.nextPage = function(wizard) {
		if (this.validate()) {
			var config = this.appEngine.getConfig();
			config.serverURL = this.comp("serverURL").get("value");
			config.webPath = config.mode === "4" ? "" : this.comp("webPath").get("value");
			config.indexURL = config.mode === "4" ? "" : this.comp("indexURL").get("value");
			if (!config.serverURL) {
				config.serverURL = "http://localhost";
			}
			config.uiResDirs = this.comp("uiResDirs").get("value");
			config.paasServiceID = (this.paasSelected && this.paasServiceID) ? this.paasServiceID : config.paasServiceID;

			var self = this;
			if (this.paasSelected) {
				xpaas.loadProjectByServiceID(config.paasServiceID, function(res) {
					var app = res && res.object || {};
					if (self.matchMode(app.tempId)) {
						self.getParent().openPage({
							id : "configApp",
							url : "configApp.w",
							fromId : "selectAppResources"
						});
					} else {
						alert("CloudX5设置出错！请重新选择。");
					}

				}, function(err) {
					alert("请求CloudX5信息失败！");
				});

			} else {
				this.getParent().openPage({
					id : "configApp",
					url : "configApp.w",
					fromId : "selectAppResources"
				});
			}
		}
	};

	Model.prototype.projectClickFun = function(buttonEvent) {
		var self = this;
		self.paasSelected = true;
		var button = buttonEvent.source;
		var projectId = button.$domNode.attr("projectId");

		this.xpaas.loadApp(projectId, function(res) {
			if (res && res.rows) {
				if ('1' == res.rows[0].deployState ? confirm('该项目有过部署，确认要覆盖吗？') : true) {
					self.appEngine.getConfig().paasServiceID = res.rows[0].id;
					self.paasServiceID = res.rows[0].id;
					self.comp("serverURL").val("http://" + res.rows[0].path);
					// self.comp("webPath").val(""); // TODO: mode3 来查
					// self.comp("indexURL").val("");
					if (self.appEngine.getConfig().mode === "3") {
						self.comp("webPath").val("/x5/UI2");
						self.comp("webPath").$domNode.attr("readonly", true);
						self.comp("selectWebPathButton").$domNode.attr("disabled", true);
					}
					self.paasApp = {
						"serverURL" : res.rows[0].path,
						"webPath" : res.rows[0].path,
						"indexURL" : res.rows[0].index_url,
						"id" : res.rows[0].id
					}
				} else {
					setTimeout(function() {
						self.comp("popMenu").show();
					}, 0);
					return;

				}
			} else {
				alert("项目" + button.label + "有异常");
			}
		}, function(result) {
			alert("ERR:" + JSON.stringify(result))
		});
	};

	Model.prototype.matchMode = function(projectTemplateId) {
		var template = this.templateInfo;
		var mode = this.appEngine.getConfig().mode;
		var needType = this.__getTemplateType(mode);
		for ( var i in template) {
			if (projectTemplateId == template[i].id && needType == template[i].type) {
				return true;
			}
		}
		return false;
	};

	Model.prototype.__getTemplateType = function(mode) {
		if (mode == '1' || mode == '2') {
			return TemplateType.JAVA;
		}
		if (mode == '3') {
			return TemplateType.UISERVER;
		}
	}

	Model.prototype.selectIPButtonClick = function(event) {
		var self = this;
		var menu = this.comp("menu");
		menu.clear();
		var downloadInfo = this.appEngine.getDownloadInfo();
		var ip = downloadInfo.ip.split(',');
		var onClick = function(event) {
			self.paasSelected = false;
			self.appEngine.getConfig().paasServiceID = "";
			self.comp("serverURL").val(event.source.label);
			self.comp("webPath").$domNode.attr("readonly", false);
			self.comp("selectWebPathButton").$domNode.attr("disabled", false);
		};
		var openURL = function(buttonEvent) {
			var mode = self.appEngine.getConfig().mode;
			if (mode == '4') {
				setTimeout(function() {
					alert("模式4不能新建CloudX5项目！");
				}, 300);
				return;
			}
			if (self.paasToken) {
				self.comp("serverURL").val("");
				var url = templateService.getXCloudConsoleUrl() + "/x5/UI2/paas/pt/index.w?token="//
						+ self.paasToken + "&type=" + self.__getTemplateType(self.appEngine.getConfig().mode) + "#!(/UI2/project/ptMainActivity.w)";
				templateService.openBrowser(url);
			} else {
				setTimeout(function() {
					alert("请先登录CloudX5！");
				}, 300);

			}
		};
		for (var i = 0; i <= ip.length - 1; i++) {
			menu.addItem({
				label : 'http://' + ip[i] + ':8080',
				onClick : onClick
			});
		}
		menu.addItem({
			label : 'http://127.0.0.1',
			onClick : onClick
		});

		var dtd = $.Deferred();
		if (self.paasToken && self.templateInfo && self.templateInfo.length > 0) {
			this.xpaas.loadProject(function(res) {
				if (res && res.rows) {
					var addDividered = false;
					for ( var rowIndex in res.rows) {
						if (self.matchMode(res.rows[rowIndex].tempId)) {
							if (addDividered == false) {
								addDividered = true;
								menu.addDivider();
							}
							var button = menu.addItem({
								label : res.rows[rowIndex].title,
								onClick : self.projectClickFun
							});
							button.$domNode.attr("projectId", res.rows[rowIndex].id);
						}
					}
					dtd.resolve();
				} else {
					dtd.resolve();
				}
			}, function(res) {
				dtd.resolve();
			});
		} else {
			dtd.reject();
		}
		dtd.always(function() {
			menu.addDivider();
			menu.addItem({
				label : '新建 CloudX5 项目',
				onClick : function() {
					openURL();
				}
			});
			self.comp("popMenu").show();
		});

	}

	Model.prototype.selectWebPathButtonClick = function(event) {
		this.comp("webPathPopMenu").show();
	};

	Model.prototype.webPathButtonClick = function(event) {
		this.comp("webPath").val(event.source.label);
	};

	return Model;
});
