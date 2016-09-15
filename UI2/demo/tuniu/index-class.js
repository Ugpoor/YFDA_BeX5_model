define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");

	var Model = function() {
		this.callParent();
	};
	
	//加载分类数据
	Model.prototype.classDataCustomRefresh = function(event){
		var classData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/classData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            classData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });	
	};
	
	//进入列表页
	Model.prototype.listClick = function(event){
		justep.Shell.showPage("searchList");
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	return Model;
});