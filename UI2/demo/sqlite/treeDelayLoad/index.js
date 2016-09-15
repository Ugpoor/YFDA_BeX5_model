define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var SqliteUtil = require("$UI/demo/sqlite/sqliteUtil");
	var DemoDB = require("$UI/demo/sqlite/demoDB");

	var Model = function() {
		this.callParent();
		this.demoDB = null;
	};

	Model.prototype.modelLoad = function(event) {
		if (!justep.Browser.isX5App) {
			alert("本案例只支持在手机APP中运行");
			return;
		}
		var self = this;
		document.addEventListener("deviceready", function() {
			self.demoDB = DemoDB.getInstance();
			self.demoDB.initData(function() {
				self.comp("regionTree").refresh(self.comp("regionData"));
			});
		});
	};

	// 树形数据逐级+分页加载模式，data.treeOption.delayLoad=true
	Model.prototype.regionDataCustomRefresh = function(event) {
		// sqlite所有调用都是异步的，所以这里必须标记为异步刷新模式
		event.async = true;

		var db = this.demoDB.getDatabase();
		var data = event.source;

		var parent = event.options && event.options.parent; // 父节点的row
		var append = event.options && event.options.append; // 数据是否增量加载

		var parentID = parent ? parent.getID() : ""; // 父ID
		var limit = event.limit; // 分页行数
		var offset = event.offset; // 分页偏移

		SqliteUtil.executeSql(db, "SELECT * FROM demo_region WHERE ((? = '' AND fParentID IS NULL) OR (fParentID = ?)) LIMIT ? OFFSET ? ", [ parentID, parentID, limit, offset ], onSuccess, onError); // 执行SQL查询
		function onSuccess(res) {
			// 转换返回数据结果
			var table = SqliteUtil.rowsToTable(res.rows);
			if (offset == 0) {
				// 如果偏移为零则表明加载第一页，需要设置table的总行数，用于分页计算
				SqliteUtil.executeSql(db, "SELECT COUNT(*) cnt FROM demo_region WHERE ((? = '' AND fParentID IS NULL) OR (fParentID = ?)) ", [ parentID, parentID ], function(res) {
					SqliteUtil.setTableTotal(table, res.rows.item(0).cnt);
					doRefreshData();
				});
			} else {
				doRefreshData();
			}
			function doRefreshData() {
				data.loadData(table, append, parent);
				// 异步执行模式下，加载数据后必须执行doRefreshAfter
				data.doRefreshAfter(true, event.options);
			}
		};
		function onError(msg) {
			data.doRefreshAfter(false, event.options);
		};
	};

	return Model;
});