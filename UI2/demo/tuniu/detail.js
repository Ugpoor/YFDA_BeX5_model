define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};

	//返回上一页
	Model.prototype.backBtnClick = function(event) {
		//history.back();
		justep.Shell.closePage();
	};

	//内容隐藏显示
	$(".hiddenBtn").each(function(){
		var height=0;
		$(this).on("click",function(){
			var obj=$(this).parent().find(".features");	
			if(obj.height()<=105){
				height=obj.outerHeight(true);
				obj.css("height","auto");
				$(this).find("i").attr("class","icon-chevron-up");
			} else {
				obj.css("height",height);
				$(this).find("i").attr("class","icon-chevron-down");
			}
		});
	});
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	return Model;
});