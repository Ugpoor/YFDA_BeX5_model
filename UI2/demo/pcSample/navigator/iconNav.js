define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util=require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	//点击弹出信息
	Model.prototype.centerColClick = function(event){
			this.comp('message').show({message:"个人中心"});
	};

	Model.prototype.favoriteColClick = function(event){
			this.comp('message').show({message:"个人收藏夹"});
	};

	Model.prototype.searchColClick = function(event){
			this.comp('message').show({message:"高级搜索"});
	};

	Model.prototype.docColClick = function(event){
			this.comp('message').show({message:"文档管理"});
	};

	Model.prototype.helpColClick = function(event){
			this.comp('message').show({message:"帮助中心"});
	};

	Model.prototype.saveColClick = function(event){
			this.comp('message').show({message:"个人存储中心"});
	};

	Model.prototype.adnexaColClick = function(event){
			this.comp('message').show({message:"附件管理"});
	};

	Model.prototype.noticeColClick = function(event){
			this.comp('message').show({message:"通知消息"});
	};

	Model.prototype.recycleColClick = function(event){
			this.comp('message').show({message:"回收站"});
	};

	Model.prototype.jsClick = function(event){
		 util.showSource({
         self : this,
         data : "demo/pcSample/navigator/iconNav.js"
          },true);
	};

	Model.prototype.sourceClick = function(event){
		util.showSource({
	   self : this,
	   type : true,
	   data : "demo/pcSample/navigator/iconNav.w&xid=window"
	  },true);
	};

	return Model;
});