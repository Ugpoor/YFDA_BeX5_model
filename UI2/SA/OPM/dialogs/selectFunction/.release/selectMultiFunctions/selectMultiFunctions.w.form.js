define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/contents/content');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/windowReceiver/windowReceiver');
require('$model/UI2/system/components/justep/smartContainer/smartContainer');
require('$model/UI2/system/components/justep/grid/grid');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/contents/contents');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
require('$model/UI2/system/components/justep/panel/panel');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/SA/OPM/dialogs/selectFunction/selectMultiFunctions'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='cJbi2yy';
	this._flag_='26c68b0609176475c9965b33a6b1eb7b';
	this.callParent(contextUrl);
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"activity":{"define":"activity","name":"activity","relation":"activity","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"isFolder":{"define":"isFolder","name":"isFolder","relation":"isFolder","type":"String"},"label":{"define":"label","name":"label","relation":"label","type":"String"},"nodeKind":{"define":"nodeKind","name":"nodeKind","relation":"nodeKind","rules":{"calculate":"$row.val(\"isFolder\") ? '' : 'nkLeaf'"},"type":"String"},"parent":{"define":"parent","name":"parent","relation":"parent","type":"String"},"path":{"define":"path","name":"path","relation":"path","type":"String"},"process":{"define":"process","name":"process","relation":"process","type":"String"},"url":{"define":"url","name":"url","relation":"url","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"treeDataCustomRefresh"},"idColumn":"id","limit":20,"treeOption":{"isDelayLoad":true,"nodeKindRelation":"nodeKind","parentRelation":"parent"},"xid":"treeData"});
 new __Data__(this,{"autoLoad":false,"autoNew":false,"confirmDelete":true,"confirmRefresh":true,"defCols":{"activity":{"define":"activity","name":"activity","relation":"activity","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"isFolder":{"define":"isFolder","name":"isFolder","relation":"isFolder","type":"String"},"label":{"define":"label","name":"label","relation":"label","type":"String"},"parent":{"define":"parent","name":"parent","relation":"parent","type":"String"},"path":{"define":"path","name":"path","relation":"path","type":"String"},"process":{"define":"process","name":"process","relation":"process","type":"String"},"url":{"define":"url","name":"url","relation":"url","type":"String"}},"directDelete":false,"events":{"onCustomRefresh":"listDataCustomRefresh"},"idColumn":"id","limit":20,"xid":"listData"});
}}); 
return __result;});