define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;
	};
	
	//checkbox行的多选
	Model.prototype.dataTablesRowCheck = function(event){
		var row = event.row;//选中当前行，这个方法效果比较好。
		var rowid = this.comp('data').getRowIndex(row)+1;//获取当前行数据id
		if(this.comp('dataTables').isChecked(row)){//判断是否勾选中【打勾】
			event.source.setRowCss(row,{"backgroundColor": "#93dffe"});
		}else{
			if(rowid%2==1){
				event.source.setRowCss(event.row,{"backgroundColor":"#f9f9f9"});
			} else {
				event.source.setRowCss(event.row,{"backgroundColor":"#fff"});
			}
		} 
	};
	//全选
	Model.prototype.dataTablesRowCheckedAll = function(event){
		var table=this.comp('dataTables');
		var checkedIDs=event.source.getCheckeds();
		if(checkedIDs.length==0){//全不选
			this.comp("data").each(function(obj){
				if(obj.index%2==0){
					table.setRowCss(obj.row,{"backgroundColor":"#f9f9f9"});
				} else {
					table.setRowCss(obj.row,{"backgroundColor":"#fff"});
				}				
			});
		} else {//全选
			for(var i=0; i<checkedIDs.length; i++){
				table.setRowCss(checkedIDs[i],{"backgroundColor":"#93dffe"});
			}
		}
	};
	
	//获取checkbox选中项按钮单击事件
	Model.prototype.buttonOneClick = function(event){
		var rows = this.comp("dataTables").getCheckeds();//选中的行  数组
		var id = new Array();
		for(var i=0;i<rows.length;i++){
			id.push(rows[i].val("tID"));
		}
		if(id.length == 0){
			justep.Util.hint("请至少选中一项", {"type":"info"});//提示信息
		}
		justep.Util.hint(""+id, {"type":"info"});//提示信息
	};
	
	//源码显示
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basicfive.js"
		},true);
	};
	//源码	
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basicfive.w&xid=dataTables"
		},true);
	};
			
	return Model;
});