//model-->data json
//data json --> model
define(function(require) {
	
	var justep = require("$UI/system/lib/justep");
	var XML = require("$UI/system/lib/base/xml");
	

	var executeRuleConstant = ["sExecuteMode2","sLimitTime","sExecuteMode","sName","sPreemptMode"];
	var transferRuleConstant = ["sLimitTime","sExecuteMode","sName","sPreemptMode"];
	var noticeRuleConstant = ["transferTask","advanceProcess","backProcess"];
	var noticeRuleConstant2 = ["sExecuteMode2","sEURL","sLimitTime","sName"];
	var convter = {
			//拼接执行规则
			toModelExecuteRule:function(executeRulesData){
				var result = [];
				if(executeRulesData != null){
					executeRulesData.each(function(option) {
						var executeRule = "<execute-rule condition='"+option.row.val('condition')+"' task-assign-mode='"+option.row.val('taskAssignMode')+"'><executor-range range-expr=\""+option.row.val('rangeExpr')+"\" default-expr=\""+option.row.val('defaultExpr')+"\" range-expr-value=\""+option.row.val('rangeExprValue')+"\" default-expr-value='"+option.row.val('defaultExprValue')+"'>";
						var arr = option.row.val("kind").split(",");
						var arr1 = option.row.val("kindName").split(",");
						for(var i = 0; i<arr.length; i++){
							executeRule += "<kind>"+arr[i]+"</kind>";
						}
						for(var i = 0; i<arr1.length; i++){
							executeRule += "<kind-name>"+arr1[i]+"</kind-name>";
						}
						
						executeRule = executeRule + "</executor-range><task-relation-value>";
						
						for(var i = 0; i<executeRuleConstant.length; i++){
							if(option.row.val(executeRuleConstant[i]) != null && option.row.val(executeRuleConstant[i]) != ""){
								if(i != 1){
									executeRule = executeRule + "<item relation='"+executeRuleConstant[i]+"'>"+option.row.val(executeRuleConstant[i])+"</item>";
								}else{
									executeRule = executeRule + "<item relation='"+executeRuleConstant[i]+"'>toDateTime('"+option.row.val(executeRuleConstant[i])+"')</item>";
								}
							}
						}
							executeRule = executeRule+"</task-relation-value></execute-rule>";
							
							var xmlExecuteRule = XML.fromString(executeRule);
							
							result.push(xmlExecuteRule);
						
					});
				}
				return result;
				
			},
			//拼接转发规则
			toModelTransferRule:function(transferRulesData){
				var result = [];
				if(transferRulesData != null){
					transferRulesData.each(function(option) {
						var dialogEnabled;
						var saveEnabled;
						option.row.val('dialogEnabled') == 'dialogEnabled'?dialogEnabled='true':dialogEnabled='false';
						option.row.val('saveEnabled') == 'saveEnabled'?saveEnabled='true':saveEnabled='false';
						
						var transferRule = "<transfer-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+saveEnabled+"' task-assign-mode='"+option.row.val('taskAssignMode')+"'><executor-range range-expr=\""+option.row.val('rangeExpr')+"\" default-expr=\""+option.row.val('defaultExpr')+"\" range-expr-value=\""+option.row.val('rangeExprValue')+"\" default-expr-value='"+option.row.val('defaultExprValue')+"'>";
						
						var arr = option.row.val("kind").split(",");
						var arr1 = option.row.val("kindName").split(",");
						for(var i = 0; i<arr.length; i++){
							transferRule += "<kind>"+arr[i]+"</kind>";
						}
						for(var i = 0; i<arr1.length; i++){
							transferRule += "<kind-name>"+arr1[i]+"</kind-name>";
						}
						
						transferRule = transferRule + "</executor-range><task-relation-value>";
						
						for(var i = 0; i<transferRuleConstant.length; i++){
							if(option.row.val(transferRuleConstant[i]) != null && option.row.val(transferRuleConstant[i]) != ""){
								if(i != 0){
									transferRule = transferRule + "<item relation='"+transferRuleConstant[i]+"'>"+option.row.val(transferRuleConstant[i])+"</item>";
								}
								else{
									transferRule = transferRule + "<item relation='"+transferRuleConstant[i]+"'>toDateTime('"+option.row.val(transferRuleConstant[i])+"')</item>";
								}
							}
							
						}
						
						
						transferRule = transferRule+"</task-relation-value></transfer-rule>";
							
						
							var xmlTransfer = XML.fromString(transferRule);
							result.push(xmlTransfer);
							
							
					
				});
				}
				return result;
			},
			//拼接通知规则
			toModelNoticeRule:function(noticeRulesData){
				var result = [];
				var noticeRule = "";
				if(noticeRulesData != null){
					noticeRulesData.each(function(option) {
						var dialogEnabled;
						var saveEnabled;
						option.row.val('dialogEnabled') == 'dialogEnabled'?dialogEnabled='true':dialogEnabled='false';
						option.row.val('saveEnabled') == 'saveEnabled'?saveEnabled='true':saveEnabled='false';
					
						if(option.row.val('whenToUnit') != ""){
							noticeRule = "<notice-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+saveEnabled+"\' when-to-unit='"+option.row.val('whenToUnit')+"' task-assign-mode='singleness'>";
						}else{
							noticeRule = "<notice-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+saveEnabled+"\' task-assign-mode='singleness'>";
						}
						for(var i = 0; i<noticeRuleConstant.length; i++){
							if(option.row.val(noticeRuleConstant[i]) != null && option.row.val(noticeRuleConstant[i]) != ""){
								noticeRule = noticeRule+"<occasion>"+noticeRuleConstant[i]+"</occasion>";

							}
						}
						
						noticeRule = noticeRule + "<executor-range range-expr=\""+option.row.val('rangeExpr')+"\" default-expr=\""+option.row.val('defaultExpr')+"\" range-expr-value='"+option.row.val('rangeExprValue')+"' default-expr-value='"+option.row.val('defaultExprValue')+"'>";
						var arr = option.row.val("kind").split(",");
						var arr1 = option.row.val("kindName").split(",");
						for(var i = 0; i<arr.length; i++){
							noticeRule += "<kind>"+arr[i]+"</kind>";
						}
						for(var i = 0; i<arr1.length; i++){
							noticeRule += "<kind-name>"+arr1[i]+"</kind-name>";
						}
						noticeRule = noticeRule + "</executor-range><task-relation-value>";
						
						for(var i = 0; i<noticeRuleConstant2.length; i++){
							if(option.row.val(noticeRuleConstant2[i]) != null){
								if(i != 2){
									noticeRule = noticeRule + "<item relation='"+noticeRuleConstant2[i]+"'>"+option.row.val(noticeRuleConstant2[i])+"</item>";
								}else{
									noticeRule = noticeRule + "<item relation='"+noticeRuleConstant2[i]+"'>toDateTime('"+option.row.val(noticeRuleConstant2[i])+"')</item>";
								}
							}
						}
						
						noticeRule = noticeRule+"</task-relation-value></notice-rule>";
							var xmlNoticeRule = XML.fromString(noticeRule);
							result.push(xmlNoticeRule);
				});
				}
				return result;
				
			},
			//拼接流转规则
			toModelAdvanceRule:function(advanceRulesData){
				var result = [];
				if(advanceRulesData != null){
					advanceRulesData.each(function(option) {
						var dialogEnabled;
						var saveEnabled;
						var jumpEnabled;
						var taskWait;
						var taskJoin;
						var advanceRule="";
						option.row.val('dialogEnabled') == 'dialogEnabled'?dialogEnabled='true':dialogEnabled='false';
						option.row.val('saveEnabled') == 'saveEnabled'?saveEnabled='true':saveEnabled='false';
						option.row.val('jumpEnabled') == 'jumpEnabled'?jumpEnabled='true':jumpEnabled='false';
						option.row.val('taskWait') == 'taskWait'?taskWait='true':taskWait='false';
						option.row.val('taskJoin') == 'taskJoin'?taskJoin='true':taskJoin='false';
			
						if(option.row.val('forkActivity') != "" && option.row.val('ignoreExecuteMode') != ""){
							advanceRule = "<advance-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+dialogEnabled+"' jump-enabled='"+jumpEnabled+"' customized-enabled='false' ignore-execute-mode='"+option.row.val('ignoreExecuteMode')+"' task-wait='"+taskWait+"' task-join='"+taskJoin+"' fork-activity='"+option.row.val('forkActivity')+"'/>";
						}else if(option.row.val('forkActivity') != ""){
							advanceRule = "<advance-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+dialogEnabled+"' jump-enabled='"+jumpEnabled+"' customized-enabled='false' task-wait='"+taskWait+"' task-join='"+taskJoin+"' fork-activity='"+option.row.val('forkActivity')+"'/>";
						}else if(option.row.val('ignoreExecuteMode') != ""){
							advanceRule = "<advance-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+dialogEnabled+"' jump-enabled='"+jumpEnabled+"' customized-enabled='false' ignore-execute-mode='"+option.row.val('ignoreExecuteMode')+"' task-wait='"+taskWait+"' task-join='"+taskJoin+"'/>";
						}else{
							advanceRule = "<advance-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+dialogEnabled+"' jump-enabled='"+jumpEnabled+"' customized-enabled='false' task-wait='"+taskWait+"' task-join='"+taskJoin+"'/>";

						}
							var xmlAdvanceRule = XML.fromString(advanceRule);
							result.push(xmlAdvanceRule);
				});
				}
				return result;
				
			},
			//拼接回退规则
			toModelBackRule:function(backRulesData,designatedLinkData,figures){
				var result = [];
				if(backRulesData != null){
					backRulesData.each(function(option) {
						var dialogEnabled;
						var saveEnabled;
						var ignoreExecuteMode;
						option.row.val('dialogEnabled') == 'dialogEnabled'?dialogEnabled='true':dialogEnabled='false';
						option.row.val('saveEnabled') == 'saveEnabled'?saveEnabled='true':saveEnabled='false';
						option.row.val('ignoreExecuteMode') == 'ignoreExecuteMode'?ignoreExecuteMode='true':ignoreExecuteMode='false';
		
						if(option.row.val('backRange') == 'specified'){
							var backRule = "<back-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+saveEnabled+"' ignore-execute-mode='"+ignoreExecuteMode+"' back-range='"+option.row.val('backRange')+"' then-flow-mode='"+option.row.val('thenFlowMode')+"'>";
							
							var demoData = designatedLinkData.find(['id'],[option.row.val('id')]);
								for(var i = 0; i< demoData.length; i++){
									var linkName;
									for ( var p in figures) {
										var figure = figures[p];
										if (figure.modelData.LABEL == demoData[i].val("linkName")) {
											linkName = figure.id;
										}
									}
									backRule = backRule+"<to activity='"+linkName+"'/>";
								}
							backRule = backRule + "</back-rule>";
						}else{
							
							var backRule = "<back-rule condition='"+option.row.val('condition')+"' dialog-enabled='"+dialogEnabled+"' save-enabled='"+saveEnabled+"' ignore-execute-mode='"+ignoreExecuteMode+"' back-range='"+option.row.val('backRange')+"' then-flow-mode='"+option.row.val('thenFlowMode')+"'/>";
						}
						
						
							var xmlBackRule = XML.fromString(backRule);
							result.push(xmlBackRule);
					
				});
				}
				return result;
			},
			//拼接合并规则
			toModelJoinRule:function(joinRulesData,joinInputActivity,figures){
				var result = [];
				var joinRule = "";
				if(joinRulesData != null){
					joinRulesData.each(function(option) {
						var demoData = joinInputActivity.find(['id'],[option.row.val('id')]);
						if(demoData != null){
							joinRule = "<join-rule condition='"+option.row.val('condition')+"' join-mode='"+option.row.val('joinMode')+"' fork-activity='"+option.row.val('forkActivity')+"'>";
							
								for(var i = 0; i< demoData.length; i++){
									var name;
									for ( var p in figures) {
										var figure = figures[p];
										if (figure.modelData.LABEL == demoData[i].val("name")) {
											name = figure.id;
										}
									}
									joinRule = joinRule+"<optional unit='"+name+"'/>";
								}
								joinRule = joinRule + "</join-rule>";
						}else{
							
							joinRule = "<join-rule condition='"+option.row.val('condition')+"' join-mode='"+option.row.val('joinMode')+"' fork-activity='"+option.row.val('forkActivity')+"'/>";
						}
						
						
							var xmlJoinRule = XML.fromString(joinRule);
							result.push(xmlJoinRule);
					
				});
				}
				return result;
			},
			//拼接分支规则
			toModelForkRule:function(forkRulesData,forkOutputActivity,figures){
				var result = [];
				var forkRule="";
				if(forkRulesData != null){
					forkRulesData.each(function(option) {
						var demoData = forkOutputActivity.find(['id'],[option.row.val('id')]);
						if(demoData != null){
							forkRule = "<fork-rule condition='"+option.row.val('condition')+"'>";
							
								for(var i = 0; i< demoData.length; i++){
									var name;
									for ( var p in figures) {
										var figure = figures[p];
										if (figure.modelData.LABEL == demoData[i].val("name")) {
											name = figure.id;
										}
									}
									forkRule = forkRule+"<optional unit='"+name+"'/>";
								}
								forkRule = forkRule + "</fork-rule>";
						}else{
							
							forkRule = "<fork-rule condition='"+option.row.val('condition')+"'/>";
						}
						
						
							var xmlForkRule = XML.fromString(forkRule);
							result.push(xmlForkRule);
					
				});
				}
				return result;
			},
			//解析执行规则
			toJsonExecuteRule:function(node,name){
				
				var condition = null;
				var taskAssignMode = null;
				var rangeExpr = null;
				var defaultExpr = null;
				var sExecuteMode2 = null;
				var sExecuteMode = null;
				var sName = null;
				var sPreemptMode = null;
				var sLimitTime = null;
				var rangeExprValue = "";
				var defaultExprValue = "";
				var kind = "";
				var kindName = "";

				condition = node.getAttribute("condition");
				taskAssignMode = node.getAttribute("task-assign-mode");

				var sNodes = node.childNodes;
				for (var j = 0; j < sNodes.length; j++) {
					if (sNodes[j].tagName == 'executor-range') {
						rangeExpr = sNodes[j].getAttribute("range-expr");
						defaultExpr = sNodes[j].getAttribute("default-expr");
						if(sNodes[j].getAttribute("range-expr-value") !== null){
							rangeExprValue = sNodes[j].getAttribute("range-expr-value");
						}else{
							rangeExprValue = sNodes[j].getAttribute("range-expr");
						}
						if(sNodes[j].getAttribute("default-expr-value") !== null){
							defaultExprValue = sNodes[j].getAttribute("default-expr-value");
						}else{
							defaultExprValue = sNodes[j].getAttribute("default-expr");
						}
						var kNodes = sNodes[j].childNodes;
						for (var m = 0; m < kNodes.length; m++) {
							if (kNodes[m].tagName == 'kind') {
									kind += kNodes[m].innerHTML;
									kind += ",";

							}
							if (kNodes[m].tagName == 'kind-name') {
									kindName += kNodes[m].innerHTML;
									kindName += ",";
							}
						}
					}
					if (sNodes[j].tagName == 'task-relation-value') {
						var tNodes = sNodes[j].childNodes;
						for (var n = 0; n < tNodes.length; n++) {
							if (tNodes[n].tagName == 'item') {

								if (tNodes[n].getAttribute("relation") == 'sExecuteMode2') {
									sExecuteMode2 = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sExecuteMode') {
									sExecuteMode = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sName') {
									sName = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sPreemptMode') {
									sPreemptMode = tNodes[n].innerHTML;
								
								}
								if (tNodes[n].getAttribute("relation") == 'sLimitTime') {
									var time = tNodes[n].innerHTML;
									sLimitTime = justep.Date.fromString(time,"yyyy-MM-dd hh:mm:ss");
								}
							}

						}
					}

				}
				var vKind = kind.substring(0, kind.length-1);
				var vKindName = kindName.substring(0, kindName.length-1);
				 return {
					 	"name" : name,
						"condition" : condition,
						"taskAssignMode" : taskAssignMode,
						"rangeExpr" : rangeExpr,
						"sExecuteMode" : sExecuteMode,
						"sPreemptMode" : sPreemptMode,
						"sExecuteMode2" : sExecuteMode2,
						"sName" : sName,
						"sLimitTime" : sLimitTime,
						"defaultExpr" : defaultExpr,
						"kind" : vKind,
						"kindName" :vKindName,
						"rangeExprValue" : rangeExprValue,
						"defaultExprValue" : defaultExprValue
				 };
				
			},
			//解析转发规则
			toJsonTransferRule:function(node,name){
			
				var condition = null;
				var taskAssignMode = null;
				var rangeExpr = null;
				var defaultExpr = null;
				var dialogEnabled = null;
				var saveEnabled = null;
				var sExecuteMode = null;
				var sName = null;
				var sPreemptMode = null;
				var sLimitTime = null;
				var rangeExprValue = "";
				var defaultExprValue = "";
				var kind = "";
				var kindName = "";
				
				condition = node.getAttribute("condition");
				if(node.getAttribute("dialog-enabled") == 'true'){
					dialogEnabled = 'dialogEnabled';
				}
				if(node.getAttribute("save-enabled") == 'true'){
					saveEnabled = 'saveEnabled';
				}
				taskAssignMode = node.getAttribute("task-assign-mode");

				var sNodes = node.childNodes;
				for (var j = 0; j < sNodes.length; j++) {
					if (sNodes[j].tagName == 'executor-range') {
						rangeExpr = sNodes[j].getAttribute("range-expr");
						defaultExpr = sNodes[j].getAttribute("default-expr");
						if(sNodes[j].getAttribute("range-expr-value") !== null){
							rangeExprValue = sNodes[j].getAttribute("range-expr-value");
						}else{
							rangeExprValue = sNodes[j].getAttribute("range-expr");
						}
						if(sNodes[j].getAttribute("default-expr-value") !== null){
							defaultExprValue = sNodes[j].getAttribute("default-expr-value");
						}else{
							defaultExprValue = sNodes[j].getAttribute("default-expr");
						}
						var kNodes = sNodes[j].childNodes;
						for (var m = 0; m < kNodes.length; m++) {
							if (kNodes[m].tagName == 'kind') {
									kind += kNodes[m].innerHTML;
									kind += ",";
							}
							if (kNodes[m].tagName == 'kind-name') {
									kindName += kNodes[m].innerHTML;
									kindName += ",";
						}
						}
					}
					if (sNodes[j].tagName == 'task-relation-value') {
						var tNodes = sNodes[j].childNodes;
						for (var n = 0; n < tNodes.length; n++) {
							if (tNodes[n].tagName == 'item') {

								if (tNodes[n].getAttribute("relation") == 'sExecuteMode') {
									sExecuteMode = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sName') {
									sName = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sPreemptMode') {
									sPreemptMode = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sLimitTime') {
									var time = tNodes[n].innerHTML;
									sLimitTime = justep.Date.fromString(time,"yyyy-MM-dd hh:mm:ss");
								}
							}

						}
					}

				}
				var vKind = kind.substring(0, kind.length-1);
				var vKindName = kindName.substring(0, kindName.length-1);
				 
				return {
						name : name,
						condition : condition,
						dialogEnabled:dialogEnabled,
						saveEnabled:saveEnabled,
						taskAssignMode : taskAssignMode,
						rangeExpr : rangeExpr,
						sExecuteMode : sExecuteMode,
						sPreemptMode : sPreemptMode,
						sName : sName,
						sLimitTime : sLimitTime,
						defaultExpr : defaultExpr,
						kind : vKind,
						kindName : vKindName,
						rangeExprValue : rangeExprValue,
						defaultExprValue : defaultExprValue
					} ;
				
			},
			//解析通知规则
			toJsonNoticeRule:function(node,name){
				var condition = null;
				var taskAssignMode = null;
				var rangeExpr = null;
				var defaultExpr = null;
				var sExecuteMode2 = null;
				var dialogEnabled = null;
				var saveEnabled = null;
				var advanceProcess = null;
				var backProcess = null;
				var transferTask = null;
				var sEURL = null;
				var whenToUnit = "";
				var sName = null;
				var kind = "";
				var kindName = "";
				var rangeExprValue = "";
				var defaultExprValue = "";
				var sLimitTime = null;

				
				condition = node.getAttribute("condition");
				if(node.getAttribute("dialog-enabled") == 'true'){
					dialogEnabled = 'dialogEnabled';
				}
				if(node.getAttribute("save-enabled") == 'true'){
					saveEnabled = 'saveEnabled';
				}
				if(node.getAttribute("when-to-unit") !== null){
					whenToUnit = node.getAttribute("when-to-unit");
				}
				taskAssignMode = node.getAttribute("task-assign-mode");

				var sNodes = node.childNodes;
				for (var j = 0; j < sNodes.length; j++) {
					if (sNodes[j].tagName == 'executor-range') {
						rangeExpr = sNodes[j].getAttribute("range-expr");
						defaultExpr = sNodes[j].getAttribute("default-expr");
						if(sNodes[j].getAttribute("range-expr-value") !== null){
							rangeExprValue = sNodes[j].getAttribute("range-expr-value");
						}
						if(sNodes[j].getAttribute("default-expr-value") !== null){
							defaultExprValue = sNodes[j].getAttribute("default-expr-value");
						}
						var kNodes = sNodes[j].childNodes;
						for (var m = 0; m < kNodes.length; m++) {
							if (kNodes[m].tagName == 'kind') {
								kind += kNodes[m].innerHTML;
								kind += ",";
							}
							if (kNodes[m].tagName == 'kind-name') {
								kindName += kNodes[m].innerHTML;
								kindName += ",";
							}
						}
					}
					
					if (sNodes[j].tagName == 'occasion') {
						if(sNodes[j].innerHTML == 'transferTask'){
							transferTask = 'transferTask';
						}else if(sNodes[j].innerHTML == 'advanceProcess'){
							advanceProcess = 'advanceProcess';
						}else if(sNodes[j].innerHTML == 'backProcess'){
							backProcess = 'backProcess';
						}
						
					}
					
					if (sNodes[j].tagName == 'task-relation-value') {
						var tNodes = sNodes[j].childNodes;
						for (var n = 0; n < tNodes.length; n++) {
							if (tNodes[n].tagName == 'item') {

								if (tNodes[n].getAttribute("relation") == 'sExecuteMode2') {
									sExecuteMode2 = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sEURL') {
									sEURL = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sName') {
									sName = tNodes[n].innerHTML;
								}
								if (tNodes[n].getAttribute("relation") == 'sLimitTime') {
									var time = tNodes[n].innerHTML;
									sLimitTime = justep.Date.fromString(time,"yyyy-MM-dd hh:mm:ss");
								}
							}

						}
					}

				}
				var vKind = kind.substring(0, kind.length-1);
				var vKindName = kindName.substring(0, kindName.length-1);
				 
				return {
						name : name,
						condition : condition,
						dialogEnabled:dialogEnabled,
						saveEnabled:saveEnabled,
						taskAssignMode : taskAssignMode,
						rangeExpr : rangeExpr,
						sName : sName,
						sLimitTime : sLimitTime,
						defaultExpr : defaultExpr,
						kind : vKind,
						kindName : vKindName,
						sExecuteMode2:sExecuteMode2,
						advanceProcess:advanceProcess,
						sEURL:sEURL,
						backProcess:backProcess,
						transferTask:transferTask,
						whenToUnit:whenToUnit,
						rangeExprValue : rangeExprValue,
						defaultExprValue : defaultExprValue
						
					};
			},
			//解析流转规则
			toJsonAdvanceRule:function(node,name){
				
				var condition = null;
				var jumpEnabled = null;
				var dialogEnabled = null;
				var saveEnabled = null;
				var ignoreExecuteMode = "";
				var taskWait = null;
				var taskJoin = null;
				var forkActivity = "";
				if(node.getAttribute("condition") !== null){
					condition = node.getAttribute("condition");
				}
				if(node.getAttribute("ignore-execute-mode") !== null){
					ignoreExecuteMode = node.getAttribute("ignore-execute-mode");
				}
				if(node.getAttribute("fork-activity") !== null){
					forkActivity = node.getAttribute("fork-activity");
				}
				
				if(node.getAttribute("dialog-enabled") == 'true'){
					dialogEnabled = 'dialogEnabled';
				}
				if(node.getAttribute("save-enabled") == 'true'){
					saveEnabled = 'saveEnabled';
				}
				if(node.getAttribute("jump-enabled") == 'true'){
					jumpEnabled = 'jumpEnabled';
				}
				if(node.getAttribute("task-wait") == 'true'){
					taskWait = 'taskWait';
				}
				if(node.getAttribute("task-join") == 'true'){
					taskJoin = 'taskJoin';
				}
				

			
				
				return {
						name : name,
						condition : condition,
						dialogEnabled:dialogEnabled,
						saveEnabled:saveEnabled,
						jumpEnabled:jumpEnabled,
						ignoreExecuteMode:ignoreExecuteMode,
						taskWait:taskWait,
						taskJoin:taskJoin,
						forkActivity:forkActivity
						
					};
			},
			//解析回退规则
			toJsonBackRule:function(node,name,id,figures){
				
				var condition = null;
				var backRange = null;
				var thenFlowMode = null;
				var dialogEnabled = null;
				var saveEnabled = null;
				var ignoreExecuteMode = null;
				var arr = [];
				var result = [];
				
				
				condition = node.getAttribute("condition");
				thenFlowMode = node.getAttribute("then-flow-mode");
				backRange = node.getAttribute("back-range");
				
				if(node.getAttribute("ignore-execute-mode") == 'true'){
					ignoreExecuteMode = 'ignoreExecuteMode';
				}
				if(node.getAttribute("dialog-enabled") == 'true'){
					dialogEnabled = 'dialogEnabled';
				}
				if(node.getAttribute("save-enabled") == 'true'){
					saveEnabled = 'saveEnabled';
				}
				var nodes = node.childNodes;
				if(node.childNodes.length > 0){
					for(var i = 0; i < nodes.length; i++){
						if(nodes[i].tagName == 'to'){
							for ( var p in figures) {
								var figure = figures[p];
								if (figure.id == nodes[i].getAttribute("activity")) {
									arr.push({
										linkName : figure.modelData.LABEL,
										id:id
									});
								}
							}
							
						
						}
					}
				}
				var backRule = {
						name : name,
						condition : condition,
						dialogEnabled:dialogEnabled,
						saveEnabled:saveEnabled,
						backRange:backRange,
						ignoreExecuteMode:ignoreExecuteMode,
						thenFlowMode:thenFlowMode,
						id:id
						
						
					};
				result.push(arr);
				result.push(backRule);
				return result;
			},
			//解析合并规则
			toJsonJoinRule:function(name,node,id,figures){
				
				var joinRuleName = null;
				var joinCondition = null;
				var joinMode = null;
				var forkActivity = null;
				var arr = [];
				var result = [];
				
				joinCondition = node.getAttribute("condition");
				joinMode = node.getAttribute("join-mode");
				forkActivity = node.getAttribute("fork-activity");
				
				var joinRule = {
					id: id,
					condition: joinCondition,
					joinMode: joinMode,
					forkActivity: forkActivity,
					name : name,
				};

				var oNodes = node.childNodes;
				if (oNodes.length > 0) {
					for (var j = 0; j < oNodes.length; j++) {
						if (oNodes[j].tagName == 'optional') {
							for ( var p in figures) {
								var figure = figures[p];
								if (figure.id == oNodes[j].getAttribute("unit")) {
									arr.push({
										id : id,
										name : figure.modelData.LABEL
									});
								}
							}
							
						}
					}
				}
				result.push(joinRule);
				result.push(arr);
				return result;
				
			},
			//解析分支规则
			toJsonForkRule:function(name,node,id,figures){
				
				var forkCondition = null;
				var arr = [];
				var result = [];
				
				forkCondition = node.getAttribute("condition");
				
				
				var forkRule = {
					id: id,
					condition: forkCondition,
					name : name,
				};

				var oNodes = node.childNodes;
				if (oNodes.length > 0) {
					for (var j = 0; j < oNodes.length; j++) {
						if (oNodes[j].tagName == 'optional') {
							for ( var p in figures) {
							var figure = figures[p];
							if (figure.id == oNodes[j].getAttribute("unit")) {
								arr.push({
									id : id,
									name : figure.modelData.LABEL
								});
							}
							}
						
						}
					}
				}
				result.push(forkRule);
				result.push(arr);
				return result;
			},
			//找出所有环节
			findAllLink:function(figures){
				var result = [];
				for(var p in figures){
					var figure = figures[p];
					if(figure.type == 'businessActivity'){
						
							result.push({
								value : figure.id,
								oValue : figure.modelData.LABEL
							});
						
						
					}
				}
				return result;
			},
			//找出输入环节
			findInputLink:function(figures,node){
				var oValue = null;
				for ( var p in figures) {
					var figure = figures[p];
					if (figure.id == node.getAttribute("unit")) {
						oValue = figure.modelData.LABEL;
					}
				}

				return {
						value : node.getAttribute("unit"),
						oValue : oValue
					} ;
			
				
			},
			//找出输出环节
			findOutputLink:function(figures,node){
				var oValue = null;
				for ( var p in figures) {
					var figure = figures[p];
					if (figure.id == node.getAttribute("unit")) {
						oValue = figure.modelData.LABEL;
					}
				}

				
					return {
						value : node.getAttribute("unit"),
						oValue : oValue
					}; 
				
			},
			//找出所有条件后环节
			findAfterConditionLink:function(figures,node){
				
				var arr = [];
				var result = [];
				var unit;
				
				for(var j = 0 ; j< node.length; j++){
					if(node[j].tagName == 'input'){
						unit = node[j].getAttribute("unit");
					}
				}
				
				
				for ( var p in figures) {
					var figure = figures[p];
					if(figure.type == "businessActivity"){
						arr.push(figure);
					}
						if (figure.id == unit) {
							
							arr = [];
						}
					
				}
				for(var i = 0; i<arr.length; i++){
					var oValue = arr[i].modelData.LABEL;
					result.push( {
						value : arr[i].id,
						oValue : oValue
					} );
				}
				
				return result;
				
			},
			//解析IF分支环节
			toJsonConditionBranch:function(node){
				
				
				var conditionName = null;
				var trueOutput = null;
				var falseOutput = null;
				var condition = null;
				var result = [];
				
				conditionName = node.LABEL;
				condition = node.xmlNode.getAttribute("condition");
				var nodes = node.xmlNode.childNodes;
				
				for(var i = 0; i<nodes.length; i++){
					if(nodes[i].tagName == 'true-output'){
						trueOutput = nodes[i].getAttribute("unit");
					}
					if(nodes[i].tagName == 'false-output'){
						falseOutput = nodes[i].getAttribute("unit");
					}
				}
				
				result.push( {
					conditionName:conditionName,
					trueOutput:trueOutput,
					falseOutput:falseOutput,
					condition:condition
					
				});
				return result;
			},
			//修改IF分支环节XML
			editModelConditionBranch:function(node,conditionBranch){
				node.setAttribute("condition",conditionBranch.val("condition"));
				var nodes = node.childNodes;
				
				
				for(var i = 0; i<nodes.length; i++){
					if(nodes[i].tagName == 'true-output'){
						nodes[i].setAttribute("unit",conditionBranch.val("trueOutput"));
					}
					if(nodes[i].tagName == 'false-output'){
						nodes[i].setAttribute("unit",conditionBranch.val("falseOutput"));					
					}
				}
				return node;
				
			}
	};
	return convter;
});