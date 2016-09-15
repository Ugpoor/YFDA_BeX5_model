define(function(require){
	//var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
		var initData = xuiService.getPageParams();// 获取传入的参数
		var params = initData.codeParams || initData.propValue;
		if(params){
			if(params){
				try{
					params = eval('('+params+')');
				}catch(e){
					//忽略json序列化错误}
				}
			}
			this.comp('mainData').loadData(params);
		}
	};

	Model.prototype.getReturnValue = function(){
		var params = []; 
		var data = this.comp('mainData');
		data.each(function(param){
			var row = param.row,o = {};
			o.name = row.val('name');
			o.displayName = row.val('displayName');
			o.type = row.val('type');
			o.defaultValue = row.val('defaultValue');
			o.required = !!row.val('required');
			params.push(o);
		});
		return params; 
	};
	
	return Model;
});