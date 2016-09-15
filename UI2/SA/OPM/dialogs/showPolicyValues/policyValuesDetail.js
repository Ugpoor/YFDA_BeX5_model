define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
		this.openMode = justep.Bind.observable("view");
	};

/*	
	event.data = {
		openMode : edit | view
		values : 
	}
*/
	Model.prototype.windowReceiverReceive = function(event){
		this._params = event.data;
		this.openMode.set(this._params.openMode || "view");
		
		var valuesData = this.comp("valuesData");
		valuesData.refreshData();
	};

	Model.prototype.valuesDataCustomRefresh = function(event){
		var valuesData = this.comp("valuesData");
		var valuesGrid = this.comp("valuesGrid");
		var params = new biz.Request.ActionParam();
		params.setString("values", this._params.values);
		var translateParam = new biz.Request.TranslateParam();
		translateParam.dataType = biz.Request.TranslateParam.DATATYPE_ROW_LIST;
		translateParam.rowOption.sequence = valuesData.getColumnIDs();
		
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "policyValuesStringToTableAction",
			"parameters" : params,
			"translateParam" : translateParam, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					$.each(data.response.rows, function(i, row) {
						row.id.value = i;
					});
					valuesData.loadData(data.response);
				}
			}
		});
	};

	Model.prototype.newBtnClick = function(event){
		this.comp("valuesData").newData({
			"defaultValues" : [{
				"id" : justep.UUID.createUUID()
			}]
		});
	};

	Model.prototype.deleleBtnClick = function(event){
		var valuesData = this.comp("valuesData");
		var valuesGrid = this.comp("valuesGrid");
		var rows = [];
		$.each(valuesGrid.getCheckeds(), function(i, rowID) {
			rows.push(valuesData.getRowByID(rowID));
		});
		valuesData.deleteData(rows);
	};

	Model.prototype.okBtnClick = function(event){
		var valuesData = this.comp("valuesData");
		var params = new biz.Request.ActionParam();
		params.setTable("table", new biz.Request.TableParam(valuesData.toJson(false)));
		
		var windowReceiver = this.comp("windowReceiver");
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "policyValuesTableToStringAction",
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					windowReceiver.windowEnsure(data.response);
				}
			}
		});
	};

	return Model;
});