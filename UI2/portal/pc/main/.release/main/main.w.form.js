define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/widgets/widgets');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/widgets/column');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/portal/pc/main/main'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='portal';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cZNbi6f';
	this._flag_='0e249911d723eda3c39c8634c1bf1703';
	this.callParent(contextUrl);
}}); 
return __result;});