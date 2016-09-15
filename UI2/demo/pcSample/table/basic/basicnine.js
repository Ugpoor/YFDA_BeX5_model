define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};

	//渲染单元格事件设置前景色 
	Model.prototype.dataTablesCellRender = function(event){
		if(event.colName == 'tName'){
			if(event.colVal == '张小三'){
				 event.html='<font color="red">' + event.html + '</font>';
			}else if(event.colVal == '李小四'){
				 event.html='<font color="blue">' + event.html + '</font>';
			}else {
				event.html='<font color="black">' + event.html + '</font>';
			}
		}
	};
	//显示源码
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basicnine.js"
		},true);
	};
	//显示源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basicnine.w&xid=dataTables"
		},true);
	};

	return Model;
});