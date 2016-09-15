define(function(require){
	var $ = require("jquery");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js
	
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};
	
	//源码显示[.js .css都可以]
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/scrollX/scrollX.js"
		},true);
	};
	//源码显示
	Model.prototype.showSourceBtnClick = function(event) {
		util.showSource({
			self : this,
			data:'demo/pcSample/table/scrollX/scrollX.w&xid=dataTables',
			type:true
		},true);
	};

	return Model;
});