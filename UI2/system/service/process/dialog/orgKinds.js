/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require){
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	require("res!$UI/system/images");
	require("res!$UI/system/images/org/orgkind");
	
	return {
		PROPERTY_ID: "id",
		PROPERTY_LABELS: "labels",
		PROPERTY_PARENTS: "parents",
		PROPERTY_VIRTUAL: "virtual",
		PROPERTY_SEQUENCE: "sequence",
		PROPERTY_ROOT: "root",
		ORGKIND_PERSONMEMBER: "psm",

		
		_getKinds: function(context){
			if (!this._kinds){
	        	var options = {};
	        	options.context = context;
	        	options.action = "getOrgKindsAction";
	        	options.parameters = new biz.Request.ActionParam();
	        	options.directExecute = true;
	        	options.contentType = biz.Request.JSON_TYPE;
	        	options.dataType = biz.Request.JSON_TYPE;
	        	var self = this;
	        	options.callback = function(data){
	        		if (data.state){
	        			self._kinds = data.response.object.value;	
	        		}
	        	};
	        	biz.Request.sendBizRequest(options);
			}
			
			return this._kinds;
		},
		
		getIDs: function(context){
			var kinds = this._getKinds(context);
			var ids = [];
			for (var i = 0; i < kinds.length; i++) {
				ids.push(kinds[i][this.PROPERTY_ID]);
			} 
			return ids;
		},
		
		getRealIDs: function(context) {
			var kinds = this._getKinds(context);
			
			var ids = [];
			for (var i = 0; i < kinds.length; i++) {
				var id = kinds[i][this.PROPERTY_ID]; 
				if (!this.isVirtual(id)) {
					ids.push(id);
				}
			} 
			return ids;
		},
		
		_getKind: function(id, context) {
			var kinds = this._getKinds(context);
			for (var i = 0; i < kinds.length; i++) {
				if (kinds[i][this.PROPERTY_ID] == id)
					return kinds[i];
			} 
			return null;
		},
		
		getLabels: function(id, context) {
			var kind = this._getKind(id, context);
			return kind != null ? kind[this.PROPERTY_LABELS] : null;
		}, 
		
		getLabel: function(id, language, context) {
			language = !language ? context.getLanguage() : language;
			var labels = this.getLabels(id, context);
			var label = (labels != null ? labels[language] : null);
			return label || id;
		},
		
		hasProperty: function(id, property, context) {
			var kind = this._getKind(id, context);
			return kind && kind.hasOwnProperty(property);
		},

		getProperty: function(id, property, context) {
			var kind = this._getKind(id, context);
			return (kind!=null) ? kind[property] : null; 
		},

		getParents: function(id, context) {
			var parents = this.getProperty(id, this.PROPERTY_PARENTS, context);
			return (parents == null) ? [] : parents.split(",");
		},

		isVirtual: function(id, context) {
			return "true" == this.getProperty(id, this.PROPERTY_VIRTUAL, context);
		},

		getSequence: function(id, context) {
			return this.getProperty(id, this.PROPERTY_SEQUENCE, context);
		},

		isPersonMember: function(kind) {
			return this.ORGKIND_PERSONMEMBER === id; 
		},

		isRoot: function(id, context) {
			return "true" == this.getProperty(id, this.PROPERTY_ROOT, context);
		},

		getImageURL: function(id, disable, gray) {
			return require.toUrl("$UI/system/images/org/orgKind/" + id + (!disable ? "" : "-disable") + (!gray ? "" : "-gray") + ".gif"); 
		}
	};
});