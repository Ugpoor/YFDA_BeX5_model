/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var $ = require("jquery");
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var Model = function() {
		this.callParent();
	};
	
	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function(){
		var cols = [], data = this.comp('data');
		data.each(function(param){
			if(data.getValue('selected', param.row)){
				var col = {name:param.row.val('name'), type:param.row.val('type')};
				var disp = param.row.val('displayName');
				if(disp) col.displayName = disp; 
				cols.push(col);
			}
		});
		return cols; 
	};
	
	Model.prototype.modelLoad = function(event) {
	};

	Model.prototype.checkbox2Change = function(event){
		var data = this.comp("data");
		data.each(function(param){
			param.row.val('selected',event.checked);
		});
	};

	Model.prototype.modelParamsReceive = function(event){
		var recvData = event.params.data;
		this._db = recvData.db;
		this._table = recvData.table;
		this._data = recvData.data;
		this.comp("data").refreshData();
	};

	Model.prototype.dataCustomRefresh = function(event){
		var db = this._db, table = this._table, data = this._data;
		if (db && table && data) {
			var fileds = BAASModel.getFileds(db, table);
			if(fileds){
				var datas = [];
				$.each(fileds, function(i,filed){
					var list = data.find([ 'name' ], [ filed.name ], true, false, false);
					if (!list || list.length <= 0)
						datas.push({name:filed.name, displayName:filed.remarks||filed.name, type:filed.dataType});
				});
				event.source.loadData(datas);
			}
		}
	};

	Model.prototype.btnOKClick = function(event){
		this.owner.send(this.getReturnValue());
		this.owner.close();
	};

	return Model;
});