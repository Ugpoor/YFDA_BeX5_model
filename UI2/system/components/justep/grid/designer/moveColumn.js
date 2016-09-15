define(function(require) {
	var $ = require("jquery");
	var XML = require("$UI/system/lib/base/xml");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.xml2data = function(xmlStr){
		if(xmlStr){
			var $grid = $(XML.fromString(xmlStr).documentElement);
			var data = this.comp('data');
			var defaultValues = [];
			$grid.find('column').each(function(index){
				var $col = $(this);
				var xid = $col.attr("xid");
				var o = {
						names : $col.attr('label')||$col.attr('name'), 
						xid:xid
				};
				defaultValues.push(o);
			});
			data.newData({
				defaultValues : defaultValues
			});
		}
	};
	
	Model.prototype.modelLoad = function(event) {
		var dataComp = this.comp("data");
		var initData = xuiService.getPageParams();// 获取传入的参数
		this.xml2data(initData.xml);// 初始化属性值

		var binding = {
			"name" : "@name",
		};
		var config = {
			xmlData : initData.xml,
			rowIdPath : "@xid", // 行id映射
			rowNodePath : "column", // 行节点映射
			idField : "xid", // data
			data : dataComp,// data组件
			binding : binding
		};
		this.xmlModel = xuiService.createXmlModel(config);
	};

	Model.prototype.getReturnValue = function() {
		var def = [];
		def = this.xmlModel.childAsArray();
		var result = {
			def : def
		};
		return result;
	};

	Model.prototype.removeRow = function(up) {
		var data = this.comp('data'), row1 = data.getCurrentRow(true);
		var index = data.getRowIndex(row1);
		index += (up ? -1 : 1);
		if (index < 0 || index >= data.getCount())
			return;
		var datas = data.datas.peek();
		var row2 = datas[index];
		data.exchangeRow(row1, row2);
	};

	Model.prototype.upClick = function(event) {
		this.removeRow(true);
	};

	Model.prototype.downClick = function(event) {
		this.removeRow(false);
	};

	return Model;
});