define(function(require){
	var $ = require("jquery");
	require("$UI/system/components/justep/dataTables/dataTables");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	var index;
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;
	};
	
	//单选按钮radio 	[渲染单元格事件]onCellRender
	Model.prototype.dataTablesCellRender = function(event){
		/*var row = event.row;
		if(event.colName == "tID"){
			event.html="<input type='radio' class='aa' name='radio'>";
		}*/
	};
	
	//单选一行时选中radio，有bug，第二次选中时，radio不能选中，但是'checked'=checked
	Model.prototype.dataTablesRowClick = function(event){
		/*if(index !=null){
			$(".aa:eq("+index+")").attr("checked",false);
		}
		var i = event.row.index();
		index = i;
		$(".aa:eq("+i+")").attr("checked",true);
		*/
		
		//alert(event.source.c);
	};
	
	
	//获取选中项按钮
	Model.prototype.radioButtonClick = function(event){
		var row = this.comp('data').getCurrentRow();//获取当前行数据
		if(row !=null){
			justep.Util.hint(""+row.val("tID"), {"type":"info"});//提示信息
		}else{
			justep.Util.hint("请至少选中一项", {"type":"info"});//提示信息
		}
	};
			
	//显示源码
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basicseven.js"
		},true);
	};
	//显示源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basicseven.w&xid=dataTables"
		},true);
	};
	
	return Model;
});
