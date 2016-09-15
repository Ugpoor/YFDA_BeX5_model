var testModelData = {
	"modelData" : [ {
		"hasRelations" : [ {
			"dataType" : "SA_DocNode",
			"inverseOf" : "sChildrenID",
			"label" : "节点父标识",
			"localName" : "sParentID",
			"relation" : "sParentID"
		}, {
			"dataType" : "SA_DocNode",
			"inverseOf" : "sParentID",
			"label" : "子节点",
			"localName" : "sChildrenID",
			"relation" : "sChildrenID"
		}, {
			"dataType" : "String",
			"label" : "文件名称",
			"localName" : "sDocName",
			"relation" : "sDocName"
		}, {
			"dataType" : "String",
			"label" : "序号",
			"localName" : "sSequence",
			"relation" : "sSequence"
		}, {
			"dataType" : "Float",
			"label" : "文件大小",
			"localName" : "sSize",
			"relation" : "sSize"
		}, {
			"dataType" : "String",
			"label" : "任务分类",
			"localName" : "sKind",
			"relation" : "sKind"
		}, {
			"dataType" : "String",
			"label" : "文件id路径",
			"localName" : "sDocPath",
			"relation" : "sDocPath"
		}, {
			"dataType" : "String",
			"label" : "文件路径",
			"localName" : "sDocDisplayPath",
			"relation" : "sDocDisplayPath"
		}, {
			"dataType" : "String",
			"label" : "提交者FID",
			"localName" : "sCreatorFID",
			"relation" : "sCreatorFID"
		}, {
			"dataType" : "String",
			"label" : "提交者",
			"localName" : "sCreatorName",
			"relation" : "sCreatorName"
		}, {
			"dataType" : "String",
			"label" : "提交者部门",
			"localName" : "sCreatorDeptName",
			"relation" : "sCreatorDeptName"
		}, {
			"dataType" : "DateTime",
			"label" : "创建时间",
			"localName" : "sCreateTime",
			"relation" : "sCreateTime"
		}, {
			"dataType" : "String",
			"label" : "编辑人标识",
			"localName" : "sEditorFID",
			"relation" : "sEditorFID"
		}, {
			"dataType" : "String",
			"label" : "编辑人姓名",
			"localName" : "sEditorName",
			"relation" : "sEditorName"
		}, {
			"dataType" : "String",
			"label" : "编辑人部门",
			"localName" : "sEditorDeptName",
			"relation" : "sEditorDeptName"
		}, {
			"dataType" : "String",
			"label" : "最后修改人标识",
			"localName" : "sLastWriterFID",
			"relation" : "sLastWriterFID"
		}, {
			"dataType" : "String",
			"label" : "最后修改人",
			"localName" : "sLastWriterName",
			"relation" : "sLastWriterName"
		}, {
			"dataType" : "String",
			"label" : "最后修改人部门",
			"localName" : "sLastWriterDeptName",
			"relation" : "sLastWriterDeptName"
		}, {
			"dataType" : "DateTime",
			"label" : "最后修改时间",
			"localName" : "sLastWriteTime",
			"relation" : "sLastWriteTime"
		}, {
			"dataType" : "String",
			"label" : "文档服务器的文件引用标识",
			"localName" : "sFileID",
			"relation" : "sFileID"
		}, {
			"dataType" : "String",
			"label" : "描述",
			"localName" : "sDescription",
			"relation" : "sDescription"
		}, {
			"dataType" : "Integer",
			"label" : "文档当前版本标志",
			"localName" : "sDocLiveVersionID",
			"relation" : "sDocLiveVersionID"
		}, {
			"dataType" : "String",
			"label" : "文件编号",
			"localName" : "sDocSerialNumber",
			"relation" : "sDocSerialNumber"
		}, {
			"dataType" : "String",
			"label" : "关键字",
			"localName" : "sKeywords",
			"relation" : "sKeywords"
		}, {
			"dataType" : "String",
			"label" : "文件类别",
			"localName" : "sClassification",
			"relation" : "sClassification"
		}, {
			"dataType" : "DateTime",
			"label" : "结束时间",
			"localName" : "sFinishTime",
			"relation" : "sFinishTime"
		}, {
			"dataType" : "String",
			"label" : "名空间",
			"localName" : "sNameSpace",
			"relation" : "sNameSpace"
		}, {
			"dataType" : "Integer",
			"label" : "删除标示",
			"localName" : "sFlag",
			"relation" : "sFlag"
		}, {
			"dataType" : "Integer",
			"label" : "版本",
			"localName" : "version",
			"relation" : "version"
		}, {
			"dataType" : "String",
			"label" : "文档缓存文件名",
			"localName" : "sCacheName",
			"relation" : "sCacheName"
		}, {
			"dataType" : "String",
			"label" : "文档修订版缓存文件名",
			"localName" : "sRevisionCacheName",
			"relation" : "sRevisionCacheName"
		} ],
		"id" : "concept1",
		"label" : "文档",
		"name" : "SA_DocNode"
	}, {
		"hasRelations" : [ {
			"dataType" : "String",
			"label" : "文件id路径",
			"localName" : "sDocPath",
			"relation" : "sDocPath"
		}, {
			"dataType" : "String",
			"label" : "授权人标识",
			"localName" : "sAuthorizerFID",
			"relation" : "sAuthorizerFID"
		}, {
			"dataType" : "String",
			"label" : "授权人姓名",
			"localName" : "sAuthorizerName",
			"relation" : "sAuthorizerName"
		}, {
			"dataType" : "String",
			"label" : "授权人部门名称",
			"localName" : "sAuthorizerDeptName",
			"relation" : "sAuthorizerDeptName"
		}, {
			"dataType" : "String",
			"label" : "被授权人标识",
			"localName" : "sAuthorizeeFID",
			"relation" : "sAuthorizeeFID"
		}, {
			"dataType" : "String",
			"label" : "被授权人姓名",
			"localName" : "sAuthorizeeName",
			"relation" : "sAuthorizeeName"
		}, {
			"dataType" : "String",
			"label" : "被授权人部门名称",
			"localName" : "sAuthorizeeDeptName",
			"relation" : "sAuthorizeeDeptName"
		}, {
			"dataType" : "DateTime",
			"label" : "授权时间",
			"localName" : "sGrantTime",
			"relation" : "sGrantTime"
		}, {
			"dataType" : "Integer",
			"label" : "权限类型，读， 打印， 写，删除",
			"localName" : "sAccess",
			"relation" : "sAccess"
		}, {
			"dataType" : "String",
			"label" : "范围：私有 共享",
			"localName" : "sScope",
			"relation" : "sScope"
		}, {
			"dataType" : "Integer",
			"label" : "版本",
			"localName" : "version",
			"relation" : "version"
		} ],
		"id" : "concept2",
		"label" : "文档权限",
		"name" : "SA_DocAuth"
	}, {
		"hasRelations" : [ {
			"dataType" : "String",
			"label" : "业务单据编码",
			"localName" : "sOwnerID",
			"relation" : "sOwnerID"
		}, {
			"dataType" : "SA_DocNode",
			"label" : "文档节点引用标识",
			"localName" : "sDocID",
			"relation" : "sDocID"
		}, {
			"dataType" : "Integer",
			"label" : "版本",
			"localName" : "version",
			"relation" : "version"
		}, {
			"dataType" : "String",
			"label" : "环节",
			"localName" : "sActivity",
			"relation" : "sActivity"
		}, {
			"dataType" : "String",
			"label" : "过程",
			"localName" : "sProcess",
			"relation" : "sProcess"
		} ],
		"id" : "concept3",
		"label" : "文档关联",
		"name" : "SA_DocLink"
	}, {
		"hasRelations" : [ {
			"dataType" : "String",
			"label" : "根文件夹路径",
			"localName" : "sRootPath",
			"relation" : "sRootPath"
		}, {
			"dataType" : "String",
			"label" : "根文件夹名称",
			"localName" : "sRootName",
			"relation" : "sRootName"
		}, {
			"dataType" : "String",
			"label" : "过程",
			"localName" : "sProcess",
			"relation" : "sProcess"
		}, {
			"dataType" : "String",
			"label" : "环节",
			"localName" : "sActivity",
			"relation" : "sActivity"
		}, {
			"dataType" : "String",
			"label" : "组织机构",
			"localName" : "sPersonFID",
			"relation" : "sPersonFID"
		}, {
			"dataType" : "String",
			"label" : "部门名称",
			"localName" : "sDeptName",
			"relation" : "sDeptName"
		}, {
			"dataType" : "String",
			"label" : "人员名称",
			"localName" : "sPersonName",
			"relation" : "sPersonName"
		}, {
			"dataType" : "String",
			"label" : "子文件夹",
			"localName" : "sSubPath",
			"relation" : "sSubPath"
		}, {
			"dataType" : "Integer",
			"label" : "权限类型，读， 打印， 写，删除",
			"localName" : "sAccess",
			"relation" : "sAccess"
		}, {
			"dataType" : "Decimal",
			"label" : "限定大小",
			"localName" : "sLimitSize",
			"relation" : "sLimitSize"
		}, {
			"dataType" : "String",
			"label" : "是否关联子目录",
			"localName" : "sShowChildren",
			"relation" : "sShowChildren"
		}, {
			"dataType" : "Integer",
			"label" : "版本",
			"localName" : "version",
			"relation" : "version"
		}, {
			"dataType" : "Text",
			"label" : "文档关联定义",
			"localName" : "sDefineItems",
			"relation" : "sDefineItems"
		}, {
			"dataType" : "String",
			"label" : "关联名",
			"localName" : "sDisplayName",
			"relation" : "sDisplayName"
		} ],
		"id" : "concept4",
		"label" : "文档关联定义",
		"name" : "SA_DocLinkDefine"
	}, {
		"hasRelations" : [ {
			"dataType" : "String",
			"label" : "文档节点引用标识",
			"localName" : "sDocID",
			"relation" : "sDocID"
		}, {
			"dataType" : "String",
			"label" : "组织机构",
			"localName" : "sPersonFID",
			"relation" : "sPersonFID"
		}, {
			"dataType" : "String",
			"label" : "人员名称",
			"localName" : "sPersonName",
			"relation" : "sPersonName"
		}, {
			"dataType" : "String",
			"label" : "部门名称",
			"localName" : "sDeptName",
			"relation" : "sDeptName"
		}, {
			"dataType" : "DateTime",
			"label" : "访问时间",
			"localName" : "sTime",
			"relation" : "sTime"
		}, {
			"dataType" : "String",
			"label" : "访问类型：下载，修改",
			"localName" : "sAccessType",
			"relation" : "sAccessType"
		}, {
			"dataType" : "String",
			"label" : "文件名称",
			"localName" : "sDocName",
			"relation" : "sDocName"
		}, {
			"dataType" : "Integer",
			"label" : "文档版本号",
			"localName" : "sDocVersionID",
			"relation" : "sDocVersionID"
		}, {
			"dataType" : "Float",
			"label" : "文件大小",
			"localName" : "sSize",
			"relation" : "sSize"
		}, {
			"dataType" : "Integer",
			"label" : "版本",
			"localName" : "version",
			"relation" : "version"
		} ],
		"id" : "concept5",
		"label" : "文档日志",
		"name" : "SA_DocLog"
	}, {
		"hasRelations" : [ {
			"dataType" : "String",
			"label" : "编码显示名",
			"localName" : "sDisplayName",
			"relation" : "sDisplayName"
		}, {
			"dataType" : "String",
			"label" : "主机地址",
			"localName" : "sHost",
			"relation" : "sHost"
		}, {
			"dataType" : "Integer",
			"label" : "端口号",
			"localName" : "sPort",
			"relation" : "sPort"
		}, {
			"dataType" : "Integer",
			"label" : "删除标示",
			"localName" : "sFlag",
			"relation" : "sFlag"
		}, {
			"dataType" : "Integer",
			"label" : "版本",
			"localName" : "version",
			"relation" : "version"
		}, {
			"dataType" : "String",
			"label" : "访问模式",
			"localName" : "sAccessMode",
			"relation" : "sAccessMode"
		}, {
			"dataType" : "String",
			"label" : "文档服务器地址",
			"localName" : "sUrl",
			"relation" : "sUrl"
		} ],
		"id" : "concept6",
		"label" : "文档名空间",
		"name" : "SA_DocNameSpace"
	} ],
	"styleData" : {
		"SA_DocNode" : {
			"bound" : {
				"x" : 20,
				"y" : 20,
				"w" : 140,
				"h" : 100
			}
		},
		"SA_DocAuth" : {
			"bound" : {
				"x" : 220,
				"y" : 20,
				"w" : 140,
				"h" : 100
			}
		},
		"SA_DocLink" : {
			"bound" : {
				"x" : 420,
				"y" : 20,
				"w" : 140,
				"h" : 100
			}
		},
		"SA_DocLinkDefine" : {
			"bound" : {
				"x" : 20,
				"y" : 170,
				"w" : 140,
				"h" : 100
			}
		},
		"SA_DocLog" : {
			"bound" : {
				"x" : 220,
				"y" : 170,
				"w" : 140,
				"h" : 100
			}
		},
		"SA_DocNameSpace" : {
			"bound" : {
				"x" : 420,
				"y" : 170,
				"w" : 140,
				"h" : 100
			}
		}
	}
}
