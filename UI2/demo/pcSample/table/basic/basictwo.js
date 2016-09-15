define(function(require){
	var $ = require("jquery");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js	
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;//用来显示源码的自定义变量
	};
	
	//源码显示
	Model.prototype.showCSSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basictwo.css"
		},true);
	};
	//源码	
	Model.prototype.showJSButtonClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/table/basic/basictwo.js"
		},true);
	};
	
	//源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/basic/basictwo.w&xid=dataTables"
		},true);
	};
	
	
	return Model;
});
