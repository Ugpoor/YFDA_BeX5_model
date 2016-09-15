define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
		a=15;
		b=35;
		c=0;
		d=0;
	};
	//切换buttongroup组件的选中项，每次定义的变量a加1,当超过button索引时还原变量a，选中选项时跳到相应的content
	Model.prototype.checkBtnClick = function(event){
		this.comp('optionBtnGroup').set("selected","button"+a);
		this.comp('pages').to('page'+a);
		a=a+1;
		if(a>17)
			a=14;
	};
	//将选项3设置bind-disable设定初始值为true 点击按钮改变statusData的edit的值 ，改变bind-disable值为false，从而使选项3可用
	Model.prototype.startUsingBtnClick = function(event){
			this.comp('statusData').setValue('status', 1);
	};
	//改变statusData的edit的值 使选项3不可用
	Model.prototype.forbiddenBtnClick = function(event){
			this.comp('statusData').setValue('status', 0);
	};
	
	Model.prototype.iframeCheckBtnClick = function(event){
			this.comp('iframeOptionBtnGroup').set("selected","button"+b);
			this.comp('iframePages').to('iframePage'+b);
			b=b+1;
			if(b>36)
				b=34;
	};
	//将选项3设置bind-disable设定初始值为true 点击按钮改变statusData的status的值 ，改变bind-disable值为false，从而使选项3可用
	Model.prototype.iframeStartUsingBtnClick = function(event){
			this.comp('iframeStatusData').setValue('status', 1);
	};
	//改变statusData的status的值 使选项3不可用
	Model.prototype.iframeforbiddenBtnClick = function(event){
			this.comp('iframeStatusData').setValue('status', 0);
	};
	//点击按钮控制popover组件显示的时间
	Model.prototype.progressBtn1Click = function(event){
			this.comp('loadPopOver').show();
			var me = this;
			window.setTimeout(function() {
				me.comp('loadPopOver').hide();
			}, 1000)
	};

	Model.prototype.progressBtn2Click = function(event){
			this.comp('loadPopOver').show();
			var me = this;
			window.setTimeout(function() {
				me.comp('loadPopOver').hide();
			}, 1000)
	};

	Model.prototype.optionEventBtn1Click = function(event){
			alert(0);
	};

	Model.prototype.optionEventBtn2Click = function(event){
		alert(1);
	};
	//点击按钮设置buttonGroup的selected属性  
	Model.prototype.optionsOneClick = function(event){
		this.comp('optionsGroup').set("selected","optionsOne");
	};	

	Model.prototype.optionsTwoClick = function(event){
		this.comp('optionsGroup').set("selected","optionsTwo");
	};	
	Model.prototype.getIndexBtnClick = function(event){
	  alert(this.comp('optionsGroup').get("selected"));
	};
  //鼠标移上去选中相应的button 跳到相应的content
	Model.prototype.programBtnoneMouseover = function(event){
			this.comp('programGroup').set("selected","programBtnone");
			this.comp('programPages').to('programPageone');
	};

	Model.prototype.programBtntwoMouseover = function(event){
			this.comp('programGroup').set("selected","programBtntwo");
			this.comp('programPages').to('programPagetwo');
	};

	Model.prototype.programBtnthreeMouseover = function(event){
             this.comp('programGroup').set("selected","programBtnthree");
			this.comp('programPages').to('programPagethree');
	};

	Model.prototype.programBtnfourMouseover = function(event){
            this.comp('programGroup').set("selected","programBtnfour");
			this.comp('programPages').to('programPagefour');
	};
	//取div的js对象 控制横向滚动条的位置
	Model.prototype.scrollRightBtnClick = function(event){
			    var a=document.getElementsByName("aa");
			    c+=50;
				$(a)[0].scrollLeft=c;
				if(c>200){
					c=200;
				}		
	};
	Model.prototype.scrollLeftBtnClick = function(event){		
			 var a=document.getElementsByName("aa");
			   c=c-50;
			   $(a)[0].scrollLeft=c;
			   if(c<=0){
				   c=0;
			   } 
			   
	};
	Model.prototype.iframeScrollLeftBtnClick = function(event){
				var a=document.getElementsByName("bb");
			   d=d-50;
			   $(a)[0].scrollLeft=c;
			   if(d<=0){
				   d=0;
			   }
	};	
	Model.prototype.iframeScrollRightBtnClick = function(event){
		
			   var a=document.getElementsByName("bb");
			    d+=50;
				$(a)[0].scrollLeft=d;
				if(d>200){
					d=200;
				}
				
	};	

	Model.prototype.jsClick = function(event){
		 util.showSource({
         self : this,
         data : "demo/pcSample/navigator/basic-flow.js"
     },true);
    
	};	

	
	

	Model.prototype.sourceClick = function(event){
		util.showSource({
	   self : this,
	   type : true,
	   data : "demo/pcSample/navigator/basic-flow.w&xid=window"
	  },true);
	};	

	
	

	return Model;
});