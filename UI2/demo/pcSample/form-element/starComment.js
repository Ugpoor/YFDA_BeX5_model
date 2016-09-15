define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
		this.isVisible=util.flag;
	};
	
	//鼠标移动事件添加class,并赋值
	Model.prototype.outputMousemove = function(event){
		var obj=this.comps("output");
		var index = event.bindingContext.$index();
			for (var i = 0; i < obj.length; i++) {
					if(i<= index){
						$(".output:eq(" + i + ")").removeClass("img");
						$(".output:eq(" + i + ")").addClass("imgs");
						this.comp("numData").setValue("grade", i+1+"星");
						}else{
						$(".output:eq(" + i + ")").removeClass("imgs");
						$(".output:eq(" + i + ")").addClass("img");
						}
		}
	};

	Model.prototype.dataCustomRefresh = function(event){
		var data=this.comp("data");
		for (var i = 0; i < 5; i++) {
		data.newData({
			defaultValues:[{
				"img":"  "
			}]})	
			data.applyUpdates();
	}
	};
	
	
	// js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/starComment.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/starComment.w&xid=controlGroup"
		}, true);
	};
	
	
	
	
	return Model;
});