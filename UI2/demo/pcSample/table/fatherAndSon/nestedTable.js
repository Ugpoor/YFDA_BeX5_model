define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");//显示源码引用的js
	
	var Model = function(){
		this.callParent();
		this.isVisible = util.flag;
	};
	//父子表格，嵌套表格，使用 listTable组件来实现
	
	//通过Ajax加载数据到data组件中
	Model.prototype.bDataCustomRefresh = function(event){
		var user = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/data.json'),
            dataType: 'json',
            async: false,
            cache: false,
            success: function(data){
            	user.loadData(data);//将返回的数据加载到data组件
            },
            error: function(){
            	throw justep.Error.create("加载数据失败");
            }
        }); 
	};

	//显示JS代码
	Model.prototype.showJSButton = function(event){
		util.showSource({
			data: 'demo/pcSample/table/fatherAndSon/nestedTable.js',
			self: this
		},true);
	};	
	//显示源码
	Model.prototype.sourceClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/table/fatherAndSon/nestedTable.w&xid=window"
		},true);		
	};
	
	return Model;
});