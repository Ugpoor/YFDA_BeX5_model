define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	var Task = require("$UI/SA/task/taskCenter/task");
	
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.flowDataBeforeRefresh = function(event){
		var filterData = this.comp("filterData");
		var statusID = filterData.getValue("statusID") || "executing";
		var statusFilter = "";
		if (statusID && (statusID !== "all")){
			if (statusID === "executing"){
				statusFilter = "((SA_Task.sStatusID='tesExecuting') OR (SA_Task.sStatusID= 'tesReady'))";
			}else if (statusID === "finished"){
				statusFilter = "(SA_Task.sStatusID='tesFinished')";
			}else if (statusID === "paused"){
				statusFilter = "(SA_Task.sStatusID='tesPaused')";
			}else if (statusID === "aborted"){
				statusFilter = "(SA_Task.sStatusID='tesAborted')";
			}
		}
		this.comp("flowData").setFilter("statusFilter", statusFilter);
		
		if (this.isHistroy()){
			event.source.filters.setStringVar("justep.shard", "histroy");	
		}
	};

	Model.prototype.isHistroy = function(){
		return this.getContext().getRequestParameter("shard") === "histroy";
	};


	Model.prototype.moreBtnClick = function(event){
		this.comp("taskMenu").show();
	};

	Model.prototype.recyBtnClick = function(event){
		Task.recy(this, "taskData", "window");
	};
	
	Model.prototype.canRecy = function(){
		var taskData = this.comp("taskData");
		if (taskData.getCount() > 0){
			var isProcess = this.isProcess(taskData);
			var isCreator = (this.getContext().getCurrentPersonID() === taskData.getValue("sCreatorPersonID"));
			var isReady = this.isReady(taskData);
			var hasExecutor = this.hasExecutor(taskData);
			return isProcess && isCreator && isReady && hasExecutor;
		}
		return false;
	};


	Model.prototype.dataBtnClick = function(event){
		var taskData = this.comp("taskData");
		var eurl = taskData.getValue("sEURL");
		var sProcess = taskData.getValue("sProcess");
		var sActivity = taskData.getValue("sActivity");
		eurl = require.toUrl("$model" + eurl + "?task=" + taskData.getCurrentRowID() + "&process=" + sProcess + "&activity=" + sActivity + "&_pagePattern=readonly");
		var dialog = this._getDataDialog();
		dialog.open({src: eurl});
	};
	
	Model.prototype._getDataDialog = function(){
		if (!this._dataDialog){
			this._dataDialog = new WindowDialog({
				parentNode : this.getElementByXid("window"),
				showTitle: true,
				status: "",
				title: "查看表单",
				width: "90%",
				height: "90%"
			});
		}
		
		return this._dataDialog;
	};
	
	Model.prototype.canShowChart = function(){
		return this.comp("flowData").getCount() > 0;
	};
	
	Model.prototype.canShowData = function(){
		var taskData = this.comp("taskData");
		if (taskData.getCount() > 0) {
			return this.getContext().getCurrentPersonID() === taskData.getValue("sExecutorPersonID");
		}
		return false;
	};

	Model.prototype.specialBtnClick = function(event){
		var taskData = this.comp("taskData");
		this.comp("process").specialQueryExt(taskData.getCurrentRowID(), {"onSuccess": function(){taskData.refreshData();}});
	};
	
	Model.prototype.canSpecial = function(){
		var taskData = this.comp("taskData");
		return this.isReady(taskData) && this.hasExecutor(taskData);
	};
	
	Model.prototype.isReady = function(data){
		if (data.getCount() > 0) {
			var status = data.getValue("sStatusID");
			return ((status==="tesReady") || (status==="tesExecuting"));
		}
		
		return false;
	};
	
	Model.prototype.hasExecutor = function(data){
		if (data.getCount() > 0){
			var executor = data.getValue("sExecutorPersonID");
			return !!executor;
		}
		return false;
	};
	
	Model.prototype.modifyExecutorBtnClick = function(event){
		var taskData = this.comp("taskData");
		this.comp("process").modifyExecutorExt(taskData.getCurrentRowID(), false, {"onSuccess": function(){taskData.refreshData();}});
	};
	
	Model.prototype.canModifyExecutor = function(){
		var taskData = this.comp("taskData");
		return this.isReady(taskData) && this.hasExecutor(taskData);
	};
	
	Model.prototype.flowChartBtnClick = function(event){
		var flowData = this.comp("flowData");
		this.comp("process").showChart(null, null, flowData.getCurrentRowID(), true);
	};
	Model.prototype.recordBtnClick = function(event){
		var taskData = this.comp("taskData");
		this.comp("process").openProcessRecordDialog(taskData.getCurrentRowID());
	};
	Model.prototype.hasTaskData = function(){
		return this.comp("taskData").getCount() > 0;
	};
	
	Model.prototype.resumeBtnClick = function(event){
		var taskData = this.comp("taskData");
		var self = this;
		justep.Util.confirm("确定要唤醒当前流程？", function(){
			var param = new biz.Request.ActionParam();
			param.setString("task", taskData.getCurrentRowID());
			var options = {
				context : self.getContext(),
				parameters : param,
				process : self.getContext().getCurrentProcess(),
				activity : self.getContext().getCurrentActivity(),
				action : "externalResumeProcessAction",
				contentType : biz.Request.JSON_TYPE,
				dataType : biz.Request.JSON_TYPE,
				directExecute : true,
				callback : function(data) {
					if (data.state) {
						taskData.refreshData();
						self.comp("flowData").refreshData();
					} else {
						data.ignoreError = false;
					}
				}
			};
			biz.Request.sendBizRequest(options);
		});
	};
	
	Model.prototype.canResume = function(){
		var taskData = this.comp("taskData");
		if (taskData.getCount() > 0){
			var isProcess = this.isProcess(taskData);
			var isPause = this.isPaused(); 
			return isProcess && isPause;
		}
		
		return false;
	};
	
	Model.prototype.isPaused = function(){
		var data = this.comp("flowData");
		if (data.getCount() > 0){
			return ("tesPaused" === data.getValue("sStatusID"));
		}
		return false;
	};
	
	
	Model.prototype.isProcess = function(data){
		if (data.getCount() > 0){
			return ("tsProcess"===data.getValue("sCatalogID"));
		}
		return false;
	};
	
	Model.prototype.suspendBtnClick = function(event){
		var taskData = this.comp("taskData");
		var flowData = this.comp("flowData");
		this.comp("process").suspendQueryExt(taskData.getCurrentRowID(), {"onSuccess": function(){taskData.refreshData();flowData.refreshData()}});
	};
	
	Model.prototype.canSuspend = function(){
		var taskData = this.comp("taskData");
		if (taskData.getCount() > 0){
			var isProcess = this.isProcess(taskData);
			var flowData = this.comp("flowData");
			var isReady = this.isReady(flowData);
			return isProcess && isReady;
		}
		return false;
	};
	
	Model.prototype.canAbort = function(){
		return this.canSuspend();
	};
	
	Model.prototype.abortBtnClick = function(event){
		var taskData = this.comp("taskData");
		var flowData = this.comp("flowData");
		this.comp("process").abortQueryExt(taskData.getCurrentRowID(), {"onSuccess": function(){taskData.refreshData();flowData.refreshData()}});
	};

	Model.prototype.statusSelectUpdateValue = function(event){
		this.comp("flowData").refreshData();
	};
	
	
	Model.prototype.canModifyTitle = function(){
		var taskData = this.comp("taskData");
		if (taskData.getCount() > 0){
			var isReady = this.isReady(taskData);
			var hasExecutor = this.hasExecutor(taskData);
			return isReady && hasExecutor;
		}
		return false;
	};

	Model.prototype.modifyTitleBtnClick = function(event){
		this.comp("titleDialog").open();
	};
	
	
	Model.prototype.cancelBtnClick = function(event){
		this.comp("titleDialog").close();
	};
	
	
	Model.prototype.okBtnClick = function(event){
		this.comp("taskData").saveData();
		this.comp("titleDialog").close();
		
	};
	
	Model.prototype.taskDataBeforeRefresh = function(event){
		if (this.isHistroy()){
			event.source.filters.setStringVar("justep.shard", "histroy");	
		}
	};
	
	
	Model.prototype.modelLoad = function(event){
		if (this.isHistroy()){
			var filterData = this.comp("filterData");
			filterData.setValue("statusName", "全部");
			filterData.setValue("statusID", "all");
		}
		
		this.comp("flowData").refreshData();
	};
	
	
	Model.prototype.modelModelConstruct = function(event){
	};
	
	
	return Model;
});