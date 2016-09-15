/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	require("$UI/system/components/justep/common/res");
	
	var $ = require("jquery");

	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');

	var url = require.normalizeName("./treeLocate");
	var ComponentConfig = require("./treeLocate.config");
	//var BizData = require("$UI/system/components/justep/data/bizData");
	
	var _locateFilterName = "_locate_Filter_";
	
	var _joinFilter = function(filter1, filter2, operator) {
		if (!operator)
			operator = "and";

		if (filter1 && filter2)
			return "(" + filter1 + ") " + operator + " (" + filter2 + ")";
		else
			return (filter1 ? filter1 : "") + (filter2 ? filter2 : "");
	};
		
	var _getMultiLikeFilter = function(fields, value, split) {
		if (!split)	split = ",";
		var fieldArray = [];
		if (typeof (fields) == "string")
			fieldArray = fields.split(split);
		else if ($.isArray(fields))
			fieldArray = fields;
		else{
			var msg = new justep.Message(justep.Message.JUSTEP231119);//"无效的过滤列"
			throw justep.Error.create(msg);
		}

		value = value.toUpperCase();
		var filter = "";
		for ( var i = 0; i < fieldArray.length; i++) {
			filter = _joinFilter(filter, "UPPER("
					+ fieldArray[i] + ") LIKE '%" + value + "%'", "OR");
		}
		return filter;
	};
	
	var _getTreeGridIDPathByFullID = function(treeGrid, fullID) {
		var idArray = fullID.split("/");
		/** 对组织机构sFID的特殊处理,去除组织扩展名 **/
		for (var i = 0; i < idArray.length; i++)
			if(idArray[i].indexOf(".")>0) idArray[i] = idArray[i].substring(0, idArray[i].indexOf("."));
		var result = idArray.join("/");
		var id = idArray.length>0?idArray[idArray.length-1]:null;
		return {path:result,id:id};
	};
	
	var TreeLocate = justep.BindComponent.extend({
		getConfig : function() {
			return ComponentConfig;
		},
		// 构造函数
		constructor : function(options) {
			this.callParent(options);
			this.data = null;
			this.relations = null;
			this.pathRelation = null;
			this.tree = null;
			
			this._filter = null;
			this._oldFilter = "";
			this._index = 0;
			this._rows = [];
		},

		dispose : function() {
			this.callParent();
		},

		// 动态创建组件
		buildTemplate : function(config) {
			if (!config)
				config = {};
			this.set(config);
			if (!config['class'])
				config['class'] = 'input-group';
			/*
  <div class="input-group" component="$UI/system/components/justep/quickLocate/treeLocate"> 
    <input type="text" class="form-control"/>  
    <div class="input-group-btn"> 
      <a class="btn btn-default btn-only-icon"> 
        <i class="icon-android-search"/>  
      </a> 
    </div>
  </div>
  			 */
			return "<div class='"
					+ config['class'] + "' " + (config.style ? (" style='" + config.style + "' ") : "")
					+ (config.xid ? (" xid='" + config.xid + "' ") : "") + " component='" + url + "' " + " >"
				    + '<input type="text" class="form-control"/>'  
				    + '<div class="input-group-btn">' 
				    + '  <a class="btn btn-default btn-only-icon"><i class="icon-android-search"/></a>' 
				    + '</div>'
					+ "</div>";
		},
		
		doInit : function(value, bindingContext, allBindings) {
			var self = this;
			this._getButton().on('click',function(){
				self.locate();
			});
			this._getInput().on('keypress',function(event){
				if(13===event.keyCode) self.locate();
			});
		},
		setFilter : function(fields,value){
			if(fields && value) {
				this._oldFilter = this._filter;
				this._filter = _getMultiLikeFilter(fields,value);
			}
		},
		getFilter : function(){
			var data = this._getData();
			return data.getFilter(_locateFilterName);
		},
		_getInput: function(){
			return this.$domNode.children('input');
		},
		_getButton: function(){
			return this.$domNode.find('a');
		},
		_getData: function(){
			return this.getModel().comp(this.data);
		},
		_getTree: function(){
			return this.getModel().comp(this.tree);
		},
		request : function(){
			var data = this._getData();
			if(!data){
				var msg = new justep.Message(justep.Message.JUSTEP231120);//"查找数据的data[{0}]不存在"
				throw justep.Error.create(msg);
			}
			var isTree = data.defTreeOption.isTree;
			var rows;
			try{
				data.setFilter(_locateFilterName, this._filter);
				/** 取消data上的tree相关状态 **/
				data.defTreeOption.isTree = false;
				data._setTreeFilter("");
				/** 构造新的查询 **/
				data._createRefreshParam(0, -1, false, {});
				var options = {
					contentType : "application/json",
					dataType : "application/json",
					process : data.getProcess(),
					activity : data.getActivity(),
					action : data.getQueryAction(),
					directExecute : true,
					parameters : data.queryParam,
					translateParam : data.createRefreshTranslateParam(),
					context : data.getContext(),
					callback : function(evtData){
						if(evtData.state) rows = evtData.response.rows;
						evtData.ignoreError = false;
					}
				};			
				biz.Request.sendBizRequest(options);
			}finally{
				data.setFilter(_locateFilterName,"");					
				data.defTreeOption.isTree = isTree;
			}			
			
			return rows;
		},		
		locate : function(path){
			var value = this._getInput().val();
			if(!value) return;
			
			var row;
			if(!path){
				this.setFilter(this.relations,value); 
				
				if (this.hasListener('onGetCondition')) {
					var eventData = {
						source : this,
						filterData : this._getData(),
						filterRelations : this.relations,
						value : value,
						condition : this._filter
					};
					this.fireEvent('onGetCondition', eventData);
					this._filter = eventData.condition;
				}
				
				/** 数据请求 **/
				if(this._oldFilter != this._filter){
					this._rows = this.request();
				}else{
					/** 查询出多条数据后依次定位**/
					this._index = ((this._index+1) < this._rows.length )?this._index + 1 : 0 ;				
				}
				if(!$.isArray(this._rows)||this._rows.length<=0){
					justep.Util.hint(justep.Message.getMessage(justep.Message.JUSTEP231118));//"没有符合条件的数据"
					return;
				}
				row = this._rows[this._index];
				if(row) {
					var raletion = row[this.pathRelation];
					if(raletion) path = raletion.value;
				}
			}
			
			if(path){			
				var grid = this._getTree();
				var idPath;
				if(grid){
					idPath = _getTreeGridIDPathByFullID(grid, path);
					if (idPath.path && idPath.id) {
						grid.expandByIDPath(idPath.path);
						grid.setSelection(idPath.id);
					}
				}
			}
		}
	});
	
	justep.Component.register(url, TreeLocate);
	return TreeLocate;
});	
	
