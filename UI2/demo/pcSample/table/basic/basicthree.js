define(function(require){
	var $ = require("jquery");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js
	var arr = [];//定义一个全局[数组]变量
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;//显示源码自定义的变量
	};
	//鼠标单击变色[多行]
	Model.prototype.dataTablesRowClick = function(event){
		var rowid = this.comp('data').getRowIndex(event.row)+1;//获取当前行数据id
		if(arr.indexOf(event.row.val("tID")) == -1){//判断数组中是否有tID
			event.source.setRowCss(event.row,{"backgroundColor": "#93dffe"});
			arr.push(event.row.val("tID"));
		}else{
			if(rowid%2==1){
				event.source.setRowCss(event.row,{"backgroundColor":"#f9f9f9"});
			} else {
				event.source.setRowCss(event.row,{"backgroundColor":"#fff"});
			}
			for(var i = 0; i<arr.length; i++){
				if(event.row.val("tID") == arr[i]){
					arr.splice(i,1);//向数组中添加/删除元素，删除第i个，删除1个
				}
			}
		}
	};
	
	//源码显示[.js .css都可以，]
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basicthree.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basicthree.w&xid=dataTables"
		},true);
	};
	
	return Model;
});
