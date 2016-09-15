define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");

	var Model = function() {
		this.callParent();
		this.isBack;
	};

	// 图片路径转换
	Model.prototype.toUrl = function(url) {
		return url ? require.toUrl(url) : "";
	};

	// 获取商品列表
	Model.prototype.goodsDataCustomRefresh = function(event) {
		var url = require.toUrl("./main/json/goodsData.json");
		allData.loadDataFromFile(url, event.source, true);
	};

	// 全选
	Model.prototype.allChooseChange = function(event) {
		var self = this;

		var goodsData = this.comp("goodsData");
		var mark = event.source.$domNode.attr("mark");
		var choose;
		if (mark == "haha") {
			id = 'f00102135';
			choose = self.comp("allChoose").val();
			var id;
		} else if (mark == "xixi") {
			id = 'f00105411';
			choose = self.comp("allCheck").val();
		}

		goodsData.each(function(obj) {
			if (choose) {
				if (obj.row.val('fShopID') == id) {
					goodsData.setValue("fChoose", "1", obj.row);
				}
			} else {
				if (obj.row.val('fShopID') == id) {
					goodsData.setValue("fChoose", "", obj.row);
				}
			}
		});
	};
	// 单选取消同步多选取消
	Model.prototype.singleChange = function(event) {
		var mark = event.source.$domNode.attr("mark");
		var self = this;
		if (event.checked == false) {
			if (mark == "haha") {
				self.comp('allChoose').val(false);
			} else if (mark == "xixi") {
				self.comp('allCheck').val(false);
			}
		}
	};

	// 计算数量
	Model.prototype.caculCount = function(event) {
		var mark = event.source.$domNode.attr("mark");
		var row = event.bindingContext.$object;
		var n = row.val("fNumber");
		if (mark == "reduce") {
			if (n > 1) {
				row.val("fNumber", n - 1);
			}
		} else if (mark == "add") {
			row.val("fNumber", n + 1);
		}
	};

	// 计算店铺合计
	Model.prototype.caculSum = function(mark) {
		var goodsData = this.comp("goodsData");
		var result = 0;
		var id;
		if (mark == "haha") {
			id = 'f00102135';
		} else if (mark == "xixi") {
			id = 'f00105411';
		}
		goodsData.each(function(obj) {
			if (obj.row.val('fShopID') == id) {
				result += obj.row.val('fSum');
			}
		});
		return result;
	};

	return Model;
});