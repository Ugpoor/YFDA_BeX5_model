define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var sDataList ;
		
	var Model = function(){
		this.callParent();
	};

	/**
	 * 获取返回值，点击确定后调用的方法.
	 */
	Model.prototype.getReturnValue = function(){
		var buf = [];//, 
		var data = this.comp('data1');
		var rows = data.find(["selected"], [true]);
		for(var i = 0;i<rows.length ; i+=1){
			buf.push(rows[i].val("id"));
		}
		return buf.join(","); 
	};
	
	Model.prototype.modelLoad = function(event){
			var data = this.comp("data1");
			var self = this;
			var responseJSON = $.ajax({
				async : false,
				contentType : 'application/json',
				processData : false,
				type : 'GET',
				url : require.toUrl('$UI/system/deploy/app/getRegPlugins.j'),
				success : function(result) {},
				error : function(xhr, status, err) {
					alert('加载应用配置失败');
				}
			});
			sDataList = responseJSON.responseText;
			data.newData({
				defaultValues :eval("("+sDataList+")")
			});		
	};

	/** 过滤查询 **/
	Model.prototype.button2Click = function(event){
		var dataList = eval("("+sDataList+")");
		var data = this.comp("data1");
		data.clear();
		var newList = [];
        var val = this.comp("input6").$domNode.val();
        if(val){
           for(var i = 0;i<dataList.length ;i+=1){
              if(dataList[i].id.indexOf(val) !=-1){
            	  newList.push(dataList[i]);
              }
           }
        }else{
        	newList = dataList;
        }
		data.newData({
			defaultValues :newList
		});	
	};

	Model.prototype.input6Blur = function(event){
		this.button2Click(event);
	};
	
	var timer;
	Model.prototype.input6Keydown = function(event){
		if(timer){
		  clearTimeout(timer);
		}
		
		var self = this;
		timer = setTimeout(function(){
			self.button2Click(event);
		},500);
	};

	return Model;
});