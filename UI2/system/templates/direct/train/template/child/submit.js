define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.subBtnClick = function(event){
		var name = this.comp("username").val();
		var span = this.getElementByXid("userSpan");
		if(!name){
			span.innerHTML="姓名不能为空!";
			span.style.color = "red";
			span.style.fontSize = "18px";
		}else{
			span.innerHTML="OK!";
			span.style.color = "green";
			span.style.fontSize = "18px";
		}
	};
	
	return Model;
});