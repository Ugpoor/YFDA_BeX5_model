define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/processChart/processChart');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/bootstrap/navs/navs');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/service/process/dialog/processChart'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='portal';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cRfaQ3m';
	this._flag_='9bc5aa16561d438bd0089706958c0eae';
	this.callParent(contextUrl);
}}); 
return __result;});