define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
		this.mustHasName = justep.Bind.observable(true);
		this.isInPI = false;
		this.task = undefined;
	};
	
	/**
		{
			"noName":true,
			"id": curTemplate,
			"task": task,
			"isInPI": true,
			"sProcess": curProcess,
			"sProcessName": curProcessName,
			"activity": curActivity,
			"activeActivities": activeActivities,
			"finishedActivities" : finishedActivities
		}
	 */
	Model.prototype.windowReceiverReceive = function(event) {
		var data = event.data;
		var id = null;
		var activeActivities = [];
		var finishedActivities = [];
		if (data) {
			id = data.id;
			this.isInPI = data.isInPI;
			this.task = data.task;
			activeActivities = data.activeActivities || [];
			finishedActivities = data.finishedActivities || [];
			if (data.noName) {
				this.mustHasName.set(false);
				this.comp("panel").setVisible("top", false);
			} else {
				this.mustHasName.set(true);
			}
		} else {
			this.isInPI = false;
			this.mustHasName.set(true);
			this.task = undefined;
		}

		var content = [];
		var content2 = [];
		var mainData = this.comp("mainData");
		if (id) {
			mainData.setFilter("__custom__", "SA_ProcessTemplate='" + id + "'");
			mainData.refreshData();
			if (mainData.getCount() === 0) {
				justep.Util.hint("流程模板“" + id + "“不存在！");
				return;
			}

			content = mainData.getValue("sContent") || [];
			content2 = mainData.getValue("sContent2") || [];
		} else {
			mainData.setFilter("__custom__", "1>2");
			mainData.refreshData();
			mainData.newData();
			mainData.setValue("sProcess", data.sProcess);
			mainData.setValue("sProcessName", data.sProcessName);
			mainData.setValue("sTypeID", "PROCESS_TEMPLATE");
			mainData.setValue("sKindID", "template");
			id = mainData.getCurrentRowID();
		}

		var pd = this.comp("processDesigner");
		pd.load(mainData.getValue("sProcess"), mainData.getValue("sProcessName"));
		if (this.isInPI && (!content || (content.length === 0))) {
			var p = pd.getProcessDefine();
			content = p[0];
			content2 = p[1];
		}

		pd.setData({
			id : id,
			processDefine : content,
			processGraph : content2,
			activeActivities : activeActivities,
			finishedActivities : finishedActivities,
			isGraph2 : true
		});
		
		$("#" + this.getIDByXID("panel") + " div").scrollTop(0).scrollLeft(0);
	};

	Model.prototype.okBtnClick = function(event) {
		var designer = this.comp("processDesigner");
		var data = designer.getData();
		var content = data.processDefine;
		var content2 = data.processGraph;

		var main = this.comp("mainData");
		if (this.isInPI && (main.getValue("sKindID") == "template")) {
			biz.Request.beginBatch();
			var id = new justep.UUID().valueOf();
			var sName = "";
			var sProcess = main.getValue("sProcess");
			var sTemplateID = main.getCurrentRowID();
			this.saveTemplate(id, sName, sProcess, content, content2, sTemplateID, "instance");
			this.replaceTemplate(this.task, id);
			biz.Request.endBatch();
		} else {
			main.setValue("sContent", content);
			main.setValue("sContent2", content2);
			main.saveData();
		}

		this.comp("windowReceiver").windowEnsure();
	};

	Model.prototype.saveTemplate = function(id, sName, sProcess, sContent, sContent2, sTemplateID, sKindID) {
		var params = new biz.Request.ActionParam();
		params.setString("id", id);
		params.setString("sName", sName);
		params.setString("sProcess", sProcess);
		params.setString("sContent", sContent);
		params.setString("sContent2", sContent2);
		params.setString("sTemplateID", sTemplateID);
		params.setString("sKindID", sKindID);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "saveProcessTemplate4Action",
			dataType : "json",
			parameters : params
		};
		biz.Request.sendBizRequest(options);
	};

	Model.prototype.replaceTemplate = function(task, id) {
		var params = new biz.Request.ActionParam();
		params.setString("task", task);
		params.setString("template", id);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "replaceTemplateAction",
			dataType : "json",
			parameters : params
		};
		biz.Request.sendBizRequest(options);
	};

	return Model;
});