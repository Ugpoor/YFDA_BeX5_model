define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var Model = function() {
		this.callParent();
		this.initOK = justep.Bind.observable(false);

		this.canOK = justep.Bind.computed(function() {
			if (!this.initOK.get())
				return false;

			var row = this.comp("dataMain").getCurrentRow();
			return row
					&& row.val('db') && row.val('table') && (!row.val('needQueryAction') || (row.val('needQueryAction') && row.val('queryAction')))
					&& (!row.val('needSaveAction') || (row.val('needSaveAction') && row.val('saveAction')));
		}, this);
	};

	Model.prototype.modelLoad = function(event) {
		this.initOK.set(true);
	};

	Model.prototype.modelParamsReceive = function(event) {
		BAASModel.loadBaasModel(BAASModel.getBaasType(this));
	};

	Model.prototype.dataDBsCustomRefresh = function(event) {
		var dbs = BAASModel.getDBs();
		if (dbs) {
			var datas = [], self = this;
			$.each(dbs, function(k) {
				datas.push({
					db : k
				});
			});
			event.source.loadData(datas);
		}
	};

	Model.prototype.dataTablesCustomRefresh = function(event) {
		var dbName = this.comp('dataMain').val('db');
		if (dbName) {
			var tables = BAASModel.getTables(dbName);
			if (tables) {
				var datas = [];
				$.each(tables, function(i, t) {
					datas.push({
						table : t.name,
						db : dbName
					});
				});
				event.source.loadData(datas);
			}
		}
	};

	Model.prototype.dataMainValueChanged = function(event) {
		if ('db' === event.col) {
			this.comp('dataTables').refreshData();
			event.row.val('table', '');
		} else if ('table' === event.col) {
			var tName = event.value;
			if (tName) {
				tName = tName.substring(0, 1).toUpperCase() + tName.substring(1);
				event.row.val('queryAction', 'query' + tName);
				event.row.val('saveAction', 'save' + tName);
			} else {
				event.row.val('queryAction', '');
				event.row.val('saveAction', '');
			}
		}
	};

	Model.prototype.btnOKClick = function(event) {
		var row = this.comp('dataMain').getCurrentRow(true);
		if (row) {
			this.owner.send({
				db : row.val("db"),
				table : row.val("table"),
				needQueryAction : row.val("needQueryAction"),
				queryAction : row.val("queryAction"),
				needSaveAction : row.val("needSaveAction"),
				saveAction : row.val("saveAction")
			});
			this.owner.close();
		}
	};

	return Model;
});