define(function(require){
	var $ = require("jquery");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};
	//源码
	Model.prototype.jsButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basictwelve.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basictwelve.w&xid=dataTables"
		},true);
	};

	return Model;
});