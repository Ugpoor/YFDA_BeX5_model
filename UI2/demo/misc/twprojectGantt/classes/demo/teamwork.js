define(function(require) {
	require("css!../platform").load();
	require("css!../libs/dateField/jquery.dateField").load();
	require("css!../gantt").load();
	require("css!../libs/jquery.svg").load();
	var biz = require("$UI/system/lib/biz");
	var $ = require("jquery");
	require("../libs/JST/jquery.JST");

	var GanttMaster = require("../ganttMaster");

	var justep = require("$UI/system/lib/justep");

	var ge; // this is the hugly but very friendly global var for the gantt

	// -------------------------------------------------------
	// -------------------teamwork js start-------------------
	// -------------------------------------------------------
	function init() {
		// editor
		// $(function() {

		// load templates
		//$("#"+ganttemplates).loadTemplates();
		$("#gantEditorTemplates").loadTemplates().remove();

		// here starts gantt initialization
		ge = new GanttMaster();
		var workSpaceObj = $("#"+workSpace);
		debugger;
		workSpaceObj.css({
			width : $(".page-content").width(),
			height : $(".page-content").width() * 0.8
		});
		
		
		ge.init(workSpaceObj);

		// inject some buttons (for this demo only)
		// var container = $(".ganttButtonBar div");
		// var clearBtn = $("<button data-bind='{click:$model.clearGanttClick}'
		// class='button'>clear</button>");
		// var importFileBtn = $("<button
		// data-bind='{click:$model.importFileClick}'
		// class='button'>import</button>");

		// justep.Component.addNodes(container[0], [ clearBtn[0],
		// importFileBtn[0] ]);
		/*
		 * $(".ganttButtonBar div").append("<button bind-click='clearGantt();'
		 * class='button'>clear</button>").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;").append( "<button
		 * bind-click='importFile();' class='button'>import</button>");
		 */
		// $(".ganttButtonBar div").addClass('buttons');
		// overwrite with localized ones
		loadI18n();

		// simulate a data load from a server.
		loadGanttFromServer();
		// fill default Teamwork roles if any
		if (!ge.roles || ge.roles.length == 0) {
			setRoles();
		}

		// fill default Resources roles if any
		if (!ge.resources || ge.resources.length == 0) {
			setResource();
		}
		
		
		$(window).resize(function() {
			debugger;
			workSpaceObj.css({
				width : $(".page-content").width(),
				height : $(".page-content").width() * 0.8
			});
			workSpaceObj.trigger("resize.gantt");
		}).oneTime(150, "resize", function() {
			$(this).trigger("resize")
		});

		// });

	}

	function loadGanttFromServer(taskId, callback) {
		// this is a simulation: load data from the local storage if you have
		// already played with the demo or a textarea with starting demo data
		loadFromLocalStorage();
	}
	
	
	
	
	function saveGanttOnServer() {
		if (!ge.canWrite)
			return;

		saveInLocalStorage();
	}

	// ------------------------------------------- Create some demo data
	// ------------------------------------------------------
	function setRoles() {
		ge.roles = [ {
			id : "tmp_1",
			name : "Project Manager"
		}, {
			id : "tmp_2",
			name : "Worker"
		}, {
			id : "tmp_3",
			name : "Stakeholder/Customer"
		} ];
	}

	function setResource() {
		var res = [];
		for ( var i = 1; i <= 10; i++) {
			res.push({
				id : "tmp_" + i,
				name : "Resource " + i
			});
		}
		ge.resources = res;
	}

	function editResources() {

	}

	function clearGantt() {
		ge.reset();
	}

	function loadI18n() {
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
	}

	// ------------------------------------------- Get project file as JSON
	// (used for migrate project from gantt to Teamwork)
	// ------------------------------------------------------

	// ------------------------------------------- LOCAL STORAGE MANAGEMENT (for
	// this demo only) ------------------------------------------------------
	Storage.prototype.setObject = function(key, value) {
		this.setItem(key, JSON.stringify(value));
	};

	Storage.prototype.getObject = function(key) {
		return this.getItem(key) && JSON.parse(this.getItem(key));
	};

	function loadFromLocalStorage() {
		var ret;
		debugger;
		if (localStorage) {
			if (localStorage.getObject("GantData")) {
				ret = localStorage.getObject("GantData");
			}
		} else {
			$("#"+taZone).show();
		}
		if (!ret || !ret.tasks || ret.tasks.length == 0) {
			ret = JSON.parse($("#"+ta).val());
		}
		ge.loadProject(ret);
		ge.checkpoint(); // empty the undo stack
	}
	function saveInLocalStorage() {
		var prj = ge.saveProject();
		if (localStorage) {
			localStorage.setObject("GantData", prj);
		} else {
			$("#"+ta).val(JSON.stringify(prj));
		}
	}
	// ------------------------------------------- Open a black popup for
	// managing resources. This is only an axample of implementation (usually
	// resources come from server)
	// ------------------------------------------------------
	function editResources() {
		// make resource editor
		var resourceEditor = $.JST.createFromTemplate({}, "RESOURCE_EDITOR");
		var resTbl = resourceEditor.find("#"+resourcesTable);
		for ( var i = 0; i < ge.resources.length; i++) {
			var res = ge.resources[i];
			resTbl.append($.JST.createFromTemplate(res, "RESOURCE_ROW"))
		}
		// bind add resource
		resourceEditor.find("#"+addResource).click(function() {
			resTbl.append($.JST.createFromTemplate({
				id : "new",
				name : "resource"
			}, "RESOURCE_ROW"))
		});

		// bind save event
		resourceEditor.find("#"+resSaveButton).click(function() {
			var newRes = [];
			// find for deleted res
			for ( var i = 0; i < ge.resources.length; i++) {
				var res = ge.resources[i];
				var row = resourceEditor.find("[resId=" + res.id + "]");
				if (row.size() > 0) {
					// if still there save it
					var name = row.find("input[name]").val();
					if (name && name != "")
						res.name = name;
					newRes.push(res);
				} else {
					// remove assignments
					for ( var j = 0; j < ge.tasks.length; j++) {
						var task = ge.tasks[j];
						var newAss = [];
						for ( var k = 0; k < task.assigs.length; k++) {
							var ass = task.assigs[k];
							if (ass.resourceId != res.id)
								newAss.push(ass);
						}
						task.assigs = newAss;
					}
				}
			}
			// loop on new rows
			resourceEditor.find("[resId=new]").each(function() {
				var row = $(this);
				var name = row.find("input[name]").val();
				if (name && name != "")
					newRes.push(new Resource("tmp_" + new Date().getTime(), name));
			});
			ge.resources = newRes;
			closeBlackPopup();
			ge.redraw();
		});

		var ndo = createBlackPage(400, 500).append(resourceEditor);
	}

	function loadDecorator() {
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
	}

	// -------------------------------------------------------
	// -------------------teamwork js end---------------------
	// -------------------------------------------------------

	var Model = function() {
		this.callParent();
	};
	var concept;// 概念名
	var masterID;// 主表ID
	// id初始化
		var ganttemplates = "ganttemplates";
		var workSpace = "workSpace";
		var taZone = "taZone";
		var ta = "ta";
		var resourcesTable = "resourcesTable";
		var addResource = "addResource";
		var resSaveButton = "resSaveButton";
	
	
	// 设置变量值
	Model.prototype.setParams_ = function(filed, value) {
		if (filed == "masterID" && concept != 'undefined' && masterID != 'undefined') {
			this.loadData(concept, value);
		}
		eval(filed + "='" + value + "'");
	};
	Model.prototype.loadData = function(value1, value2) {
		// 调用action查询数据库
		var param = new biz.Request.ActionParam();
		param.setString("operation", "loadData");
		param.setString("concept", value1);
		param.setString("masterID", value2);
		var option = {
			context : this.getContext(),
			async : false,
			directExecute : true,
			dataType : 'application/json',
			contextType : 'application/json',
			action : 'ganttOperateAction',
			parameters : param,
		};
		var result = biz.Request.sendBizRequest(option);
		debugger;
		var obj = JSON.parse(JSON.parse(result.responseText).data.value);
		if (obj == '0') {
			$('#'+ta)
					.val(
							'{"tasks":[{"id":-1,"name":"Gantt editor","code":"","level":0,"status":"STATUS_ACTIVE","canWrite":true,"start":1396994400000,"duration":21,"end":1399672799999,"startIsMilestone":true,"endIsMilestone":false,"collapsed":false,"assigs":[],"hasChild":true},{"id":-2,"name":"coding","code":"","level":1,"status":"STATUS_ACTIVE","canWrite":true,"start":1396994400000,"duration":10,"end":1398203999999,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"description":"","progress":0,"hasChild":true},{"id":-3,"name":"gantt part","code":"","level":2,"status":"STATUS_ACTIVE","canWrite":true,"start":1396994400000,"duration":2,"end":1397167199999,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"depends":"","hasChild":false},{"id":-4,"name":"editor part","code":"","level":2,"status":"STATUS_SUSPENDED","canWrite":true,"start":1397167200000,"duration":4,"end":1397685599999,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"depends":"3","hasChild":false},{"id":-5,"name":"testing","code":"","level":1,"status":"STATUS_SUSPENDED","canWrite":true,"start":1398981600000,"duration":6,"end":1399672799999,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"depends":"2:5","description":"","progress":0,"hasChild":true},{"id":-6,"name":"test on safari","code":"","level":2,"status":"STATUS_SUSPENDED","canWrite":true,"start":1398981600000,"duration":2,"end":1399327199999,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"depends":"","hasChild":false},{"id":-7,"name":"test on ie","code":"","level":2,"status":"STATUS_SUSPENDED","canWrite":true,"start":1399327200000,"duration":3,"end":1399586399999,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"depends":"6","hasChild":false},{"id":-8,"name":"test on chrome","code":"","level":2,"status":"STATUS_SUSPENDED","canWrite":true,"start":1399327200000,"duration":2,"end":1399499999999,"startIsMilestone":false,"endIsMilestone":false,"collapsed":false,"assigs":[],"depends":"6","hasChild":false}],"selectedRow":0,"canWrite":true,"canWriteOnParent":true}');
			obj = JSON.parse($('#'+ta).val());
		}
		localStorage.setObject("GantData", obj);
		ge.loadProject(obj);
		ge.checkpoint(); // empty the undo stack
	};
	Model.prototype.modelLoad = function(event) {
		// 生成随机id并替换
		var uuid=this.randomString(8);
		ganttemplates="ganttemplates"+"_"+uuid;
        workSpace="workSpace"+"_"+uuid;
        taZone="taZone"+"_"+uuid;
        ta="ta"+"_"+uuid;
        resourcesTable="resourcesTable"+"_"+uuid;
        addResource="addResource"+"_"+uuid;
        resSaveButton="resSaveButton"+"_"+uuid;
        $('#ganttemplates').attr('id',ganttemplates);
        $('#workSpace').attr('id',workSpace);
        $('#taZone').attr('id',taZone);
        $('#ta').attr('id',ta);
        $('#resourcesTable').attr('id',resourcesTable);
        $('#addResource').attr('id',addResource);
        $('#resSaveButton').attr('id',resSaveButton);        
		localStorage.setObject("GantData", null);
		
		this.InitGantt();
	};
	// 随机字符生成函数
	Model.prototype.randomString=function(len) {
　　		len = len || 32;
　　		var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
　　		var maxPos = $chars.length;
　　		var pwd = '';
　　		for (var i = 0; i < len; i++) {
　　　　		pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
　　		}
　　		return pwd;
	};
	Model.prototype.showImportDlg = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		this.comp('importDialog').open();
	};
	Model.prototype.loadGanttFromServerClick = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		// 从服务器加载数据
		loadGanttFromServer(taskId, callback);
	};
	// 打印
	Model.prototype.printClick = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		print();
	};
	//
	Model.prototype.criticalClick = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		ge.gantt.showCriticalPath = !ge.gantt.showCriticalPath;
		ge.redraw();
	};
	// 编辑资源
	Model.prototype.editResourcesClick = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		editResources();
	};
	// 保存
	Model.prototype.saveGanttOnServerClick = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		saveGanttOnServer();
		// 调用action存入数据库
		var param = new biz.Request.ActionParam();
		param.setString("operation", "saveData");
		param.setString("concept", concept);
		param.setString("masterID", masterID);
		param.setString("data", JSON.stringify(localStorage.getObject("GantData")));
		var option = {
			context : this.getContext(),
			async : false,
			directExecute : true,
			dataType : 'application/json',
			contextType : 'application/json',
			action : 'ganttOperateAction',
			parameters : param,
		};
		var result = biz.Request.sendBizRequest(option);
		var str = JSON.parse(result.responseText).data.value;
	};
	// 清除
	Model.prototype.clearGanttClick = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		clearGantt();
	};
	// 导入
	Model.prototype.importFileClick = function(event) {
		if (masterID == 'undefined' || masterID == null || masterID == undefined || concept == 'undefined' || concept == null || concept == undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		this.showImportDlg();
	};
	Model.prototype.importDialogReceive = function(event) {
		if (masterID == 'undefined' || masterID === null || masterID === undefined || concept === 'undefined' || concept === null || concept === undefined) {
			alert("请选择或新增总计划数据！");
			return;
		}
		// 解析mpp文件返回数据

		if (localStorage) {
			if (localStorage.getObject("GantData")) {
				debugger;
				localStorage.setObject("GantData", JSON.parse(event.data));
			} else {
				$('#'+ta).val(event.data);
			}
		} else {
			$("#"+ta).val(event.data);
		}
		loadFromLocalStorage();
	};
	
	Model.prototype.getPlanDate = function() {
	
		//获取计划开工竣工日期
		debugger;
		var obj = null;
		if(localStorage.getObject("GantData")){
			obj = localStorage.getObject("GantData");
		} else {
			//货物ta标签中的内容
			obj = JSON.parse($('#'+ta).val());
		}
		return {
		'start' : obj.tasks[0].start,
		'end' : obj.tasks[0].end
		};
	};
	
	Model.prototype.InitGantt = function() {
		// 初始化调用action查询数据库
		init();
		loadDecorator();
	};
	return Model;
	
	
});
