define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/pagerBar/pagerBar');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/menu/menu');
require('$model/UI2/system/components/bootstrap/pagination/pagination');
require('$model/UI2/system/components/justep/smartFilter/smartFilter');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/pagerLimitSelect/pagerLimitSelect');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/grid/grid');
require('$model/UI2/system/components/justep/popMenu/popMenu');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/bizFilter/bizFilter');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/richardtest/test1/process/queryInvo/mainActivity'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cVNrmuq';
	this._flag_='d8be57913c288f66978411bfe0e316e5';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/richardtest/test1/data","defAggCols":{},"defCols":{"RI_RY":{"define":"RI_RY","name":"RI_RY","relation":"RI_RY","type":"String"},"calcCheckBox":{"define":"EXPRESS","name":"calcCheckBox","relation":"EXPRESS","type":"String"},"fMZ":{"define":"RI_RY.fMZ","isBiz":true,"label":"名字","name":"fMZ","relation":"RI_RY.fMZ","type":"String"},"fXB":{"define":"RI_RY.fXB","isBiz":true,"label":"性别","name":"fXB","relation":"RI_RY.fXB","type":"String"},"version":{"define":"RI_RY.version","isBiz":true,"label":"版本","name":"version","relation":"RI_RY.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{"onSaveCommit":"saveCommit"},"idColumn":"RI_RY","limit":20,"newAction":"createRI_RYAction","offset":0,"queryAction":"queryRI_RYAction","saveAction":"saveRI_RYAction","updateMode":"whereVersion","xid":"mainData"});
}}); 
return __result;});