define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.userDataCustomRefresh = function(event) {
		// 主表数据加载
		var data = event.source;
		justep.Baas.sendRequest({
			"url" : "/justep/demo",
			"action" : "queryUser",
			"params" : {
				"limit" : event.limit,
				"offset" : event.offset
			},
			"success" : function(resultData) {
				var append = event.options && event.options.append;
				data.loadData(resultData, append);
			}
		});
	};

	Model.prototype.orderDataCustomRefresh = function(event) {
		// 从表数据加载
		var userData = this.comp("userData");
		var orderData = event.source;
		justep.Baas.sendRequest({
			"url" : "/justep/demo",
			"action" : "queryOrder",
			"params" : {
				"limit" : event.limit,
				"offset" : event.offset,
				"userID" : userData.getCurrentRowID()
			},
			"success" : function(resultData) {
				var append = event.options && event.options.append;
				orderData.loadData(resultData, append);
			}
		});
	};
	//js代码
	Model.prototype.jsClick = function(event) {
		util.showSource({
			self : this,
			data : "demo/pcSample/grid/masterDetail-operate.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/grid/masterDetail-operate.w&xid=userGrid"
		},true);
	};
	//单元格渲染
	Model.prototype.orderGridCellRender = function(event) {
		if (event.colName == 'op') {
			event.html = "<a component='$UI/system/components/justep/button/button' class='btn x-orange btn-sm'  xid='button1'><span xid='span1' class='update' >修改</span></a> <a component='$UI/system/components/justep/button/button' class='btn x-orange btn-sm'  xid='button1'><span xid='span1' class='delete' >删除</span></a> <a component='$UI/system/components/justep/button/button' class='btn x-orange btn-sm'  xid='button1'><span xid='span1' class='show' >查看</span></a>"
		}

	};
	//删除及查看
	Model.prototype.orderGridRowClick = function(event) {
		if ($(event.domEvent.target).hasClass('delete')) {
			var row = this.comp('orderData').getRowByID(event.rowID);
			this.comp('orderData').deleteData(row);
		}
		if ($(event.domEvent.target).hasClass('show')) {
			var me = this;
			var url = require.toUrl("$UI/demo/pcSample/grid/show.w");
			this.comp('windowDialog').set({src:url});
			var row = this.comp('orderData').getRowByID(event.rowID);
			this.comp('windowDialog').open({data:row});
		}
		if ($(event.domEvent.target).hasClass('update')) {
			this.comp('updateWindowDialog').open({data:this.comp('orderData').getCurrentRow()});
		}
	};
	//新增
	Model.prototype.addClick = function(event) {
		var username = this.comp('userData').getCurrentRow().val('fName');
		this.comp('updateWindowDialog').open({data:username});
		
	};
	//接收数据
	Model.prototype.windowDialogReceive = function(event){
		this.comp('orderData').saveData();
		this.comp('orderData').refreshData();

	};

	

	return Model;
});