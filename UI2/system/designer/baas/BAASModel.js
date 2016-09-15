define(function(require) {
	var $ = require("jquery");
	var bizService = require("$UI/system/components/designerCommon/js/bizModelService");
	var url = require.toUrl("$UI/system/designer/baas/server/getBaasModel.j");
	
	var __BAASModel = null;
	var __tables = {};

	var sqlType2DataType = function(sqlType){
		switch (sqlType) {
			case 1://Types.CHAR
			case -15://Types.NCHAR
			case 12://Types.VARCHAR
			case -9://Types.NVARCHAR
			case -1://Types.LONGVARCHAR
			case -16://Types.LONGNVARCHAR
			case 2005://Types.CLOB
			case 2011://Types.NCLOB
				return 'String';
			case -6://Types.TINYINT
			case 5://Types.SMALLINT
			case 4://Types.INTEGER
				return 'Integer';
			case -5://Types.BIGINT
				return 'Long';
			case 7://Types.REAL
			case 6://Types.FLOAT
				return 'Float';
			case 8://Types.DOUBLE
				return 'Double';
			case 3://Types.DECIMAL
			case 2://Types.NUMERIC
				return 'Decimal';
			case -7://Types.BIT
			case 16://Types.BOOLEAN
				return 'Boolean';
			case 91://Types.DATE
				return 'Date';
			case 92://Types.TIME
				return 'Time';
			case 93://Types.TIMESTAMP
				return 'DateTime';
			default:
				return 'String';
		}
	};
	
	var BAASModel = {
		getRootModel: function(model){
			if(model && $.isFunction(model.getParentModel)){
				var m = model.getParentModel();
				if(!m) return model;
				else return this.getRootModel(m);
			}else return model;				
		},
		getBaasType : function(model){
			var rootM = this.getRootModel(model);
			if(rootM && $.isFunction(rootM.getContext)){
				var ctx = rootM.getContext();
				if(ctx){
					var baasPath = ctx.getRequestParameter("baasPath");
					if(baasPath){
						var p = baasPath.lastIndexOf('/');
						if(p>=0){
							return baasPath.substr(p+1);
						}
					}
				}
			}
		},
		loadBaasModel : function(baas){
			__tables = {};
			var option = {
					async : false,
					dataType : 'json',
					type : 'GET',
					cache : false,
					url : url,
					success : function(model) {
						__BAASModel = model;
					},
					error : function(xhr, status, err) {
						throw new Error("获取BAAS模型定义失败：" + [ status, xhr.readyState, err ]);
					}
				};
			if(baas) option.data = {baas:baas};
			$.ajax(option);
		},
		
		getServices: function(){
			if(!__BAASModel) this.loadBaasModel();
			return __BAASModel.services;
		},
		
		getDBs: function(){
			if(!__BAASModel) this.loadBaasModel();
			return __BAASModel.DBs;
		},
		
		getFields: function(db, table){
			return this.getFileds(db, table);
		},
		getFileds: function(db, table){
			var fields = bizService.getTableFields(db, table);
			if($.isArray(fields)){
				$.each(fields,function(i,field){
					field['dataType'] = sqlType2DataType(field.sqlType)
				});
			}
			return fields;
		},
		
		//缓存表
		getTables: function(db){
			if(!__tables[db]){
				__tables[db] = bizService.getDBTables(db);
			}
			return __tables[db];
		}		
	};

	return BAASModel;
});