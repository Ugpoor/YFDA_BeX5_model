define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/bootstrap/form/form');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/bizData');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/YFDA1/YFDA_lawEnforce/process/generalAudit/detailDialog'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cruQb6b';
	this._flag_='7c69dc9d74f1803eae7a993d69b7b15b';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/YFDA1/YFDA_lawEnforce/data","defAggCols":{},"defCols":{"YF_Acce":{"define":"YF_Acce","name":"YF_Acce","relation":"YF_Acce","type":"String"},"calcCheckBox":{"define":"EXPRESS","name":"calcCheckBox","relation":"EXPRESS","type":"String"},"fAcceId":{"define":"YF_Acce.fAcceId","isBiz":true,"label":"附件Id","name":"fAcceId","relation":"YF_Acce.fAcceId","type":"String"},"fAcceLink":{"define":"YF_Acce.fAcceLink","isBiz":true,"label":"附件链接","name":"fAcceLink","relation":"YF_Acce.fAcceLink","type":"String"},"fAcceName":{"define":"YF_Acce.fAcceName","isBiz":true,"label":"附件名称","name":"fAcceName","relation":"YF_Acce.fAcceName","type":"String"},"fAcceValid":{"define":"YF_Acce.fAcceValid","isBiz":true,"label":"是否有效","name":"fAcceValid","relation":"YF_Acce.fAcceValid","rules":{"integer":true},"type":"Integer"},"fApplicationId":{"define":"YF_Acce.fApplicationId","isBiz":true,"label":"申请表Id","name":"fApplicationId","relation":"YF_Acce.fApplicationId","type":"String"}},"directDelete":true,"events":{},"idColumn":"YF_Acce","limit":20,"newAction":"createYF_AcceAction","offset":0,"queryAction":"queryYF_AcceAction","saveAction":"saveYF_AcceAction","updateMode":"whereVersion","xid":"dialogData"});
}}); 
return __result;});