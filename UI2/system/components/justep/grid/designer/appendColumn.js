define(function(require){
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");

	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.getReturnValue = function(){
		var cols = [], data = this.comp('data');
		data.each(function(param){
			var name = data.getValue('name', param.row);
			var editor = data.getValue('editor', param.row);
			if(data.getValue('selected', param.row)) cols.push({name:name,editor:editor});
		});
		return {cols:cols}; 
	};
	
	Model.prototype.modelLoad = function(event) {
		//创建grid的下拉选择
		var initData = xuiService.getPageParams();// 获取传入的参数
		this.cols2data(initData.cols,initData.xml);// 初始化属性值
		
		var editorsData = this.comp('editorsdata');
		editorsData.loadData(initData.editors);
	};
	
	return Model;
});