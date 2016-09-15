define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/pagerBar/pagerBar');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/bootstrap/pagination/pagination');
require('$model/UI2/system/components/justep/smartFilter/smartFilter');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/pagerLimitSelect/pagerLimitSelect');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/grid/grid');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/OPM/management/manageTypeSetting'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='c7rEbim';
	this._flag_='c54a62030b299ccbd24e31e43b84e761';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPManageType":{"define":"SA_OPManageType","name":"SA_OPManageType","relation":"SA_OPManageType","type":"String"},"calcIsSystemLabel":{"define":"EXPRESS","name":"calcIsSystemLabel","relation":"EXPRESS","rules":{"calculate":"$row.val(\"sIsSystem\") == 1 ? '是' : '否'"},"type":"String"},"sCode":{"define":"SA_OPManageType.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OPManageType.sCode","rules":{"readonly":"$row.val(\"sIsSystem\") == 1","required":{"message":"编码不能为空","params":{"expr":"true"}}},"type":"String"},"sIsSystem":{"define":"SA_OPManageType.sIsSystem","isBiz":true,"label":"是否系统","name":"sIsSystem","relation":"SA_OPManageType.sIsSystem","rules":{"integer":true},"type":"Integer"},"sLeaderNumber":{"define":"SA_OPManageType.sLeaderNumber","isBiz":true,"label":"上级个数","name":"sLeaderNumber","relation":"SA_OPManageType.sLeaderNumber","rules":{"integer":true},"type":"Integer"},"sManageOrgKind":{"define":"SA_OPManageType.sManageOrgKind","isBiz":true,"label":"管理组织类型","name":"sManageOrgKind","relation":"SA_OPManageType.sManageOrgKind","type":"String"},"sManageOrgKindName":{"define":"SA_OPManageType.sManageOrgKindName","isBiz":true,"label":"管理组织类型名称","name":"sManageOrgKindName","relation":"SA_OPManageType.sManageOrgKindName","type":"String"},"sName":{"define":"SA_OPManageType.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OPManageType.sName","rules":{"readonly":"$row.val(\"sIsSystem\") == 1","required":{"message":"名称不能为空","params":{"expr":"true"}}},"type":"String"},"version":{"define":"SA_OPManageType.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPManageType.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{"onSaveCommit":"saveCommit"},"idColumn":"SA_OPManageType","limit":20,"newAction":"createOPManageTypeAction","offset":0,"queryAction":"queryOPManageTypeAction","saveAction":"saveOPManageTypeAction","updateMode":"whereVersion","xid":"mainData"});
}}); 
return __result;});