define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/textarea/textarea');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/button/checkbox');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/org/orgImage');
require('$model/UI2/system/components/justep/output/output');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent2=require('$model/UI2/system/lib/base/modelBase'); 
var __parent1=require('$model/UI2/system/service/process/dialog/processDialog.m'); 
var __parent0=require('$model/UI2/system/service/process/dialog/processDialog'); 
var __result = __parent2._extend(__parent1)._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='false';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cVVJVFf';
	this._flag_='48f47bc14b14c879d3e63874ea5247fd';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"message":{"define":"message","name":"message","relation":"message","type":"String"},"postscript":{"define":"postscript","name":"postscript","relation":"postscript","type":"String"},"rowid":{"define":"rowid","name":"rowid","relation":"rowid","type":"String"}},"directDelete":false,"events":{},"idColumn":"rowid","initData":"[{rowid: '0', message: '', postscript:''}]","limit":20,"xid":"controlData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"btnStatus":{"define":"btnStatus","name":"btnStatus","relation":"btnStatus","type":"String"},"isEnd":{"define":"isEnd","name":"isEnd","relation":"isEnd","rules":{"integer":true},"type":"Integer"},"label":{"define":"label","name":"label","relation":"label","type":"String"},"rowid":{"define":"rowid","name":"rowid","relation":"rowid","type":"String"},"selected":{"define":"selected","name":"selected","relation":"selected","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{},"idColumn":"rowid","initData":"","limit":20,"xid":"activityData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"rowid":{"define":"rowid","name":"rowid","relation":"rowid","type":"String"},"sExecuteMode":{"define":"sExecuteMode","name":"sExecuteMode","relation":"sExecuteMode","type":"String"},"sExecuteMode2":{"define":"sExecuteMode2","name":"sExecuteMode2","relation":"sExecuteMode2","type":"String"},"sName":{"define":"sName","name":"sName","relation":"sName","type":"String"},"sPreemptMode":{"define":"sPreemptMode","name":"sPreemptMode","relation":"sPreemptMode","type":"String"}},"directDelete":false,"events":{},"idColumn":"rowid","initData":"","limit":20,"xid":"flowToData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"btnStatus":{"define":"btnStatus","name":"btnStatus","relation":"btnStatus","type":"String"},"rowid":{"define":"rowid","name":"rowid","relation":"rowid","type":"String"},"sName":{"define":"sName","name":"sName","relation":"sName","type":"String"},"selected":{"define":"selected","name":"selected","relation":"selected","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{},"idColumn":"rowid","initData":"","limit":20,"xid":"noticeData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":false,"confirmRefresh":true,"defCols":{"owner":{"define":"owner","name":"owner","relation":"owner","type":"String"},"responsible":{"define":"responsible","name":"responsible","relation":"responsible","rules":{"integer":true},"type":"Integer"},"rowid":{"define":"rowid","name":"rowid","relation":"rowid","type":"String"},"sFID":{"define":"sFID","name":"sFID","relation":"sFID","type":"String"},"sFName":{"define":"sFName","name":"sFName","relation":"sFName","type":"String"},"sName":{"define":"sName","name":"sName","relation":"sName","type":"String"}},"directDelete":false,"events":{},"idColumn":"rowid","initData":"","limit":20,"xid":"executorData"});
}}); 
return __result;});