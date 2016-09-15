define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var XML = require("$UI/system/lib/base/xml");

	var TextOut = {
		formatText : function(text) {
			return text.toString().replace(/</g, "&lt;");
		},
		clear : function(container) {
			$(container).empty();
		},
		setText : function(container, text) {
			$(container).html("<pre>" + this.formatText(text) + "</pre>");
		},
		appendText : function(container, text) {
			$(container).append("<pre>" + this.formatText(text) + "</pre>");
		}
	};

	var Model = function() {
		this.callParent();
	};

	var code, result;
	Model.prototype.modelLoad = function(event) {
		code = this.getElementByXid("code");
		result = this.getElementByXid("result");
	};

	Model.prototype.simpleParamBtnClick = function(event) {
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		var inputData = this.comp("inputData");
		// 构造参数
		var params = new biz.Request.ActionParam();
		params.setString("param_string", inputData.getValue("param_string"));
		params.setInteger("param_integer", inputData.getValue("param_integer"));
		params.setLong("param_long", inputData.getValue("param_long"));
		params.setDouble("param_double", inputData.getValue("param_double"));
		params.setFloat("param_float", inputData.getValue("param_float"));
		params.setDateTime("param_datetime", inputData.getValue("param_datetime"));
		params.setDate("param_date", inputData.getValue("param_date"));
		params.setTime("param_time", inputData.getValue("param_time"));
		params.setBoolean("param_boolean", inputData.getValue("param_boolean"));
		params.setDecimal("param_decimal", inputData.getValue("param_decimal"));
		// 调用动作
		biz.Request.sendBizRequest({
//			"directExecute" : false,
//			"process" : this.getContext().getCurrentProcess(),
//			"activity" : this.getContext().getCurrentActivity(),
//			"executor" : this.getContext().getExecutor(),
//			"executeContext" : this.getContext().getExecuteContext(),
//			"contentType": "application/json",
//			"dataType": "application/json",
			"context" : this.getContext(),
			"action" : "demoActionParams",
			"parameters" : params,
			"callback" : function(data) {
				// data.ignoreError 是否忽略默认的异常处理，默认值true
				data.ignoreError = false;
				// data.state 请求返回状态，标识请求是否执行成功
				if (data.state) {
					justep.Util.hint("传入简单参数调用成功");
					// 输出返回结果
					TextOut.setText(result, data.response);
				}
			}
		});
	};

	Model.prototype.listParamBtnClick = function(event) {
		// 输code
		TextOut.setText(code, arguments.callee.toString());

		var inputData = this.comp("inputData");
		// 构造参数
		var params = new biz.Request.ActionParam();
		// List参数
		var listParam = new biz.Request.ListParam();
		listParam.add(inputData.getValue("param_string"));
		listParam.add(inputData.getValue("param_integer"));
		listParam.add(inputData.getValue("param_datetime"));
		params.setList("param_list", listParam);
		// 调用动作
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoActionParams",
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("传入List参数调用成功");
					// 输出返回结果
					TextOut.setText(result, data.response);
				}
			}
		});
	};

	Model.prototype.mapParamBtnClick = function(event) {
		// 输code
		TextOut.setText(code, arguments.callee.toString());

		var inputData = this.comp("inputData");
		// 构造参数
		var params = new biz.Request.ActionParam();
		// Map参数
		var mapParam = new biz.Request.MapParam();
		mapParam.put("string", inputData.getValue("param_string"));
		mapParam.put("integer", inputData.getValue("param_integer"));
		mapParam.put("datetime", inputData.getValue("param_datetime"));
		params.setMap("param_map", mapParam);
		// 调用动作
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoActionParams",
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("传入Map参数调用成功");
					// 输出返回结果
					TextOut.setText(result, data.response);
				}
			}
		});
	};

	Model.prototype.xmlParamBtnClick = function(event) {
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());

		// 构造参数
		var params = new biz.Request.ActionParam();
		// XML参数
		var xmlParam = new biz.Request.XMLParam("<root><company>起步科技有限公司</company></root>");
		params.setXml("param_xml", xmlParam);
		// 调用动作
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoActionParams",
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("传入XML参数调用成功");
					// 输出返回结果
					TextOut.setText(result, data.response);
				}
			}
		});
	};

	Model.prototype.tableParamBtnClick = function(event) {
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());

		var orgData = this.comp("orgData");
		orgData.refreshData();
		// 构造参数
		var params = new biz.Request.ActionParam();
		var tableParam = new biz.Request.TableParam(orgData.toJson());
		params.setTable("param_table", tableParam);
		// 调用动作
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoActionParams",
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("传入Table参数调用成功");
					// 输出返回结果
					TextOut.setText(result, data.response);
				}
			}
		});
	};

	Model.prototype.objectParamBtnClick = function(event) {
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());

		// 构造参数
		var params = new biz.Request.ActionParam();
		var objectParam = new biz.Request.ObjectParam({
			name : "霍金",
			sex : "男",
			age : 70
		}, "demo.DemoObject");
		params.setObject("param_object", objectParam);
		// 调用动作
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "demoActionParams",
			"parameters" : params,
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("传入自定义对象参数调用成功");
					// 输出返回结果
					TextOut.setText(result, data.response);
				}
			}
		});
	};

	Model.prototype.returnSimpleBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "demoReturnSimple",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("返回简单值调用成功");
					// 输出返回结果
					TextOut.setText(result, data.response);
				}
			}
		});
	};

	Model.prototype.returnListBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "demoReturnList",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("返回List值调用成功");
					// 输出返回结果
					TextOut.setText(result, JSON.stringify(data.response));
				}
			}
		});
	};

	Model.prototype.returnMapBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "demoReturnMap",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("返回Map值调用成功");
					// 输出返回结果
					TextOut.setText(result, JSON.stringify(data.response));
				}
			}
		});
	};

	Model.prototype.returnXMLBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "demoReturnXML",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("返回XML值调用成功");
					// 返回XML字符串
					var xmlStr = data.response.xml;
					TextOut.setText(result, xmlStr);

					var product = $(xmlStr).find('product').text();
					// 输出返回结果
					TextOut.appendText(result, "product: " + product);
				}
			}
		});
	};

	Model.prototype.returnTableBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		var self = this;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "demoReturnTable",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("返回Table值调用成功");
					
					var names = [];
					var orgData = self.comp("orgData");
					orgData.loadData(data.response);
					orgData.each(function(o) {
						names.push(o.row.val("sName"));
					});
					
					// 输出返回结果
					TextOut.setText(result, "返回" + self.comp("orgData").getCount() + "行数据");
					TextOut.appendText(result, names.join(", "));
				}
			}
		});
	};

	Model.prototype.returnObjectBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		var self = this;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "demoReturnObject",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("返回自定义对象调用成功");
					// 输出返回结果
					TextOut.setText(result, JSON.stringify(data.response));
				}
			}
		});
	};

	Model.prototype.syncBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		TextOut.clear(result);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action": "demoAsync",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("同步调用成功");
					// 输出返回结果
					TextOut.appendText(result, "返回执行结果 - " + data.response + " - " + justep.Date.toString(new Date(), justep.Date.DEFAULT_FORMAT));
				}
			}
		});
		// 执行后续代码
		TextOut.appendText(result, "执行后续代码 - " + justep.Date.toString(new Date(), justep.Date.DEFAULT_FORMAT));
	};

	Model.prototype.asyncBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		// 调用动作，动作demoReturnSimple每次调用返回不同类型的简单值
		TextOut.clear(result);
		biz.Request.sendAsyncBizRequest({
			"context" : this.getContext(),
			"action": "demoAsync",
			"callback": function(data) {
				data.ignoreError = false;
				if (data.state) {
					justep.Util.hint("同步调用成功");
					// 输出返回结果
					TextOut.appendText(result, "返回执行结果 - " + data.response + " - " + justep.Date.toString(new Date(), justep.Date.DEFAULT_FORMAT));
				}
			}
		});
		// 执行后续代码
		TextOut.appendText(result, "执行后续代码 - " + justep.Date.toString(new Date(), justep.Date.DEFAULT_FORMAT));
	};

	Model.prototype.batchBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		// 清空返回结果
		TextOut.clear(result);
		
		var directExecute = this.comp("directExecuteBox").val();
		// 开启批请求
		TextOut.appendText(result, "开启批请求。");
		biz.Request.beginBatch();	
		try {
			// 调用动作1
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "demoBatchAction1",
				"directExecute" : directExecute,
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						// 输出返回结果1
						TextOut.appendText(result, "动作1返回执行结果 - " + data.response);
					}
				}
			});
			TextOut.appendText(result, "动作1的后续代码执行。");
		
			// 调用动作2
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action": "demoBatchAction2",
				"callback": function(data) {
					data.ignoreError = false;
					if (data.state) {
						// 输出返回结果2
						TextOut.appendText(result, "动作2返回执行结果 - " + data.response);
					}
				}
			});
			TextOut.appendText(result, "动作2的后续代码执行。");
			
			TextOut.appendText(result, "批请求提交前。");
			// 提交批请求
			biz.Request.endBatch();	
			TextOut.appendText(result, "批请求提交后。");
			
			justep.Util.hint("批请求调用成功");
		} catch (e) {
			// 取消批请求
			biz.Request.cancelBatch();
			throw e;
		} 
	};

	Model.prototype.postBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
	
		var form = this.getElementByXid("postForm");
		var uploadFileName = this.getElementByXid("uploadFileName");
		var uploadFile = this.getElementByXid("uploadFile");
		var postResultIframe = this.getElementByXid("postResultIframe");
		
		// form表单提交对应的请求URL是"$UI/system/service/common/bizAction.j"，但提交前需要进行URL转换，在URL上补足bsessionid等必要信息
		var url = require.toUrl("$UI/system/service/common/bizAction.j?bsessionid=" + this.getContext().getBSessionID());
		// 将转换后的URL设置到form表单上
		form.attributes["action"].value = url;
		// 设置文件名参数域，文件名中的中文需要编码encodeURI，在Action的java中再解码decode
		$(uploadFileName).val(window.encodeURI($(uploadFile).val()));
	
		// 在form目标iframe的onload事件中以回调方式获取返回值
		var parentWindow = window;
		$(postResultIframe).load(function(){
			var iframeWindow = this.contentWindow;
			iframeWindow.setTimeout(function() {
				var doc = iframeWindow.document.XMLDocument ? iframeWindow.document.XMLDocument : iframeWindow.document; 
	
				// 判断动作调用是否成功
				var flag = $(doc).find("flag").text();
				if (flag == "true") {
					justep.Util.hint("form表单方式调用动作成功");
					
					// 输出返回结果
					var data = $(doc).find("data").text();
					TextOut.setText(result, data);
				} else {
					justep.Util.hint("form表单方式调用动作失败");
	
					// 抛出错误信息
					var message = $(doc).find("message").text();
					TextOut.setText(result, message);
				}
			}, 1);
		});
	
		// 提交表单
		$(form).submit();
	};

	Model.prototype.showImageBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
		
		var downloadFileName = this.getElementByXid("downloadFileName");
		var showImage = this.getElementByXid("showImage");
	
		// get方式调用动作对应的请求URL是"$UI/system/service/common/bizAction.j"，但提交前需要进行URL转换，在URL上补足bsessionid等必要信息
		var url = require.toUrl("$UI/system/service/common/bizAction.j?bsessionid=" + this.getContext().getBSessionID());
		// 用get方式传参
		url = url 
			+ "&process=" + this.getContext().getCurrentProcess() 
			+ "&activity=" + this.getContext().getCurrentActivity()
			+ "&executor=" + this.getContext().getExecutor() 
			+ "&action=demoDownloadFile" 
			+ "&fileName=" + window.encodeURI($(downloadFileName).val());
		// 将URL设置给image组件显示图片
		$(showImage).attr("src", url);
	};

	Model.prototype.downloadFileBtnClick = function(event){
		// 输出执行代码
		TextOut.setText(code, arguments.callee.toString());
	
		var downloadFileName = this.getElementByXid("downloadFileName");

		// 这个案例中为了下载时能给出文件名，自定义了一个.j用于执行下载的get请求，.j请参考"$UI/demo/actions/process/invokeAction/downloadFile.j"
		// 提交前需要进行URL转换，在URL上补足bsessionid等必要信息
		var url = require.toUrl("$UI/demo/actions/process/invokeAction/downloadFile.j?bsessionid=" + this.getContext().getBSessionID());
		// 用get方式传参
		url = url 
			+ "&process=" + this.getContext().getCurrentProcess() 
			+ "&activity=" + this.getContext().getCurrentActivity()
			+ "&executor=" + this.getContext().getExecutor() 
			+ "&action=demoDownloadFile" 
			+ "&fileName=" + window.encodeURI($(downloadFileName).val());
		// 弹出下载
		window.open(url);
	};

	Model.prototype.tabs1Select = function(event){
		TextOut.clear(code);
		TextOut.clear(result);
	};

	return Model;
});
