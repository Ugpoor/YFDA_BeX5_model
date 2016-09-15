define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	//接收调用者传递的数据
	Model.prototype.wReceiverReceive = function(event){
		this.comp('nameInput').val(event.data.name);//为弹出窗 赋值
		this.comp('password').val(event.data.password);
		this.comp('educationSelect').val(event.data.education);
		this.comp('radioGroup').val(event.data.sex);
		this.comp('dateInput').val(event.data.hiredate);
		pwd = event.data.password;
	};
	
	//确定button单击事件
	Model.prototype.OKButtonClick = function(event){
		var matchPwd = /^(?=\d{0,5}[a-zA-Z])(?=[a-zA-Z]{0,5}\d)[a-zA-Z0-9]{6}$/;
		if(this.comp('password').val()!= pwd){
			if(matchPwd.test(this.comp('password').val())){
				//返回数据 并关闭当前窗口
				this.comp("wReceiver").windowEnsure({
					name: this.comp('nameInput').val(),
					password: this.comp('password').val(),
					education: this.comp('educationSelect').val(),
					sex: this.comp('radioGroup').val(),
					hiredate: this.comp('dateInput').val()
				});
			}else{
				justep.Util.hint("密码为6位数字或字符组成,且必须含有一个数字、一个字符");
			}
		}else{
			justep.Util.hint("新密码与原密码不能相同！！！");
		}
	};
	//清空数据
	Model.prototype.clearButtonClick = function(event){
		this.comp('password').val("");
		this.comp('educationSelect').val("");
		this.comp('radioGroup').val("");
		this.comp('dateInput').val("");
	};

	return Model;
});