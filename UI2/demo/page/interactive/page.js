define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	//-----------Shell.showPage相关
	Model.prototype.button5Click = function(event){
		//"p2"是pageMappings定义的页面标识
		justep.Shell.showPage("p2");
	};

	Model.prototype.button6Click = function(event){
		var url = require.toUrl("./page2.w");
		justep.Shell.showPage(url);
	};

	Model.prototype.button7Click = function(event){
		var url = require.toUrl("./page2.w?p1=p1Value&p2=p2Value");
		var params = {
			a1: "a1Value",
			a2: 2,
			data: {
				d1: "d1Value",
				d2: "d2Value"
			}
		}
		justep.Shell.showPage(url, params)
	};

	
	//----------WindowContainer相关
	Model.prototype.button8Click = function(event){
		var url = require.toUrl("./page3.w?p1=p1ValueNew&p2=p2NewValueNew");
		var params = {
			a1: "a1ValueNew",
			a2: 20,
			data: {
				d1: "d1ValueNew",
				d2: "d2ValueNew"
			}
		}
		this.comp("windowContainer1").load(url, params);
	};
	Model.prototype.windowContainer1Receive = function(event){
		alert("接收到内嵌页面的返回数据：r1=" + event.data.r1);
	};


	

	//-----------WindowDialog相关
	Model.prototype.button1Click = function(event){
		var dialog = this.comp("dialog");
		var url = require.toUrl("./dialog.w?p1=参数1&p2=参数2");
		dialog.open({
			src: url,
			params: {
				a1: "简单数据a1",
				a2: 2,
				//data是特殊的参数, 这部分内容不能被分享
				data: {
					//将一个函数传递给对话框
					fn: function(){        
						alert("将一个函数传到对话框中");
					}, 
					//将data中的一行数据传给对话框
					data1: this.comp("data1").getCurrentRow().toJson()
				} 
			}
			
		})
	};
	Model.prototype.dialogReceive = function(event){
		alert("页面接收对话框架返回的数据：" + JSON.stringify(event.data.toJson()));
	};
	Model.prototype.dialogClose = function(event){
		alert("对话框关闭");
	};
	Model.prototype.modelActive = function(event){
		debugger;
	};
	return Model;
});