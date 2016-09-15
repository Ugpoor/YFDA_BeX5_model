define(function(require) {
	var $ = require("jquery");
	//var justep = require("$UI/system/lib/justep");
	var XML = require("$UI/system/lib/base/xml");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");

	var Model = function() {
		this.callParent();
	};

	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function() {
		return this.getOrderby();
	};

	Model.prototype.getOrderby = function(){
		var ret = [],data = this.comp('dataCols');
		data.each(function(param){
			var orderBy = param.row.val('orderBy');
			if(orderBy){
				ret.push(param.row.val('name')+":"+orderBy);
			}
		});
		return ret.join(",");
	};
	
	Model.prototype.initValue = function(did,orderby) {
		var xuiDoc = xuiService.getXuiDoc();
		var xml = xuiDoc.getNodeByDId(did);
		this.xml2data(xml,orderby);
	};

	Model.prototype.xml2data = function(xmlStr,orderby){
		if(xmlStr){
			var orderbys = {};
			if(orderby){
				var ss = orderby.split(",");
				if($.isArray(ss)){
					$.each(ss,function(i,v){
						var temp = v.split(":");
						if(temp.length>1){
							orderbys[temp[0]] = temp[1]; 
						}
					});
				}
			}
			var $data = $(XML.fromString(xmlStr).documentElement), data = this.comp('dataCols');
			$data.children('column[isCalculate!="true"]').each(function(){
				var $col = $(this),name=$col.attr('name');
				data.add({
						name : name,
						dataType : $col.attr('type'),
						displayName : $col.attr('label'),
						orderBy : orderbys[name]||''
					});
			});
			data.first();
		}
	};
	
	Model.prototype.modelLoad = function(event) {
		var initData = xuiService.getPageParams();// 获取初始化数据
		// 初始化原始值
		this.initValue(initData.d_id,initData.propValue);
	};

	return Model;
});