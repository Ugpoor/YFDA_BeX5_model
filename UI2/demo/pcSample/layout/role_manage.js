define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};

	Model.prototype.dataTablesCellRender = function(event) {
		if (event.colName == "fHandle")// 显示按钮
			event.html = "<button class='btn btn-link icon-compose btnUpdate'>角色修改</button><button class='btn btn-link icon-android-add-contact btnUser'>角色关联用户</button></button><button class='btn btn-link icon-android-storage btnResource'>角色关联资源</button>";
	};
	Model.prototype.dataTablesRowClick = function(event){
		var domButton = $(event.domEvent.target);// 获取点击的元素
		if (domButton.hasClass("btnUpdate")) {// 判断是否包含某个样式
			justep.Util.hint("角色修改");
		} else if (domButton.hasClass("btnUser")) {
			this.comp("relevance_users").show();
		} else if (domButton.hasClass("btnResource")) {
			this.comp("resource").show();
		}
	};

	Model.prototype.closeUserClick = function(event){
		this.comp("relevance_users").hide();
	};

	Model.prototype.closeResourceClick = function(event){
		this.comp("resource").hide();
	};

	Model.prototype.resourceDataCustomRefresh = function(event){
		
		var resourceData = event.source;
	    $.ajax({
	        type: "GET",
	        url: require.toUrl('./json/resource.json'),
	        dataType: 'json',
	        async: false,
	        cache: false,
	        success: function(data){
	            resourceData.loadData(data);
	        },
	        error: function(){
	          throw justep.Error.create("加载数据失败");
	        }
	    });
	};
	// js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/role_manage.js"
		},true);
	};

	Model.prototype.showReleUsersSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/role_manage.w&xid=relevance_users"
		},true);
	};

	Model.prototype.showResourceSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/role_manage.w&xid=resource"
		},true);
	};
	//源码
	Model.prototype.showSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/role_manage.w&xid=window"
		},true);

	};
	
	return Model;
});