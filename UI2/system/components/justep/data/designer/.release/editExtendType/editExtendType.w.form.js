define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/bootstrap/row/row');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/dataTables/dataTables');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/components/justep/data/designer/editExtendType'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cNnU3Mj';
	this._flag_='4d0d49503295a393b0a29ddba0cd9c25';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"displayName":{"define":"displayName","label":"显示名称","name":"displayName","relation":"displayName","type":"String"},"extendType":{"define":"extendType","label":"扩展类型","name":"extendType","relation":"extendType","type":"String"},"name":{"define":"name","label":"名称","name":"name","relation":"name","type":"String"},"type":{"define":"type","label":"数据类型","name":"type","relation":"type","type":"String"}},"directDelete":false,"events":{},"idColumn":"name","limit":20,"xid":"data"});
}}); 
return __result;});