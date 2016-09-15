define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");
	var Task = require("$UI/SA/task/taskCenter/task");
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function() {
		var conditionData = this.comp("conditionData")
		var parameter = this.getContext().getRequestParameter("parameter");
		var status = "waiting";
		var statusLabel = "待办";
		if (this.isHistroy()){
			status = "finished";
			statusLabel = "已办"
		}else{
			if (parameter == "submited") {
				status = "submited";
				statusLabel = "提交"
			} 
		}
		conditionData.setValue("status", status);
		conditionData.setValue("statusLabel", statusLabel);
		this.comp("taskData").refreshData();
	};

	Model.prototype.moreBtnClick = function(event) {
		this.comp("moreMenu").show();
	};

	Model.prototype.hasData = function() {
		return this.comp("taskData").getCount() > 0;
	};

	Model.prototype.isWaitingStatus = function() {
		var result = false;
		if (this.hasData()) {
			var status = this.comp("taskData").val("sStatusID");
			result = (status == "tesReady" || status == "tesExecuting");
		}
		return result;
	};

	Model.prototype.isExecutor = function() {
		var result = false;
		if (this.hasData()) {
			var executorFID = this.comp("taskData").val("sExecutorFID");
			if (executorFID) {
				var personID = this.getContext().getCurrentPersonID();
				if (executorFID.indexOf("/" + personID + "@") !== -1) {
					result = true;
				} else {
					var items = this.getContext().getAllPersonMemberFIDs();
					if (items != null) {
						for ( var i = 0; i < items.length; i++) {
							/* 有设计问题：当前认为一个人不仅可以处理自己的任务，而且还可以处理自己上层组织(包括所有上层)的任务 */
							if (items[i].indexOf(executorFID) === 0) {
								result = true;
								break;
							}
						}
					}
				}
			}
		}
		return result;
	};
	
	Model.prototype.isCreator = function() {
		var result = false;
		if (this.hasData()){
			var creatorFID = this.comp("taskData").val("sCreatorFID");
			var personID = this.getContext().getCurrentPersonID();
			result = creatorFID && (creatorFID.indexOf("/" + personID + "@") != -1); 
		}
		return result;
	};	

	Model.prototype.executeBtnClick = function(event) {
		this.executeTask();
	};

	Model.prototype.canExecute = function() {
		return this.isWaitingStatus() && this.isExecutor();
	};

	Model.prototype.canBrowse = function() {
		return this.hasData();
	};
	
	Model.prototype.canRecycle = function() {
		return this.isFlow() && this.isWaitingStatus() && this.isCreator();
	};
	
	Model.prototype.isFlow = function(){
		return this.hasData() && this.comp("taskData").val("sFlowID");
	};
	
	Model.prototype.canShowChart = function() {
		return this.isFlow();
	};
	
	Model.prototype.canProcessRecord = function(){
		return this.isFlow();
	};
	

	Model.prototype.rowDbClick = function(event) {
		if (this.canExecute()) {
			this.executeTask();
		} else if (this.canBrowse()) {
			this.browseTask();
		}
	};
	
	Model.prototype.browseTask = function(){
		var mainData = this.comp("taskData");
		var name = mainData.val("sName");
		var executor = mainData.val("sCreatorFID");
		var personID = this.getContext().getCurrentPersonID();
		if (executor.indexOf(personID) == -1){
			executor = mainData.val("sExecutorFID");
		}
		if (!executor || (executor.indexOf(".psm")==-1)){
			executor = personID;
		}
	
		var url = this.getBrowseURL();
		justep.Shell.showPage({url:url, title: name, executor: executor});	
	};
	
	Model.prototype.getBrowseURL = function(){
		var url = "";
		if (this.hasData()){
			var mainData = this.comp("taskData");
			var isCreator = false;
			var items = this.getContext().getAllPersonMemberFIDs();
			if (items!=null){
				var creatorFID = mainData.val("sCreatorFID"); 
				for(var i = 0; i < items.length; i++) {
					if (items[i]==creatorFID){
						isCreator = true;
						break;
					}
				}
			}
			
			if (isCreator){
				url = mainData.val("sCURL");
			}else{
				url = mainData.val("sEURL");
			}
			
			if (url.charAt(0) === "/"){
				if (url.indexOf(".a") !== -1){
					url = "$UI" + url;
				}else{
					url = "$model/UI" + url;
				}
			}

			
			var process = mainData.val("sProcess");
			url += ((url.indexOf("?") == -1) ? "?" : "&");
			var id = mainData.getCurrentRowID();
			
			url += 'task=' + id + '&_pagePattern=readonly&process=' + process + "&activity=" + url.substring(url.lastIndexOf("/")+1, url.lastIndexOf("."));
			url = this.addTaskData(url, mainData.getCurrentRow());
		}
		
		return url;
	};
	

	Model.prototype.executeTask = function() {
		var mainData = this.comp("taskData");
		var name = mainData.val("sName");
		var url = mainData.val("sEURL");
		if (!url) {
			throw new Error("任务: '" + name + "' 的处理页面(sEURL)不允许为空!");
		} else {
			
			if (url.charAt(0) === "/"){
				if (url.indexOf(".a") !== -1){
					url = "$UI" + url;
				}else{
					url = "$model/UI" + url;
				}
			}
			
			var id = mainData.getCurrentRowID();
			var executorFID = mainData.val("sExecutorFID");
			var process = mainData.val("sProcess");
			var activity = mainData.val("sActivity");
			
			url += ((url.indexOf("?") == -1) ? "?" : "&");
			url += 'task=' + id + '&_pagePattern=write&process=' + process + '&activity=' + activity;
			url = this.addTaskData(url, mainData.getCurrentRow());
			if (mainData.val("sStatusID") === "tesReady"){
				var param = new biz.Request.ActionParam();
				param.setString("task", id);
				param.setString("executor", executorFID);
				var self = this;
				var options = {
					context : this.getContext(),
					parameters : param,
					process : process,
					activity : activity,
					action : "executeTaskAction",
					contentType : biz.Request.JSON_TYPE,
					dataType : biz.Request.JSON_TYPE,
					directExecute : true,
					callback : function(data) {
						if (data.state) {
							justep.Shell.showPage({url:url, 
								title : name,
								executor : data.response || ""
							});
						} else {
							data.ignoreError = false;
						}
					}
				};
				biz.Request.sendBizRequest(options);
			}else{
				justep.Shell.showPage({url:url, title : name, executor : executorFID || ""});
			}
		}
	};

	Model.prototype.viewBtnClick = function(event){
		this.browseTask();
	};

	Model.prototype.recyTaskBtnClick = function(event){
		Task.recy(this, "taskData", "window");
	};

	Model.prototype.modelActive = function(event){
		this.comp("taskData").refreshData();
	};

	Model.prototype.taskDataRefreshCreateParam = function(event){
		var param = event.param;
		var conditionData = this.comp("conditionData");
		param.setString("status", conditionData.val("status")||"");
		
		var currentOrg = this.orgCondition || this.getContext().getCurrentPersonID();
		var org = "";
		var selecteds = currentOrg.split(",");
		for (var i=0; i<selecteds.length; i++){
			var item = selecteds[i];
			if (item){
				if (org) org = org + ",";
				var index = item.lastIndexOf(".psn");
				if ((index!==-1) && (index === (item.length-".psn".length))){
					org += item.substr(0, index);
				}else{
					org += item;
				}
			}
		}
		param.setString("org", org);
	};

	Model.prototype.orgFilterFilter = function(event){
		this.orgCondition = event.source.selectedValue.get();
	};

	Model.prototype.statusSelectUpdateValue = function(event){
		this.comp("taskData").refreshData();
	};

	Model.prototype.addTaskData = function(url, row){
		var data1 = row.val("sData1") || "";
		var data2 = row.val("sData2") || "";
		var data3 = row.val("sData3") || "";
		var data4 = row.val("sData4") || "";
		if (data1){
			url += "&sData1=" + data1;
		}
		if (data2){
			url += "&sData2=" + data2;
		}
		if (data3){
			url += "&sData3=" + data3;
		}
		if (data4){
			url += "&sData4=" + data4;
		}
		return url;
	}

	Model.prototype.taskDataBeforeRefresh = function(event){
		if (this.isHistroy()){
			event.source.filters.setStringVar("justep.shard", "histroy");	
		}
	};
	
	Model.prototype.isHistroy = function(){
		return this.getContext().getRequestParameter("shard") === "histroy";
	};

	return Model;
});
