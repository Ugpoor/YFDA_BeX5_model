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
			// 获取数据库单例对象
			self.demoDB = DemoDB.getInstance();
			// 初始化数据库
			self.demoDB.initData(function() {
				// 初始化成功后刷新tree
				self.comp("regionTree").refresh(self.comp("regionData"));
			});
		});
	};

	Model.prototype.regionDataCustomRefresh = function(event) {
		// sqlite所有调用都是异步的，所以这里必须标记为异步刷新模式
		event.async = true;
		
		var db = this.demoDB.getDatabase();
		var data = event.source;

		// 执行SQL查询
		SqliteUtil.executeSql(db, "SELECT * FROM demo_region", null, onSuccess, onError); 
		function onSuccess(res) {
			// 转换返回数据结果
			var table = SqliteUtil.rowsToTreeTable(res.rows, "fID", "fParentID");
			// 加载数据 
			data.loadData(table); 
			// 异步模式下，加载数据后必须执行doRefreshAfter
			data.doRefreshAfter(true, event.options); 
		};
		function onError(msg) {
			data.doRefreshAfter(false, event.options);
		};
	};

	return Model;
});