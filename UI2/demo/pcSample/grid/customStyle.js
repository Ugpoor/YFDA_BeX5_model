define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	//加载数据
	Model.prototype.productDataCustomRefresh = function(event) {
		var product = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/productData.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				product.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});

	};
	//渲染单元格
	Model.prototype.productGridCellRender = function(event) {
		if (event.colName == 'productName') {
			event.html = "<font color='#FF7F00' size=3>" + event.colVal + "</font>"
		}
		if (event.colName == 'operate') {
			event.html = " <a component='$UI/system/components/justep/button/button' class='btn x-orange' label='立即购买' xid='button1'><i xid='i1'></i><span xid='span1'>立即购买</span></a>"
		}
		if (event.colName == 'account') {
			var arr = event.colVal.split(",");
			event.html = "<font color='#FF7F00' size=3>" + arr[0] + "</font></br><font color='#FF7F00' size=3>" + arr[1] + "</font>"
		}

	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/customStyle.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/customStyle.w&xid=productGrid"
		},true);
	};

	return Model;
});