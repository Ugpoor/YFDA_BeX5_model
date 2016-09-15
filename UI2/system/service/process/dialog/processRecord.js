define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	/**
	 接收的数据格式 
		{ 
			task: task,
			process: process,
			data: data 
		}
	 */
	Model.prototype.windowReceiveReceive = function(event) {
		var params = event.data || {};
		var executeListData = this.comp("processRecordData");
		var filter = "1<0";
		if (params.task){
			filter = "(SA_Task.sFlowID in (select x.sFlowID from SA_Task x where x = '" + params.task + "'))";
		}else{
			if (params.data){
				if (params.process){
					filter = "(SA_Task.sFlowID in (select x.sFlowID from SA_Task x where (x.sData1 = '" + params.data + "') and (x.sProcess='"+ params.process +"')))";	
				}else{
					filter = "(SA_Task.sFlowID in (select x.sFlowID from SA_Task x where x.sData1 = '" + params.data + "'))";	
				}
			}
		}
		var shardCondition = "";
		if (params.task) shardCondition += ",task=" + params.task;
		if (params.data) shardCondition += ",data=" + params.data;
		if (params.process) shardCondition += ",process=" + params.process;
		executeListData.queryParam.setString("shardCondition", shardCondition);
		executeListData.setFilter("filter", filter);
		executeListData.refreshData();
	};

	return Model;
});