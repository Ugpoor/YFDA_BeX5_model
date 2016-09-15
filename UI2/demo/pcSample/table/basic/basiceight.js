define(function(require){
	var $ = require("jquery");
	require("$UI/system/components/justep/dataTables/dataTables");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};

	//渲染表格
	Model.prototype.dataTablesCellRender = function(event){
		var row = event.row;
		if(event.colName == 'tAge'){
			if(event.colVal % 2 == 0){
				event.source.setRowCss(row, {"height":"70",'backgroundColor':'#93dffe' });				
			}
			//event.source.setCSS(row, {'backgroundColor':'#93dffe'});//可以同时实现隔行变色和鼠标移入移出效果
		}
	};
	
	//显示js代码
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basiceight.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basiceight.w&xid=dataTables"
		},true);
	};

	return Model;
});