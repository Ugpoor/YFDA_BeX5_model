window.__justep.__ResourceEngine.loadCss([{url: '/v_ca645d96e3f34139af0b54c18899ab71l_zh_CNs_desktopd_pc/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'},{url: '/v_85ee177d26454464b2549053fc4ed03bl_zh_CNs_desktopd_pc/system/components/comp.min.css', include: '$model/system/components/justep/lib/css2/dataControl,$model/system/components/justep/input/css/datePickerPC,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/justep/lib/css3/round,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/contents/css/contents,$model/system/components/justep/common/css/forms,$model/system/components/justep/locker/css/locker,$model/system/components/justep/menu/css/menu,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/bar/css/bar,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/lib/css4/e-commerce,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/lib/css1/linear,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/justep/dataTables/css/dataTables'}]);window.__justep.__ResourceEngine.loadJs(['/v_c65491c3b6e445c1b2e87271ea153a1cl_zh_CNs_desktopd_pc/system/components/biz.comp.min.js','/v_9a8903cbff3a4a1ea17f658f72e43a23l_zh_CNs_desktopd_pc/system/biz.common.min.js','/v_d9a940a120d04a1491e6191aef47a8e8l_zh_CNs_desktopd_pc/system/core.min.js','/v_10965b0052424e8195679477802cea9dl_zh_CNs_desktopd_pc/system/common.min.js','/v_2d8d87b61da94bc89523b38b3429df73l_zh_CNs_desktopd_pc/system/components/comp.min.js']);define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/popOver/popOver');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/output/output');
require('$model/UI2/system/components/justep/window/window');
var __parent2=require('$model/UI2/system/lib/base/modelBase'); 
var __parent1=require('$model/UI2/system/components/justep/bizFilter/filterPattern.m'); 
var __parent0=require('$model/UI2/system/components/justep/bizFilter/filterPattern'); 
var __result = __parent2._extend(__parent1)._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cVB7Rbq';
	this._flag_='378831705da2671351a6cc849fd2052b';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmDeleteText":"要删除这个查询模板吗？","confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_FilterPattern":{"define":"SA_FilterPattern","name":"SA_FilterPattern","relation":"SA_FilterPattern","type":"String"},"isPublic":{"define":"EXPRESS","name":"isPublic","relation":"EXPRESS","rules":{"calculate":"!$row.val(\"sPerson\")"},"type":"String"},"sActivity":{"define":"SA_FilterPattern.sActivity","isBiz":true,"label":"环节","name":"sActivity","relation":"SA_FilterPattern.sActivity","size":128,"type":"String"},"sContent":{"define":"SA_FilterPattern.sContent","isBiz":true,"label":"内容","name":"sContent","relation":"SA_FilterPattern.sContent","type":"Text"},"sCreateTime":{"define":"SA_FilterPattern.sCreateTime","isBiz":true,"label":"创建时间","name":"sCreateTime","relation":"SA_FilterPattern.sCreateTime","rules":{"datetime":true},"type":"DateTime"},"sCreatorID":{"define":"SA_FilterPattern.sCreatorID","isBiz":true,"label":"提交者ID","name":"sCreatorID","relation":"SA_FilterPattern.sCreatorID","size":32,"type":"String"},"sCreatorName":{"define":"SA_FilterPattern.sCreatorName","isBiz":true,"label":"提交者","name":"sCreatorName","relation":"SA_FilterPattern.sCreatorName","size":64,"type":"String"},"sInstance":{"define":"SA_FilterPattern.sInstance","isBiz":true,"label":"数据","name":"sInstance","relation":"SA_FilterPattern.sInstance","size":128,"type":"String"},"sName":{"define":"SA_FilterPattern.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_FilterPattern.sName","rules":{"required":{"message":"请输入模板名称","params":{"expr":"js: true"}}},"size":36,"type":"String"},"sOrderNum":{"define":"SA_FilterPattern.sOrderNum","isBiz":true,"label":"顺序号","name":"sOrderNum","relation":"SA_FilterPattern.sOrderNum","rules":{"integer":true},"type":"Integer"},"sOrgFID":{"define":"SA_FilterPattern.sOrgFID","isBiz":true,"label":"范围组织全路径ID","name":"sOrgFID","relation":"SA_FilterPattern.sOrgFID","size":512,"type":"String"},"sOrgFName":{"define":"SA_FilterPattern.sOrgFName","isBiz":true,"label":"范围组织全路径名","name":"sOrgFName","relation":"SA_FilterPattern.sOrgFName","size":1024,"type":"String"},"sPerson":{"define":"SA_FilterPattern.sPerson","isBiz":true,"label":"操作员","name":"sPerson","relation":"SA_FilterPattern.sPerson","size":36,"type":"String"},"sProcess":{"define":"SA_FilterPattern.sProcess","isBiz":true,"label":"过程","name":"sProcess","relation":"SA_FilterPattern.sProcess","size":1024,"type":"String"},"version":{"define":"SA_FilterPattern.version","isBiz":true,"label":"版本","name":"version","relation":"SA_FilterPattern.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{},"idColumn":"SA_FilterPattern","limit":20,"newAction":"createFilterPatternAction","offset":0,"orderBys":[{"relation":"sName","type":1}],"queryAction":"queryFilterPatternAction","saveAction":"saveFilterPatternAction","updateMode":"whereVersion","xid":"patternData"});
}}); 
return __result;});