define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/designerCommon/grid/grid');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/templates/common/processLink'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cIjiiaq';
	this._flag_='6e4d54537b7e0640d5a77dd5308708de';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"crefile":{"define":"crefile","label":"生成文件","name":"crefile","relation":"crefile","type":"String"},"identification":{"define":"identification","label":"标识","name":"identification","relation":"identification","type":"String"},"index":{"define":"index","label":"序号","name":"index","relation":"index","type":"String"},"name":{"define":"name","label":"名称","name":"name","relation":"name","type":"String"}},"directDelete":false,"events":{},"idColumn":"name","limit":20,"xid":"processData"});
}}); 
return __result;});