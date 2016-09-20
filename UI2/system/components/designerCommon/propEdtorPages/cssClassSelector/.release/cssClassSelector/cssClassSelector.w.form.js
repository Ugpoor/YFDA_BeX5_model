define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/components/designerCommon/propEdtorPages/cssClassSelector/cssClassSelector'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cEvQv6b';
	this._flag_='d0ef079723ff4dcbf9dbfd11dcaabe16';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"fBase":{"define":"fBase","label":"名称","name":"fBase","relation":"fBase","type":"String"},"fColor":{"define":"fColor","name":"fColor","relation":"fColor","type":"String"},"fOther":{"define":"fOther","name":"fOther","relation":"fOther","type":"String"},"fSize":{"define":"fSize","name":"fSize","relation":"fSize","type":"String"}},"directDelete":false,"events":{},"idColumn":"fBase","initData":"[{fBase:'btn',fColor:'btn-default',fSize:'',fOther:''}]","limit":20,"xid":"mainData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"fValue":{"define":"fValue","label":"值","name":"fValue","relation":"fValue","type":"String"}},"directDelete":false,"events":{},"idColumn":"fValue","initData":"[{fValue:'btn-default'},{fValue:'btn-primary'},{fValue:'btn-success'},{fValue:'btn-info'},{fValue:'btn-warning'},{fValue:'btn-danger'},{fValue:'btn-link'}]","limit":20,"xid":"data1"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"fValue":{"define":"fValue","label":"值","name":"fValue","relation":"fValue","type":"String"}},"directDelete":false,"events":{},"idColumn":"fValue","initData":"[{fValue:'无'}, {fValue:'btn-xs'},{fValue:'btn-sm'},{fValue:'btn-lg'}]","limit":20,"xid":"data2"});
}}); 
return __result;});