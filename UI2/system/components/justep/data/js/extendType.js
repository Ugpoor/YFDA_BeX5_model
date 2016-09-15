/*! 
* WeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
* Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
*/ 
define(function(require) {
	var justep = require('$UI/system/lib/justep');
	var $ = require("jquery");
	
	var ExtendType = justep.Object.extend({
		// 构造函数
		constructor : function(data,col,def) {
			this.callParent();
			
			this.data = data;
			this.col = col;
			this._def = def;
			//this._param
		},
		getParam : function(name){
			if(!this._param){
				if('string'===typeof(this._def.param)) this._param = $.parseJSON(this._def.param);
				else if(this._def.param) this._param = this._def.param;
			}				
			if(this._param)
				return name?this._param[name]:this._param;
		},
		getModel : function(){
			return this.data.getModel();
		},
		getEditor : function(){
			var ret = this._def['editor'];
			if(ret) return ret;
			else{
				var def = getExtendTypeDef(this.getModel(), this._def.name);
				if(def) return def['editor'];
			}
		}
	});
	
	var n = '__ExtendTypes__';
	
	//此方法将被注入到model，所以this指的是model实例
	var _getExtendTypes = function(model){
		return this[n];
	};
	
	//def = {name,editor,class}
	ExtendType.registerExtendType = function(model,def){
		if(model instanceof justep.ModelBase){
			if(typeof(model.getExtendTypes)!=='function'){
				model.getExtendTypes = _getExtendTypes;
			}
			if(!model[n]) model[n] = {};
			model[n][def.name] = def;
		}else{
			var msg = new justep.Message(justep.Message.JUSTEP231102, def.name);
			throw justep.Error.create(msg);
		} 
	};
	
	ExtendType.unregisterExtendType = function(model,name){
		if(model[n]){
			var extendTypes = model[n];
			if(extendTypes[name]) delete extendTypes[name];
		}
	};
	
	ExtendType.getEditor = function(model,ref){
		var o = ExtendType.getExtendTypeObject(model, ref);
		if(o) return o.getEditor();
	};
	
	var getColExtendTypeDef = function(ref){
		if(ref && ref['define']){
			//define = {data,row,col,defCol}
			var refDef = ref['define'];
			return refDef.defCol?refDef.defCol.extendType:null;
		}
	};
	
	var getExtendTypeDef = function(model,col){
		return model[n][col];
	};
	
	ExtendType.getExtendTypeDef = function(model,ref){
		if(model && model[n] && ref && ref['define']){
			var dtDef = getColExtendTypeDef(ref);
			if(dtDef) return getExtendTypeDef(model,dtDef.name);
		}
	};

	var getExtendTypeClass = function(model,col){
		var def = getExtendTypeDef(model,col);
		if(def) return def['class'];
	};
	
	ExtendType.getExtendTypeClass = function(model,ref){
		var def = ExtendType.getExtendTypeDef(model,ref);
		if(def)
			return def['class'];
	};
	
	ExtendType.getExtendTypeObject = function(model,ref){
		if(model && model[n] && ref && ref['define']){
			var dtDef = getColExtendTypeDef(ref);
			if(dtDef){
				if(dtDef.object) return dtDef.object;
				var clz = getExtendTypeClass(model,dtDef.name);
				if(clz){
					var refDef = ref['define'];
					dtDef.object = new clz(refDef.data,refDef.col,dtDef);
					return dtDef.object;
				}
			} 
		}
	};
	
	ExtendType.getExtendTypeObjectByColDef = function(data, colDef){
		if(data && colDef){
			var model = data.getModel(); 
			var dtDef = colDef.extendType;
			if(model && model[n] && dtDef){
				if(dtDef.object) return dtDef.object;
				var clz = getExtendTypeClass(model,dtDef.name);
				if(clz){
					dtDef.object = new clz(data,colDef.name,dtDef);
					return dtDef.object;
				}
			} 
		}
	};

	return ExtendType;
});