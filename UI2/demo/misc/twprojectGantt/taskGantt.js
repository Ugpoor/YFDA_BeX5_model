define(function(require) {
	require("css!./src/platform").load();
	require("css!./src/libs/dateField/jquery.dateField").load();
	require("css!./src/gantt").load();
	require("css!./src/libs/jquery.svg").load();
	var biz = require("$UI/system/lib/biz");
	var $ = require("jquery");
	require("./src/libs/JST/jquery.JST");

	var GanttMaster = require("./src/ganttMaster");

	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// ------------------------------------------- Create some demo data
	// ------------------------------------------------------
	Model.prototype.setRoles = function() {
		this.ge.roles = [ {
			id : "tmp_1",
			name : "Project Manager"
		}, {
			id : "tmp_2",
			name : "Worker"
		}, {
			id : "tmp_3",
			name : "Stakeholder/Customer"
		} ];
	};

	Model.prototype.setResource = function() {
		var res = [];
		for (var i = 1; i <= 10; i++) {
			res.push({
				id : "tmp_" + i,
				name : "Resource " + i
			});
		}
		this.ge.resources = res;
	};

	Model.prototype.loadI18n = function() {
		GanttMaster.messages = {
			"CANNOT_WRITE" : "不可编辑",
			"CHANGE_OUT_OF_SCOPE" : "NO_RIGHTS_FOR_UPDATE_PARENTS_OUT_OF_EDITOR_SCOPE",
			"START_IS_MILESTONE" : "开始里程碑",
			"END_IS_MILESTONE" : "结束里程碑",
			"TASK_HAS_CONSTRAINTS" : "TASK_HAS_CONSTRAINTS",
			"GANTT_ERROR_DEPENDS_ON_OPEN_TASK" : "GANTT_ERROR_DEPENDS_ON_OPEN_TASK",
			"GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK" : "GANTT_ERROR_DESCENDANT_OF_CLOSED_TASK",
			"TASK_HAS_EXTERNAL_DEPS" : "TASK_HAS_EXTERNAL_DEPS",
			"GANTT_ERROR_LOADING_DATA_TASK_REMOVED" : "GANTT_ERROR_LOADING_DATA_TASK_REMOVED",
			"ERROR_SETTING_DATES" : "ERROR_SETTING_DATES",
			"CIRCULAR_REFERENCE" : "CIRCULAR_REFERENCE",
			"CANNOT_DEPENDS_ON_ANCESTORS" : "CANNOT_DEPENDS_ON_ANCESTORS",
			"CANNOT_DEPENDS_ON_DESCENDANTS" : "CANNOT_DEPENDS_ON_DESCENDANTS",
			"INVALID_DATE_FORMAT" : "INVALID_DATE_FORMAT",
			"TASK_MOVE_INCONSISTENT_LEVEL" : "TASK_MOVE_INCONSISTENT_LEVEL",

			"GANTT_QUARTER_SHORT" : "trim.",
			"GANTT_SEMESTER_SHORT" : "sem."
		};
	};

	Model.prototype.loadDecorator = function() {
		$.JST.loadDecorator("ASSIGNMENT_ROW", function(assigTr, taskAssig) {
			var resEl = assigTr.find("[name=resourceId]");
			for ( var i in taskAssig.task.master.resources) {
				var res = taskAssig.task.master.resources[i];
				var opt = $("<option>");
				opt.val(res.id).html(res.name);
				if (taskAssig.assig.resourceId == res.id)
					opt.attr("selected", "true");
				resEl.append(opt);
			}

			var roleEl = assigTr.find("[name=roleId]");
			for ( var i in taskAssig.task.master.roles) {
				var role = taskAssig.task.master.roles[i];
				var optr = $("<option>");
				optr.val(role.id).html(role.name);
				if (taskAssig.assig.roleId == role.id)
					optr.attr("selected", "true");
				roleEl.append(optr);
			}

			if (taskAssig.task.master.canWrite && taskAssig.task.canWrite) {
				assigTr.find(".delAssig").click(function() {
					var tr = $(this).closest("[assigId]").fadeOut(200, function() {
						$(this).remove();
					});
				});
			}

		});
	};

	Model.prototype.modelLoad = function(event) {
		this.createGantt();
	};

	Model.prototype.createGantt = function() {
		// load templates
		$(this.getElementByXid("gantEditorTemplates")).loadTemplates().remove();

		// here starts gantt initialization
		this.ge = new GanttMaster();
		var workSpaceObj = $(this.getElementByXid("workSpace"));//$("#" + workSpace);
		this.ge.init(workSpaceObj);
		this.loadI18n();

		// fill default Teamwork roles if any
		if (!this.ge.roles || this.ge.roles.length == 0) {
			this.setRoles();
		}

		// fill default Resources roles if any
		if (!this.ge.resources || this.ge.resources.length == 0) {
			this.setResource();
		}

		this.loadDecorator();
		
		this.resizeFn = function() {
			workSpaceObj.css({
				width : $(".page-content").width(),
				height : $(".page-content").width() * 0.8
			});
			workSpaceObj.trigger("resize.gantt");
		};
		this.resizeFn2 = function() {
			$(this).trigger("resize")
		};
		$(window).resize(this.resizeFn).oneTime(150, "resize", this.resizeFn2);
	};

	Model.prototype.modelUnLoad = function(event){
		$(window).off("resize", this.resizeFn);
		$(window).off("resize", this.resizeFn2);
	};


	Model.prototype.loadDemoData = function() {
		var ret = {
			"tasks" : [ {
				"id" : "tmp_fk1345624806538",
				"name" : "Gantt editor ",
				"code" : "",
				"level" : 0,
				"status" : "STATUS_ACTIVE",
				"start" : 1346623200000,
				"duration" : 5,
				"end" : 1347055199999,
				"startIsMilestone" : false,
				"endIsMilestone" : false,
				"assigs" : [ {
					"resourceId" : "tmp_3",
					"id" : "tmp_1345625008213",
					"roleId" : "tmp_1",
					"effort" : 7200000
				} ],
				"depends" : "",
				"description" : "",
				"progress" : 0
			}, {
				"id" : "tmp_fk1345624806539",
				"name" : "phase 1",
				"code" : "",
				"level" : 1,
				"status" : "STATUS_ACTIVE",
				"start" : 1346623200000,
				"duration" : 2,
				"end" : 1346795999999,
				"startIsMilestone" : false,
				"endIsMilestone" : false,
				"assigs" : [ {
					"resourceId" : "tmp_1",
					"id" : "tmp_1345624980735",
					"roleId" : "tmp_1",
					"effort" : 36000000
				} ],
				"depends" : "",
				"description" : "",
				"progress" : 0
			}, {
				"id" : "tmp_fk1345624789530",
				"name" : "phase 2",
				"code" : "",
				"level" : 1,
				"status" : "STATUS_SUSPENDED",
				"start" : 1346796000000,
				"duration" : 3,
				"end" : 1347055199999,
				"startIsMilestone" : false,
				"endIsMilestone" : false,
				"assigs" : [ {
					"resourceId" : "tmp_2",
					"id" : "tmp_1345624993405",
					"roleId" : "tmp_2",
					"effort" : 36000000
				} ],
				"depends" : "2",
				"description" : "",
				"progress" : 0
			} ],
			"resources" : [ {
				"id" : "tmp_1",
				"name" : "Resource 1"
			}, {
				"id" : "tmp_2",
				"name" : "Resource 2"
			}, {
				"id" : "tmp_3",
				"name" : "Resource 3"
			} ],
			"roles" : [ {
				"id" : "tmp_1",
				"name" : "Project Manager"
			}, {
				"id" : "tmp_2",
				"name" : "Worker"
			} ],
			"canWrite" : true,
			"canWriteOnParent" : true,
			"selectedRow" : 0,
			"deletedTaskIds" : [],
		};

		this.ge.reset();
		this.ge.loadProject(ret);
		this.ge.checkpoint(); // empty the undo stack
	};

	Model.prototype.modelParamsReceive = function(event) {
		this.loadDemoData();
		//this.loadTaskGantt();
	};

	Model.prototype.loadTaskGantt = function() {
		var self = this;
		this.ge.reset();
		var task = this.params.task || "";
		var params = new biz.Request.ActionParam();
		params.setString("task", task);
		var options = {};
		options.context = this.getContext();
		options.action = "getTaskGanttAction";
		options.parameters = params;
		options.directExecute = true;
		options.contentType = biz.Request.JSON_TYPE;
		options.dataType = biz.Request.JSON_TYPE;
		options.process = process;
		options.activity = activity;
		var self = this;
		options.callback = function(options) {
			if (options.state) {
				var ret = options.response;
				self.ge.loadProject(ret);
				self.ge.checkpoint(); // empty the undo stack

			} else {
				options.ignoreError = false;
			}
		};
		biz.Request.sendBizRequest(options);
	};

	return Model;
});
