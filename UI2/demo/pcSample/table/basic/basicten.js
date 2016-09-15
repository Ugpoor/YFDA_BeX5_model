define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};

	//显示源码
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basicten.js"
		});
	};
	//显示源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basicten.w&xid=dataTables"
		},true);
	};


	return Model;
});