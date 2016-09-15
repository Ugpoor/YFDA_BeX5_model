define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/pagerBar/pagerBar');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/bootstrap/pagination/pagination');
require('$model/UI2/system/components/justep/smartFilter/smartFilter');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/toolBar/toolBar');
require('$model/UI2/system/components/justep/dataTables/dataTables');
require('$model/UI2/system/components/justep/pagerLimitSelect/pagerLimitSelect');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/OPM/agent/mainActivity'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cmyqa2u';
	this._flag_='7c8d0237d13836d62aa3365ea6ac85f9';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":true,"confirmDelete":false,"confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_OPAgent":{"define":"SA_OPAgent","name":"SA_OPAgent","relation":"SA_OPAgent","type":"String"},"agentPersonName":{"define":"SA_OPPerson.sName","isBiz":true,"label":"名称","name":"agentPersonName","relation":"SA_OPPerson.sName","type":"String"},"processLabel":{"define":"EXPRESS","isBiz":true,"name":"processLabel","relation":"EXPRESS","type":"String"},"sAgentID":{"define":"SA_OPAgent.sAgentID","isBiz":true,"label":"代理人","name":"sAgentID","relation":"SA_OPAgent.sAgentID","type":"String"},"sCanTranAgent":{"define":"SA_OPAgent.sCanTranAgent","isBiz":true,"label":"是否允许把代理工作转交给其他人","name":"sCanTranAgent","relation":"SA_OPAgent.sCanTranAgent","rules":{"integer":true},"type":"Integer"},"sCreateTime":{"define":"SA_OPAgent.sCreateTime","isBiz":true,"label":"创建时间","name":"sCreateTime","relation":"SA_OPAgent.sCreateTime","rules":{"datetime":true},"type":"DateTime"},"sCreatorID":{"define":"SA_OPAgent.sCreatorID","isBiz":true,"label":"提交者ID","name":"sCreatorID","relation":"SA_OPAgent.sCreatorID","type":"String"},"sCreatorName":{"define":"SA_OPAgent.sCreatorName","isBiz":true,"label":"提交者","name":"sCreatorName","relation":"SA_OPAgent.sCreatorName","type":"String"},"sFinishTime":{"define":"SA_OPAgent.sFinishTime","isBiz":true,"label":"结束时间","name":"sFinishTime","relation":"SA_OPAgent.sFinishTime","rules":{"datetime":true},"type":"DateTime"},"sOrgFID":{"define":"SA_OPAgent.sOrgFID","isBiz":true,"label":"委托人","name":"sOrgFID","relation":"SA_OPAgent.sOrgFID","type":"String"},"sOrgFName":{"define":"SA_OPAgent.sOrgFName","isBiz":true,"label":"委托人","name":"sOrgFName","relation":"SA_OPAgent.sOrgFName","type":"String"},"sProcess":{"define":"SA_OPAgent.sProcess","isBiz":true,"label":"过程","name":"sProcess","relation":"SA_OPAgent.sProcess","type":"Text"},"sStartTime":{"define":"SA_OPAgent.sStartTime","isBiz":true,"label":"开始时间","name":"sStartTime","relation":"SA_OPAgent.sStartTime","rules":{"datetime":true},"type":"DateTime"},"sValidState":{"define":"SA_OPAgent.sValidState","isBiz":true,"label":"可用状态","name":"sValidState","relation":"SA_OPAgent.sValidState","rules":{"integer":true},"type":"Integer"},"version":{"define":"SA_OPAgent.version","isBiz":true,"label":"版本","name":"version","relation":"SA_OPAgent.version","rules":{"integer":true},"type":"Integer"}},"directDelete":true,"events":{"onBeforeRefresh":"agentDataBeforeRefresh"},"idColumn":"SA_OPAgent","limit":20,"offset":0,"orderBys":[{"relation":"sCreateTime","type":0}],"queryAction":"queryOPAgentAction","saveAction":"saveOPAgentAction","updateMode":"whereVersion","xid":"agentData"});
}}); 
return __result;});