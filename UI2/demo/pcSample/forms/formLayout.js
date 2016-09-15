define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	
	var Model = function(){
		this.callParent();
		this.flag=true;
	};
	//隐藏表单；
	Model.prototype.disableBtnClick = function(event){
		var data = event.source;
		var form = $(this.comp("disableform").domNode);
		if(this.flag){
			form.css("display","none");
			data.set("label","显示");
			this.flag=false;
		}else{
			form.css("display","block");
			data.set("label","隐藏");
			this.flag=true;
		}
	};
	//重置
	Model.prototype.regestBtnClick = function(event){
		this.comp("userData").clear();
	};
	//清空
	Model.prototype.clearBtnClick = function(event){
		var data = this.comp("userData");
		data.clear();
		data.refreshData();
	};
	//加载页面时添加一个空的数据
	Model.prototype.userDataCustomRefresh = function(event){
		var row = event.source.getCurrentRow();
		if(!row){
			event.source.newData();
		}
		
	};
	
	//查看js代码
	Model.prototype.showJsSource = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/forms/formLayout.js"
		},true);
	};
	//查看源码
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/forms/formLayout.w&xid=contents"
		},true);
	};
	return Model;
});