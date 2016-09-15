define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};

	Model.prototype.menuDataCustomRefresh = function(event){
		var menuData = event.source;
	    $.ajax({
	        type: "GET",
	        url: require.toUrl('./json/menu.json'),
	        dataType: 'json',
	        async: false,
	        cache: false,
	        success: function(data){
	            menuData.loadData(data);
	        },
	        error: function(){
	          throw justep.Error.create("加载数据失败");
	        }
	    });
	};
	
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/user_manage.js"
		},true);
	};
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/user_manage.w&xid=window"
		},true);
	};
	return Model;
});