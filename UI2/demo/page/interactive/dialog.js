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
			buf += "    params.data.fn=" + event.params.data.fn + "\n";
			this.comp("dlgData").loadData([event.params.data.data1]);
			this.comp("dlgData").first();
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
			buf += "    params.data.fn=" + this.params.data.fn + "\n";
		}
		alert(buf);
	};
	
	Model.prototype.button3Click = function(event){
		this.owner.send(this.comp("dlgData").getCurrentRow());
		this.close();
	};

	return Model;
});
