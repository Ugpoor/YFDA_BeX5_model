define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	//弹出窗，接收调用者传入的数据
	Model.prototype.windowReceiverReceive = function(event){
		this.comp('nameInput').val(event.data.name);//设置值
		this.comp('radioGroup').val(event.data.sex);
		this.comp('ageInput').val(event.data.age);
		this.comp('addressInput').val(event.data.address);
	};
	
	//确定按钮 onClick 单击事件
	Model.prototype.OKButtonClick = function(event){
		//返回数据 并关闭当前窗口
		this.comp("windowsReceiver").windowEnsure({
			name: this.comp('nameInput').val(),
			sex: this.comp('radioGroup').val(),
			age: this.comp('ageInput').val(),
			address: this.comp('addressInput').val()
		});
	};
	//清空按钮 单击事件
	Model.prototype.resetButtonClick = function(event){
		this.comp('nameInput').val("");//设置值
		this.comp('radioGroup').val("");
		this.comp('ageInput').val("");
		this.comp('addressInput').val("");
	};

	return Model;
});