define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Input = require("$UI/system/components/justep/input/input");
	var Password = require("$UI/system/components/justep/input/password");
	var Output=require("$UI/system/components/justep/output/output")
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.delBtnClick = function(event){
		this.comp("textBox").clear();
	};

	Model.prototype.deleteClick = function(event){
		this.comp("textPassword").set({
			"value" : ""
		});
	};
	//显示剩余字数
	Model.prototype.inputKeyup = function(event){
		var data = this.getElementByXid("input").value;
		var num =5- data.length;
		this.comp("data").setValue("num", "剩余字数"+num);
	};

	Model.prototype.passwordKeyup = function(event){
		var data = this.getElementByXid("password").value;
		var num =5 - data.length;
		this.comp("numData").setValue("num","剩余字数"+num);
	};
	
	//监听大小写
	Model.prototype.lockKeyup = function(event){
	  var data=this.comp("name");
	  debugger
	  var str=this.getElementByXid("lock").value;
	  var  string=str.substring(str.length-1,str.length);
	  if (/[A-Z]+/.test(string)){
		   data.setValue("lock", "大写锁定已打开");
	   }else{
		   data.setValue("lock", " ");
	   }
	};
	//判断密码强度
	Model.prototype.passwordStrengthKeyup = function(event){
		var string = this.getElementByXid("passwordStrength").value;
		if (string.length >= 6) {
			if (/[a-zA-Z]+/.test(string) && /[0-9]+/.test(string) && /\W+\D+/.test(string)) {
				this.noticeAssign(1);
			} else if (/[a-zA-Z]+/.test(string) || /[0-9]+/.test(string) || /\W+\D+/.test(string)) {
				if (/[a-zA-Z]+/.test(string) && /[0-9]+/.test(string)) {
					this.noticeAssign(-1);
				} else if (/\[a-zA-Z]+/.test(string) && /\W+\D+/.test(string)) {
					this.noticeAssign(-1);
				} else if (/[0-9]+/.test(string) && /\W+\D+/.test(string)) {
					this.noticeAssign(-1);
				} else {
					this.noticeAssign(0);
				}
			}
		} else {
			this.noticeAssign(null);
		}
	};

	Model.prototype.noticeAssign = function(num) {
		var data = this.comp("name");
		if (num == 1) {
			data.setValue("strength", "密码强");
		} else if (num == -1) {
			data.setValue("strength", "密码中");
		} else if (num == 0) {
			data.setValue("strength", "密码弱");
		} else {
			data.setValue("strength", "");
		}
	};
	//禁用 可用
	Model.prototype.disableBtnClick = function(event) {
	this.comp("enableData").setValue("disabled",1);
	};
	Model.prototype.enableBtnClick = function(event) {
	this.comp("enableData").setValue("disabled",0);
	};
	//动态创建
	Model.prototype.addInputClick = function(event) {
		var parentNode = this.getElementByXid("insertInput");
		if (parentNode) {
			var options = {
				parentNode : parentNode,
				xid : "input"
			}
		}
		var input = new Input(options);
		input.set({
			"placeHolder" : "请输入"
		});
	};
	Model.prototype.addPasswordClick = function(event) {
	var me=this;
		var parentNode = this.getElementByXid("insertPassword");
		if (parentNode) {
			var options = {
				parentNode : parentNode,
				xid : "passwordStrength"
			}
		}
		var password = new Password(options);
		password.set({
			"placeHolder" : "请输入密码"
		})
	};
	//监听回车事件
	Model.prototype.enterKeypress = function(event){

		e = window.event || event;
		var keyCode = e.keyCode || e.which;
		var data=this.comp("enterPassword");
		if (keyCode == 13){
			$(data.domNode).focus();
		}
	};
	Model.prototype.enterPasswordKeypress = function(event){
			e = window.event || event;
		var keyCode = e.keyCode || e.which;
		var data=this.comp("enterPassword");
		if (keyCode == 13){
			justep.Util.hint("正在进行登录处理");
		}
	};
	//重置
	Model.prototype.resetBtnClick = function(event){
		this.comp("enter").set({
			"value" : ""
		});
		this.comp("enterPassword").set({
			"value" : ""
		});
	};
	Model.prototype.loginBtnClick = function(event){
		justep.Util.hint("正在进行登录处理");
	};
	// js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/text-box.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/text-box.w&xid=contents"
		}, true);
	};
	Model.prototype.sourceBtnClick = function(event){
			util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/text-box.w&xid=row4"
		});
	};
	
	return Model;
});