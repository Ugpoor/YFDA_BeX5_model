define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
		this.a = 10;
		this.tabs = 63;
		b=0;
		c=0;
	};
	//每次点击按钮激活tabs的的不同的li 当定义的变量超过tabs的li索引时,将li索引还原
	Model.prototype.checkBtnClick = function(event){
		this.comp('checkTabs').setActiveTab("li" + this.tabs);
		this.tabs= this.tabs + 1;
		if (this.tabs> 65)
			this.tabs= 62;
	};
	//将选项3设置bind-disable设定初始值为true 点击按钮改变statusData的edit的值 ，改变bind-disable值为false，从而使选项3可用
	Model.prototype.optionThreeBtnClick = function(event){
		this.comp('statusData').setValue("edit", 1);
	};
	//改变statusData的edit的值 使选项3不可用
	Model.prototype.optionThreeUnBtnClick = function(event){
		this.comp('statusData').setValue("edit", 0);
	};
	
	Model.prototype.checkIframeBtnClick = function(event) {
		this.comp('iframeCheckTabs').setActiveTab("li" + this.a);
		this.a = this.a + 1;
		if (this.a > 11)
			this.a = 9;
	};
	Model.prototype.startBtnClick = function(event) {
		this.comp('iframeStatusData').setValue("edit", 1);
	};
	Model.prototype.forbiddenBtnClick = function(event) {
		this.comp('iframeStatusData').setValue("edit", 0);
	};
	Model.prototype.progressBarLi1Click = function(event) {
		this.comp('loadPopOver').show();
		var me = this;
		window.setTimeout(function() {
			me.comp('loadPopOver').hide();
		}, 1000)
	};
	//点击按钮控制popover组件显示的时间
	Model.prototype.progressBarLi2Click = function(event) {
		this.comp('loadPopOver').show();
		var me = this;
		window.setTimeout(function() {
			me.comp('loadPopOver').hide();
		}, 1000)
	};
	//点击弹出选中项
	Model.prototype.optionOneClick = function(event){
			alert("你选中了选项1")
	};
	Model.prototype.optionTwoClick = function(event){
			alert("你选中了选项2")
	};

	//点击按钮得到被选中的xid
	Model.prototype.getIndexBtnClick = function(event) {
		var option = this.comp('options').getActiveXid();
		alert(option);

	};
     //鼠标移上去改变tabs的选中项
	Model.prototype.menuOption1Mouseover = function(event) {
		this.comp('mouseOverTabs').setActiveTab("menuOption1");
	};

	Model.prototype.menuOption2Mouseover = function(event) {
		this.comp('mouseOverTabs').setActiveTab("menuOption2");
	};

	Model.prototype.menuOption3Mouseover = function(event) {
		this.comp('mouseOverTabs').setActiveTab("menuOption3");
	};

	Model.prototype.a2Click = function(event){
		var id=this.getIDByXID("ul3");
	};
	//得到js对象 控制div横向滚动条距离左边的距离
	Model.prototype.scrollRightBtnClick = function(event){
			    var a=document.getElementsByName("aa");
			    b+=50;
				$(a)[0].scrollLeft=b;
				if(b>200){
					b=200;
				}		
	};
	Model.prototype.scrollLeftBtnClick = function(event){		
			 var a=document.getElementsByName("aa");
			   b=b-50;
			   $(a)[0].scrollLeft=b;
			   if(b<=0){
				   b=0;
			   } 
	};
	Model.prototype.iframeScrollLeftBtnClick = function(event){
				var a=document.getElementsByName("bb");
			   c=c-50;
			   $(a)[0].scrollLeft=c;
			   if(c<=0){
				   c=0;
			   }
	};	
	Model.prototype.iframeScrollRightBtnClick = function(event){
		
			   var a=document.getElementsByName("bb");
			    c+=50;
				$(a)[0].scrollLeft=c;
				if(c>200){
					c=200;
				}
	};
		
	
	Model.prototype.jsClick = function(event){
		 util.showSource({
         self : this,
         data : "demo/pcSample/navigator/basic-2.js"
  },true);
	};
	
	Model.prototype.sourceClick = function(event){
		util.showSource({
		self : this,
		type : true,
		data : "demo/pcSample/navigator/basic-2.w&xid=window"
	},true);
	};
	
	return Model;
});