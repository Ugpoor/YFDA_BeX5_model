define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.button1Click = function(event){
		if (confirm("点击了创建的按钮")) {  
            alert("点击了确定");  
        }
	};

	Model.prototype.button3Click = function(event){
		window.close();
	};

	return Model;
});