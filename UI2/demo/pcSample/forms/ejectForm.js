define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.closeBtnClick = function(event){
		this.comp("windowReceiver").windowCancel();
	};
	//验证用户名和密码
	Model.prototype.nextBtnClick = function(event){
		var name = this.getElementByXid("name").value;
		var pass = this.getElementByXid("pass").value;
		var reg = /^\w{3,15}$/;
		if(!reg.test(name)){
			justep.Util.hint("请输入正确的用户名，3-15个字符");
			return false;
		}else if(!reg.test(pass)){
			justep.Util.hint("请输入正确的密码，3-15个字符");
			return false;
		}
	};
	//验证邮箱和QQ
	Model.prototype.regBtnClick = function(event){
		var email = this.getElementByXid("email").value;
		var QQ = this.getElementByXid("QQ").value;
		var reg = /^\d{6,11}$/;
		var regEmail = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
		if(!regEmail.test(email)){
			justep.Util.hint("请输入正确邮箱");
			return false;
		}else if(!reg.test(QQ)){
			justep.Util.hint("QQ---6-11位数字");
			return false;
		}
	};
	//验证电话和地址；
	Model.prototype.closeBtnClickClick = function(event){
		var tel = this.getElementByXid("tel").value;
		var address = this.getElementByXid("address").value;
		var reg = /^[1][3,4,5,7,8,]\d{9}$/;
		if(!reg.test(tel)){
			justep.Util.hint("请输入正确的电话号码");
			return false;
		}else if(!address){
			justep.Util.hint("地址不能为空；");
			return false;
		}else{
			justep.Util.hint("提交成功。。。请等待审核：");
			this.comp("windowReceiver").windowCancel();
		}
		

	};
	return Model;
});