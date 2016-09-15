define(function(require){
	var $ = require("jquery");
	require("$UI/system/components/justep/dataTables/dataTables");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;//自定义变量
		this.row;
	};

	//勾选radio 行的单选
	Model.prototype.dataTablesRowClick = function(event){
		var row = event.row;//选中当前行，这个方法效果比较好。		
		var rowid = this.comp('data').getRowIndex(this.row)+1;//获取当前行索引
		var link=$(event.domEvent.target);
		if(link.hasClass("radio")){			
			if(rowid%2==1){
				event.source.setRowCss(this.row,{"backgroundColor":"#f9f9f9"});
			} else {
				event.source.setRowCss(this.row,{"backgroundColor":"#fff"});
			}
			event.source.setRowCss(row,{"backgroundColor": "#93dffe"});
			
			if(this.row!=row){
				this.row=row;
			}
		}
	};
	
	//行渲染 显示单选框
	Model.prototype.dataTablesCellRender = function(event){
		if(event.colName=="inventory"){
			event.html="<input type='radio' value='1' name='state' xid='radio3' class='radio'></input>";
		}
	};
	
	//获取选中项
	Model.prototype.buttonOneClick = function(event){
		justep.Util.hint(""+this.comp("data").getCurrentRowID(), {"type":"info"});//提示信息
	};
		
	//源码显示
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basicfour.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basicfour.w&xid=dataTables"
		},true);
	};
		
	return Model;
});