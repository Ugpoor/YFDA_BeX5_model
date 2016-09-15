define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/templates/index/configuration'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cvUNzUv';
	this._flag_='c52072bc70fbf8c9f5aec79fe266144f';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"configPage":{"define":"configPage","label":"配置页","name":"configPage","relation":"configPage","type":"String"},"file":{"define":"file","label":"模板文件","name":"file","relation":"file","type":"String"},"id":{"define":"id","label":"id","name":"id","relation":"id","type":"String"},"setting":{"define":"setting","label":"配置项","name":"setting","relation":"setting","type":"String"}},"directDelete":false,"events":{"onIndexChanged":"dataIndexChanged"},"idColumn":"id","limit":20,"xid":"data"});
}}); 
return __result;});