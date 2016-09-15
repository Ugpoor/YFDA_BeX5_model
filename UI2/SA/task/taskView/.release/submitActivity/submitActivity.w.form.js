define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/output/output');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/bizData');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/task/taskView/submitActivity'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='portal';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cn2QfAv';
	this._flag_='3c041dd936523dd80490adc298964f5a';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_Task":{"define":"SA_Task","name":"SA_Task","relation":"SA_Task","type":"String"},"sActivity":{"define":"SA_Task.sActivity","isBiz":true,"label":"环节","name":"sActivity","relation":"SA_Task.sActivity","type":"String"},"sCURL":{"define":"SA_Task.sCURL","isBiz":true,"label":"提交页面","name":"sCURL","relation":"SA_Task.sCURL","type":"String"},"sCreateTime":{"define":"SA_Task.sCreateTime","isBiz":true,"label":"创建时间","name":"sCreateTime","relation":"SA_Task.sCreateTime","rules":{"datetime":true},"type":"DateTime"},"sCreatorFName":{"define":"SA_Task.sCreatorFName","isBiz":true,"label":"提交者","name":"sCreatorFName","relation":"SA_Task.sCreatorFName","type":"String"},"sData1":{"define":"SA_Task.sData1","isBiz":true,"label":"业务数据1","name":"sData1","relation":"SA_Task.sData1","type":"String"},"sData2":{"define":"SA_Task.sData2","isBiz":true,"label":"业务数据2","name":"sData2","relation":"SA_Task.sData2","type":"String"},"sData3":{"define":"SA_Task.sData3","isBiz":true,"label":"业务数据3","name":"sData3","relation":"SA_Task.sData3","type":"String"},"sData4":{"define":"SA_Task.sData4","isBiz":true,"label":"业务数据4","name":"sData4","relation":"SA_Task.sData4","type":"String"},"sExecutorFID":{"define":"SA_Task.sExecutorFID","isBiz":true,"label":"执行者FID","name":"sExecutorFID","relation":"SA_Task.sExecutorFID","type":"String"},"sExecutorFName":{"define":"SA_Task.sExecutorFName","isBiz":true,"label":"执行者","name":"sExecutorFName","relation":"SA_Task.sExecutorFName","type":"String"},"sExecutorNames":{"define":"SA_Task.sExecutorNames","isBiz":true,"label":"执行者列表","name":"sExecutorNames","relation":"SA_Task.sExecutorNames","type":"String"},"sName":{"define":"SA_Task.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_Task.sName","type":"String"},"sProcess":{"define":"SA_Task.sProcess","isBiz":true,"label":"过程","name":"sProcess","relation":"SA_Task.sProcess","type":"String"}},"directDelete":false,"events":{},"idColumn":"SA_Task","limit":5,"offset":-1,"orderBys":[{"relation":"sCreateTime","type":0}],"queryAction":"querySubmitTask2Action","updateMode":"whereVersion","xid":"taskData"});
}}); 
return __result;});