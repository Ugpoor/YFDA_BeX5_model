define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
    var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.firstToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("firstStatus");
			if(status==0)
				this.comp('statusData').setValue('firstStatus',1);
			if(status==1)
			     this.comp('statusData').setValue('firstStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.secondToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("secondStatus");
			if(status==0)
			   this.comp('statusData').setValue('secondStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('secondStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.thirdToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("thirdStatus");
			if(status==0)
			   this.comp('statusData').setValue('thirdStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('thirdStatus',0);
	};

   //判断statusData中的值控制div隐藏或显示
	Model.prototype.fourthToggleDivClick = function(event){
		var status=this.comp('statusData').getValue("fourthStatus");
			if(status==0)
			   this.comp('statusData').setValue('fourthStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('fourthStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.fifthToggleDivClick = function(event){
            var status=this.comp('statusData').getValue("fifthStatus");
			if(status==0)
			   this.comp('statusData').setValue('fifthStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('fifthStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.sixthToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("sixthStatus");
			if(status==0)
			   this.comp('statusData').setValue('sixthStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('sixthStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.seventhToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("seventhStatus");
			if(status==0)
			   this.comp('statusData').setValue('seventhStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('seventhStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.eighthToggleDivClick = function(event){
		var status=this.comp('statusData').getValue("eighthStatus");
			if(status==0)
			   this.comp('statusData').setValue('eighthStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('eighthStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.ninthToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("ninthStatus");
			if(status==0)
			   this.comp('statusData').setValue('ninthStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('ninthStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.ninthToggleBtnClick = function(event){
			var status=this.comp('statusData').getValue("ninthStatus");
			if(status==0)
			   this.comp('statusData').setValue('ninthStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('ninthStatus',0);
	};
	//判断statusData中的值控制div隐藏或显示
	Model.prototype.getStatusBtnClick = function(event){
			alert(this.comp('statusData').getValue("ninthStatus"));
	};

	//设置statusData的值是div显示
	Model.prototype.openBtnClick = function(event){
		 this.comp('statusData').setValue('ninthStatus',1);
	};

	//设置statusData的值是div不显示
	Model.prototype.closeBtnClick = function(event){
			this.comp('statusData').setValue('ninthStatus',0);
	};

	//判断statusData中的值控制div隐藏或显示
	Model.prototype.tenthToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("tenthStatus");
			if(status==0)
			   this.comp('statusData').setValue('tenthStatus',1);
		    if(status==1)
		    this.comp('statusData').setValue('tenthStatus',0);
	};

    //设置statusData的值是div显示
	Model.prototype.createBtnClick = function(event){
          this.comp('statusData').setValue('tenthDivStatus',1);
	};

  //判断statusData中的值控制div隐藏或显示
	Model.prototype.eleventhToggleDivClick = function(event){
			var status=this.comp('statusData').getValue("eleventhStatus");
			if(status==0){
			 this.comp('statusData').setValue('eleventhStatus',1);
			 alert(this.comp('statusData').getValue('eleventhStatus'));
			} 
		    if(status==1){
		      this.comp('statusData').setValue('eleventhStatus',0);
		      alert(this.comp('statusData').getValue('eleventhStatus'));
		    }

	};


	Model.prototype.jsClick = function(event){
		 util.showSource({
         self : this,
         data : "demo/pcSample/navigator/gridLine.js"
          },true);
	};


	Model.prototype.sourceClick = function(event){
		util.showSource({
	   self : this,
	   type : true,
	   data : "demo/pcSample/navigator/gridLine.w&xid=window"
	  },true);
	};


	return Model;
});