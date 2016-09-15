define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var XML = require("$UI/system/lib/base/xml");
	var docService = require("$UI/system/designer/baas/docService");// 文档服务
	var BAASModel = require("$UI/system/designer/baas/BAASModel");

	var defaultParams = {
	};

	var paramValueHasEditor = ['db','tableName','permissions','sql','countSql'];
	var Model = function() {
		this.callParent();

		this.serviceDom;
	};

	Model.prototype.getParamDB = function(){
		var rows = this.comp("dataParams").find([ 'name' ], [ 'db' ], true, false, false);
		if(rows.length>0)
			return rows[0].val("value");
	};
	
	//判断是否使用默认input编辑器
	Model.prototype.isDefaultValueEditor = function($object){
		var name = $object.val('name'),ret=true;
		$.each(paramValueHasEditor, function(i,n){
			if(name==n){
				ret = false;;
				return false;
			}
		});
		return ret;
	};
	
	// 加载xml
	Model.prototype.initXML = function() {
		/*
		 * //测试代码 var test = '<?xml version="1.0" encoding="utf-8"?><takeout>' +'<action
		 * name="queryFood" impl="com.justep.baas.action.CRUD.query"><private
		 * name="db" type="String" value="takeout" /><private name="tableName"
		 * type="String" value="takeout_food" /><private name="condition"
		 * type="String" value="" /><public name="filter" type="String" /><public
		 * name="limit" type="Integer" /><public name="offset" type="Integer" /><public
		 * name="columns" type="String" /><public name="orderBy" type="String"
		 * value="fID ASC" /></action>' +'<action name="queryUser"
		 * impl="com.justep.baas.action.CRUD.query"><private name="db"
		 * type="String" value="takeout" /><private name="tableName"
		 * type="String" value="takeout_user" /><private name="condition"
		 * type="String" value="" /><public name="filter" type="String" /><public
		 * name="limit" type="Integer" /><public name="offset" type="Integer" /><public
		 * name="columns" type="String" /><public name="orderBy" type="String"
		 * value="fID ASC" /></action>' +'</takeout>';
		 */
		this.serviceDom = XML.fromString(docService.getContent());
	};

	// 保存xml
	Model.prototype.saveXML = function() {
		this.updateServiceDom();
		var str = this.service2String();
		//console.log(str);
		docService.setContent(str);
	};

	Model.prototype.dataActionsBeforeNew = function(event) {
		var data = event.source;
		if(event.option.defaultValues && event.option.defaultValues.length>0) return;
		var i = data.getCount();
		event.option.defaultValues = [ {
			name : 'action' + i
		} ];
	};

	Model.prototype.dataParamsBeforeNew = function(event) {
		if (!event.option || !event.option.defaultValues || event.option.defaultValues.length <= 0) {
			var data = event.source;
			var i = data.getCount();
			event.option.defaultValues = [ {
				kind : 'private',
				name : 'param' + i,
				type : 'String'
			} ];
		}
	};

	Model.prototype.dataActionsValueChanged = function(event) {
		if ('impl' == event.col) {
			this.addParamsByImpl(event.value);
		}
	};

	Model.prototype.getAction = function(serviceName, name) {
		if(!serviceName || !name) return;
		var ret;
		var services = BAASModel.getServices();
		if (services) {
			if(0!=serviceName.indexOf("/")) serviceName = "/"+serviceName;
			var service = services[serviceName];
			if (service) {
				$.isArray(service.actions)
				{
					$.each(service.actions, function(i, action) {
						if (name === action.name) {
							ret = action;
							return false;
						}
					});
				}
			}
		}
		return ret;
	};

	Model.prototype.getDefaultParams = function(impl,notProcessExist) {
		var params;
		if (0 == impl.indexOf("action:")) {// ation方式
			var pos = impl.lastIndexOf("/");
			var serviceName = impl.substring(7, pos);
			var actionName = impl.substring(pos+1);
			var action = this.getAction(serviceName, actionName);
			if (action) {
				params = [];
				$.isArray(action.privateParams)
				{
					$.each(action.privateParams, function(i, param) {
						params.push({
							kind : 'private',
							name : param.name,
							type : param.type,
							value : param.value
						});
					});
				}
				$.isArray(action.publicParams)
				{
					$.each(action.publicParams, function(i, param) {
						params.push({
							kind : 'public',
							name : param.name,
							type : param.type,
							value : param.value
						});
					});
				}
			}
		} else {// 代码方式
			params = defaultParams[impl];
		}
		if(notProcessExist) return params;
		var ret = [];
		if ($.isArray(params)) {
			var data = this.comp("dataParams");
			$.each(params, function(i, v) {
				var list = data.find([ 'name' ], [ v.name ], true, false, false);
				if (!list || list.length <= 0)
					ret.push(v);
			});
		}
		return ret;
	};

	Model.prototype.addParamsByImpl = function(impl) {
		var defaultValues = this.getDefaultParams(impl);
		if (defaultValues && defaultValues.length > 0)// 没有参数不增加
			this.comp("dataParams").newData({
				defaultValues : defaultValues
			});
	};

	Model.prototype.dataActionsDataChange = function(event) {
		if ("valueChanged" != event.type) {
			this.comp("dataParams").refreshData();
		}

		// 通知修改
		var types = [ 'new', 'delete', 'valueChanged', 'clear', 'exchangeRow' ];
		if ($.inArray(event.type, types) >= 0) {
			var self = this;
			if (this._saveHandle)
				window.clearTimeout(this._saveHandle);
			this._saveHandle = window.setTimeout(function() {
				self.saveXML();
				self._saveHandle = null;
			}, 10);
		}
	};

	Model.prototype.dataActionsIndexChanged = function(event) {
		this.comp("dataParams").refreshData();
	};

	Model.prototype.service2String = function() {
		var ret = XML.toString(this.serviceDom);
		return ret;
	};

	Model.prototype.updateServiceDom = function() {
		var $dom = this.$serviceDom();
		$dom.empty();
		var data = this.comp("dataActions");
		data.each(function(param) {
			var row = param.row;
			var name = row.val('name');
			var impl = row.val('impl');
			var _private = row.val('private');
			var params = row.val('params');
			var action = justep.String.format('<action name="{0}" impl="{1}" {2}></action>', name, impl, (_private?'private="true"':''));
			$(action).appendTo($dom);//此处必须用appendTo，不能用append否在在safari浏览器上运行会出问题 zmh 20160106
			if(name){
				var $action = $dom.children("[name="+name+"]");
				params2xml($action, params);
			}
		});
	};

	var needCData = function(type, val){
		val = val+'';
		var needCDataTypes = ['Object','List'];
		if($.inArray(type,needCDataTypes)>-1) return true;
		else if("String"===type){
			return val.indexOf("&")>-1 || val.indexOf("<")>-1 || val.indexOf(">")>-1;
		}else return false;
	};
	
	var param2xml = function(param){
		return needCData(param.type, param.value)?("<![CDATA["+param.value+"]]>"):param.value;
	};
	
	var params2xml = function($action, params) {		
		if ($.isArray(params)) {
			$.each(params, function(i, param) {
				var sText = "";
				var isCdata = false;
				if(param.value && param.name){
					isCdata = needCData(param.type, param.value);
					if(!isCdata){
					  sText = param.value;
					}
				}
				$(justep.String.format('<{0} name="{1}" type="{2}">'+sText+'</{0}>', param.kind, param.name, param.type)).appendTo($action);
				if(isCdata){//创建cdata节点，此处不能通过jquery的方式来操作，否在在safari浏览器上会出问题 zmh20160106
					var doc = $action[0].ownerDocument;
					var textNode = doc.createCDATASection(param.value);
					var $p = $action.children("[name="+param.name+"]");
					$p[0].appendChild(textNode);
				}
			});
	}};

	var xml2params = function($action) {
		var ret = [];
		$action.children("private").each(function() {
			var $param = $(this);
			ret.push({
				kind : 'private',
				name : $param.attr('name'),
				type : $param.attr('type'),
				value : $param.text()
			});
		});
		$action.children("public").each(function() {
			var $param = $(this);
			ret.push({
				kind : 'public',
				name : $param.attr('name'),
				type : $param.attr('type'),
				value : $param.text()
			});
		});
		return ret;
	};

	Model.prototype.$serviceDom = function() {
		return $(this.serviceDom.documentElement);
	};

	Model.prototype.loadActionsByService = function() {
		var data = [];
		if (!this.serviceDom)
			return;
		this.$serviceDom().children("action").each(function() {
			var $action = $(this);
			data.push({
				name : $action.attr('name'),
				impl : $action.attr('impl'),
				private : "true"==$action.attr('private'),
				params : xml2params($action)
			});
		});
		if (data.length > 0)
			this.comp("dataActions").loadData(data);
	};

	Model.prototype.dataActionsCustomRefresh = function(event) {
		// 服务下的action加载
		this.loadActionsByService();
	};

	Model.prototype.dataParamsCustomRefresh = function(event) {
		// 参数加载
		var params = this.comp("dataActions").val('params')
		event.source.loadData(params || []);
	};

	Model.prototype.dataParamsDataChange = function(event) {
		// 参数变化保存到action
		var types = [ 'new', 'delete', 'valueChanged', 'clear', 'exchangeRow' ];
		if ($.inArray(event.type, types) >= 0) {
			this.comp("dataActions").setValue("params", this.dataParams2Json());
		}
	};

	Model.prototype.dataParams2Json = function() {
		var ret = [];
		this.comp("dataParams").each(function(param) {
			ret.push(param.row.toJson({
				format : 'simple'
			}));
		});
		return ret;
	};

	Model.prototype.doDeleteParams = function(event) {
		this.comp("dataParams").clear();
	};

	Model.prototype.modelModelConstruct = function(event) {
		this.initXML();
		BAASModel.loadBaasModel(BAASModel.getBaasType(this));//页面打开加载一次
	};

	Model.prototype.menu1Click = function(event) {
		this.comp("dataActions").setValue("impl", $(event.target).closest('a').data('value'));
	};

	Model.prototype.actionDialogReceive = function(event) {
		var action = event.data;
		if (action) {
			if (0 == action.service.indexOf("/"))
				action.service = action.service.substring(1);
			this.comp("dataActions").setValue("impl", "action:" + action.service + "/" + action.action);
		}
	};

	Model.prototype.rangeBtnClick = function(event){
		var db = this.getParamDB();
		if(db){
			var row = event.bindingContext.$object;
			this.comp("saveRangeDialog").open({data:{db:db,row:row}});
		}else justep.Util.hint({text:'需要先设置db参数',type:'danger',delay:8000});
	};

	Model.prototype.tableBtnClick = function(event){
		var db = this.getParamDB();
		if(db){
			var row = event.bindingContext.$object;
			this.comp("selectTableDlg").open({data:{db:db,row:row}});
		}else justep.Util.hint({text:'需要先设置db参数',type:'danger',delay:8000});
	};
	
	Model.prototype.DbBtnClick = function(event){
		var row = event.bindingContext.$object;
		this.comp("selectDbDlg").open({data:{row:row}});
	};
	
	var processActionParam = function(param,option){
		$.each(param,function(i,v){
			var newV = option[v.name];
			if(newV) v.value = newV;
		});
	};

	Model.prototype.newTableActionDlgReceive = function(event){
		var param = event.data,p;
		if(param){
			if(param.needQueryAction){
				p = this.getDefaultParams('action:common/CRUD/query',true);
				processActionParam(p,{db:param.db,tableName:param.table});
				this.comp("dataActions").newData({defaultValues:[{name:param.queryAction,impl:'action:common/CRUD/query',params:p}]});
			}
			if(param.needSaveAction){
				p = this.getDefaultParams('action:common/CRUD/save',true);
				processActionParam(p,{db:param.db,permissions:'{"'+param.table+'":""}'});
				this.comp("dataActions").newData({defaultValues:[{name:param.saveAction,impl:'action:common/CRUD/save',params:p}]});
			}
		}
	};

	return Model;
});