window.__justep.__ResourceEngine.loadCss([{url: '/v_2dbe3c1751df4912a418970be4cfdfddl_zh_CNs_desktopd_pc/system/components/pc.addon.min.css', include: '$model/system/components/justep/pagerBar/css/pagerBar,$model/system/components/justep/widgets/css/widgets,$model/system/components/justep/absoluteLayout/css/absoluteLayout,$model/system/components/justep/pagerLimitSelect/css/pagerLimitSelect,$model/system/components/justep/cellLayout/css/cellLayout,$model/system/components/justep/smartContainer/css/smartContainer'},{url: '/v_498610d1ef824e7b9295ece7620aedfcl_zh_CNs_desktopd_pc/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'},{url: '/v_f877093a231248899ccf60bc95181084l_zh_CNs_desktopd_pc/system/components/comp.min.css', include: '$model/system/components/justep/lib/css2/dataControl,$model/system/components/justep/input/css/datePickerPC,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/justep/lib/css3/round,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/contents/css/contents,$model/system/components/justep/common/css/forms,$model/system/components/justep/locker/css/locker,$model/system/components/justep/menu/css/menu,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/bar/css/bar,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/lib/css4/e-commerce,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/lib/css1/linear,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/justep/dataTables/css/dataTables'}]);window.__justep.__ResourceEngine.loadJs(['/v_369d10e7c1424a9aba025f9a9a4c17fbl_zh_CNs_desktopd_pc/system/components/biz.comp.min.js','/v_e9648c5d491b4bba9fec699a2fc22784l_zh_CNs_desktopd_pc/system/components/comp2.min.js','/v_06deb8db7929493eba7eb5d8d1f3bcecl_zh_CNs_desktopd_pc/system/biz.common.min.js','/v_7fd7fccaf85a4b8fb956f9864193ff9fl_zh_CNs_desktopd_pc/system/core.min.js','/v_bf4bf0725a3e422281c573bfef883b99l_zh_CNs_desktopd_pc/system/common.min.js','/v_f8cdd1e743544a3fb53eece9442c19cel_zh_CNs_desktopd_pc/system/components/comp.min.js','/v_78607516be844cf3962fb24df00f268fl_zh_CNs_desktopd_pc/system/components/pc.addon.min.js']);define(function(require){
require('$model/UI2/system/components/justep/pagerBar/pagerBar');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/org/orgTreePC');
require('$model/UI2/system/components/bootstrap/pagination/pagination');
require('$model/UI2/system/components/justep/smartFilter/smartFilter');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/dataTables/dataTables');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/grid/grid');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/bootstrap/row/row');
require('$model/UI2/system/components/justep/smartContainer/smartContainer');
require('$model/UI2/system/components/justep/menu/menu');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/bootstrap/dropdown/dropdown');
require('$model/UI2/system/components/justep/button/checkbox');
require('$model/UI2/system/components/justep/pagerLimitSelect/pagerLimitSelect');
require('$model/UI2/system/components/bootstrap/inputGroup/inputGroup');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/OPM/authorization/mainActivity'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='crMRJve';
	this._flag_='c602337ab5e322330883a4a731381247';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPAuthorize":{"define":"SA_OPAuthorize","name":"SA_OPAuthorize","relation":"SA_OPAuthorize","type":"String"},"roleCatalog":{"define":"SA_OPRole.sCatalog","isBiz":true,"label":"分类","name":"roleCatalog","relation":"SA_OPRole.sCatalog","type":"String"},"roleDescription":{"define":"SA_OPRole.sDescription","isBiz":true,"label":"描述","name":"roleDescription","relation":"SA_OPRole.sDescription","type":"String"},"roleName":{"define":"SA_OPRole.sName","isBiz":true,"label":"名称","name":"roleName","relation":"SA_OPRole.sName","type":"String"},"roleParentRolesNames":{"define":"SA_OPRole.sParentRolesNames","isBiz":true,"label":"父角色名称列表","name":"roleParentRolesNames","relation":"SA_OPRole.sParentRolesNames","type":"String"},"roleRoleKind":{"define":"SA_OPRole.sRoleKind","isBiz":true,"label":"角色类型","name":"roleRoleKind","relation":"SA_OPRole.sRoleKind","type":"String"},"sAuthorizeRoleID":{"define":"SA_OPAuthorize.sAuthorizeRoleID","isBiz":true,"label":"授权角色","name":"sAuthorizeRoleID","relation":"SA_OPAuthorize.sAuthorizeRoleID","type":"String"},"sCreateTime":{"define":"SA_OPAuthorize.sCreateTime","isBiz":true,"label":"创建时间","name":"sCreateTime","relation":"SA_OPAuthorize.sCreateTime","rules":{"datetime":true},"type":"DateTime"},"sCreatorFID":{"define":"SA_OPAuthorize.sCreatorFID","isBiz":true,"label":"授权人","name":"sCreatorFID","relation":"SA_OPAuthorize.sCreatorFID","type":"String"},"sCreatorFName":{"define":"SA_OPAuthorize.sCreatorFName","isBiz":true,"label":"授权人","name":"sCreatorFName","relation":"SA_OPAuthorize.sCreatorFName","type":"String"},"sDescription":{"define":"SA_OPAuthorize.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPAuthorize.sDescription","type":"String"},"sOrgFID":{"define":"SA_OPAuthorize.sOrgFID","isBiz":true,"label":"组织全路径ID","name":"sOrgFID","relation":"SA_OPAuthorize.sOrgFID","type":"String"},"sOrgFName":{"define":"SA_OPAuthorize.sOrgFName","isBiz":true,"label":"组织全路径名","name":"sOrgFName","relation":"SA_OPAuthorize.sOrgFName","type":"String"},"sOrgID":{"define":"SA_OPAuthorize.sOrgID","isBiz":true,"label":"组织","name":"sOrgID","relation":"SA_OPAuthorize.sOrgID","type":"String"},"sOrgName":{"define":"SA_OPAuthorize.sOrgName","isBiz":true,"label":"组织名","name":"sOrgName","relation":"SA_OPAuthorize.sOrgName","type":"String"},"version":{"define":"SA_OPAuthorize.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPAuthorize.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{"onBeforeRefresh":"authorizeDataBeforeRefresh"},"idColumn":"SA_OPAuthorize","limit":20,"offset":0,"queryAction":"queryOPAuthorizeAction","updateMode":"whereVersion","xid":"authorizeData"});
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","label":"id","name":"id","relation":"id","type":"String"},"showInherited":{"define":"showInherited","label":"showInherited","name":"showInherited","relation":"showInherited","type":"String"}},"directDelete":false,"events":{"onValueChanged":"tempDataValueChanged"},"idColumn":"id","initData":"[{\"showInherited\":\"true\"}]","limit":20,"xid":"tempData"});
 new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPOrg":{"define":"SA_OPOrg","name":"SA_OPOrg","relation":"SA_OPOrg","type":"String"},"sAddress":{"define":"SA_OPOrg.sAddress","isBiz":true,"label":"地址","name":"sAddress","relation":"SA_OPOrg.sAddress","type":"String"},"sCode":{"define":"SA_OPOrg.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OPOrg.sCode","type":"String"},"sDescription":{"define":"SA_OPOrg.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPOrg.sDescription","type":"String"},"sFCode":{"define":"SA_OPOrg.sFCode","isBiz":true,"label":"全路径编码","name":"sFCode","relation":"SA_OPOrg.sFCode","type":"String"},"sFID":{"define":"SA_OPOrg.sFID","isBiz":true,"label":"全路径ID","name":"sFID","relation":"SA_OPOrg.sFID","type":"String"},"sFName":{"define":"SA_OPOrg.sFName","isBiz":true,"label":"全路径名","name":"sFName","relation":"SA_OPOrg.sFName","type":"String"},"sFax":{"define":"SA_OPOrg.sFax","isBiz":true,"label":"传真","name":"sFax","relation":"SA_OPOrg.sFax","type":"String"},"sLevel":{"define":"SA_OPOrg.sLevel","isBiz":true,"label":"级别","name":"sLevel","relation":"SA_OPOrg.sLevel","rules":{"integer":true},"type":"Integer"},"sLongName":{"define":"SA_OPOrg.sLongName","isBiz":true,"label":"长名称","name":"sLongName","relation":"SA_OPOrg.sLongName","type":"String"},"sName":{"define":"SA_OPOrg.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OPOrg.sName","type":"String"},"sNodeKind":{"define":"SA_OPOrg.sNodeKind","isBiz":true,"label":"节点类型","name":"sNodeKind","relation":"SA_OPOrg.sNodeKind","type":"String"},"sOrgKindID":{"define":"SA_OPOrg.sOrgKindID","isBiz":true,"label":"组织类型","name":"sOrgKindID","relation":"SA_OPOrg.sOrgKindID","type":"String"},"sParent":{"define":"SA_OPOrg.sParent","isBiz":true,"label":"父节点","name":"sParent","relation":"SA_OPOrg.sParent","type":"String"},"sPersonID":{"define":"SA_OPOrg.sPersonID","isBiz":true,"label":"人员","name":"sPersonID","relation":"SA_OPOrg.sPersonID","type":"String"},"sPhone":{"define":"SA_OPOrg.sPhone","isBiz":true,"label":"电话","name":"sPhone","relation":"SA_OPOrg.sPhone","type":"String"},"sSequence":{"define":"SA_OPOrg.sSequence","isBiz":true,"label":"序号","name":"sSequence","relation":"SA_OPOrg.sSequence","type":"String"},"sValidState":{"define":"SA_OPOrg.sValidState","isBiz":true,"label":"可用状态","name":"sValidState","relation":"SA_OPOrg.sValidState","rules":{"integer":true},"type":"Integer"},"sWxDeptID":{"define":"SA_OPOrg.sWxDeptID","isBiz":true,"label":"微信部门ID","name":"sWxDeptID","relation":"SA_OPOrg.sWxDeptID","rules":{"integer":true},"type":"Integer"},"sZip":{"define":"SA_OPOrg.sZip","isBiz":true,"label":"邮编","name":"sZip","relation":"SA_OPOrg.sZip","type":"String"},"version":{"define":"SA_OPOrg.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPOrg.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{"onIndexChanged":"orgSearchDataIndexChanged"},"idColumn":"SA_OPOrg","limit":20,"offset":0,"queryAction":"queryOrgAction","updateMode":"whereVersion","xid":"orgSearchData"});
 new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPOrg":{"define":"SA_OPOrg","name":"SA_OPOrg","relation":"SA_OPOrg","type":"String"},"sAddress":{"define":"SA_OPOrg.sAddress","isBiz":true,"label":"地址","name":"sAddress","relation":"SA_OPOrg.sAddress","type":"String"},"sCode":{"define":"SA_OPOrg.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OPOrg.sCode","type":"String"},"sDescription":{"define":"SA_OPOrg.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPOrg.sDescription","type":"String"},"sFCode":{"define":"SA_OPOrg.sFCode","isBiz":true,"label":"全路径编码","name":"sFCode","relation":"SA_OPOrg.sFCode","type":"String"},"sFID":{"define":"SA_OPOrg.sFID","isBiz":true,"label":"全路径ID","name":"sFID","relation":"SA_OPOrg.sFID","type":"String"},"sFName":{"define":"SA_OPOrg.sFName","isBiz":true,"label":"全路径名","name":"sFName","relation":"SA_OPOrg.sFName","type":"String"},"sFax":{"define":"SA_OPOrg.sFax","isBiz":true,"label":"传真","name":"sFax","relation":"SA_OPOrg.sFax","type":"String"},"sLevel":{"define":"SA_OPOrg.sLevel","isBiz":true,"label":"级别","name":"sLevel","relation":"SA_OPOrg.sLevel","rules":{"integer":true},"type":"Integer"},"sLongName":{"define":"SA_OPOrg.sLongName","isBiz":true,"label":"长名称","name":"sLongName","relation":"SA_OPOrg.sLongName","type":"String"},"sName":{"define":"SA_OPOrg.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OPOrg.sName","type":"String"},"sNodeKind":{"define":"SA_OPOrg.sNodeKind","isBiz":true,"label":"节点类型","name":"sNodeKind","relation":"SA_OPOrg.sNodeKind","type":"String"},"sOrgKindID":{"define":"SA_OPOrg.sOrgKindID","isBiz":true,"label":"组织类型","name":"sOrgKindID","relation":"SA_OPOrg.sOrgKindID","type":"String"},"sParent":{"define":"SA_OPOrg.sParent","isBiz":true,"label":"父节点","name":"sParent","relation":"SA_OPOrg.sParent","type":"String"},"sPersonID":{"define":"SA_OPOrg.sPersonID","isBiz":true,"label":"人员","name":"sPersonID","relation":"SA_OPOrg.sPersonID","type":"String"},"sPhone":{"define":"SA_OPOrg.sPhone","isBiz":true,"label":"电话","name":"sPhone","relation":"SA_OPOrg.sPhone","type":"String"},"sSequence":{"define":"SA_OPOrg.sSequence","isBiz":true,"label":"序号","name":"sSequence","relation":"SA_OPOrg.sSequence","type":"String"},"sValidState":{"define":"SA_OPOrg.sValidState","isBiz":true,"label":"可用状态","name":"sValidState","relation":"SA_OPOrg.sValidState","rules":{"integer":true},"type":"Integer"},"sWxDeptID":{"define":"SA_OPOrg.sWxDeptID","isBiz":true,"label":"微信部门ID","name":"sWxDeptID","relation":"SA_OPOrg.sWxDeptID","rules":{"integer":true},"type":"Integer"},"sZip":{"define":"SA_OPOrg.sZip","isBiz":true,"label":"邮编","name":"sZip","relation":"SA_OPOrg.sZip","type":"String"},"version":{"define":"SA_OPOrg.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPOrg.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{"onIndexChanged":"orgTreeDataIndexChanged"},"filters":{"filter0":"SA_OPOrg.sValidState = 1"},"idColumn":"SA_OPOrg","limit":20,"offset":0,"queryAction":"queryOrgAction","treeOption":{"isDelayLoad":true,"nodeKindRelation":"sNodeKind","parentRelation":"sParent"},"updateMode":"whereVersion","xid":"orgTreeData"});
}}); 
return __result;});
