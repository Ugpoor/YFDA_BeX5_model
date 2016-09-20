define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/fragment/list/listTable');
require('$model/UI2/system/components/bootstrap/table/table');
require('$model/UI2/system/components/justep/output/output');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/bootstrap/inputGroup/inputGroup');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/components/designerCommon/propEdtorPages/operationSelector/setOPParam'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='c6b6Bjm';
	this._flag_='f6af53ba5db681e8329f1ffb97fd1cd4';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"defaultValue":{"define":"defaultValue","label":"默认值","name":"defaultValue","relation":"defaultValue","type":"String"},"displayName":{"define":"displayName","label":"显示名","name":"displayName","relation":"displayName","type":"String"},"name":{"define":"name","label":"参数名","name":"name","relation":"name","type":"String"},"type":{"define":"type","label":"参数类型","name":"type","relation":"type","type":"String"},"value":{"define":"value","label":"参数值","name":"value","relation":"value","type":"String"}},"directDelete":false,"events":{},"idColumn":"name","limit":20,"xid":"data"});
}}); 
return __result;});