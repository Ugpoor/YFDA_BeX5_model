define(function(require) {
	require('css!./css/operationSelector').load();

	var $ = require("jquery");
	var xuiService = require("$UI/system/components/designerCommon/js/xuiService");
	var xuiDoc = xuiService.getXuiDoc();

	var Model = function() {
		this.callParent();
	};
	/**
	 * 获取返回值，点击确定后调用的方法,必须是一个json格式的数据 .
	 */
	Model.prototype.getReturnValue = function() {
		var $input = $("input:checked"), ret = [];
		var self = this;
		$input.each(function(){
			var value = $(this).attr("operation");
			var op = self.allOperations[value];
			var args = op&&op.userArgs?op.userArgs:undefined;
			if(value)ret.push({operation: value, args:args}); // 用于同时返回多个属性值
		});
		
		return ret.length===1?JSON.stringify(ret[0]):(ret.length===0?"":JSON.stringify(ret));
	};

	Model.prototype.beforeOkAction = function(){
		var $input = $("input:checked"), ret = [];
		var self = this;
		$input.each(function(){
			var value = $(this).attr("operation");
			var op = self.allOperations[value];
			var args = op&&op.userArgs?op.userArgs:undefined;
			if(value && op && op.argsDef){
				$.each(op.argsDef,function(i,def){
					if(def.required && (!args || !args.hasOwnProperty(def.name))){
						ret.push('操作['+value+']的参数['+def.name+']必须设置\n');
					}
				});
			}
		});
		if(ret.length>0) return ret.join('');
	};
	
	Model.prototype.modelLoad = function(event) {
		var idIdx = 0,op; 
		var initData = xuiService.getPageParams();
		var inputType = !initData.multiselect?'radio':'checkbox';
		if(initData.value){
			try {
				op = eval('('+initData.value+')');
			} catch (e) {
				//设置参数不是操作或错误写法，忽略
			}
		}
		// document.body.style.background = initData.background;
		var self = this;
		//绑定参数设置
		var $operations = $(this.getElementByXid('operations')).on('click','.operatonItemArgs',function(event){
			var opName = $(event.target).attr('operation');
			var op = self.allOperations[opName];
			var args = op.userArgs;
			self.comp('OPParamDlg').open({data:{operation:op,name:opName,args:args}});
		});
		//加载操作
		xuiDoc.getAllOperations(function(result){
			self.allOperations = {};
		    var allOperations = eval("("+result.operations+")");
		    //console.log(result.operations);
		    
			var buf = [ "<div style='padding:2px;'>" ];
			for ( var i = 0; i < allOperations.length; i += 1) {
				var operationConfig = allOperations[i];
				var xid = operationConfig.xid;
				buf.push("<H3 style='margin:0;'>" + xid + "</H3>");
				buf.push("<div class='x-ops'>");
				var operationItems = operationConfig.operations;
				for ( var j = 0; j < operationItems.length; j += 1) {
					var operationItem = operationItems[j];
					var id = "__inner_input_" + (idIdx++);
					var value = xid + "." + operationItem.name;
					self.allOperations[value] = operationItem;
					var hasArgs = operationItem.argsDef && operationItem.argsDef.length>0;
					var isChecked = (!op || value!==op.operation)?false:true;
					var args = isChecked?(op.args||''):'';
					operationItem.userArgs = args;
					var text = operationItem.name + "[<i class='" + operationItem.icon + "'></i>" + operationItem.label + "]";
					buf.push("<div class='operatonItem x-op-item'><input operation='" + value + "' name='operationInput' type='"+inputType+"' id='" + id
							+ "'" + (isChecked?' checked':'') + "/><label for='" + id + "'>" + text + "</label>"+(hasArgs?("<i operation='" + value + "' class='operatonItemArgs icon-gear-b'/>"):"")+"</div>");
				}
				buf.push("</div>");
			}
			buf.push("</div>");
			$operations.append(buf.join(""));
		});
	};

	Model.prototype.OPParamDlgReceive = function(event){
		//event.data = {name:,args:}
		var op = this.allOperations[event.data.name];
		op.userArgs = event.data.args;
	};

	return Model;
});
