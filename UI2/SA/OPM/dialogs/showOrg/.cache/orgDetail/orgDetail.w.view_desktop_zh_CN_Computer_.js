window.__justep.__ResourceEngine.loadCss([{url: '/v_fb5252f12a954db78000d42797d0380fl_zh_CNs_desktopd_pc/system/components/bootstrap.min.css', include: '$model/system/components/bootstrap/lib/css/bootstrap,$model/system/components/bootstrap/lib/css/bootstrap-theme'},{url: '/v_0b2c9b530dc94f648867335b91aa9143l_zh_CNs_desktopd_pc/system/components/comp.min.css', include: '$model/system/components/justep/lib/css2/dataControl,$model/system/components/justep/input/css/datePickerPC,$model/system/components/justep/messageDialog/css/messageDialog,$model/system/components/justep/lib/css3/round,$model/system/components/justep/input/css/datePicker,$model/system/components/justep/row/css/row,$model/system/components/justep/attachment/css/attachment,$model/system/components/justep/barcode/css/barcodeImage,$model/system/components/bootstrap/dropdown/css/dropdown,$model/system/components/justep/dataTables/css/dataTables,$model/system/components/justep/contents/css/contents,$model/system/components/justep/common/css/forms,$model/system/components/justep/locker/css/locker,$model/system/components/justep/menu/css/menu,$model/system/components/justep/scrollView/css/scrollView,$model/system/components/justep/loadingBar/loadingBar,$model/system/components/justep/dialog/css/dialog,$model/system/components/justep/bar/css/bar,$model/system/components/justep/popMenu/css/popMenu,$model/system/components/justep/lib/css/icons,$model/system/components/justep/lib/css4/e-commerce,$model/system/components/justep/toolBar/css/toolBar,$model/system/components/justep/popOver/css/popOver,$model/system/components/justep/panel/css/panel,$model/system/components/bootstrap/carousel/css/carousel,$model/system/components/justep/wing/css/wing,$model/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/system/components/justep/titleBar/css/titleBar,$model/system/components/justep/lib/css1/linear,$model/system/components/justep/numberSelect/css/numberList,$model/system/components/justep/list/css/list,$model/system/components/justep/dataTables/css/dataTables'}]);window.__justep.__ResourceEngine.loadJs(['/v_81997631954e4fc6a686c76bb968b523l_zh_CNs_desktopd_pc/system/components/comp2.min.js','/v_d89b9963446148dabfb673ff9e4aead5l_zh_CNs_desktopd_pc/system/biz.common.min.js','/v_f1e5679596de4fa99e1a829b0a812316l_zh_CNs_desktopd_pc/system/core.min.js','/v_5e05a070162c4a52b23ec01d7eb5bf80l_zh_CNs_desktopd_pc/system/common.min.js','/v_eb85725318f94514aeb24602a324eba2l_zh_CNs_desktopd_pc/system/components/comp.min.js','/v_d0a91562df0c40d09fc8e98a4e74da79l_zh_CNs_desktopd_pc/system/components/pc.addon.min.js']);define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/bootstrap/form/form');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/gridSelect/gridSelect');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/panel/panel');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/OPM/dialogs/showOrg/orgDetail'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cmeUZNf';
	this._flag_='1ff8bafe8009dd24d27e514d3e2984c9';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPOrg":{"define":"SA_OPOrg","name":"SA_OPOrg","relation":"SA_OPOrg","type":"String"},"dptName":{"define":"EXPRESS","isBiz":true,"name":"dptName","relation":"EXPRESS","type":"String"},"levelName":{"define":"SA_OrgLevel.sName","isBiz":true,"label":"名称","name":"levelName","relation":"SA_OrgLevel.sName","type":"String"},"ognName":{"define":"EXPRESS","isBiz":true,"name":"ognName","relation":"EXPRESS","type":"String"},"orgKindLabel":{"define":"EXPRESS","name":"orgKindLabel","relation":"EXPRESS","rules":{"calculate":"js:$model.orgKinds.getLabel($row.val('sOrgKindID'))"},"type":"String"},"personCode":{"define":"SA_OPPerson.sCode","isBiz":true,"label":"编码","name":"personCode","relation":"SA_OPPerson.sCode","type":"String"},"personID":{"define":"EXPRESS","isBiz":true,"name":"personID","relation":"EXPRESS","type":"Object"},"personIDCard":{"define":"SA_OPPerson.sIDCard","isBiz":true,"label":"身份证号","name":"personIDCard","relation":"SA_OPPerson.sIDCard","type":"String"},"personLoginName":{"define":"SA_OPPerson.sLoginName","isBiz":true,"label":"登录名","name":"personLoginName","relation":"SA_OPPerson.sLoginName","type":"String"},"personMainOrgID":{"define":"SA_OPPerson.sMainOrgID","isBiz":true,"label":"所属部门","name":"personMainOrgID","relation":"SA_OPPerson.sMainOrgID","type":"String"},"personName":{"define":"SA_OPPerson.sName","isBiz":true,"label":"名称","name":"personName","relation":"SA_OPPerson.sName","type":"String"},"personNumb":{"define":"SA_OPPerson.sNumb","isBiz":true,"label":"数字编号","name":"personNumb","relation":"SA_OPPerson.sNumb","rules":{"integer":true},"type":"Integer"},"personPassword":{"define":"SA_OPPerson.sPassword","isBiz":true,"label":"密码(MD5)","name":"personPassword","relation":"SA_OPPerson.sPassword","type":"String"},"personSex":{"define":"SA_OPPerson.sSex","isBiz":true,"label":"性别","name":"personSex","relation":"SA_OPPerson.sSex","type":"String"},"personValidState":{"define":"SA_OPPerson.sValidState","isBiz":true,"label":"可用状态","name":"personValidState","relation":"SA_OPPerson.sValidState","rules":{"integer":true},"type":"Integer"},"personVersion":{"define":"SA_OPPerson.version","isBiz":true,"label":"版本","name":"personVersion","relation":"SA_OPPerson.version","rules":{"integer":true},"type":"Integer"},"posName":{"define":"EXPRESS","isBiz":true,"name":"posName","relation":"EXPRESS","type":"String"},"sAddress":{"define":"SA_OPOrg.sAddress","isBiz":true,"label":"地址","name":"sAddress","relation":"SA_OPOrg.sAddress","type":"String"},"sCode":{"define":"SA_OPOrg.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OPOrg.sCode","rules":{"required":{"message":"组织编码不能为空","params":{"expr":"js:true"}}},"type":"String"},"sDescription":{"define":"SA_OPOrg.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPOrg.sDescription","type":"String"},"sFCode":{"define":"SA_OPOrg.sFCode","isBiz":true,"label":"全路径编码","name":"sFCode","relation":"SA_OPOrg.sFCode","type":"String"},"sFID":{"define":"SA_OPOrg.sFID","isBiz":true,"label":"全路径ID","name":"sFID","relation":"SA_OPOrg.sFID","type":"String"},"sFName":{"define":"SA_OPOrg.sFName","isBiz":true,"label":"全路径名","name":"sFName","relation":"SA_OPOrg.sFName","type":"String"},"sFax":{"define":"SA_OPOrg.sFax","isBiz":true,"label":"传真","name":"sFax","relation":"SA_OPOrg.sFax","type":"String"},"sLevel":{"define":"SA_OPOrg.sLevel","isBiz":true,"label":"级别","name":"sLevel","relation":"SA_OPOrg.sLevel","rules":{"integer":true},"type":"Integer"},"sLongName":{"define":"SA_OPOrg.sLongName","isBiz":true,"label":"长名称","name":"sLongName","relation":"SA_OPOrg.sLongName","type":"String"},"sName":{"define":"SA_OPOrg.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OPOrg.sName","rules":{"required":{"message":"组织名称不能为空","params":{"expr":"js:true"}}},"type":"String"},"sNodeKind":{"define":"SA_OPOrg.sNodeKind","isBiz":true,"label":"节点类型","name":"sNodeKind","relation":"SA_OPOrg.sNodeKind","type":"String"},"sOrgKindID":{"define":"SA_OPOrg.sOrgKindID","isBiz":true,"label":"组织类型","name":"sOrgKindID","relation":"SA_OPOrg.sOrgKindID","type":"String"},"sParent":{"define":"SA_OPOrg.sParent","isBiz":true,"label":"父节点","name":"sParent","relation":"SA_OPOrg.sParent","type":"String"},"sPersonID":{"define":"SA_OPOrg.sPersonID","isBiz":true,"label":"人员","name":"sPersonID","relation":"SA_OPOrg.sPersonID","type":"String"},"sPhone":{"define":"SA_OPOrg.sPhone","isBiz":true,"label":"电话","name":"sPhone","relation":"SA_OPOrg.sPhone","type":"String"},"sSequence":{"define":"SA_OPOrg.sSequence","isBiz":true,"label":"序号","name":"sSequence","relation":"SA_OPOrg.sSequence","type":"String"},"sValidState":{"define":"SA_OPOrg.sValidState","isBiz":true,"label":"可用状态","name":"sValidState","relation":"SA_OPOrg.sValidState","rules":{"integer":true},"type":"Integer"},"sWxDeptID":{"define":"SA_OPOrg.sWxDeptID","isBiz":true,"label":"微信部门ID","name":"sWxDeptID","relation":"SA_OPOrg.sWxDeptID","rules":{"integer":true},"type":"Integer"},"sZip":{"define":"SA_OPOrg.sZip","isBiz":true,"label":"邮编","name":"sZip","relation":"SA_OPOrg.sZip","type":"String"},"version":{"define":"SA_OPOrg.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPOrg.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{},"idColumn":"SA_OPOrg","limit":1,"newAction":"createOPOrgAction","offset":0,"queryAction":"queryOPOrgAction","readonly":"js:$model.openMode.get() == 'view'","saveAction":"saveOPOrgAction","updateMode":"whereVersion","xid":"orgData"});
 new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPOrg":{"define":"SA_OPOrg","name":"SA_OPOrg","relation":"SA_OPOrg","type":"String"},"dptName":{"define":"EXPRESS","isBiz":true,"name":"dptName","relation":"EXPRESS","type":"String"},"levelName":{"define":"SA_OrgLevel.sName","isBiz":true,"label":"名称","name":"levelName","relation":"SA_OrgLevel.sName","type":"String"},"ognName":{"define":"EXPRESS","isBiz":true,"name":"ognName","relation":"EXPRESS","type":"String"},"personCode":{"define":"SA_OPPerson.sCode","isBiz":true,"label":"编码","name":"personCode","relation":"SA_OPPerson.sCode","type":"String"},"personID":{"define":"EXPRESS","isBiz":true,"name":"personID","relation":"EXPRESS","type":"Object"},"personIDCard":{"define":"SA_OPPerson.sIDCard","isBiz":true,"label":"身份证号","name":"personIDCard","relation":"SA_OPPerson.sIDCard","type":"String"},"personLoginName":{"define":"SA_OPPerson.sLoginName","isBiz":true,"label":"登录名","name":"personLoginName","relation":"SA_OPPerson.sLoginName","type":"String"},"personMainOrgID":{"define":"SA_OPPerson.sMainOrgID","isBiz":true,"label":"所属部门","name":"personMainOrgID","relation":"SA_OPPerson.sMainOrgID","type":"String"},"personName":{"define":"SA_OPPerson.sName","isBiz":true,"label":"名称","name":"personName","relation":"SA_OPPerson.sName","type":"String"},"personNumb":{"define":"SA_OPPerson.sNumb","isBiz":true,"label":"数字编号","name":"personNumb","relation":"SA_OPPerson.sNumb","rules":{"integer":true},"type":"Integer"},"personPassword":{"define":"SA_OPPerson.sPassword","isBiz":true,"label":"密码(MD5)","name":"personPassword","relation":"SA_OPPerson.sPassword","type":"String"},"personSex":{"define":"SA_OPPerson.sSex","isBiz":true,"label":"性别","name":"personSex","relation":"SA_OPPerson.sSex","type":"String"},"personValidState":{"define":"SA_OPPerson.sValidState","isBiz":true,"label":"可用状态","name":"personValidState","relation":"SA_OPPerson.sValidState","rules":{"integer":true},"type":"Integer"},"personVersion":{"define":"SA_OPPerson.version","isBiz":true,"label":"版本","name":"personVersion","relation":"SA_OPPerson.version","rules":{"integer":true},"type":"Integer"},"posName":{"define":"EXPRESS","isBiz":true,"name":"posName","relation":"EXPRESS","type":"String"},"sAddress":{"define":"SA_OPOrg.sAddress","isBiz":true,"label":"地址","name":"sAddress","relation":"SA_OPOrg.sAddress","type":"String"},"sCode":{"define":"SA_OPOrg.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OPOrg.sCode","type":"String"},"sDescription":{"define":"SA_OPOrg.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPOrg.sDescription","type":"String"},"sFCode":{"define":"SA_OPOrg.sFCode","isBiz":true,"label":"全路径编码","name":"sFCode","relation":"SA_OPOrg.sFCode","type":"String"},"sFID":{"define":"SA_OPOrg.sFID","isBiz":true,"label":"全路径ID","name":"sFID","relation":"SA_OPOrg.sFID","type":"String"},"sFName":{"define":"SA_OPOrg.sFName","isBiz":true,"label":"全路径名","name":"sFName","relation":"SA_OPOrg.sFName","type":"String"},"sFax":{"define":"SA_OPOrg.sFax","isBiz":true,"label":"传真","name":"sFax","relation":"SA_OPOrg.sFax","type":"String"},"sLevel":{"define":"SA_OPOrg.sLevel","isBiz":true,"label":"级别","name":"sLevel","relation":"SA_OPOrg.sLevel","rules":{"integer":true},"type":"Integer"},"sLongName":{"define":"SA_OPOrg.sLongName","isBiz":true,"label":"长名称","name":"sLongName","relation":"SA_OPOrg.sLongName","type":"String"},"sName":{"define":"SA_OPOrg.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OPOrg.sName","type":"String"},"sNodeKind":{"define":"SA_OPOrg.sNodeKind","isBiz":true,"label":"节点类型","name":"sNodeKind","relation":"SA_OPOrg.sNodeKind","type":"String"},"sOrgKindID":{"define":"SA_OPOrg.sOrgKindID","isBiz":true,"label":"组织类型","name":"sOrgKindID","relation":"SA_OPOrg.sOrgKindID","type":"String"},"sParent":{"define":"SA_OPOrg.sParent","isBiz":true,"label":"父节点","name":"sParent","relation":"SA_OPOrg.sParent","type":"String"},"sPersonID":{"define":"SA_OPOrg.sPersonID","isBiz":true,"label":"人员","name":"sPersonID","relation":"SA_OPOrg.sPersonID","type":"String"},"sPhone":{"define":"SA_OPOrg.sPhone","isBiz":true,"label":"电话","name":"sPhone","relation":"SA_OPOrg.sPhone","type":"String"},"sSequence":{"define":"SA_OPOrg.sSequence","isBiz":true,"label":"序号","name":"sSequence","relation":"SA_OPOrg.sSequence","type":"String"},"sValidState":{"define":"SA_OPOrg.sValidState","isBiz":true,"label":"可用状态","name":"sValidState","relation":"SA_OPOrg.sValidState","rules":{"integer":true},"type":"Integer"},"sWxDeptID":{"define":"SA_OPOrg.sWxDeptID","isBiz":true,"label":"微信部门ID","name":"sWxDeptID","relation":"SA_OPOrg.sWxDeptID","rules":{"integer":true},"type":"Integer"},"sZip":{"define":"SA_OPOrg.sZip","isBiz":true,"label":"邮编","name":"sZip","relation":"SA_OPOrg.sZip","type":"String"},"version":{"define":"SA_OPOrg.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPOrg.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{},"idColumn":"SA_OPOrg","limit":1,"offset":0,"queryAction":"queryOPOrgAction","updateMode":"whereVersion","xid":"parentData"});
 new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OrgLevel":{"define":"SA_OrgLevel","name":"SA_OrgLevel","relation":"SA_OrgLevel","type":"String"},"sCode":{"define":"SA_OrgLevel.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OrgLevel.sCode","type":"String"},"sName":{"define":"SA_OrgLevel.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OrgLevel.sName","type":"String"},"version":{"define":"SA_OrgLevel.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OrgLevel.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{},"idColumn":"SA_OrgLevel","limit":-1,"offset":0,"queryAction":"queryOrgLevelAction","updateMode":"whereVersion","xid":"orgLevelData"});
}}); 
return __result;});