define(function(require) {
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;

		this.appEngine = this.getParent().appEngine;
		var config = this.appEngine.getConfig();

		this.allPlugins = '';
		var pluginsInfo = this.appEngine.getPlugins(config.projectName);
		var pluginsConfig = [];
		$.each(pluginsInfo, function() {
			function addPluginConfig(id, platform, params) {
				if (params) {
					$.each(params, function() {
						var value;
						if (self.getParent().edit) {
							var pluginConfig = self._getObjectByID(config.pluginsConfig, "id", id);
							if (pluginConfig && pluginConfig[platform]) {
								value = pluginConfig[platform][this.name];
							}
						}
						pluginsConfig.push({
							"id" : id,
							"platform" : platform,
							"name" : this.name,
							"displayName" : this.displayName,
							"value" : value ? value : this.defaultValue,
							"defaultValue" : this.defaultValue,
							"type" : this.type,
							"values" : this.values
						});
					});
				}
			}
			if (!this.params) {
				this.params = {};
			}
			debugger;
			addPluginConfig(this.id, "common", this.params.common);
			addPluginConfig(this.id, "android", this.params.android);
			addPluginConfig(this.id, "ios", this.params.ios);
			this.hasParams = (this.params.common && (this.params.common.length > 0)) || (this.params.android && (this.params.android.length > 0)) || (this.params.ios && (this.params.ios.length > 0));
		});

		for ( var i in pluginsInfo) {
			this.allPlugins = this.allPlugins + ' ' + pluginsInfo[i].id;
		}

		var pluginsData = this.comp("pluginsData");
		pluginsData.loadData(pluginsInfo);

		var pluginsConfigData = this.comp("pluginsConfigData");
		pluginsConfigData.loadData(pluginsConfig);

		if (this.getParent().edit) {
			this.comp("autoSelectPlugins").val(config.autoSelectPlugins);
			if (config.plugins) {
				pluginsData.disableRecordChange();
				try {
					var plugins = config.plugins.split(',');
					for (var j = 0; j < plugins.length; j++) {
						var row = pluginsData.getRowByID(plugins[j]);
						if (row) {
							row.val('checked', true);
						}
					}
				} finally {
					pluginsData.enabledRecordChange();
				}
			}

			this._refreshPluginsDiv();
		}

		this._recalcHeight();
		$(window).resize(function() {
			self._recalcHeight();
		});
	};

	Model.prototype.getParamValueItems = function($object) {
		var values = [];
		var list = [];
		var type = $object.val('type');
		if (type === 'boolean') {
			list = [ "true", "false" ];
		} else if (type === 'enumerate') {
			list = $object.val('values').split(',');
		}
		for (var i = 0; i < list.length; i++) {
			values.push({
				"value" : list[i]
			});
		}
		return values;
	};

	Model.prototype._recalcHeight = function() {
		var height = $("body").height() - $(this.getElementByXid("modeDiv")).height() - 140;
		var pluginsDiv = $(this.getElementByXid("pluginsDiv"));
		pluginsDiv.height(height);
	};

	Model.prototype._refreshPluginsDiv = function() {
		this.getElementByXid("pluginsDiv").style.display = "block";
	};

	Model.prototype._checkDependency = function(selectedPlugins) {
		var neededPlugins = this._getNeededPlugins(selectedPlugins);
		var mustSelectedPlugins = [];
		for (var i = 0; i < neededPlugins.length; i++) {
			if (!this._pluginAdded(selectedPlugins, neededPlugins[i])) {
				mustSelectedPlugins.push(neededPlugins[i]);
			}
		}

		var result = (mustSelectedPlugins.length === 0) || confirm("有依赖的插件“" + mustSelectedPlugins.join(',') + "”未选择，是否选择？");
		if (result) {
			var pluginsData = this.comp("pluginsData");
			for (var j = 0; j < mustSelectedPlugins.length; j++) {
				var row = pluginsData.getRowByID(mustSelectedPlugins[j]);
				row.val('checked', true);
			}
		}
		return result;
	};

	Model.prototype._getSeletedPlugins = function() {
		var seletedPlugins = [];
		var pluginsData = this.comp("pluginsData");
		pluginsData.eachAll(function(data) {
			var row = data.row;
			if (row.val('checked') === true) {
				seletedPlugins.push(row.val('id'));
			}
		});

		return seletedPlugins;
	};

	Model.prototype._getNeededPlugins = function(selectedPlugins) {
		var neededPlugins = [];
		// 必须的插件直接后台处理，前台不再提示
		// splashscreen为必选，否则App启动等待会不友好
		// neededPlugins.push('cordova-plugin-splashscreen');

		for (var i = 0; i < selectedPlugins.length; i++) {
			this._addPlugin(neededPlugins, selectedPlugins[i]);
		}

		return neededPlugins;
	};

	Model.prototype._pluginAdded = function(neededPlugins, pluginID) {
		var added = false;
		for (var i = 0; i <= neededPlugins.length; i++) {
			if (neededPlugins[i] === pluginID) {
				added = true;
				break;
			}
		}
		return added;
	};

	Model.prototype._addPlugin = function(neededPlugins, pluginID) {
		if (this._pluginAdded(neededPlugins, pluginID)) {
			return;
		}

		var pluginsData = this.comp("pluginsData");
		var row = pluginsData.getRowByID(pluginID);
		var dependency = row.val("dependency");
		if (dependency !== "") {
			dependency = dependency.split(',');
			for (var i = 0; i < dependency.length; i++) {
				this._addPlugin(neededPlugins, dependency[i]);
			}
		}
		neededPlugins.push(pluginID);
	};

	Model.prototype._getObjectByID = function(array, id, value) {
		if (array) {
			for (var i = 0; i < array.length; i++) {
				if (array[i][id] === value)
					return array[i];
			}
		}

		return;
	};

	Model.prototype._setObjectByID = function(array, id, value, newObj) {
		var obj = this._getObjectByID(array, id, value);
		if (newObj && !obj) {
			obj = {};
			obj[id] = value;
			array.push(obj);
		}
		return obj;
	};

	Model.prototype._getPluginsConfig = function(wizard) {
		var self = this;
		var result = [];
		var pluginsData = this.comp("pluginsData");
		var pluginsConfigData = this.comp("pluginsConfigData");

		pluginsConfigData.eachAll(function(data) {
			var row = data.row;
			var pluginRow = pluginsData.getRowByID(row.val('id'));
			var value = row.val('value');
			if (pluginRow.val('checked') || value) {
				var plugin = self._setObjectByID(result, 'id', row.val('id'), true);
				if (!plugin[row.val('platform')]) {
					plugin[row.val('platform')] = {};
				}
				value = value ? value : row.val('defaultValue');
				value = value ? value : "";
				plugin[row.val('platform')][row.val('name')] = value;
			}
		});

		return result;
	};

	Model.prototype.getTitle = function(wizard) {
		return '选择打包的本地插件';
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

	Model.prototype.nextPage = function(wizard) {
		var autoSelectPlugins = this.comp("autoSelectPlugins").get("checked") === true;
		var plugins = this._getSeletedPlugins();
		if (!autoSelectPlugins) {
			if (!this._checkDependency(plugins)) {
				return;
			}
		}

		var config = this.appEngine.getConfig();
		config.autoSelectPlugins = autoSelectPlugins;
		config.plugins = plugins.join(',');
		config.pluginsConfig = this._getPluginsConfig();

		this.getParent().openPage({
			id : "configUpdateInfo",
			url : "configUpdateInfo.w",
			fromId : "selectPlugins"
		});
	};

	Model.prototype.btnSelectAllClick = function(event) {
		this.comp("plugins").val(this.allPlugins);
	};

	Model.prototype.btnCancelAllClick = function(event) {
		this.comp("plugins").val("");
	};

	Model.prototype.checkbox2Change = function(event) {
		this._refreshPluginsDiv();
		this._recalcHeight();
	};

	Model.prototype.filterChange = function(event) {
		this.comp("pluginsList").refresh();
	};

	Model.prototype.queryButtonClick = function(event) {
		this.comp("pluginsList").refresh();
	};

	Model.prototype.searchInputKeyup = function(event) {
		if (event.keyCode == 13) {
			this.comp("pluginsList").refresh();
		}
	};

	Model.prototype.customFilter = function(row) {
		var result;

		var val = this.comp("filterSelect").val();
		if (val === '2') {
			// 已选择
			result = row.val("checked");
		} else if (val === '3') {
			// 未选择
			result = !row.val("checked");
		} else {
			result = true;
		}

		if (result && (this.comp("paramsCheckbox").get("checked") === true)) {
			result = row.val("hasParams");
		}

		var search = this.comp("searchInput").val();
		if (result && search) {
			search = search.toLowerCase();
			var name = row.val("name");
			var id = row.val("id");
			var description = row.val("description");

			result = (name && name.toLowerCase().indexOf(search) >= 0) || (id && id.toLowerCase().indexOf(search) >= 0) || (description && description.toLowerCase().indexOf(search) >= 0);
		}
		return result;
	};

	return Model;
});
