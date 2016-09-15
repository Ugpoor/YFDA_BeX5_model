define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.modelParamsReceive = function(event){
		var context = this.getContext();
		
		//获取URL中的参数
		var p1 = context.getRequestParameter("p1");
		var p2 = context.getRequestParameter("p2");
		var buf = "来自url的参数: p1=" + p1 + ", p2=" + p2 + "\n";
		
		//获取简单参数
		buf += "简单参数：params.a1=" + event.params.a1 + ", params.a2=" + event.params.a2 + "\n";
		
		//获取复杂参数
		buf += "复杂参数：\n"
		if (event.params.data){
			buf += "    params.data.d1=" + event.params.data.d1 + "\n";
			buf += "    params.data.d2=" + event.params.data.d2 + "\n";
		}
		alert(buf);
	};

	Model.prototype.button1Click = function(event){
		var context = this.getContext();
		
		//获取URL中的参数
		var p1 = context.getRequestParameter("p1");
		var p2 = context.getRequestParameter("p2");
		var buf = "来自url的参数: p1=" + p1 + ", p2=" + p2 + "\n";
		
		//获取简单参数
		buf += "简单参数：params.a1=" + this.params.a1 + ", params.a2=" + this.params.a2 + "\n";
		
		//获取复杂参数
		buf += "复杂参数：\n"
		if (this.params.data){
			buf += "    params.data.d1=" + this.params.data.d1 + "\n";
			buf += "    params.data.d2=" + this.params.data.d2 + "\n";
		}
		alert(buf);
	};

	Model.prototype.modelActive = function(event){
		debugger;
	};

	return Model;
});
