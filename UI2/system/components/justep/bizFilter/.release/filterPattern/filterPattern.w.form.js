define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/popOver/popOver');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/output/output');
require('$model/UI2/system/components/justep/window/window');
var __parent2=require('$model/UI2/system/lib/base/modelBase'); 
var __parent1=require('$model/UI2/system/components/justep/bizFilter/filterPattern.m'); 
var __parent0=require('$model/UI2/system/components/justep/bizFilter/filterPattern'); 
var __result = __parent2._extend(__parent1)._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cVB7Rbq';
	this._flag_='378831705da2671351a6cc849fd2052b';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmDeleteText":"要删除这个查询模板吗？","confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_FilterPattern":{"define":"SA_FilterPattern","name":"SA_FilterPattern","relation":"SA_FilterPattern","type":"String"},"isPublic":{"define":"EXPRESS","name":"isPublic","relation":"EXPRESS","rules":{"calculate":"!$row.val(\"sPerson\")"},"type":"String"},"sActivity":{"define":"SA_FilterPattern.sActivity","isBiz":true,"label":"环节","name":"sActivity","relation":"SA_FilterPattern.sActivity","size":128,"type":"String"},"sContent":{"define":"SA_FilterPattern.sContent","isBiz":true,"label":"内容","name":"sContent","relation":"SA_FilterPattern.sContent","type":"Text"},"sCreateTime":{"define":"SA_FilterPattern.sCreateTime","isBiz":true,"label":"创建时间","name":"sCreateTime","relation":"SA_FilterPattern.sCreateTime","rules":{"datetime":true},"type":"DateTime"},"sCreatorID":{"define":"SA_FilterPattern.sCreatorID","isBiz":true,"label":"提交者ID","name":"sCreatorID","relation":"SA_FilterPattern.sCreatorID","size":32,"type":"String"},"sCreatorName":{"define":"SA_FilterPattern.sCreatorName","isBiz":true,"label":"提交者","name":"sCreatorName","relation":"SA_FilterPattern.sCreatorName","size":64,"type":"String"},"sInstance":{"define":"SA_FilterPattern.sInstance","isBiz":true,"label":"数据","name":"sInstance","relation":"SA_FilterPattern.sInstance","size":128,"type":"String"},"sName":{"define":"SA_FilterPattern.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_FilterPattern.sName","rules":{"required":{"message":"请输入模板名称","params":{"expr":"js: true"}}},"size":36,"type":"String"},"sOrderNum":{"define":"SA_FilterPattern.sOrderNum","isBiz":true,"label":"顺序号","name":"sOrderNum","relation":"SA_FilterPattern.sOrderNum","rules":{"integer":true},"type":"Integer"},"sOrgFID":{"define":"SA_FilterPattern.sOrgFID","isBiz":true,"label":"范围组织全路径ID","name":"sOrgFID","relation":"SA_FilterPattern.sOrgFID","size":512,"type":"String"},"sOrgFName":{"define":"SA_FilterPattern.sOrgFName","isBiz":true,"label":"范围组织全路径名","name":"sOrgFName","relation":"SA_FilterPattern.sOrgFName","size":1024,"type":"String"},"sPerson":{"define":"SA_FilterPattern.sPerson","isBiz":true,"label":"操作员","name":"sPerson","relation":"SA_FilterPattern.sPerson","size":36,"type":"String"},"sProcess":{"define":"SA_FilterPattern.sProcess","isBiz":true,"label":"过程","name":"sProcess","relation":"SA_FilterPattern.sProcess","size":1024,"type":"String"},"version":{"define":"SA_FilterPattern.version","isBiz":true,"label":"版本","name":"version","relation":"SA_FilterPattern.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{},"idColumn":"SA_FilterPattern","limit":20,"newAction":"createFilterPatternAction","offset":0,"orderBys":[{"relation":"sName","type":1}],"queryAction":"queryFilterPatternAction","saveAction":"saveFilterPatternAction","updateMode":"whereVersion","xid":"patternData"});
}}); 
return __result;});