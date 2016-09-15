define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.modelLoad = function(event){
		//删除模块
		$(".icon-android-close").each(function(){
			$(this).on("click",function(){
				$(this).parent().parent().parent().remove();
			});
		});		
	};
	
	//进入列表页
	Model.prototype.listClick = function(event){
		justep.Shell.showPage("list");
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
		
	//进入内容页
	Model.prototype.detailClick = function(event){
		justep.Shell.showPage("detail");
	};
	
	//进入登录页
	Model.prototype.loginBtnClick = function(event){
		justep.Shell.showPage("login");
	};
	
	
	
	return Model;
});