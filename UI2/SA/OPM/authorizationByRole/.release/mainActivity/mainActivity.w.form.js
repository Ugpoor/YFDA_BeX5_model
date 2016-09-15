define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/pagerBar/pagerBar');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/bootstrap/row/row');
require('$model/UI2/system/components/justep/menu/menu');
require('$model/UI2/system/components/bootstrap/pagination/pagination');
require('$model/UI2/system/components/justep/smartFilter/smartFilter');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/org/orgDialogPC');
require('$model/UI2/system/components/justep/dataTables/dataTables');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/bootstrap/dropdown/dropdown');
require('$model/UI2/system/components/justep/button/checkbox');
require('$model/UI2/system/components/justep/pagerLimitSelect/pagerLimitSelect');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/OPM/authorizationByRole/mainActivity'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cueeUzu';
	this._flag_='f35009adca4a999fcb0db14083efebc1';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPRole":{"define":"SA_OPRole","name":"SA_OPRole","relation":"SA_OPRole","type":"String"},"sCatalog":{"define":"SA_OPRole.sCatalog","isBiz":true,"label":"分类","name":"sCatalog","relation":"SA_OPRole.sCatalog","type":"String"},"sCode":{"define":"SA_OPRole.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OPRole.sCode","type":"String"},"sDescription":{"define":"SA_OPRole.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPRole.sDescription","type":"String"},"sName":{"define":"SA_OPRole.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OPRole.sName","type":"String"},"sParentRolesNames":{"define":"SA_OPRole.sParentRolesNames","isBiz":true,"label":"父角色名称列表","name":"sParentRolesNames","relation":"SA_OPRole.sParentRolesNames","type":"String"},"sRoleKind":{"define":"SA_OPRole.sRoleKind","isBiz":true,"label":"角色类型","name":"sRoleKind","relation":"SA_OPRole.sRoleKind","type":"String"},"sSequence":{"define":"SA_OPRole.sSequence","isBiz":true,"label":"序号","name":"sSequence","relation":"SA_OPRole.sSequence","rules":{"integer":true},"type":"Integer"},"sValidState":{"define":"SA_OPRole.sValidState","isBiz":true,"label":"可用状态","name":"sValidState","relation":"SA_OPRole.sValidState","rules":{"integer":true},"type":"Integer"},"version":{"define":"SA_OPRole.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPRole.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{"onIndexChanged":"roleDataIndexChanged"},"idColumn":"SA_OPRole","limit":-1,"offset":0,"queryAction":"queryOPRoleAction","updateMode":"whereVersion","xid":"roleData"});
 new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPAuthorize":{"define":"SA_OPAuthorize","name":"SA_OPAuthorize","relation":"SA_OPAuthorize","type":"String"},"orgFName":{"define":"SA_OPOrg.sFName","isBiz":true,"label":"全路径名","name":"orgFName","relation":"SA_OPOrg.sFName","type":"String"},"orgKindID":{"define":"SA_OPOrg.sOrgKindID","isBiz":true,"label":"组织类型","name":"orgKindID","relation":"SA_OPOrg.sOrgKindID","type":"String"},"orgName":{"define":"SA_OPOrg.sName","isBiz":true,"label":"名称","name":"orgName","relation":"SA_OPOrg.sName","type":"String"},"roleDescription":{"define":"SA_OPRole.sDescription","isBiz":true,"label":"描述","name":"roleDescription","relation":"SA_OPRole.sDescription","type":"String"},"roleName":{"define":"SA_OPRole.sName","isBiz":true,"label":"名称","name":"roleName","relation":"SA_OPRole.sName","type":"String"},"sAuthorizeRoleID":{"define":"SA_OPAuthorize.sAuthorizeRoleID","isBiz":true,"label":"授权角色","name":"sAuthorizeRoleID","relation":"SA_OPAuthorize.sAuthorizeRoleID","type":"String"},"sCreateTime":{"define":"SA_OPAuthorize.sCreateTime","isBiz":true,"label":"创建时间","name":"sCreateTime","relation":"SA_OPAuthorize.sCreateTime","rules":{"datetime":true},"type":"DateTime"},"sCreatorFID":{"define":"SA_OPAuthorize.sCreatorFID","isBiz":true,"label":"授权人","name":"sCreatorFID","relation":"SA_OPAuthorize.sCreatorFID","type":"String"},"sCreatorFName":{"define":"SA_OPAuthorize.sCreatorFName","isBiz":true,"label":"授权人","name":"sCreatorFName","relation":"SA_OPAuthorize.sCreatorFName","type":"String"},"sDescription":{"define":"SA_OPAuthorize.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPAuthorize.sDescription","type":"String"},"sOrgFID":{"define":"SA_OPAuthorize.sOrgFID","isBiz":true,"label":"组织全路径ID","name":"sOrgFID","relation":"SA_OPAuthorize.sOrgFID","type":"String"},"sOrgFName":{"define":"SA_OPAuthorize.sOrgFName","isBiz":true,"label":"组织全路径名","name":"sOrgFName","relation":"SA_OPAuthorize.sOrgFName","type":"String"},"sOrgID":{"define":"SA_OPAuthorize.sOrgID","isBiz":true,"label":"组织","name":"sOrgID","relation":"SA_OPAuthorize.sOrgID","type":"String"},"sOrgName":{"define":"SA_OPAuthorize.sOrgName","isBiz":true,"label":"组织名","name":"sOrgName","relation":"SA_OPAuthorize.sOrgName","type":"String"},"version":{"define":"SA_OPAuthorize.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPAuthorize.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{"onRefreshCreateParam":"authorizeDataRefreshCreateParam"},"idColumn":"SA_OPAuthorize","limit":20,"offset":0,"queryAction":"queryOPAuthorizeByRoleAction","updateMode":"whereVersion","xid":"authorizeData"});
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","label":"id","name":"id","relation":"id","type":"String"},"showInherited":{"define":"showInherited","label":"showInherited","name":"showInherited","relation":"showInherited","type":"String"}},"directDelete":false,"events":{"onValueChanged":"tempDataValueChanged"},"idColumn":"id","initData":"[{\"showInherited\":\"true\"}]","limit":20,"xid":"tempData"});
}}); 
return __result;});