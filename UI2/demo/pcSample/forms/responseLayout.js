define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Message = require("$UI/system/components/justep/common/common");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/responseLayout.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/responseLayout.w&xid=window"
		},true);
	};
	//重置
	Model.prototype.regestClick = function(event){
		var data = this.comp("uData");
		data.clear();
		var row = data.getCurrentRow();
		if(!row){
			data.newData();
		}
	};
	
	//刷新页面时添加一个空的数据；
	Model.prototype.uDataCustomRefresh = function(event){
		var row = event.source.getCurrentRow();
		if(!row){
			event.source.newData();
		}
	};

	//保存提示
	Model.prototype.uDataCustomSave = function(event){
		justep.Util.hint("保存成功");
		
	};

	//保存
	Model.prototype.addBtnClick = function(event){
		this.comp("uData").saveData()
	};


	return Model;
});