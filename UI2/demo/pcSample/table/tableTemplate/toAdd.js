define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
/*组件中验证的属性只有input框才有，建议增加验证，并且增加验证提示*/


	//确定button单击事件， 部分表单验证
	Model.prototype.OKButtonClick = function(event){
		var matchName = /^[a-zA-Z\u4e00-\u9fa5]{1,5}$/gi;//正则表达式
		var matchPwd = /^(?=\d{0,5}[a-zA-Z])(?=[a-zA-Z]{0,5}\d)[a-zA-Z0-9]{6}$/;//一条正则验证密码强度,密码为6位数字或字符组成,且必须含有一个数字、一个字符
		var currentDate = new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+new Date().getDate();
//		alert(currentDate);
		if(this.comp('inputName').val() != ""){
			if(matchName.test(this.comp('inputName').val())){
				if(matchPwd.test(this.comp('pwd').val())){
					if(this.comp('pwds').val() == this.comp('pwd').val()){
						if(!(isNaN(this.comp('inputAge').val()))){//判断是不是数字
							if(this.comp('inputAge').val()>0 && this.comp('inputAge').val()<120){
								//返回数据 并关闭当前窗口
								this.comp('windowReceiver').windowEnsure({
									name: this.comp('inputName').val(),
									password: this.comp('pwd').val(),
									sex: this.comp('radioGroup').val(),
									age: this.comp('inputAge').val(),
									education: this.comp("select").val(),
									hiredate: this.comp('inputDate').val(),//设置默认日期【今天】，没有效果
									remark: this.comp('textarea').val()
								});
							}else{
								justep.Util.hint("年龄必须在0-120之间");
								this.comp('inputAge').val("");
							}
						}else{
							justep.Util.hint("年龄必须是数字");
							this.comp('inputAge').val("");
						}
					}else{
						justep.Util.hint("两次密码不一致,请重新输入");
						this.comp('pwds').val("");
					}
				}else{
					justep.Util.hint("密码为6位数字或字符组成,且必须含有一个数字、一个字符");
//					this.comp('pwd').val("");
				}
			}else{
				justep.Util.hint("用户名必须是中文或英文字母");
				this.comp('inputName').val("");
			}
		}else{
			justep.Util.hint("用户名不能为空！");
		}			
	};
	
	return Model;
});