define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/bootstrap/form/form');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/dataTables/dataTables');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/OPM/dialogs/showRole/roleDetail'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='czm2AFn';
	this._flag_='687693aafe6a66e6eaf327fe7179f9f3';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPRole":{"define":"SA_OPRole","name":"SA_OPRole","relation":"SA_OPRole","type":"String"},"roleKindLabel":{"define":"EXPRESS","name":"roleKindLabel","relation":"EXPRESS","rules":{"calculate":"js:$model.OpmUtils.getRoleKindLabel(val('sRoleKind'))","readonly":"js:true"},"type":"String"},"sCatalog":{"define":"SA_OPRole.sCatalog","isBiz":true,"label":"分类","name":"sCatalog","relation":"SA_OPRole.sCatalog","type":"String"},"sCode":{"define":"SA_OPRole.sCode","isBiz":true,"label":"编码","name":"sCode","relation":"SA_OPRole.sCode","rules":{"required":{"message":"编码不能为空","params":{"expr":"js:true"}}},"type":"String"},"sDescription":{"define":"SA_OPRole.sDescription","isBiz":true,"label":"描述","name":"sDescription","relation":"SA_OPRole.sDescription","type":"String"},"sName":{"define":"SA_OPRole.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_OPRole.sName","rules":{"required":{"message":"名称不能为空","params":{"expr":"js:true"}}},"type":"String"},"sParentRolesNames":{"define":"SA_OPRole.sParentRolesNames","isBiz":true,"label":"父角色名称列表","name":"sParentRolesNames","relation":"SA_OPRole.sParentRolesNames","type":"String"},"sRoleKind":{"define":"SA_OPRole.sRoleKind","isBiz":true,"label":"角色类型","name":"sRoleKind","relation":"SA_OPRole.sRoleKind","type":"String"},"sSequence":{"define":"SA_OPRole.sSequence","isBiz":true,"label":"序号","name":"sSequence","relation":"SA_OPRole.sSequence","rules":{"integer":true},"type":"Integer"},"sValidState":{"define":"SA_OPRole.sValidState","isBiz":true,"label":"可用状态","name":"sValidState","relation":"SA_OPRole.sValidState","rules":{"integer":true},"type":"Integer"},"version":{"define":"SA_OPRole.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPRole.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{"onSaveCreateParam":"roleDataSaveCreateParam"},"idColumn":"SA_OPRole","limit":1,"newAction":"createOPRoleAction","offset":0,"queryAction":"queryOPRoleAction","readonly":"$model.openMode.get() == 'view'","saveAction":"saveOPRoleAction","updateMode":"whereVersion","xid":"roleData"});
 new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":false,"confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPParentRole":{"define":"SA_OPParentRole","name":"SA_OPParentRole","relation":"SA_OPParentRole","type":"String"},"parentName":{"define":"SA_OPRole.sName","isBiz":true,"label":"名称","name":"parentName","relation":"parent.sName","type":"String"},"sParentRoleID":{"define":"SA_OPParentRole.sParentRoleID","isBiz":true,"label":"父角色","name":"sParentRoleID","relation":"SA_OPParentRole.sParentRoleID","type":"String"},"sRoleID":{"define":"SA_OPParentRole.sRoleID","isBiz":true,"label":"角色","name":"sRoleID","relation":"SA_OPParentRole.sRoleID","type":"String"},"version":{"define":"SA_OPParentRole.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPParentRole.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{},"idColumn":"SA_OPParentRole","limit":-1,"newAction":"createOPParentRoleAction","offset":0,"queryAction":"queryOPParentRoleAction","updateMode":"whereVersion","xid":"roleParentsData"});
}}); 
return __result;});