define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	var Model = function(){
		this.callParent();
	};
	//获取勾选项并添加到条件里
	Model.prototype.flowDefaultValueChanged = function(event){
			var str=this.comp("flowDefault").val("flow");
			var data=this.comp("flowFilter");
		if(!str){
		data.clear();
		}else{
		var string=str.split(" ", str.length);
		var defaulValues = [];
		for (var i = 0; i < string.length; i++) {
			defaulValues.push({
				"flow":string[i]
			});}
		data.clear();
			data.newData({
				defaultValues:defaulValues})	
		               data.applyUpdates();
		}};
	Model.prototype.accountDefaultValueChanged = function(event){
			var str=this.comp("accountDefault").val("account");
			var data=this.comp("accountFilter");
		if(!str){
		data.clear();
		}else{
		
		var string=str.split(" ", str.length);
		var defaulValues = [];
		for (var i = 0; i < string.length; i++) {
			defaulValues.push({
				"account":string[i]
			});
		}
		data.clear();
			data.newData({
				defaultValues:defaulValues})	
		               data.applyUpdates();
		}
	};
	Model.prototype.typeDefaultValueChanged = function(event){
		var str=this.comp("typeDefault").val("type");
		var data=this.comp("tyeFilter");
		if(!str){
		data.clear();
		}else{
		
		var string=str.split(" ", str.length);
		var defaulValues = [];
		for (var i = 0; i < string.length; i++) {
			defaulValues.push({
				"type":string[i]
			});
		}
		data.clear();
			data.newData({
				defaultValues:defaulValues})	
		               data.applyUpdates();
		}
			
	};
	//获得时间并添加到条件
	Model.prototype.buttonClick = function(event){
		var start=this.comp("start").val();
		var end=this.comp("end").val();
		if(start!=''&&end!=""){
		this.comp("date").newData({
		defaultValues:[{
						
		               "date":start+"-"+end
		               }]
		})
		}else{
		justep.Util.hint("时间不完整");
		}
	};
	//获取关键词添加到条件
	Model.prototype.sureClick = function(event){
	var value=this.comp("keyWord").val();
			if(value!=""){
		this.comp("keyData").newData({
		defaultValues:[{
		               "keyword":value
		               }]
		})
		}else{
		justep.Util.hint("请填写关键词");
		}
	};
	Model.prototype.flowBtnClick = function(event){
		var row=event.bindingContext.$object;
		this.backClick("flowFilter", "flowDefault", "flow", row)
	};

	Model.prototype.accountBtnClick = function(event){
		var row=event.bindingContext.$object;
		this.backClick("accountFilter", "accountDefault", "account", row)
	};
	//点击按钮取消条件
	Model.prototype.backClick = function(filterData,defaultData,cloumn,row){
		var data=this.comp(filterData);
			var value=this.comp(defaultData).val(cloumn);
			if(!value)
			return;
			var str=value.split(" ", value.length);
			var string="";
		for (var i = 0; i < str.length; i++) {
			if(row.val(cloumn)==str[i]){
		
			str.splice(i,0);
			}else{
				string +=str[i]+" ";
			}}
		data.deleteData(row);
		string=string.substring(0, string.length-1);
		this.comp(defaultData).setValue(cloumn, string);
	}
	Model.prototype.typeBtnClick = function(event){
		var row=event.bindingContext.$object;
	this.backClick("tyeFilter", "typeDefault", "type", row)
	};
	
	Model.prototype.dateBtnClick = function(event){
		this.comp("start").clear();
		this.comp("end").clear();
		this.comp("date").clear();
	};

	Model.prototype.keyBtnClick = function(event){
		this.comp("keyWord").clear();
		this.comp("keyData").clear();
	};

	//全选设置样式
	Model.prototype.dataTablesRowCheckedAll = function(event){
		this.comp('data').each(function(options){
			event.source.setRowCss(options.row,{"backgroundColor": "white"});
		});
		var rows = this.comp("dataTables").getCheckeds();
		for(var i=0;i<rows.length;i++){
			if(this.comp('dataTables').isChecked(rows[i])){
				event.source.setRowCss(rows[i],{"backgroundColor": "#C1D3FB"});
			}
		}
	};
	// js代码
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/form-element/filterConditionEight.js"
		},true);
	};
	// 源码
	Model.prototype.sourceClick = function(event) {
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/form-element/filterConditionEight.w&xid=window"
		}, true);
	};
	
	//单选设置样式
	Model.prototype.dataTablesRowClick = function(event){
		var row = this.comp("data").getCurrentRow();
		var table = this.comp("dataTables");
		if(table.isChecked(row)){
			event.source.setRowChecked(row, false);
			if($(event.domEvent.target).attr("type") === "checkbox"){
				event.source.setRowChecked(row, true);
				event.source.setRowCss(row,{"backgroundColor": "#C1D3FB"})
			}else{
				event.source.setRowChecked(row, false);
				event.source.setRowCss(row,{"backgroundColor": "white"});
			}
		}else {
			event.source.setRowChecked(row, true);
			
			event.source.setRowCss(row,{"backgroundColor": "yellow"});
			if(($(event.domEvent.target).attr("type") === "checkbox")&& table.isChecked(row)){
				event.source.setRowChecked(row, false);
				event.source.setRowCss(row,{"backgroundColor": "white"});
			}
		}
	};
	return Model;
});