window.__justep.__ResourceEngine.loadCss([{url: '/v_97d65b70610d46e086dfe95765e36df7l_zh_CNs_desktopd_pc/system/components/pc.addon.min.css', include: '$model/system/components/justep/pagerBar/css/pagerBar,$model/system/components/justep/widgets/css/widgets,$model/system/components/justep/absoluteLayout/css/absoluteLayout,$model/system/components/justep/pagerLimitSelect/css/pagerLimitSelect,$model/system/components/justep/cellLayout/css/cellLayout,$model/system/components/justep/smartContainer/css/smartContainer'},{url: '/v_57949f33e4344d2d95ba90e638f87230l_zh_CNs_desktopd_pc/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'},{url: '/v_13d541e72e034f1db8713d7b2a18eb97l_zh_CNs_desktopd_pc/system/components/comp.min.css', include: '$model/system/components/justep/lib/css2/dataControl,$model/system/components/justep/input/css/datePickerPC,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/justep/lib/css3/round,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/contents/css/contents,$model/system/components/justep/common/css/forms,$model/system/components/justep/locker/css/locker,$model/system/components/justep/menu/css/menu,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/bar/css/bar,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/lib/css4/e-commerce,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/lib/css1/linear,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/justep/dataTables/css/dataTables'}]);window.__justep.__ResourceEngine.loadJs(['/v_481fe9b8f60e4ff1bbf21af66e4b6502l_zh_CNs_desktopd_pc/system/components/comp2.min.js','/v_2a7ff01cc2a54502af3816d7674c90a4l_zh_CNs_desktopd_pc/system/components/biz.comp.min.js','/v_aaa25b881fc049bc921be3fa52540be0l_zh_CNs_desktopd_pc/system/biz.common.min.js','/v_b5bc7185d070474d8d16f6a0914dc93dl_zh_CNs_desktopd_pc/system/core.min.js','/v_d6e3d35a128c4c4da4913bf38640ee92l_zh_CNs_desktopd_pc/system/common.min.js','/v_efd8a85c7e8948fe9613598329b5aab9l_zh_CNs_desktopd_pc/system/components/comp.min.js','/v_4acb81d1ef234e1b849b396dea643a42l_zh_CNs_desktopd_pc/system/components/pc.addon.min.js']);define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/pagerBar/pagerBar');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/menu/menu');
require('$model/UI2/system/components/bootstrap/pagination/pagination');
require('$model/UI2/system/components/justep/smartFilter/smartFilter');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/pagerLimitSelect/pagerLimitSelect');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/grid/grid');
require('$model/UI2/system/components/justep/popMenu/popMenu');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/bizFilter/bizFilter');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/richardtest/test1/process/queryInvo/mainActivity'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cVNrmuq';
	this._flag_='d8be57913c288f66978411bfe0e316e5';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/richardtest/test1/data","defAggCols":{},"defCols":{"RI_RY":{"define":"RI_RY","name":"RI_RY","relation":"RI_RY","type":"String"},"calcCheckBox":{"define":"EXPRESS","name":"calcCheckBox","relation":"EXPRESS","type":"String"},"fMZ":{"define":"RI_RY.fMZ","isBiz":true,"label":"名字","name":"fMZ","relation":"RI_RY.fMZ","type":"String"},"fXB":{"define":"RI_RY.fXB","isBiz":true,"label":"性别","name":"fXB","relation":"RI_RY.fXB","type":"String"},"version":{"define":"RI_RY.version","isBiz":true,"label":"版本","name":"version","relation":"RI_RY.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{"onSaveCommit":"saveCommit"},"idColumn":"RI_RY","limit":20,"newAction":"createRI_RYAction","offset":0,"queryAction":"queryRI_RYAction","saveAction":"saveRI_RYAction","updateMode":"whereVersion","xid":"mainData"});
}}); 
return __result;});
