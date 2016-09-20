define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/input/input');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/windowDialog/windowDialog');
require('$model/UI2/system/components/justep/data/bizData');
require('$model/UI2/system/components/justep/org/orgDialogPC');
require('$model/UI2/system/components/justep/labelEdit/labelEdit');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/select/select');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/components/justep/bizFilter/filterEditor'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cBvYrmq';
	this._flag_='06e4ad901be89036dd7513af68295e77';
	this.callParent(contextUrl);
 var __BizData__ = require("$UI/system/components/justep/data/bizData");new __BizData__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":false,"confirmRefresh":false,"dataModel":"/system/data","defAggCols":{},"defCols":{"SA_FilterPattern":{"define":"SA_FilterPattern","name":"SA_FilterPattern","relation":"SA_FilterPattern","type":"String"},"sActivity":{"define":"SA_FilterPattern.sActivity","isBiz":true,"label":"环节","name":"sActivity","relation":"SA_FilterPattern.sActivity","size":128,"type":"String"},"sContent":{"define":"SA_FilterPattern.sContent","isBiz":true,"label":"内容","name":"sContent","relation":"SA_FilterPattern.sContent","type":"Text"},"sCreateTime":{"define":"SA_FilterPattern.sCreateTime","isBiz":true,"label":"创建时间","name":"sCreateTime","relation":"SA_FilterPattern.sCreateTime","rules":{"datetime":true},"type":"DateTime"},"sCreatorID":{"define":"SA_FilterPattern.sCreatorID","isBiz":true,"label":"提交者ID","name":"sCreatorID","relation":"SA_FilterPattern.sCreatorID","size":32,"type":"String"},"sCreatorName":{"define":"SA_FilterPattern.sCreatorName","isBiz":true,"label":"提交者","name":"sCreatorName","relation":"SA_FilterPattern.sCreatorName","size":64,"type":"String"},"sInstance":{"define":"SA_FilterPattern.sInstance","isBiz":true,"label":"数据","name":"sInstance","relation":"SA_FilterPattern.sInstance","size":128,"type":"String"},"sName":{"define":"SA_FilterPattern.sName","isBiz":true,"label":"名称","name":"sName","relation":"SA_FilterPattern.sName","rules":{"required":{"message":"请输入模板名称","params":{"expr":"js: true"}}},"size":36,"type":"String"},"sOrderNum":{"define":"SA_FilterPattern.sOrderNum","isBiz":true,"label":"顺序号","name":"sOrderNum","relation":"SA_FilterPattern.sOrderNum","rules":{"integer":true},"type":"Integer"},"sOrgFID":{"define":"SA_FilterPattern.sOrgFID","isBiz":true,"label":"范围组织全路径ID","name":"sOrgFID","relation":"SA_FilterPattern.sOrgFID","size":512,"type":"String"},"sOrgFName":{"define":"SA_FilterPattern.sOrgFName","isBiz":true,"label":"范围组织全路径名","name":"sOrgFName","relation":"SA_FilterPattern.sOrgFName","size":1024,"type":"String"},"sPerson":{"define":"SA_FilterPattern.sPerson","isBiz":true,"label":"操作员","name":"sPerson","relation":"SA_FilterPattern.sPerson","size":36,"type":"String"},"sProcess":{"define":"SA_FilterPattern.sProcess","isBiz":true,"label":"过程","name":"sProcess","relation":"SA_FilterPattern.sProcess","size":1024,"type":"String"},"version":{"define":"SA_FilterPattern.version","isBiz":true,"label":"版本","name":"version","relation":"SA_FilterPattern.version","rules":{"integer":true},"type":"Integer"}},"directDelete":false,"events":{},"idColumn":"SA_FilterPattern","limit":1,"newAction":"createFilterPatternAction","offset":0,"queryAction":"queryFilterPatternAction","saveAction":"saveFilterPatternAction","updateMode":"whereVersion","xid":"patternData"});
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":false,"confirmRefresh":false,"defCols":{"col":{"define":"col","label":"列","name":"col","relation":"col","type":"String"},"dateValue":{"define":"dateValue","name":"dateValue","relation":"dateValue","rules":{"date":true},"type":"Date"},"datetimeValue":{"define":"datetimeValue","name":"datetimeValue","relation":"datetimeValue","rules":{"datetime":true},"type":"DateTime"},"expr":{"define":"expr","label":"表达式","name":"expr","relation":"expr","type":"String"},"exprKSQL":{"define":"exprKSQL","label":"表达式KSQL","name":"exprKSQL","relation":"exprKSQL","type":"String"},"floatValue":{"define":"floatValue","name":"floatValue","relation":"floatValue","rules":{"number":true},"type":"Float"},"id":{"define":"id","label":"id","name":"id","relation":"id","type":"String"},"integerValue":{"define":"integerValue","name":"integerValue","relation":"integerValue","rules":{"integer":true},"type":"Integer"},"label":{"define":"label","label":"列显示名称","name":"label","relation":"label","type":"String"},"leftBracket":{"define":"leftBracket","label":"左括号","name":"leftBracket","relation":"leftBracket","type":"Boolean"},"logic":{"define":"logic","label":"逻辑关系","name":"logic","relation":"logic","type":"String"},"operator":{"define":"operator","label":"运算符","name":"operator","relation":"operator","type":"String"},"relation":{"define":"relation","label":"关系","name":"relation","relation":"relation","type":"String"},"rightBracket":{"define":"rightBracket","label":"右括号","name":"rightBracket","relation":"rightBracket","type":"Boolean"},"stringValue":{"define":"stringValue","name":"stringValue","relation":"stringValue","type":"String"},"timeValue":{"define":"timeValue","name":"timeValue","relation":"timeValue","rules":{"time":true},"type":"Time"},"type":{"define":"type","label":"类型","name":"type","relation":"type","type":"String"},"value":{"define":"value","label":"值","name":"value","relation":"value","type":"String"}},"directDelete":false,"events":{"onValueChanged":"listDataValueChanged"},"idColumn":"id","limit":20,"xid":"listData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":false,"confirmRefresh":false,"defCols":{"col":{"define":"col","label":"列别名","name":"col","relation":"col","type":"String"},"label":{"define":"label","label":"显示名","name":"label","relation":"label","type":"String"},"relation":{"define":"relation","label":"关系名","name":"relation","relation":"relation","type":"String"},"selected":{"define":"selected","label":"selected","name":"selected","relation":"selected","rules":{"calculate":"js: $data.getCurrentRow() == $row"},"type":"Boolean"},"type":{"define":"type","label":"类型","name":"type","relation":"type","type":"String"},"typeLabel":{"define":"typeLabel","label":"类型显示","name":"typeLabel","relation":"typeLabel","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"relationDataCustomRefresh"},"idColumn":"col","initData":"[]","limit":20,"xid":"relationData"});
 var justep = require('$UI/system/lib/justep');if(!this['__justep__']) this['__justep__'] = {};if(!this['__justep__'].selectOptionsAfterRender)	this['__justep__'].selectOptionsAfterRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._addDefaultOption();	};if(!this['__justep__'].selectOptionsBeforeRender)	this['__justep__'].selectOptionsBeforeRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._optionsBeforeRender();	};
 var justep = require('$UI/system/lib/justep');if(!this['__justep__']) this['__justep__'] = {};if(!this['__justep__'].selectOptionsAfterRender)	this['__justep__'].selectOptionsAfterRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._addDefaultOption();	};if(!this['__justep__'].selectOptionsBeforeRender)	this['__justep__'].selectOptionsBeforeRender = function($element) {		var comp = justep.Component.getComponent($element);		if(comp) comp._optionsBeforeRender();	};
}}); 
return __result;});