define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.openExpressionEditor = function(row){
		if(row){
			var value = row.val('value');
			if(value && typeof(value)==='string' && value.indexOf('js:')==0) value = value.substring(3);
			if(value===null || value===undefined) value = '';
			else if(typeof(value)!=='string') value = value.toString();
			xuiService.openEditor("jSExpressionEditor", {value : value, propValue:value, propName:"OPParam"}, function(result) {
				row.val('value', 'js:'+result.value);
			});
		}
	};

	Model.prototype.OKBtnClick = function(event){
		var comp = this.comp("data"), data = {name:this.opName};
		comp.each(function(param){
			var val = param.row.val('value'), name = param.row.val('name');
			if(val){
			  var args = data.args || {};
			  data.args = args;
			  args[name] = val;
			}
		});
		this.owner.send(data);
		this.owner.close();
	};

	Model.prototype.modelParamsReceive = function(event){
		//传入参数{data:{operation:op,args:args}}
		var params = event.params.data;
		if(params){
			this.opName = params.name;
			this.operation = params.operation;
			this.args = params.args;
		}else{
			this.operation = null;
			this.args = null;
		}
		this.load();
	};
	
	Model.prototype.load = function(){
		var comp = this.comp("data");
		if(this.operation){
			var rows = [];
			var argsDef = this.operation.argsDef;
			var args = this.args;
			if(argsDef){
				$.each(argsDef,function(i,v){
					var row = {name:v.name,displayName:v.displayName,type:v.type,defaultValue:v.defaultValue};
					var arg = args[v.name];
					if(arg){
						row.value = arg;
					}
					rows.push(row);
				});
			}
			comp.loadData(rows);
		}else comp.clear();		
	};

	Model.prototype.button1Click = function(event){
		this.openExpressionEditor(event.bindingContext.$object);
	};

	return Model;
});