define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/text/listeningTextChange.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/text/listeningTextChange.w&xid=window"
		},true);
	};
	Model.prototype.textareaChange = function(event){
		 var text=this.comp('textarea').get('value');
		 if(text.length>2)
			 justep.Util.hint("输入:"+text);
	};
	return Model;
});