define(function(require){
	//var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");
	//var Locker = require("$UI/system/components/justep/locker/locker");

	var Model = function(){
		this.callParent();
		this.result = null;
	};

	Model.prototype.getReturnValue = function() {
		return {
			password : this.result?('['+this.result+']'):''
		};
	};

	Model.prototype.linePoint = function(event){
		event.clear = false;
		this.result = event.values;
		$(this.getElementByXid("divLabel")).text("输入密码："+event.values);
	};
	
	return Model;
});