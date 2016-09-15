define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var SqliteUtil = require("$UI/demo/sqlite/sqliteUtil");
	var DemoDB = require("$UI/demo/sqlite/demoDB");

	var Model = function() {
		this.callParent();
		this.demoDB = null;
	};

	/**
	 * 手机上的Sqlite几乎所有的操作都是异步执行的，代码执行的顺序必须依赖回调函数
	 */
	Model.prototype.modelLoad = function(event) {
		if (!justep.Browser.isX5App) {
			alert("本案例只支持在手机APP中运行");
			return;
		}
		var self = this;
		// 设备准备好后，才能通过插件打开数据库
		document.addEventListener("deviceready", function() {
			// 这里在DemoDB.js中实现了一个单例对象，为了能在多个功能页中共用一个数据源，避免死锁
			self.demoDB = DemoDB.getInstance();
			// DemoDB.js中实现了自动判断并初始化数据库
			self.demoDB.initData(function() {
				// 初始化后刷新列表
				self.comp("testList").refresh(true);
			});
		});
	};

	Model.prototype.testDataCustomRefresh = function(event) {
		// 标记当前刷新是异步执行的
		event.async = true;

		var db = this.demoDB.getDatabase();
		var data = event.source;

		var append = event.options && event.options.append; // 是否数据追加模式
		var limit = event.limit; // 分页行数
		var offset = event.offset; // 分页偏移

		// 执行SQL查询
		SqliteUtil.executeSql(db, "SELECT * FROM demo_test LIMIT ? OFFSET ? ", [ limit, offset ], onSuccess, onError);
		function onSuccess(res) {
			// 转换返回数据结果
			var table = SqliteUtil.rowsToTable(res.rows);
			if (offset == 0) {
				// 如果偏移为零则表明加载第一页，需要在Table中提供总行数，用于分页计算
				SqliteUtil.executeSql(db, "SELECT COUNT(*) cnt FROM demo_test ", [], function(res) {
					SqliteUtil.setTableTotal(table, res.rows.item(0).cnt);
					doRefreshData();
				});
			} else {
				doRefreshData();
			}
			function doRefreshData() {
				data.loadData(table, append);
				// 异步执行模式下，加载数据后必须执行doRefreshAfter
				data.doRefreshAfter(true, event.options);
			}
		}
		function onError(msg) {
			data.doRefreshAfter(false, event.options);
		}
	};

	Model.prototype.testDataCustomSave = function(event) {
		// 标记当前保存是异步执行的
		event.async = true;

		var db = this.demoDB.getDatabase();
		var data = event.source;

		SqliteUtil.saveData(db, data, "demo_test", null, function(res) {
			// 异步执行模式下，保存成功后必须执行doSaveAfter
			data.doSaveAfter(true, event.options);
		}, function(msg) {
			data.doSaveAfter(false, event.options);
		});
	};

	return Model;
});