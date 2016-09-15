define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	
	//加载数据
	Model.prototype.bankDataCustomRefresh = function(event) {
		var employee = event.source;
		$.ajax({
			type : "GET",
			url : require.toUrl('./json/bankData.json'),
			dataType : 'json',
			async : false,
			cache : false,
			success : function(data) {
				employee.loadData(data);// 将返回的数据加载到data组件
			},
			error : function() {
				throw justep.Error.create("加载数据失败");
			}
		});
	};
	//合并单元格
	Model.prototype.bankGridReload = function(event) {
		var taskData = this.comp('bankData');
		taskData.each(function(option) {// 在遍历时进行比较，确定合并方式
			if (option.row.val('id') % 2 == 0) {
				var cell = event.source.getCell(option.row.val('id'), "bank");
				$(cell).attr('colspan', 5);
				var cell = event.source.getCell(option.row.val('id'), "creditCard");
				$(cell).hide();
				var cell = event.source.getCell(option.row.val('id'), "billingDate");
				$(cell).hide();
				var cell = event.source.getCell(option.row.val('id'), "repaymentDate");
				$(cell).hide();
				var cell = event.source.getCell(option.row.val('id'), "cash");
				$(cell).hide();
			}
		});
	};
	//渲染单元格
	Model.prototype.bankGridCellRender = function(event) {
		if (event.colVal == "") {
			event.html = "<font color='#EE2C2C'>查看账单：</font><a>2012年12月</a>&nbsp;&nbsp;<a>2012年7月</a>&nbsp;&nbsp;<a>历史账单</a>"
		}
		if (event.colName == 'creditCard') {
			event.html = "<font color='#FF7F00' size='4'>" + event.colVal + "</font>";
		}
		if (event.colVal == '平安银行') {
			event.html = "<img src='img/1.png' xid='image1' style='height:33px;width:87px;'></img>";
		}
		if (event.colVal == '招商银行') {
			event.html = "<img src='img/2.png' xid='image1' style='height:33px;width:87px;'></img>";
		}

	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/additionalRow.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/additionalRow.w&xid=bankGrid"
		},true);
	};

	return Model;
});