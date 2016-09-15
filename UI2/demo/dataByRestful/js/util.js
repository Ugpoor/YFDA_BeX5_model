define(function(require) {
	var $ = require("jquery");
	var Data = require("$UI/system/components/justep/data/data");

	return {
		getCount : function(url) {
			var deferred = $.Deferred();
			$.ajax({
				type : "GET",
				dataType : "json",
				url : url,
				success : function(data) {
					deferred.resolve(data);
				},
				error : function() {
					deferred.reject();
				}
			});
			return deferred.promise();
		},
		customRefresh : function(option) {
			var deferred = $.Deferred();
			$.ajax({
				type : "GET",
				dataType : "json",
				url : option.url,
				data : option.param,
				success : function(data, textStatus, jqXHR) {
					var rows = $.isFunction(option.getDataCallback) ? option.getDataCallback(data, textStatus, jqXHR) : data;
					option.data.loadData(rows, option.append);
					// 当offset=0即首页数据获取时增加获取获取总记录数，用于data计算分页逻辑
					if (0 === option.offset) {
						var count;
						if(!option.getCountCallback){
							//默认从http头X-Total-Count获取总条数
							count = jqXHR.getResponseHeader('X-Total-Count');
							if(count){
								count = parseInt(count, 10);
								if(!isNaN(count)) option.data.setTotal(count);
							}
							deferred.resolve();
						}else if($.isFunction(option.getCountCallback)){
							count = option.getCountCallback(data, textStatus, jqXHR);
							// 支持getCountCallback异步操作，返回promise
							if ($.isFunction(count.then)) {
								count.then(function(c) {
									option.data.setTotal(c);
									deferred.resolve();
								});
							} else {
								option.data.setTotal(count);
								deferred.resolve();
							}
						}
					} else
						deferred.resolve();
				},
				error : function() {
					deferred.reject();
				}
			});
			// 给出promise对象，data.refreshData()函数根据promise对象完成后续动作
			return deferred.promise();
		},
		customDelete : function(option) {
			var row = option.row;
			var deferred = $.Deferred();
			$.ajax({
				type : "DELETE",
				dataType : "json",
				url : option.url,
				success : function(data) {
					row.data.remove(row);
					deferred.resolve();
				},
				error : function() {
					deferred.reject();
				}
			});
			// 给出promise对象，data.deleteData()函数根据promise对象完成后续动作
			return deferred.promise();
		},
		customSave : function(option) {
			var row = option.row;
			var deferred = $.Deferred();
			var isNew = Data.STATE.NEW === row.data.getRowState(row);
			var url = isNew ? option.newUrl : option.updateUrl;
			var type = isNew ? "POST" : "PUT";
			$.ajax({
				type : type,
				dataType : "json",
				contentType : "application/json",
				processData : false,
				url : url,
				data : JSON.stringify(row.toJson({
					format : 'simple'
				})),// 提交当前行数据，指定格式返回简单json格式
				success : function(data) {
					deferred.resolve();
				},
				error : function() {
					deferred.reject();
				}
			});
			// 给出promise对象，data.saveData()函数根据promise对象完成后续动作
			return deferred.promise();
		}
	};
});