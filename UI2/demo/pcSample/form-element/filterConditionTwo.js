define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.deadlineOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("deadlineOutput", "deadline", "none",index,1);
}
	Model.prototype.typeOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("typeOutput", "type", "none",index,2);
	};
	Model.prototype.amountOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("amountOutput", "amount", "none",index,3);
		
	};
	Model.prototype.financialperiodOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("financialperiodOutput", "financialperiod", "none",index,4);
	
	};
	Model.prototype.earningsOutputClick = function(event){
		var index = event.bindingContext.$index();
		this.insert("earningsOutput", "earnings", "none",index,5);
	};
	Model.prototype.btnClick = function(event){
		var data=this.comp("checkData");
		var row=event.bindingContext.$object;
		if(row.val("fID")==1){
			this.backClass("deadlineOutput", "deadline", "none");
		}else if(row.val("fID")==2){
		this.backClass("typeOutput", "type", "none");
		}else if (row.val("fID")==3) {
			this.backClass("amountOutput", "amount", "none");
		}else if (row.val("fID")==4) {
		this.backClass("financialperiodOutput", "financialperiod", "none");
	}else if (row.val("fID")==5) {
		this.backClass("earningsOutput", "earnings", "none");
	}
	
		data.deleteData(row);
		
	};
	//点击取消条件
	Model.prototype.backClass = function(output, css,remove) {
		var obj = this.comps(output);
		for (var i = 0; i < obj.length; i++) {
			var string = $("."+css+":eq(" + i + ")").attr("class")
			var str = string.split(" ", string.length);
		if (this.indexOf(remove, str) > 0) {
			$("."+css+":eq(" + i + ")").removeClass(remove);
			}else{
			$("."+css+":eq(" + i + ")").addClass("pass");
			}};
	}
	//点击增加条件
	Model.prototype.insert = function(output, css,newcss,index,num) {
		var checked;
		var obj = this.comps(output);
		var string = $("."+css+":eq(" + index + ")").attr("class")
		var str = string.split(" ", string.length);
		for (var i = 0; i < obj.length; i++) {
			if (i != index) {
					$("."+css+":eq(" + i + ")").addClass(newcss);
						checked=obj[index].value;
					}else{
					$("."+css+":eq(" + index + ")").removeClass("pass");
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
			data : "demo/pcSample/form-element/filterConditionTwo.js"
		},true);
	};
	//源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/filterConditionTwo.w&xid=contents"
		}, true);
	};
	return Model;
});