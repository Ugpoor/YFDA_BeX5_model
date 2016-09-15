define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};

	Model.prototype.roleDataCustomRefresh = function(event){
		var roleData = event.source;
	    $.ajax({
	        type: "GET",
	        url: require.toUrl('./json/role.json'),
	        dataType: 'json',
	        async: false,
	        cache: false,
	        success: function(data){
	            roleData.loadData(data);
	        },
	        error: function(){
	          throw justep.Error.create("加载数据失败");
	        }
	    });
	};

	Model.prototype.resoureDataCustomRefresh = function(event){
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

	Model.prototype.resourceRowDblClick = function(event){
		var row = event.row;
		var data = this.comp("selectData");
		var rows = data.find(["fName"], [row.val("fName")]);
		if(rows.length>0)
			justep.Util.hint("已添加该资源！");
		else
		if(row.val("fParentID")!=null){
			data.newData({
				defaultValues:[{
					"fID":row.val("fID"),
					"fName":row.val("fName"),
					"fParentID":row.val("fParentID"),
					"fType":row.val("fType")
				}]
			});
		}
	};

	Model.prototype.allClick = function(event){
		var me = this;
		var names=[];
		var data = this.comp("selectData");
		var rows;
		this.comp("resourceData").each(function(options){
			var row = options.row;
			rows = data.find(["fName"], [row.val("fName")]);
			if(rows.length<1){
				if(row.val("fParentID")!=null){
					names.push(row.val("fName"));
				}
			}
		});
		for(var i = 0; i<names.length; i++){
			this.comp("selectData").newData({
				defaultValues:[{
					"fName":names[i]
				}]
			});
		}
	};
	
	Model.prototype.clearClick = function(event){
		var data =this.comp("selectData");
		data.clear();
	};
	Model.prototype.selectDblclick = function(event){
		var data = this.comp("selectData");
		var row = data.getCurrentRow();
		data.deleteData(row);
	};
	// js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/resource_distribute_role.js"
		},true);
	};
	//源码
	Model.prototype.showSource = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/resource_distribute_role.w&xid=window"
		},true);

	};
	
	return Model;
});