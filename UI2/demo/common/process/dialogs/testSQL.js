define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	this._inputData = event.data;
	var Model = function(){
		this.callParent();
	};

	Model.prototype.btnCloseClick = function(event){
		this.comp("windowReceiver1").windowCancel();
	};

	Model.prototype.windowReceiver1Receive = function(event){
	   debugger;
	   var grid = this.comp("gridresult");
	   
	  
		this._inputData = event.data;
	
	
		
		this.getElementByXid('gridresult').style.display = "none";
	
		if (event.data.type == "ksql") {
			this.comp("data2").setValue("fValue","KSQL");
			
		} else {
			this.comp("data2").setValue("fValue","SQL");
		}
	    var textSQL = this.getElementByXid("textSQL");
	    textSQL.value =  event.data.sql;

	
		this.btnExecuteClick();
	};

	Model.prototype.btnExecuteClick = function(event){
	  debugger;
	   var result;
		var dResult = this.comp("dResult");
		 var textSQL = this.getElementByXid("textSQL");
		 var grid = this.getElementByXid('gridresult');
		 var lb = this.getElementByXid('lbResult');
		var params = new biz.Request.ActionParam();
		params.setString("dataModel", this._inputData.dataModel);
		params.setString("type", this.comp("data2").getValue("fValue")=="KSQL" ? "ksql" : "sql");
		params.setString("sql", textSQL.value);
		// 调用动作
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			
			"action": "testSQLAction",
			"parameters": params,
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					
						result = callbackData.response;
					
				} else {
				    result = null;
					grid.style.display = "none";
					lb.innerText = "执行失败！";
				}
			}
		});
		if(result != null){
			if(typeof result == "object"){
				grid.style.display = "block";
						
				this.dynamicLoad(dResult, result);
				lb.innerText = "本次执行结果影响记录数：" + dResult.getCount();
			}else{
				grid.style.display = "none";
				lb.innerText ="本次执行结果影响记录数：" + result;
			}
		}
	};
	
	Model.prototype.dynamicLoad = function(data, jsonTable){
		if (typeof data == "string") data = this.comp(data);
		debugger;
		var grid = this.comp("gridresult");
		var len = 33;  //怎样获得grid的列数？
		for(i = 0;i<len;i++){
		    var colname = grid.getColName(i);
			grid.hideCol(colname);
		}
	// 动态设置grid列
	   debugger;
		var columnIDs = jsonTable.userdata.relationAlias.split(",");
		for (var i = 0; i < columnIDs.length; i++) {	
				grid.showCol(columnIDs[i]);

		}

	// 加载数据
		data.loadData(jsonTable);
	
		data.refreshData();
	};

	return Model;
});