/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require){
	var justep = require("$UI/system/lib/justep");
	return {
		orgUnitsFilterByKind: function(units, kinds){
			var result = [];
			units = units || [];
			kinds = kinds || [];
			for (var i=0; i<units.length; i++){
				var kind = this.getOrgKind(units[i]);
				if (kind && (kinds.indexOf(kind)!=-1)){
					result.push(units[i]);
				}
			}
			
			return result;
		},
		
		getOrgKind: function(orgUnit){
			if (orgUnit && orgUnit.fid && (orgUnit.fid.indexOf(".")!=-1)){
				return orgUnit.fid.substring(orgUnit.fid.lastIndexOf(".")+1);
			}
			return null;
		},
		
		orgUnitsToTree: function(orgUnits){
			orgUnits = orgUnits || [];
			var root = {"@@children": []};
			for (var i = 0; i < orgUnits.length; i++) {
				this._generateOrgUnitsTree(orgUnits[i].fid, orgUnits[i].fname, root, false);
			}
			return root["@@children"];
		},
		
		getIDByFID: function(fid){
			var s = (fid != null && fid.lastIndexOf("/") != -1) ? fid.substring(fid.lastIndexOf("/") + 1, fid.length) : fid;
			return (s == null || s.lastIndexOf(".") == -1) ? s : s.substring(0, s.lastIndexOf("."));
		},
		
		getNameByFName: function(fname){
			return (fname!=null && fname.lastIndexOf("/")!=-1) ? fname.substring(fname.lastIndexOf("/")+1) : fname;
		},
		
		orgUnitTreeToData: function(tree){
			var rows = this._orgUnitTreeToData(tree);
			return {rows: rows, userdata: {model: "/system/data", 'sys.loaded': true, 'sys.count': rows.length}};
		},
		
		_orgUnitTreeToData: function(tree){
			var rows = [];
			for (var i = 0; i < tree.length; i++) {
				var orgUnit = tree[i];
				var id = this.getIDByFID(orgUnit.fid);
				var name = this.getNameByFName(orgUnit.fname);
				var orgKind = this.getOrgKind(orgUnit);
				var parentID = this.getIDByFID(this.getParentPath(orgUnit.fid));
				var rowData = {
					"SA_OPOrg": id,
					"sName":  name,
					"sFID":  orgUnit.fid,
					"sFName": orgUnit.fname,
					"sOrgKindID": orgKind, 
					"sParent":  parentID,
					"responsible": orgUnit.responsible,
					"virtual": orgUnit.virtual
				};
				
				if (orgUnit["@@children"]) {
					rowData.rows = this._orgUnitTreeToData(orgUnit["@@children"]);
				}

				if (orgUnit.virtual){
					rowData.userdata = {'sys.loaded': true, 'sys.count': rowData.rows.length};
				}
				
				rows.push(rowData);
			}
			return rows;
		},
		
		getParentPath : function(path) {
			return (path == null || path.lastIndexOf("/") == -1) ? null : path.substring(0, path.lastIndexOf("/"));
		},
		
		_generateOrgUnitsTree: function(fid, fname, parent, virtual) {
			var parentFID = this.getParentPath(fid);
			var parentFName = this.getParentPath(fname);
			if (parentFID) {
				parent = this._generateOrgUnitsTree(parentFID, parentFName, parent, true);
			}
			var children = parent["@@children"];
			for (var i = 0; i < children.length; i++) {
				if (fid == children[i].fid) {
					if (!virtual) children[i].virtual = virtual;
					return children[i];
				}
			}
			
			var orgUnit = {
				"fid": fid,
				"fname": fname,
				"virtual": virtual,
				"@@children": []
			};
			children.push(orgUnit);
			return orgUnit;
		},
		
		stringToArray: function(str, seperator){
			var result = [];
			seperator = seperator || ",";
			if (str && (typeof(str) === "string")){
				var items = str.split(seperator);
				for (var i=0; i<items.length; i++){
					if (items[i]){
						result.push(justep.String.trim(items[i]));
					}
				}
			}
			
			return result;
		}
	};
});