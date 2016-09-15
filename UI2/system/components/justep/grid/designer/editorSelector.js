define(function(require){
	var Data = require("$UI/system/components/justep/data/data");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.td2Click = function(event){
		var row = event.bindingContext.$object;
		if(row instanceof Data.Row){
			row.data.each(function(param){
				if(row!==param.row)param.row.val('checked',false);
			});
			row.val('checked',true);
		}
	};

	Model.prototype.getType = function(){
		var data = this.comp('data');
		var ret;
		data.each(function(parem){
			if(parem.row.val('checked')){
				ret = parem.row.val('type');
				parem.cancel = true;
			}
		});
		return ret;
	};

	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function(){
		var type = this.getType();
		return {type:type};
	};

	Model.prototype.modelLoad = function(event){
		//创建grid的下拉选择
		var initData = xuiService.getPageParams();// 获取传入的参数
		if(initData.data){
			var param = initData.data;
			var data = this.comp('data');
			data.loadData(param.editors);
			var rows = data.find(['type'],[param.editType],true);
			if(rows.length>0) rows[0].val('checked',true);
		}
	};

	Model.prototype.radio1Change = function(event){
		var row = event.bindingContext.$object;
		if(row instanceof Data.Row){
			row.data.each(function(param){
				if(row!==param.row)param.row.val('checked',false);
			});
		}
	};

	return Model;
});
