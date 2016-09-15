define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/bootstrap/form/form');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/controlGroup/controlGroup');
require('$model/UI2/system/components/justep/menu/menu');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/popMenu/popMenu');
require('$model/UI2/system/components/justep/grid/grid');
require('$model/UI2/system/components/justep/process/process');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/YFDA1/YFDA_lawEnforce/process/grantDrugPermission/newDrugPermission'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cmqqUJz';
	this._flag_='04db2208d2bd36435de060ca5d713774';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/YFDA1/YFDA_lawEnforce/data","defAggCols":{},"defCols":{"YF_Application":{"define":"YF_Application","name":"YF_Application","relation":"YF_Application","type":"String"},"fApplicationId":{"define":"YF_Application.fApplicationId","isBiz":true,"label":"申请表Id","name":"fApplicationId","relation":"YF_Application.fApplicationId","type":"String"},"fApplicationStatus":{"define":"YF_Application.fApplicationStatus","isBiz":true,"label":"申请状态","name":"fApplicationStatus","relation":"YF_Application.fApplicationStatus","type":"String"},"fApplicationType":{"define":"YF_Application.fApplicationType","isBiz":true,"label":"申请表类型","name":"fApplicationType","relation":"YF_Application.fApplicationType","type":"String"},"fApplyTime":{"define":"YF_Application.fApplyTime","isBiz":true,"label":"申请时间","name":"fApplyTime","relation":"YF_Application.fApplyTime","rules":{"datetime":true},"type":"DateTime"},"fUser":{"define":"YF_Application.fUser","isBiz":true,"label":"申请人用户名","name":"fUser","relation":"YF_Application.fUser","type":"String"},"version":{"define":"YF_Application.version","isBiz":true,"label":"版本","name":"version","relation":"YF_Application.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{},"idColumn":"YF_Application","limit":20,"newAction":"createYF_ApplicationAction","offset":0,"queryAction":"queryYF_ApplicationAction","saveAction":"saveYF_ApplicationAction","updateMode":"whereVersion","xid":"mainData"});
 new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/YFDA1/YFDA_lawEnforce/data","defAggCols":{},"defCols":{"YF_Acce":{"define":"YF_Acce","name":"YF_Acce","relation":"YF_Acce","type":"String"},"fAcceId":{"define":"YF_Acce.fAcceId","isBiz":true,"label":"附件Id","name":"fAcceId","relation":"YF_Acce.fAcceId","type":"String"},"fAcceLink":{"define":"YF_Acce.fAcceLink","isBiz":true,"label":"附件链接","name":"fAcceLink","relation":"YF_Acce.fAcceLink","type":"String"},"fAcceName":{"define":"YF_Acce.fAcceName","isBiz":true,"label":"附件名称","name":"fAcceName","relation":"YF_Acce.fAcceName","type":"String"},"fAcceValid":{"define":"YF_Acce.fAcceValid","isBiz":true,"label":"是否有效","name":"fAcceValid","relation":"YF_Acce.fAcceValid","rules":{"integer":true},"type":"Integer"},"fApplicationId":{"define":"YF_Acce.fApplicationId","isBiz":true,"label":"申请表Id","name":"fApplicationId","relation":"YF_Acce.fApplicationId","type":"String"},"version":{"define":"YF_Acce.version","isBiz":true,"label":"版本","name":"version","relation":"YF_Acce.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{},"idColumn":"YF_Acce","limit":20,"newAction":"createYF_AcceAction","offset":0,"queryAction":"queryYF_AcceAction","saveAction":"saveYF_AcceAction","updateMode":"whereVersion","xid":"detailData"});
}}); 
return __result;});