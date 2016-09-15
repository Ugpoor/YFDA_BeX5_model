define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Textarea=require("$UI/system/components/justep/textarea/textarea");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	//动态创建
	Model.prototype.addBtnClick = function(event){
		var parentNode = this.getElementByXid("col8");
		if (parentNode) {
			var options = {
				parentNode : parentNode,
				xid : "textarea"
			}
		}
		var textarea = new Textarea(options);
	textarea.set({"placeHolder":"请输入备注信息"});
	};
	//禁用 可用
	Model.prototype.enableClick = function(event){
	this.comp("textareaEnable").set({
	"disabled" : false
	});
	};

	Model.prototype.disabledClick = function(event){
		this.comp("textareaEnable").set({"disabled":true});
	};
	//动态改变输出框大小
	Model.prototype.labelTextareaHeightKeypress = function(event){
		var data=this.comp("textareaHeight");
		var height=$(data.domNode).height();
		if(data.get("value").length%20==0&&data.get("value").length/20>1){
		
		data.setCSS({
		"height":height+100
		});
		
		}
	};
	//显示剩余字数
	Model.prototype.textareaNUmKeydown = function(event){
		var data = this.comp("textareaNUm");
		var num = 150 - data.get("value").length;
		this.comp("textareaData").setValue("num", "剩余字数" + num);
	};
	//js代码
	Model.prototype.jsBtnClick = function(event){
			util.showSource({
			self : this,
			data : "demo/pcSample/form-element/textarea.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/textarea.w&xid=contents"
		}, true);
	};

	return Model;
});