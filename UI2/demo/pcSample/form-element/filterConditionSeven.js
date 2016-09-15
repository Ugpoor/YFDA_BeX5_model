define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	//控制Divy样式
	Model.prototype.divMousemove = function(event){
		this.comp("numData").setValue("num", 0);
	};

	Model.prototype.div1Mouseout = function(event){
		this.comp("numData").setValue("num", 1);

	};

	Model.prototype.propertyOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.add("propertyOutput", index,"property", 1)
	};
	Model.prototype.ageOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.add("ageOutput", index,"age", 2)
	};
	Model.prototype.typeOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.add("typeOutput", index,"type", 3)
	};
	//点击取消条件
	Model.prototype.buttonClick = function(event){
		var data=this.comp("checkedData");
			var row=event.bindingContext.$object;
			if(row.val("fID")==1){
			this.back("propertyOutput", row, "property");
		}else if(row.val("fID")==2){
			this.back("ageOutput", row, "age");
		}else if (row.val("fID")==3) {
			this.back("typeOutput", row, "type");
		}
			data.deleteData(row);
	};
	//点击选中添加到条件
	Model.prototype.add = function(xid,index,css,num){
		var checked;
		var obj = this.comps(xid);
		for (var i = 0; i < obj.length; i++) {
			if (i == index) {
					$("."+css+":eq(" + i + ")").addClass("checked");
					$("."+css+":eq(" + index + ")").removeClass("pass");
						checked=obj[index].value;
					}
					};
		var data=this.comp("checkedData");
		var rows = data.find(["fID",'checked'],[num,checked]);
		if(rows.length==0){
			data.newData({
				defaultValues:[{
						"fID":num,
		               "checked":checked
		               }]})	}
		               data.applyUpdates();
	}
	//点击取消条件
	Model.prototype.back = function(xid,row,css){
		var obj=this.comps(xid);
		for (var i = 0; i < obj.length; i++) {
			if(row.val("checked")==obj[i].value){
				$("."+css+":eq(" + i + ")").removeClass("checked");
				$("."+css+":eq(" + i + ")").addClass("pass");
			}
				
		}
	}
	//获取选中值
	Model.prototype.dataEach = function(event) {
			var data = this.comp("checkedData");
			var checked="";
			data.each(function(data){
			 checked += data.row.val('checked')+", ";
			});
		return checked;
	}
	//js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/filterConditionSeven.js"
		},true);
	};
	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/filterConditionSeven.w&xid=contents"
		}, true);
	};
	return Model;
});