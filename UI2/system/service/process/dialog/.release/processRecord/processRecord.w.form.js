define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/smartFilter/smartFilter');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/button/buttonGroup');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/dataTables/dataTables');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/service/process/dialog/processRecord'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cyyyMje';
	this._flag_='dcbe39914d319e2b07454cbe4fb6f351';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_Task":{"define":"SA_Task","name":"SA_Task","relation":"SA_Task","type":"String"},"sActivityName":{"define":"SA_Task.sActivityName","isBiz":true,"label":"环节","name":"sActivityName","relation":"SA_Task.sActivityName","type":"String"},"sActualFinishTime":{"define":"SA_Task.sActualFinishTime","isBiz":true,"label":"结束时间","name":"sActualFinishTime","relation":"SA_Task.sActualFinishTime","rules":{"datetime":true},"type":"DateTime"},"sActualStartTime":{"define":"SA_Task.sActualStartTime","isBiz":true,"label":"开始时间","name":"sActualStartTime","relation":"SA_Task.sActualStartTime","rules":{"datetime":true},"type":"DateTime"},"sContent":{"define":"SA_Task.sContent","isBiz":true,"label":"内容","name":"sContent","relation":"SA_Task.sContent","type":"String"},"sExecutorDeptName":{"define":"SA_Task.sExecutorDeptName","isBiz":true,"label":"执行者部门","name":"sExecutorDeptName","relation":"SA_Task.sExecutorDeptName","type":"String"},"sExecutorPersonName":{"define":"SA_Task.sExecutorPersonName","isBiz":true,"label":"执行人","name":"sExecutorPersonName","relation":"SA_Task.sExecutorPersonName","type":"String"},"sName":{"define":"SA_Task.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_Task.sName","type":"String"}},"directDelete":false,"events":{},"idColumn":"SA_Task","limit":20,"offset":0,"queryAction":"queryProcessExecuteListAction","updateMode":"whereVersion","xid":"processRecordData"});
}}); 
return __result;});