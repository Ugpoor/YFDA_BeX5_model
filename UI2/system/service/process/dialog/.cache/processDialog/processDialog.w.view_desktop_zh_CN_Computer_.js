window.__justep.__ResourceEngine.loadCss([{url: '/v_8b921fbc0bce4e92b553089fb9a86be5l_zh_CNs_desktopd_pc/system/components/biz.min.css', include: '$model/system/components/justep/excel/css/excel,$model/system/components/justep/social/focus/focus,$model/system/components/justep/social/relativeOrg/relativeOrg,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/richTextarea/css/richTextarea,$model/system/components/justep/blob/css/blob'},{url: '/v_ec64723cbaa0442093175ac86c3af75al_zh_CNs_desktopd_pc/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'},{url: '/v_67d515f57300491d9d7cf6abb99595f9l_zh_CNs_desktopd_pc/system/components/comp.min.css', include: '$model/system/components/justep/lib/css2/dataControl,$model/system/components/justep/input/css/datePickerPC,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/justep/lib/css3/round,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/contents/css/contents,$model/system/components/justep/common/css/forms,$model/system/components/justep/locker/css/locker,$model/system/components/justep/menu/css/menu,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/bar/css/bar,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/lib/css4/e-commerce,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/lib/css1/linear,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/justep/dataTables/css/dataTables'}]);window.__justep.__ResourceEngine.loadJs(['/v_896eb01a85e0458a8501b495315a85b0l_zh_CNs_desktopd_pc/system/components/biz.comp.min.js','/v_da7e3a9e08204ad8ba99c267ca56fb6cl_zh_CNs_desktopd_pc/system/biz.common.min.js','/v_21e46636e46c49fe9379d4f52a531db7l_zh_CNs_desktopd_pc/system/core.min.js','/v_7d0329c23c9841258dc45d1cc1b8542fl_zh_CNs_desktopd_pc/system/common.min.js','/v_87b755bc3bc24ffb88de9b5432c1b350l_zh_CNs_desktopd_pc/system/components/comp.min.js']);define(function(require){
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
