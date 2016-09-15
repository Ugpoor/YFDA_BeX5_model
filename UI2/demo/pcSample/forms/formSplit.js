define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Message = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.flag = true;
		this.callParent();
	};
	
	//弹出框
	Model.prototype.findBtnClick = function(event){
		this.comp("eiectDialog").open();
	};
	//查看js代码；
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/formSplit.js"
		});
	};
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/formSplit.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/formSplit.w&xid=controlGroup"
		},true);
	};
	//提示邮箱不能为空
	Model.prototype.checkboxChange = function(event){
		var email = this.getElementByXid("email");
		if(this.flag){
			email.innerHTML = "邮箱不能为空";
			email.style.color = "red";
			this.flag = false;
		}else{
			email.innerHTML = "";
			this.flag = true;
		}
		
	};
	//重置
	Model.prototype.regBtnClick = function(event){
		var data = this.comp("uData");
		data.clear();
		var row = data.getCurrentRow();
		if(!row){
			data.refreshData();
		}
		
	};
	//姓名验证
	Model.prototype.subBtnClick = function(event){
		var name = this.comp("nameInput").val();
		var message = this.comp("messageDialog");
		if(!name){
			message.show({"message":"用户名不能为空"});
		}else{
			message.show({"message":"提交成功"});
		}
	};
	//邮箱验证；
	Model.prototype.subButtClick = function(event){
		var money = this.comp("money").val();
		var monspan = this.getElementByXid("monspan");
		var reg = /^(([5-9]\d)|([1-9]\d{2,}))$/;
		if(!reg.test(money)){
			monspan.innerHTML = "不能小于50";
			monspan.style.color = "red";
		}else{
			justep.Util.hint("提交成功");
			monspan.innerHTML = "OK!";
			monspan.style.color = "green";
		}
	};
	
	
	//清空数据
	Model.prototype.regClick = function(event){
		this.comp("money").clear();
	};
	
	
	//用户名验证。
	Model.prototype.submClick = function(event){
		var username = this.comp("username").val();
		var message = this.comp("messageDialog");
		var name = "admin";
		if(username==name){
			message.show({"message":"用户名不能为admin"});
		}else if(!username){
			message.show({"message":"用户名不能为空"});
		}else{
			message.show({"message":"提交成功"});
		}
	};
	
	//清空数据
	Model.prototype.regestClick = function(event){
		this.comp("username").clear();
	};
	
	//把软件盘的值添加到input框
	Model.prototype.showNum = function(event){
		var data =event.source.get("label");

		this.comp("numData").setValue("num",this.comp("numData").getValue("num")==null?""+data:this.comp("numData").getValue("num")+data);
		
	};

	//清空数据
	Model.prototype.clearBtnClick = function(event){
		this.comp("num").clear();
	};
	
	//删除最后一个数字
	Model.prototype.deleBtnClick = function(event){
		var data = this.comp("numData").getValue("num");
		if(data==null){
			this.comp("numData").setValue("num","");
		}else{
			var str = data.substring(0,data.length-1);
			this.comp("numData").setValue("num",str);
		}
		
	};
	//隐藏软键盘；
	Model.prototype.closeBtnClick = function(event){
		var div = this.getElementByXid("showdiv");
		div.style.display = "none";
	};
	//显示软键盘；
	Model.prototype.numFocus = function(event){
		var div = this.getElementByXid("showdiv");
		div.style.display = "block";
	};
	
	return Model;
});