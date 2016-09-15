define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
		this.a = 10;
		this.page = 10;
		b=0;
		c=0;

	};
	//点击按钮显示popMenu组件
	Model.prototype.button29Click = function(event) {
		this.comp('popMenu1').show();
	};
	//点击按钮改变buttongroup的选中项 并跳到相应的页面
	Model.prototype.checkBtnClick = function(event) {
		this.comp('checkbBtnGroup').set("selected", "pageBtn" + this.a);
		this.comp('contents6').to("page" + this.page);
		this.a = this.a + 1;
		this.page = this.page + 1;
		if (this.a > 12)
			this.a = 9;
		if (this.page > 12)
			this.page = 9;
	};
	//启用按钮
	Model.prototype.enabledBtnClick = function(event) {
		this.comp('pageBtn15').set("disabled", false);
	};
	//禁用按钮
	Model.prototype.disabledBtnClick = function(event) {
		this.comp('pageBtn15').set("disabled", true);
	};
	Model.prototype.checkIframeBtnClick = function(event) {
		this.comp('iframeCheckTabs').setActiveTab("li" + this.a);
		this.a = this.a + 1;
		if (this.a > 11)
			this.a = 9;
	};
	//改变statusData的edit的值 使选项3可用
	Model.prototype.startBtnClick = function(event) {
		this.comp('statusData').setValue("edit", 1);
	};
	//改变statusData的edit的值 使选项3不可用
	Model.prototype.forbiddenBtnClick = function(event) {
		this.comp('statusData').setValue("edit", 0);
	};
	//控制popover显示的时间
	Model.prototype.progressBarLi1Click = function(event) {
		this.comp('loadPopOver').show();
		var me = this;
		window.setTimeout(function() {
			me.comp('loadPopOver').hide();
		}, 1000)
	};
	Model.prototype.progressBarLi2Click = function(event) {
		this.comp('loadPopOver').show();
		var me = this;
		window.setTimeout(function() {
			me.comp('loadPopOver').hide();
		}, 1000)
	};
	//弹出选中项
	Model.prototype.li26Click = function(event) {
		alert("你选中了选项1")
	};
	Model.prototype.li25Click = function(event) {
		alert("你选中了选项2")
	};
	//弹出tabs的选中项
	Model.prototype.button15Click = function(event) {
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
	//获取div的js对象 改变横向滚动条的位置
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
         data : "demo/pcSample/navigator/Basic.js"
     },true);
	};
	Model.prototype.sourceClick = function(event){
		util.showSource({
	   self : this,
	   type : true,
	   data : "demo/pcSample/navigator/Basic.w&xid=window"
	  },true);
	};
	return Model;
});