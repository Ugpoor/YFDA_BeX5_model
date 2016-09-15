define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	//1.1提示信息
	Model.prototype.button2Click = function(event){
		alert('这里是提示信息');
	};
	//1.2提示自动
	Model.prototype.button3Click = function(event){
		//window.setTimeout(closeWin(), 2);
		
	};
	function closeWin(){
		alert("a");
	}
	//1.3询问信息
	Model.prototype.button4Click = function(event){
		if (confirm("你确定提交吗？")) {  
            alert("点击了确定");  
        }  
        else {  
            alert("点击了取消");  
        }  
	};
	//2.1普通窗口
	Model.prototype.button5Click = function(event){
		this.comp('windowDialog1').open();
	};
	//2.2自定义宽高
	Model.prototype.button6Click = function(event){
		this.comp('windowDialog2').open();
	};
	//2.3带说明栏窗口
	Model.prototype.button7Click = function(event){
		this.comp('windowDialog3').open();
	};
	//2.4无遮罩窗口(*)
	Model.prototype.button8Click = function(event){
		this.comp('windowDialog4').open();
	};
	//2.5最大化与最小化
	Model.prototype.button9Click = function(event){
		window.open("page.w", '', 'height=400, width=400, top=100, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')
	};
	//2.6初始时最大化窗口
	Model.prototype.button10Click = function(event){
		window.open("page.w",'','fullscreen');
		
	};
	//3.1非iframe弹窗（简单内容）
	Model.prototype.button11Click = function(event){
		this.comp('windowDialog5').open();
	};
	//3.2非iframe（复杂内容）(*tree)
	Model.prototype.button12Click = function(event){
		this.comp('windowDialog6').open();
	};
	//3.3非iframe（复杂内容2）
	Model.prototype.button13Click = function(event){
		this.comp('windowDialog7').open();
	};
	//3.4指定弹出位置
	Model.prototype.button1Click = function(event){
		this.comp('windowDialog8').open();
	};
	//3.5自动关闭
	
	//4.1确定、取消、最大化、最小化、关闭
	Model.prototype.button14Click = function(event){
		window.open("page3.w", '', 'height=400, width=400, top=100, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	};
	//4.2更改按钮	
	Model.prototype.button15Click = function(event){
		window.open("page4.w", '', 'height=400, width=400, top=100, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	};
	//4.3创建新按钮
	Model.prototype.button16Click = function(event){
		window.open("page5.w", '', 'height=400, width=400, top=100, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	};
	//5.1提交表单并刷新父页
	Model.prototype.button17Click = function(event){
		this.comp('windowDialog9').open();
		
	};
	//5.2手动关闭窗口并刷新页面1
	Model.prototype.button18Click = function(event){
		this.comp('windowDialog10').open();
	};	
	//5.3手动关闭窗口并刷新页面2
	Model.prototype.button19Click = function(event){
		this.comp('windowDialog11').open();
	};
	//6.1手动关闭窗口1	
	Model.prototype.button20Click = function(event){
		this.comp('windowDialog12').open();
	};
	//6.2手动关闭窗口2
	Model.prototype.button21Click = function(event){
		this.comp('windowDialog13').open();
	};
	//6.3打开第二个窗口关闭前一个窗口
	Model.prototype.button22Click = function(event){
		this.comp('windowDialog14').open();
	};
	//7.1本页面获取窗口页的值
	Model.prototype.button23Click = function(event){
		this.comp('windowDialog15').open();
	};
	
	Model.prototype.windowDialog15Receive = function(event){
		alert(event.data);
		
	};
	//7.2本页面调取窗口页的方法
	Model.prototype.button24Click = function(event){
		this.comp('windowDialog16').open();
	};
	//7.3窗口将值传给本页
	Model.prototype.button25Click = function(event){
		this.comp('windowDialog18').open();
	};
	Model.prototype.windowDialog18Receive = function(event){
		this.comp('input3').val(event.data);
	};
	//7.4窗口之间传值
	Model.prototype.button26Click = function(event){
		this.comp('windowDialog17').open();
	};
	//8
	//9.1窗口1	
	Model.prototype.button27Click = function(event){
		this.comp('windowDialog19').open();
	};
	//9.2窗口2
	Model.prototype.button28Click = function(event){
		this.comp('windowDialog19').open();
	};
	//9.3窗口3
	Model.prototype.button29Click = function(event){
		this.comp('windowDialog19').open();
	};
	
	
	
	
	return Model;
});