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
var __parent0=require('$model/UI2/SA/OPM/organization/orgLevelSetting'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cb6zEfy';
	this._flag_='d72615d2f2131cbfc2152f85c18b77b7';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OrgLevel":{"define":"SA_OrgLevel","name":"SA_OrgLevel","relation":"SA_OrgLevel","type":"String"},"sCode":{"define":"SA_OrgLevel.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OrgLevel.sCode","rules":{"constraint":{"message":"级别编码只能是整数","params":{"expr":"!isNaN($val)"}},"required":{"message":"编码不能为空","params":{"expr":"true"}}},"type":"String"},"sName":{"define":"SA_OrgLevel.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OrgLevel.sName","rules":{"required":{"message":"名称不能为空","params":{"expr":"true"}}},"type":"String"},"version":{"define":"SA_OrgLevel.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OrgLevel.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{"onSaveCommit":"saveCommit"},"idColumn":"SA_OrgLevel","limit":20,"newAction":"createOrgLevelAction","offset":0,"queryAction":"queryOrgLevelAction","saveAction":"saveOrgLevelAction","updateMode":"whereVersion","xid":"mainData"});
}}); 
return __result;});