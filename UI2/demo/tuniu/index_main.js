define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	
	//页面初始化
	Model.prototype.modelLoad = function(event){
		//页面下拉时页头显示背景颜色
		var _this=this;
		$(this.comp("homeContent").domNode).scroll(function() {
			if($(this).scrollTop()>100){			
				$(".x-titlebar", _this.getRootNode()).css({"background-color":"rgba(0,0,0,0.8)"});
			} else {
				$(".x-titlebar", _this.getRootNode()).css({"background-color":"rgba(0,0,0,0)"});
			}
		});
	};
		
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return this.toUrl(url);
	};
	
	Model.prototype.toUrl = function(url){
		return require.toUrl(url);
	};
		
	return Model;
});