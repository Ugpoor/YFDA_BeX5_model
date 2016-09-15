define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.btnAddRowClick = function(event){
	   debugger;
		var dExample = this.comp("dExample");
		var params = new biz.Request.ActionParam();
	   
		params.setTable("table", new biz.Request.TableParam(dExample.toJson()));
	
	
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "addTableRowAction",
			"parameters" : params, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
				   debugger;
					//dExample.loadJson(result.response);
					
					dExample.loadData(data.response);
					dExample.refreshData();
				} 
			}
		});
	};

	Model.prototype.btnDelRowClick = function(event){
		var dExample = this.comp("dExample");
		var params = new biz.Request.ActionParam();
		
		params.setTable("table", new biz.Request.TableParam(dExample.toJson()));
		params.setParam("id", dExample.getCurrentRowID());
		biz.Request.sendBizRequest({
		    "context" : this.getContext(),
			"contentType": "application/json",
			"dataType": "application/json",
			"action": "delTableRowAction",
			"parameters": params,
			"callback": function(result) {
				result.ignoreError = false;
				if (result.state) {
					dExample.loadData(result.response);
					dExample.refreshData();
				} 
			}
		});
	};



	

	Model.prototype.btnListTableClick = function(event){
		var dExample = this.comp("dExample");
		var columnName = this.comp("dTemp").getValue("listColumn");
		if (columnName == "") throw new Error("请输入列名！");

		var params = new biz.Request.ActionParam();
		params.setTable("table", new biz.Request.TableParam(dExample.toJson()));
		params.setString("columnName", columnName);
		biz.Request.sendBizRequest({
		    "context" : this.getContext(),
			"contentType": "application/json",
			"dataType": "application/json",
			"action": "listTableAction",
			"parameters": params,
			"callback": function(result) {
				result.ignoreError = false;
				if (result.state) {
					alert(result.response);
				}
			}
		});	
	};

	Model.prototype.modelLoad = function(event){
		var dTemp = this.comp("dTemp");
		var now = new Date();
		dTemp.setValue("year", now.getFullYear()); 
		dTemp.setValue("month", now.getMonth() + 1);      
		dTemp.setValue("addColumn", "fNewColumn");   
		dTemp.setValue("delColumn", "fContactName");   
		dTemp.setValue("listColumn", "fCompanyName");  
	};

	Model.prototype.li3Click = function(event){
	    debugger;
		var dExample = this.comp("dExample");
		var jsonTable;
		if (!dExample.loaded) {
			biz.Request.sendBizRequest({
			    "context" : this.getContext(),
				"dataType": "application/json",
				"action": "returnTableAction",
				"callback": function(callbackData) {
				    debugger;
					callbackData.ignoreError = false;
					if (callbackData.state) {
					   jsonTable = callbackData.response;
						
					}
				}
			});
			if(jsonTable != null){
			    dExample.loadData(jsonTable);
			    dExample.refreshData();
			}
				
		}
	};
	

	Model.prototype.li2Click = function(event){
		var dTemp = this.comp("dTemp");
		this.showCalendar(dTemp.getValue("year"),dTemp.getValue("month"));
	};
	
	Model.prototype.showCalendar = function(year,month){
		
		var dCalendar = this.comp("dCalendar");
		var params = new biz.Request.ActionParam();
		params.setInteger("year", year);
		params.setInteger("month", month);
		biz.Request.sendBizRequest({
			 "context" : this.getContext(),
			"dataType": "application/json",
			"action": "createCalendarAction",
			"parameters": params,
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					dCalendar.loadData(callbackData.response);
					dCalendar.refreshData();
				}
			}
		});
	};


	Model.prototype.dTempValueChanged = function(event){
		if(event.col == "year" && this.comp("dTemp").getValue("month") != undefined){
		    
		  
			this.showCalendar(event.value,this.comp("dTemp").getValue("month"));
		}else if(event.col == "month" && this.comp("dTemp").getValue("year") != undefined){
			this.showCalendar(this.comp("dTemp").getValue("year"),event.value);
		}
	};


	return Model;
});