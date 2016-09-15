define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/designerCommon/grid/grid');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent2=require('$model/UI2/system/lib/base/modelBase'); 
var __parent1=require('$model/UI2/system/templates/common/listView'); 
var __parent0=require('$model/UI2/system/templates/common/noTitleListView'); 
var __result = __parent2._extend(__parent1)._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cIVjIFn';
	this._flag_='0ad8972fceba7fa54184f2bddfbe87e9';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"colEditor":{"define":"colEditor","label":"列编辑器","name":"colEditor","relation":"colEditor","type":"String"},"data-type":{"define":"data-type","label":"关系类型","name":"data-type","relation":"data-type","type":"String"},"index":{"define":"index","label":"序号","name":"index","relation":"index","type":"String"},"isVisible":{"define":"isVisible","label":"是否显示","name":"isVisible","relation":"isVisible","type":"String"},"labelName":{"define":"labelName","label":"列名","name":"labelName","relation":"labelName","type":"String"},"name":{"define":"name","label":"关系名","name":"name","relation":"name","type":"String"},"xid":{"define":"xid","label":"xid","name":"xid","relation":"xid","type":"String"}},"directDelete":false,"events":{},"idColumn":"xid","limit":20,"xid":"listData"});
}}); 
return __result;});