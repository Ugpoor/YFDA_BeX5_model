define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.searchBtnClick = function(event){
			this.comp('message').show({message:"搜索"});
	};

	Model.prototype.applyBtnClick = function(event){
			this.comp('message').show({message:"应用"});
	};

	Model.prototype.statisticsBtnClick = function(event){
			this.comp('message').show({message:"统计"});
	};

	Model.prototype.toleadBtnClick = function(event){
			this.comp('message').show({message:"导入"});
	};

	Model.prototype.addBtnClick = function(event){
			this.comp('message').show({message:"增加"});
	};

	Model.prototype.deleteBtnClick = function(event){
			this.comp('message').show({message:"删除"});
	};

	Model.prototype.lockBtnClick = function(event){
		this.comp('message').show({message:"锁定"});
	};

	Model.prototype.exportBtnClick = function(event){
			this.comp('message').show({message:"导出"});
	};

	Model.prototype.printpreviewBtnClick = function(event){
          this.comp('message').show({message:"打印预览"});
	};

	Model.prototype.printBtnClick = function(event){
			 this.comp('message').show({message:"打印"});
	};

	Model.prototype.aboutBtnClick = function(event){
			 this.comp('message').show({message:"关于"});
	};

	Model.prototype.jsClick = function(event){
		 util.showSource({
         self : this,
         data : "demo/pcSample/navigator/toolbar.js"
        },true);
	};

	Model.prototype.sourceClick = function(event){
		util.showSource({
	   self : this,
	   type : true,
	   data : "demo/pcSample/navigator/toolbar.w&xid=window"
	  },true);
	};

	return Model;
});