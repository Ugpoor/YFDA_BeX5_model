define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var comUtil = require("$UI/system/components/justep/common/common");
	
	var Model = function() {
		this.callParent();
	};
	
	//加载数据
	Model.prototype.cityDataCustomRefresh = function(event){
		var cityData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/cityData.json'),
            dataType: 'json',
            async: false,//使用同步方式，目前data组件有同步依赖
            cache: false,
            success: function(data){
            cityData.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });	
	};
	
	//当前城市
	Model.prototype.listClick = function(event){
		var cityData=this.comp("cityData");
		cityData.each(function(obj){
			if(obj.row.val("fCurrent")==1){
				cityData.setValue("fCurrent",0,obj.row);
			}
		});
		cityData.setValue("fCurrent",1);
		
		this.comp("windowReceiver").windowEnsure({"fName":cityData.getValue("fName")});
	};	
	

	return Model;
});