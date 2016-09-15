define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/output/output');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/system/templates/common/detailData'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cmQb6nq';
	this._flag_='230621c9f16a414703fc4cdda30ad439';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"canDelete":{"define":"canDelete","label":"canDelete","name":"canDelete","relation":"canDelete","type":"String"},"column":{"define":"column","label":"master-column","name":"column","relation":"column","type":"String"},"columns":{"define":"columns","label":"columns","name":"columns","relation":"columns","type":"String"},"concept":{"define":"concept","label":"concept","name":"concept","relation":"concept","rules":{"required":{"message":"概念名不能为空，","params":{"expr":"js:true"}}},"type":"String"},"creator":{"define":"creator","label":"creator","name":"creator","relation":"creator","type":"String"},"dataId":{"define":"dataId","label":"业务数据列表","name":"dataId","relation":"dataId","rules":{"readonly":"js:val('dataId')==\"detailData\"","required":{"message":"dataId不能为空，","params":{"expr":"js:true"}}},"type":"String"},"id":{"define":"id","label":"id","name":"id","relation":"id","type":"String"},"isDetail":{"define":"isDetail","label":"是否为从数据","name":"isDetail","relation":"isDetail","type":"Boolean"},"isTree":{"define":"isTree","label":"是否显示为树形","name":"isTree","relation":"isTree","type":"Boolean"},"masterData":{"define":"masterData","label":"master-data","name":"masterData","relation":"masterData","type":"String"},"nodeKindRelation":{"define":"nodeKindRelation","label":"node-kind-relation","name":"nodeKindRelation","relation":"nodeKindRelation","type":"String"},"nodeLevelRelation":{"define":"nodeLevelRelation","label":"树形展开列","name":"nodeLevelRelation","relation":"nodeLevelRelation","type":"String"},"parentRelation":{"define":"parentRelation","label":"parent-relation(*)","name":"parentRelation","relation":"parentRelation","type":"String"},"reader":{"define":"reader","label":"reader","name":"reader","relation":"reader","rules":{"required":{"message":"读取动作不能为空，","params":{"expr":"js:true"}}},"type":"String"},"rootFilter":{"define":"rootFilter","label":"root-filter","name":"rootFilter","relation":"rootFilter","type":"String"},"writer":{"define":"writer","label":"writer","name":"writer","relation":"writer","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","limit":20,"xid":"mainData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"name":{"define":"name","label":"可选择数据名称","name":"name","relation":"name","type":"String"},"xid":{"define":"xid","label":"xid","name":"xid","relation":"xid","type":"String"}},"directDelete":false,"events":{},"idColumn":"xid","limit":20,"xid":"treeConfigData"});
}}); 
return __result;});