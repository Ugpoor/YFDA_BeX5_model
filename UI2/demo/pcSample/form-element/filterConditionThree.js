define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.deadlineOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("deadlineOutput", "deadline", "color",index,1);
	}
	Model.prototype.typeOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("typeOutput", "type", "color",index,2);
	};
	Model.prototype.amountOutputClick = function(event){
		var index = event.bindingContext.$index();
		var checked=this.insert("amountOutput", "amount", "color",index,3);
	};
	Model.prototype.financialperiodOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("financialperiodOutput", "financialperiod", "color",index,4);
	};
	Model.prototype.earningsOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("earningsOutput", "earnings", "color",index,5);
	};
	Model.prototype.btnClick = function(event){
		
		var row=event.bindingContext.$object;
		var data=this.comp("checkData");
		if(row.val("fID")==1){
		this.backClass("deadlineOutput", row, "deadline");
		}else if(row.val("fID")==2){
			this.backClass("typeOutput", row, "type");
		}else if (row.val("fID")==3) {
			
			this.backClass("amountOutput", row, "amount");
		}else if (row.val("fID")==4) {
			
			this.backClass("financialperiodOutput", row, "financialperiod");
		}else if(row.val("fID")==5){
			this.backClass("earningsOutput", row, "earnings");
		}
		data.deleteData(row);
		
	};
	//点击取消条件项
	Model.prototype.backClass = function(xid,row,css) {
		var obj=this.comps(xid);
		for (var i = 0; i < obj.length; i++) {
			if(row.val("checked")==obj[i].value){
				$("."+css+":eq(" + i + ")").addClass("pass");
				$("."+css+":eq(" + i + ")").removeClass("color");
			}
		}
	}
	//点击增加条件
	Model.prototype.insert = function(output, css,newcss,index,num) {
		var checked;
		var obj = this.comps(output);
		for (var i = 0; i < obj.length; i++) {
			if (i == index) {
					$("."+css+":eq(" + i + ")").addClass(newcss);
					$("."+css+":eq(" + index + ")").removeClass("pass");
						checked=obj[index].value;
					}
					};
		var data=this.comp("checkData");
		var rows = data.find(["fID",'checked'],[num,checked]);
		if(rows.length==0){
			data.newData({
				defaultValues:[{
						"fID":num,
		               "checked":checked
		               }]})	}
		               data.applyUpdates();
	}
	Model.prototype.indexOf = function(val, arr) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i] == val)
				return i;
		}
		return -1;
	}
	//获取选中项
	Model.prototype.dataEach = function(event) {

			var data = this.comp("checkData");
			var checked="";
			data.each(function(data){
			 checked += data.row.val('checked')+"，   ";
			});
		return checked;
	}
	// js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/filterConditionThree.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/filterConditionThree.w&xid=contents"
		}, true);
	};
	return Model;
});