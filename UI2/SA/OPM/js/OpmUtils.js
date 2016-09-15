define(function(require){
	var justep = require("$UI/system/lib/justep");
	var OrgKinds = require("$UI/system/service/org/orgKinds");
	var Grid = require("$UI/system/components/justep/grid/grid");
	
	return {
		joinCondition : function(condition1, condition2, operator) {
			if (!operator)
				operator = "and";

			if (condition1 && condition2)
				return "(" + condition1 + ") " + operator + " (" + condition2 + ")";
			else
				return (condition1 ? condition1 : "") + (condition2 ? condition2 : "");
		},

		getMultiLikeFilter : function(fields, value, split) {
			if (!split)
				split = ",";

			var fieldArray = [];
			if (typeof (fields) == "string")
				fieldArray = fields.split(split);
			else if (Object.prototype.toString.apply(fields) == "[object Array]")
				fieldArray = fields;
			else
				throw new Error("无效的fields");

			value = value.toUpperCase();
			var filter = "";
			for ( var i = 0; i < fieldArray.length; i++) {
				filter = this.joinCondition(filter, "upper(" + fieldArray[i] + ") like '%" + value + "%'", "or");
			}
			return filter;
		},

		createParentPathFilter : function(field, path) {
			if (path == null) return '1=0';
			var filter = "";
			while (path != "") {
				filter = this.joinCondition(filter, field + " = '" + path + "'", "or");
				if (path.indexOf("/") != -1) {
					path = path.substring(0, path.lastIndexOf("/"));
				} else {
					path = "";
				}
			};
			return filter;
		},

		getOrgIDFromPsmID : function(psmID) {
			return psmID.substring(psmID.indexOf("@") + 1);
		},

		getPersonIDFromPsmID : function(psmID) {
			return psmID.substring(0, psmID.indexOf("@"));
		},
		
		formatPsmID : function(personID, orgID) {
			return personID + "@" + orgID;
		},
		
		orgFIDtoIDPath : function(orgFID) {
			return orgFID.replace(/\.\w+/g, "");
		},

		getOrgImgURL : function(orgKind, disable, isMasterPsm) {
			if (Grid.isVirtualRoot(orgKind)) {
				return require.toUrl("$UI/system/images/org/root.gif");
			} else if ("psm" == orgKind && isMasterPsm) {
				return require.toUrl("$UI/system/images/org/masterPsm" + (disable ? "-disable" : "") + ".gif");
			} else {
				return OrgKinds.getImageURL(orgKind, disable);
			}
		},
		
		getRoleImgURL : function(roleKind, disable) {
			return require.toUrl("$UI/SA/OPM/images/" + roleKind + "Role" + (disable ? "-disable" : "") + ".gif");
		},
		
		getPermissionImgURL : function(kind) {
			return require.toUrl("$UI/SA/OPM/images/" +	{0 : "fun", 1 : "data"}[kind] + "Permission.gif");
		},

		getValidStateLabel : function(validState) {
			return {
				1 : "启用",
				0 : "禁用",
				"-1" : "删除"
			}[validState];
		},
		
		getRoleKindLabel : function(roleKind) {
			return {
				"fun" : "功能角色",
				"data" : "数据角色"
			}[roleKind];
		}
	};
});
