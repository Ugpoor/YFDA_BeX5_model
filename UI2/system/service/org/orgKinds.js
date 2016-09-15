/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	require("res!$UI/system/images");
	require("res!$UI/system/images/org/orgkind");
	
	var OrgKinds = function(context) {
		this.context = context;
	};
	
	OrgKinds._kinds = null;
	OrgKinds.prototype._getKinds = function() {
		if (!OrgKinds._kinds) {
        	var options = {};
        	options.contentType = biz.Request.JSON_TYPE;
        	options.dataType = biz.Request.JSON_TYPE;
        	options.directExecute = true;
        	
        	options.context = this.context;
        	options.action = "getOrgKindsAction";
        	options.callback = function(data){
        		if (data.state){
        			OrgKinds._kinds = data.response.object.value;	
        		}
        	};
        	biz.Request.sendBizRequest(options);
		}
		return OrgKinds._kinds;
	};
	
	OrgKinds.prototype.getIDs = function(){
		var kinds = this._getKinds();
		var ids = [];
		for (var i = 0; i < kinds.length; i++) {
			ids.push(kinds[i]["id"]);
		} 
		return ids;
	};
	
	OrgKinds.prototype.getRealIDs = function() {
		var kinds = this._getKinds();
		
		var ids = [];
		for (var i = 0; i < kinds.length; i++) {
			var id = kinds[i]["id"]; 
			if (!this.isVirtual(id)) {
				ids.push(id);
			}
		} 
		return ids;
	};
	
	OrgKinds.prototype._getKind = function(id) {
		var kinds = this._getKinds();
		for (var i = 0; i < kinds.length; i++) {
			if (kinds[i]["id"] == id)
				return kinds[i];
		} 
		return null;
	};
	
	OrgKinds.prototype.getLabels = function(id) {
		var kind = this._getKind(id);
		return kind != null ? kind["labels"] : null;
	}; 
	
	OrgKinds.prototype.getLabel = function(id, language) {
		language = !language ? this.context.getLanguage() : language;
		var labels = this.getLabels(id);
		var label = (labels != null ? labels[language] : null);
		return label || id;
	};
	
	OrgKinds.prototype.hasProperty = function(id, property) {
		var kind = this._getKind(id);
		return kind && kind.hasOwnProperty(property);
	};

	OrgKinds.prototype.getProperty = function(id, property) {
		var kind = this._getKind(id);
		return (kind!=null) ? kind[property] : null; 
	};

	OrgKinds.prototype.getParents = function(id) {
		var parents = this.getProperty(id, "parents");
		return (parents == null) ? [] : parents.split(",");
	};
	
	OrgKinds.prototype.getAllParents = function(ids, parents) {
		ids = ids.split(",");
		parents = parents ? parents : [];
		var self = this;
		$.each(ids, function(i, id) {
			var ps = self.getParents(id);
			$.each(ps, function(id, p) {
				if ($.inArray(p, parents) == -1) {
					parents.push(p);
					self.getAllParents(p, parents);
				}
			});
		});
		return parents;
	};

	OrgKinds.prototype.getChildren = function(parent) {
		var children = [];
		var ids = this.getIDs();
		for (var i = 0, len = ids.length; i < len; i++) {
			var id = ids[i];
			if ($.inArray(parent, this.getParents(id)) != -1) {
				children.push(id);
			}
		}
		return children;
	};

	OrgKinds.prototype.isVirtual = function(id) {
		return "true" == this.getProperty(id, "virtual");
	};

	OrgKinds.prototype.getSequence = function(id) {
		return this.getProperty(id, "sequence");
	};

	OrgKinds.prototype.isRoot = function(id) {
		return "true" == this.getProperty(id, "root");
	};

	OrgKinds.prototype.isPersonMember = function(id) {
		return OrgKinds.isPersonMember(id); 
	};

	OrgKinds.prototype.getImageURL = function(id, disable, gray) {
		return OrgKinds.getImageURL(id, disable, gray); 
	};

	OrgKinds.isPersonMember = function(id) {
		return "psm" === id; 
	};

	OrgKinds.getImageURL = function(id, disable, gray) {
		return require.toUrl("$UI/system/images/org/orgkind/" + id + (!disable ? "" : "-disable") + (!gray ? "" : "-gray") + ".gif"); 
	};

	OrgKinds.prototype.getTableData = function() {
		var ids = this.getIDs();
		var rows = [];
		for (var i = 0; i < ids.length; i++) {
			var id = ids[i];
			rows.push({
				"id" : {"value" : id},
				"label" : {"value" : this.getLabel(id)},
				"root" : {"value" : this.isRoot(id)},
				"virtual" : {"value" : this.isVirtual(id)},
				"psm" : {"value" : this.isPersonMember(id)},
				"parents" : {"value" : this.getParents(id).join(",")},
				"children" : {"value" : this.getChildren(id).join(",")},
				"sequence" : {"value" : this.getSequence(id)},
				"img" : {"value" : this.getImageURL(id)} 
			});
		} 
		return {
			"type" : "table",
			"rows" : rows
		};
	};
	
	return OrgKinds;
});