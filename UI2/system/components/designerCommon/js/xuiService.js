define(function(require) {
	var $ = require("jquery"), idIdx = 0, callBackCount = 0;
	var xmlUtil = require('$UI/system/lib/base/xml');
	var webSocket = require("$UI/system/components/designerCommon/js/webSocketMng");
	var xuiServiceName = "com.justep.designer.service.XuiService";
	var idIdx = 0;
	
	window.errorCallBack = function(errorMsg) {
		alert(errorMsg);
	};

	/*xml片段模型*/
	var XmlModel = function(config){
		var data = config.data;//数据组件对象
		var rowNodePath = this.rowNodePath = config.rowNodePath;//行节点的搜索路径
		var rowIdPath = this.rowIdPath = config.rowIdPath;//data的idColumn字段对应的值的路径
		var binding = this.binding = config.binding; // data字段与xml数据的绑定 {"name":"readonly/expr"};
		var rootPath = config.rootPath;//根路径
		this.idField = config.idField || data.idColumn;
		//解析xml文本
		var $xmlData  = $(xmlUtil.fromString(config.xmlData).documentElement);
		if(rootPath){
		    var $tempNode = $(">"+rootPath,$xmlData);
		    if($tempNode.length == 0){
		      $tempNode = this.createNodeByPath($xmlData, rootPath);
		    }
		    $xmlData = $tempNode;
		}
		var $rowData = this.$rootNode = $xmlData;
		
		//data行对应的节点路径
		if(rowNodePath){
		  $rowData = $(">"+rowNodePath,$xmlData);
		}
		var self = this;
		
		
		//遍历行节点数据
		$rowData.each(function(){
			var $this = $(this);
			var xid = $this.attr("xid");
			if(!xid){
				xid = "xid_"+new Date().getTime()+"_"+(idIdx++);
			    $this.attr("xid",xid);
			}
			var row = {};
			for(var p in binding){
				var value = self.getValue(binding[p],$this);
				if(value){
					row[p] = value;
				}
			}
			if(rowIdPath){
				var keyValue = self.getValue(rowIdPath,$this);
				if(!keyValue){
					return;
				}
				var rows = data.find([self.idField],[keyValue],true);
				if(rows && rows.length>0){
					for(var p in row){
						data.setValue(p,row[p],rows[0]);
					}
					return;
				}
				row[self.idField] = keyValue;
			}
			
			data.add(row);	
			
		});
		this.installListener(this,data);
	}
	
	XmlModel.prototype = {
		installListener:function(self,data){
			data.on("onValueChanged",function(event){
			    var path = self.binding[event.col];
			    if(path){
			       var idValue = data.getValue(self.idField,event.row); 
			       var $rowNode = self.findNodeByRowIdPath(self.rowIdPath,idValue);
			       if(!$rowNode || $rowNode.length == 0){
			    	    $rowNode = self.createNodeByPath(self.$rootNode,self.rowNodePath,true);	     
			    	   
			    	    if(self.rowIdPath){
			    	    	self.setValue(self.rowIdPath,idValue,$rowNode);
			    	    }  
			       }
			       self.setValue(path,event.value,$rowNode);
			    }
			});
			
			data.on("onAfterDelete",function(event){
				var deleteRows = event.deleteRows;
				for(var i = 0;i<deleteRows.length;i+=1){
					var deleteRow = deleteRows[i];
					var idValue = deleteRow.val(self.idField);
					self.findNodeByRowIdPath(self.rowIdPath,idValue).remove();
				}
			});
			
			data.on("onAfterNew",function(event){
				var rows = event.rows;				
				for(var i=0;i<rows.length;i+=1){
					var row = rows[i];
					var idValue = row.val(self.idField);
					var $rowNode = self.findNodeByRowIdPath(self.rowIdPath,idValue);
			        if(!$rowNode || $rowNode.length == 0){
			    	    $rowNode = self.createNodeByPath(self.$rootNode,self.rowNodePath,true);	     
			    	    idValue = idValue || "xid_"+new Date().getTime()+"_"+(idIdx++);
			    	    if(self.rowIdPath){
			    	    	self.setValue(self.rowIdPath,idValue,$rowNode);
			    	    }
			    	    row.val(self.idField,idValue);
			        } 
		    	    for(var p in self.binding){
		    	    	var v = row.val(p);
		    	    	if( v !== undefined){
		    	    		self.setValue(self.binding[p],v,$rowNode);
		    	    	}
		    	    }
				}
			});
			
			/**
			 * 节点移动
			 */
			data.on("onDataChange",function(event){
				if(event.type == 'exchangeRow'){
					var row1 = event.row1;
					var row2 = event.row2;
					
					var idValue1 = row1.val(self.idField);
					var idValue2 = row2.val(self.idField);
					
					var $rowNode1 = self.findNodeByRowIdPath(self.rowIdPath,idValue1);
					var $rowNode2 = self.findNodeByRowIdPath(self.rowIdPath,idValue2);
					
					if($rowNode1 && $rowNode1.length>0 && $rowNode2 && $rowNode2.length>0){
						var rowNode1Bak = $rowNode1.clone(true);
						var rowNode2Bak = $rowNode2.clone(true);
						
						$rowNode1.before(rowNode2Bak);
						$rowNode2.before(rowNode1Bak);
						
						$rowNode1.remove();
						$rowNode2.remove();
					}
				}
			});
		},
		
		/**根据rowIdPath查找节点**/
		findNodeByRowIdPath : function(rowIdPath,targetValue){
			var $xmlData = this.$rootNode;
			var self = this;
			var $targetNode;
			if(this.rowNodePath){
			  $xmlData = $(this.rowNodePath,$xmlData);
			  $xmlData.each(function(){
					var $this = $(this);
					var keyValue = self.getValue(rowIdPath,$this);
					if(keyValue == targetValue){
						$targetNode = $this;
						return false;
					}
				});
			}
			return $targetNode;
		},
		
		/**根据节点路径获取属性或者文本值**/
	    getValue:function(path,$rootNode){
	    	$rootNode = $rootNode || this.$rootNode;
	    	var pathItem = path.split(">");
	    	var $currentNode = $rootNode;
	    	for(var i = 0;i<pathItem.length;i+=1){
	    		var item = pathItem[i];
	    		if(!item){
	    			continue;
	    		}
	    		if(item.substring(0,1) != '@'){
	    			$currentNode = $(">"+item,$currentNode);
	    		}else{
	    			return $currentNode.attr(item.substring(1));
	    		}
	    	}
	    	var text = "";
	    	if($currentNode.getText){
	    		text = $currentNode.getText();
	    	}else{
	    		text = $currentNode.text();
	    	}
	    	return $.trim(text);
	    },
	    
	    /**创建节点*/
	    createNode : function($parentNode,tagName/*标签名*/){
		  var node =  $parentNode[0].ownerDocument.createElement(tagName);
		  $parentNode[0].appendChild(node);
		  return $(node);
	    },
	    
	    /**根据路径创建节点系列
		 * 如果forceCreate不为true，则path中存在的节点不会再创建
	     **/
	    createNodeByPath:function($parentNode,path,forceCreate/*是否强制创建*/){
	    	if(!path){
	    		return;
	    	}
	    	var pathItems = path.split(">");
	    	var $currentParent = $parentNode;
	    	for(var i = 0;i<pathItems.length ;i+=1){
	    	   var item = pathItems[i];
	    	   if(!item){
	    		   continue;
	    	   }
	    	   if(item.substring(0,1) == '@'){
	    	     continue;
	    	   }
	    	   var $tempNode = $(">"+pathItems[i],$currentParent);
	    	   if($tempNode.length == 0 || forceCreate){
	    		  $currentParent = this.createNode($currentParent,pathItems[i]);
	    	   }else{
	    		   $currentParent = $tempNode;
	    	   }
	    	}
		    return $currentParent;
	    },
	    
	    removeTextNode : function(node){
	    	var childNodes = node.childNodes;
	    	for(var i= 0 ;i<childNodes.length ;i+=1){
	    		var childNode = childNodes[i];
	    		var type = childNode.nodeType;
	    		if(type == 3 || type == 4){
	    			node.removeChild(childNode);
	    		}
	    	}
	    },
	    
	    /** 根据路径设置属性或者文本值**/
	    setValue :function(path,value,$rootNode){
	    	$rootNode = $rootNode || this.$rootNode;
	    	
	    	var oldValue = this.getValue(path,$rootNode);
	    	if(oldValue == value){
	    		return;
	    	}
	    	var $currentNode = this.createNodeByPath($rootNode,path);
	    	var pathItems = path.split(">");
	    	var lastItem = pathItems[pathItems.length - 1];
	    	if(lastItem.substring(0,1) != '@'){
	    		this.removeTextNode($currentNode[0]);
	    		if(value){
	    			$currentNode[0].appendChild($currentNode[0].ownerDocument.createCDATASection(value));	    			
	    		}else{
	    			$currentNode.text(value);
	    		}
	    	}else{
	    	   $currentNode.attr(lastItem.substring(1),value);
	    	}
	    },
	    
	    buildXmlStr:function(node,buf){
	    	if(!buf){
	    		buf = [];
	    	}
	    	var tagName =  node.tagName;
	    	buf.push("<"+tagName);
	    	var attributes = node.attributes;
	    	for(var i = 0;i<attributes.length;i+=1){
	    		var attr = attributes[i];
	    		buf.push(" "+attr.name+'="'+attr.value+'"');
	    	}
	    	
	    	var childNodes = node.childNodes;
	    	if(childNodes.length>0){
	    		buf.push(">");
	    	}
	    	for(var i = 0;i<childNodes.length;i+=1){
	    		var childNode = childNodes[i];
	    	 
	    		var type = childNode.nodeType;
	    		if(type == 1){
	    			this.buildXmlStr(childNode,buf);
	    		}else if(type == 3 || type == 4){ 
	    			buf.push("<![CDATA["+childNode.nodeValue+"]]>");
	    		}
	    	}
	    	
	    	if(childNodes.length>0){
	    		buf.push("</"+tagName+">");
	    	}else{
	    		buf.push(" />");
	    	}
	    	return buf.join("");
	    },
	    
	    asXml:function(){
	    	var xml = this.buildXmlStr(this.$rootNode[0]);//.outerHTML;
	    	return xml;
	    },
	    childAsXml : function(){
	    	var xml = this.buildXmlStr(this.$rootNode[0]);//.innerHTML;
	    	return xml;
	    },
	    childAsArray:function(){
	    	var array = [];
	    	var self = this;
	    	this.$rootNode.children().each(function(){
	    		array.push(self.buildXmlStr(this));
	    	});
	    	return array;
	    }
	}
	
	function updateDesignerAttr(sourceNode, targetNode) {
		var attrList = [ "d_selectable", "d_canmove", "d_canaddchild", "d_canremove", "componentName", "d_resizable" ];
		for ( var i = 0; i < attrList.length; i++) {
			if (!targetNode.getAttribute(attrList[i])) {
				targetNode.setAttribute(attrList[i], sourceNode.getAttribute(attrList[i]));
			}
		}
	}
	function __callJava(className, methodName, params, callback) {
		params = params || {};
		params.filePath = webSocket.getRequestParameter("filePath");
		return webSocket._callJava(className, methodName, params, callback);
	}

	var xuiDoc = {
		callJava : __callJava,

		getFilePath : function() {
			return webSocket.getRequestParameter("filePath");
		},

		/** 根据设计时id获取模型节点 */
		getNodeByDId : function(dId) {
			var sNode = this.callJava(xuiServiceName, "getModelNodeByDId", {
				"d_id" : dId,
				async : false
			});
			return sNode;
		},

		/** 根据xpath选择模型节点* */
		selectNodes : function(xpath) {
			var sNode = this.callJava(xuiServiceName, "selectModelNodes", {
				async : false,
				"xpath" : xpath
			});
			return sNode;
		},
		
		/** 生成xid **/
		genaXId : function(componentName){
			var xid = this.callJava(xuiServiceName, "genaXId", {
				async : false,
				"componentName" : componentName
			});
 
			return xid;
		},
		
		/**
		 * 获取组件模版内容.
		 */
		getTemplate : function(componentName){
			var template = this.callJava(xuiServiceName, "getTemplate", {
				async : false,
				"componentName" : componentName
			});
 
			return template;
		},
		
		/**
		 * 获取组件模版内容.
		 */
		getConfig : function(componentName){
			var xml = this.callJava(xuiServiceName, "getConfig", {
				async : false,
				"componentName" : componentName
			});
			if(xml){
				return xmlUtil.fromString(xml).documentElement
			}
		},
		
		/**
		 * 创建组件. parent 父节点--可以是dom节点也可以是d_id options 包含before--d_id
		 * 表示在这个id对应的元素之前插入、templateContent--模板内容
		 */
		createComponent : function(componentName/* 组件名 */, parent/* 父节点的d_id */, options, callBack) {
			options = options || {};
			options.componentName = componentName;
			options.parentElementId = typeof parent != 'string' ? parent.domNode.getAttribute("d_id") : parent;
			var callBackAdapter = null;
			if (callBack) {
				callBackAdapter = function(result) {
					if (result.xml) {
						callBack($(result.xml).get(0));
					} else {
						callBack(result);
					}
				};
			}
			this.callJava(xuiServiceName, "createComponent", {
				asyn : true,
				config : options
			}, callBackAdapter);
		},

		batchCreateComponent : function(configs, callBack) {
			var callBackAdapter = null;
			if (callBack) {
				callBackAdapter = function(result) {
					if (result.xml) {
						callBack($(result.xml).get(0));
					} else {
						callBack(result);
					}
				};
			}
			
			this.callJava(xuiServiceName, "batchCreateComponent", {
				asyn : true,
				config : configs
			}, callBackAdapter);
		},
		
		callMethod : function(comObjOrDId,targetMethod,params,callBack){
			if (typeof comObjOrDId != 'string') {
				comObjOrDId = comObjOrDId.domNode.getAttribute("d_id");
			}
			this.callJava(xuiServiceName, "callMethod", {
				d_id : comObjOrDId,
				targetMethod:targetMethod,
				config : params
			}, callBack);
		},

		/** 删除组件 */
		deleteComponent : function(comObjOrIds, options, callBack) {
			options = options || {};
			var paths = [];
			for ( var i = 0; i < comObjOrIds.length; i += 1) {
				var item = comObjOrIds[i];
				if (typeof item != 'string') {
					comObjOrIds[i] = item.domNode.getAttribute("d_id");
				}
				paths.push($("*[d_id='" + comObjOrIds[i] + "']").getPath());
			}
			options.paths = paths;
			options.ids = comObjOrIds;
			xuiDoc.callJava(xuiServiceName, "deleteComponent", options, callBack);
		},

		/**
		 * 设置属性值,支持同时设置多个
		 * 
		 * @param comObjOrDId
		 *            组件对象或者组件的d_id
		 * @param config
		 *            多个属性值的json对象
		 * @param callBack
		 *            属性设置完成后回调方法
		 */
		set : function(comObjOrDId, config, callBack) {
			if (typeof comObjOrDId != 'string') {
				comObjOrDId = comObjOrDId.domNode.getAttribute("d_id");
			}
			this.callJava(xuiServiceName, "set", {
				d_id : comObjOrDId,
				config : config
			}, callBack);
		},

		/**
		 * 获取属性值.
		 * 
		 * @param comObjOrDId
		 *            组件对象或者组件的d_id
		 * @param propName
		 *            属性名.
		 * @returns 返回属性值
		 */
		get : function(comObjOrDId, propName) {
			if (typeof comObjOrDId != 'string') {
				comObjOrDId = comObjOrDId.domNode.getAttribute("d_id");
			}
			return this.callJava(xuiServiceName, "get", {
				d_id : comObjOrDId,
				async : false,
				name : propName
			});
		},

		/**
		 * 更新属性值到w对应的dom节点上.
		 * 
		 * @param $$htmlNodeList
		 *            jquery对象
		 * @param properties
		 *            属性列表
		 * @param exclude
		 *            是否是排除属性
		 * @param callback
		 *            回调
		 */
		updateProperties : function($htmlNodeList, properties, exclude, callback) {
			var d_ids = [], propList = [];
			$htmlNodeList.each(function() {
				var dId = this.getAttribute("d_id");
				if (dId) {
					d_ids.push(dId);
					var propMap = {};
					propList.push(propMap);
					if (properties && !exclude) {
						for ( var i = 0; i < properties.length; i += 1) {
							propMap[properties[i]] = this.getAttribute(properties[i]) || "";
						}
					} else {
						var attrs = this.attributes;
						for ( var i = 0; i < attrs.length; i += 1) {
							var name = attrs[i].name;
							if (name.substring(0, 2) == "d_" || name == 'component' || name == 'componentname' || name == 'id') {
								continue;
							}
							if (exclude && properties) {
								if ($.inArray(name, properties) != -1) {
									continue;
								}
							}
							var attrV = attrs[i].value;
							if(name == 'class' && attrV){
								attrV = attrV.replace("xui-hignlight-selected","");
							}
							propMap[name] = attrV;
						}
					}
				}
			});
			return this.callJava(xuiServiceName, "updateProperties", {
				d_ids : d_ids,
				"properties" : propList
			}, callback);
		},

		asXml : function(htmlNode, excludeProperties, buf) {
			buf = buf || [];

			var tagName = htmlNode.tagName.toLowerCase();
			buf.push("<" + tagName + " ");
			var attributes = htmlNode.attributes;

			for ( var p in attributes) {
				var attr = attributes[p];
				if (attr.value !== undefined) {
					if (excludeProperties && $.inArray(attr.name, excludeProperties) != -1) {
						continue;
					}
					buf.push(" " + attr.name + '="' + attr.value + '" ');
				}
			}

			var childNodes = htmlNode.childNodes;
			if (childNodes.length > 0) {
				buf.push(">");
			} else {
				buf.push("/>");
			}

			for ( var i = 0; i < childNodes.length; i += 1) {
				var childNode = childNodes[i];
				if (childNode.nodeType == 1) {
					this.asXml(childNode, excludeProperties, buf);
				} else if (childNode.nodeType == 3) {
					buf.push(childNode.nodeValue);
				}
			}
			if (childNodes.length > 0) {
				buf.push("</" + tagName + ">");
			}

			return buf;

		},

		updateNodes : function($htmlNodeList, excludeProperties, callback) {
			var contents = [];

			var self = this;
			$htmlNodeList.each(function() {
				var dId = this.getAttribute("d_id");
				if (!dId) {
					this.setAttribute("d_id", "d_id_js_" + (idIdx++));
				}
				$("*", this).each(function() {
					if (this.getAttribute("d_updatable") != 'false') {
						var dId = this.getAttribute("d_id");
						if (!dId) {
							this.setAttribute("d_id", "d_id_js_" + (idx++));
						}
					}
				});

				var cloneNode = this.cloneNode(true);
				$(cloneNode).removeClass("xui-hignlight-selected active");
				cloneNode.setAttribute("d_parentDId", this.parentNode.getAttribute("d_id"));
				var next = $(this).nextElement();// .nextSibling;
				if (next) {
					cloneNode.setAttribute("d_nextDId", next.getAttribute("d_id"));
				}
				var previous = $(this).prevElement();
				if (previous) {
					cloneNode.setAttribute("d_prevDId", previous.getAttribute("d_id"));
				}
				contents.push(self.asXml(cloneNode, excludeProperties).join(""));
			});
			var callbackAdapter = function(result) {

				var nodeList = result.nodeList;
				for ( var i = 0; i < nodeList.length; i += 1) {
					var $node = $(nodeList[i]);
					var dId = $node.attr("d_id");
					var $targetNode = $("*[d_id='" + dId + "']:first");
					if ($targetNode.length > 0) {
						updateDesignerAttr($node[0], $targetNode[0]);
					}
					$("*", $node).each(function() {
						var $targetNode = $("*[d_id='" + this.getAttribute("d_id") + "']:first");
						if ($targetNode.length > 0) {
							updateDesignerAttr(this, $targetNode[0]);
						}
					});
				}
				if (callback) {
					callback.call(window, result);
				}
			};
			return this.callJava(xuiServiceName, "udpateDomNodes", {
				"contents" : contents
			}, callbackAdapter);
		},

		updateText : function($htmlNodeList, isCDATA, callback) {
			var textMap = {};
			$htmlNodeList.each(function() {
				var $node = $(this);
				var childNodes = this.childNodes;
				var text = [];
				for ( var i = 0; i < childNodes.length; i += 1) {
					var childNode = childNodes[i];
					if (childNode.nodeType == 3) {
						text.push(childNode.nodeValue);
					}
				}
				textMap[$node.attr("d_id")] = text.join("");
			});
			return this.callJava(xuiServiceName, "updateText", {
				isCDATA : isCDATA,
				"textMap" : textMap
			}, callback);
		},

		/**
		 * 替换子元素.
		 * 
		 * @param comObjOrDId
		 *            组件对象或者组件的d_id
		 * @param childTemplate
		 *            子元素的模板内容
		 * @param options
		 *            可选参数 包含：xpathCondition 查询子元素的xpath paintComponent
		 *            是否需要在界面上绘制这些子节点.
		 * @param callBack
		 */
		replaceChild : function(comObjOrDId, childTemplate, options, callBack) {
			if (typeof comObjOrDId != 'string') {
				comObjOrDId = comObjOrDId.domNode.getAttribute("d_id");
			}
			options = options || {};
			options.childTemplate = childTemplate;
			options.d_id = comObjOrDId;
			return this.callJava(xuiServiceName, "replaceChild", options, callBack);
		},

		/**
		 * 重新绘制组件.
		 * 
		 * @param comObjOrDId
		 *            组件对象或者组件的d_id
		 * @param callBack
		 *            回调方法
		 */
		repaintComponent : function(comObjOrDId, callBack) {
			if (typeof comObjOrDId != 'string') {
				comObjOrDId = comObjOrDId.domNode.getAttribute("d_id");
			}
			this.callJava(xuiServiceName, "repaintComponent", {
				d_id : comObjOrDId
			}, callBack);
		},

		/**
		 * 移动组件节点.
		 * 
		 * @param comObjOrDId
		 *            组件对象或者组件的d_id
		 * @param targetParentObjOrDId
		 *            目标父组件对象或者d_id
		 * @param beforeObjOrId
		 *            参考组件对象或者d_id --表示移动到组件之前
		 * @param callBack
		 *            回调方法
		 * @returns
		 */
		move : function(comObjOrDId, targetParentObjOrDId, beforeObjOrId, callBack) {
			if (typeof comObjOrDId != 'string') {
				comObjOrDId = comObjOrDId.domNode.getAttribute("d_id");
			}
			if (targetParentObjOrDId && typeof targetParentObjOrDId != 'string') {
				targetParentObjOrDId = targetParentObjOrDId.domNode.getAttribute("d_id");
			}
			if (beforeObjOrId && typeof beforeObjOrId != 'string') {
				beforeObjOrId = beforeObjOrId.domNode.getAttribute("d_id");
			}
			this.callJava(xuiServiceName, "move", {
				d_id : comObjOrDId,
				targetId : targetParentObjOrDId,
				refId : beforeObjOrId
			});
		},

		/**
		 * 获取所有组件的操作.
		 * 
		 * @returns
		 */
		getAllOperations : function(callBack) {
			return this.callJava(xuiServiceName, "getAllOperations", {
				async : true
			},callBack);
		},

		/**
		 * 获取编辑器数据源.
		 * 
		 * @param method
		 *            带包名和类名的方法
		 *            如果在包com.justep.studio.ui.editors.property.datasource下，直接写类名即可,如：ConceptDatasource.getDataSource
		 * @param propertyItem
		 *            属性名，可以根据具体方法来判断是否需要传入什么样的属性
		 * @returns
		 */
		getEditorDataSource : function(method, propertyItem,dId) {
			return this.callJava(xuiServiceName, "getEditorDataSource", {
				async : false,
				method : method,
				d_id:dId,
				propertyItem : propertyItem
			});
		},

		/**
		 * 设置css项
		 * 
		 * @param comObjOrDId
		 *            组件对象或者组件的d_id
		 * @param cssConfig
		 *            例如：{width:"100px",height:"450px"}
		 */
		setCSS : function(comObjOrDId, cssConfig) {
			if (typeof comObjOrDId != 'string') {
				comObjOrDId = comObjOrDId.domNode.getAttribute("d_id");
			}
			return this.callJava(xuiServiceName, "setCSS", {
				d_id : comObjOrDId,
				config : cssConfig
			});
		},
		
		/**
		 * 批量设置CSS.
		 */
		batchSetCSS : function(d_ids,cssConfig){
			return this.callJava(xuiServiceName, "batchSetCSS", {
				d_ids : d_ids,
				config : cssConfig
			});
		},
		
		getXuiService : function() {
			return xuiService;
		}
	};

	var xuiService = {
		callJava : __callJava,

		regComponents : function(map) {
			if(!window.componentConfig){
				return;
			}
			for ( var p in map) {
				componentConfig[p]["js-class"] = map[p];
			}
		},

		/** 打开对话框页面 */
		openPage : function(url, params, callBack) {
		   if(url.substring(0,3) == "$UI"){
		    url = "$model/"+url;
		   } 
		   var lastStr = "";
		   var href = window.location.href;
		   var idx0 = href.indexOf("#");
		   if(idx0 != -1){
		    lastStr = href.substring(idx0);
		    href = href.substring(0,idx0);
		   }
		   var idx = href.indexOf("?");
		   if (idx != -1) {
		    if (url.indexOf("?") == -1) {
		     url = url + href.substring(idx);
		    } else {
		     url = url + "&" + href.substring(idx + 1);
		    }
		   }
		   if(lastStr){
			   href += lastStr;
		   }
		 
		   params = params || {};
		   this.callJava(xuiServiceName, "openPage", {
		    url : url,
		    pageParams : params
		   }, callBack);
		  },
		
		openEditor:function(name,params,callBack){ 
			this.callJava(xuiServiceName, "openEditor", {
				name : name,
				params : params
			}, callBack);
		},

		pageOkAction : function(params) {
			params = params || {};
			if (params.returnValue && typeof params.returnValue == 'object') {
				params.returnValue = JSON.stringify(params.returnValue);
			}
			params.pageId = params.pageId || webSocket.getRequestParameter("pageId");
			this.callJava(xuiServiceName, "pageOkAction", params);
		},
		
		pageApplyAction : function(params) {
			params = params || {};
			if (params.returnValue && typeof params.returnValue == 'object') {
				params.returnValue = JSON.stringify(params.returnValue);
			}
			params.pageId = params.pageId || webSocket.getRequestParameter("pageId");
			this.callJava(xuiServiceName, "pageApplyAction", params);
		},
		
		pageCloseAction : function(params) {
			params = params || {};
			params.pageId = params.pageId || webSocket.getRequestParameter("pageId");
			this.callJava(xuiServiceName, "pageCloseAction", params);
		},

		/**
		 * 获取初始化数据.
		 * 
		 * @returns
		 */
		getPageParams : function(pageId) {
			pageId = pageId || webSocket.getRequestParameter("pageId");
			var returnData = this.callJava(xuiServiceName, "getPageParams", {
				async : false,
				pageId : pageId
			});// 调用java端的方法，对应的响应方法为：jsCallJavaHandler
			return returnData;
		},

		getXuiDoc : function() {
			return xuiDoc;
		},
		
		/**
		 * 创建xml格式的excel文件
		 */
		createExcelFile : function(params){
			params.async = false ;
		   this.callJava(xuiServiceName, "createExcelFile", params); 
		},
		
		/**
		 * 把xml格式的excel另存为二进制格式
		 */
		saveXmlExcelAsBinaryFile : function(xmlFilePath){
			var url = require.toUrl("$UI/system/templates/server/XmlToExcel.j");
			var data = {
				pathname : xmlFilePath
			};
			$.ajax({
				async : false,
				data : data,

				dataType : 'json',
				type : 'POST',
				url : url,
				success : function(result) { },
				error : function(xhr, status, err) {
					var erroeMsg = "ajax请求出错：" + [ status, xhr.readyState, err ];
					console.log(erroeMsg);
				}
			});
		},
		
		/**
		 * 获取所有的应用名称.
		 */
		getAllAppNames : function(){
			var returnData = this.callJava(xuiServiceName, "getAllAppNames", {
				async : false
			}); 
			return returnData;
		},
		
		/**
		 * 创建xml片段模型，主要用于根data的绑定.
		 * 参数：{xmlData:xmlStr,rootPath:"rule",rowNodePath:"col",rowIdPath:"@name",data:this.comp("data"),binding:{name:"test>@name"}}
		 * @rootPath 根路径
		 * @rowNodePath 行节点路径
		 * @rowIdPath ID值的路径
		 * @data data对象
		 * @bingding data字段与节点之间的映射关系，如：var binding = { "readonly":"readonly>expr"};
		 */
		createXmlModel : function(config){
			return new XmlModel(config);
		},
		
		loginPaas : function(config,callback){
			var returnData = this.callJava(xuiServiceName, "setLonginConfig", config,callback); 
		},
		
		setNoDisplay : function(config,callback){
			var returnData = this.callJava(xuiServiceName, "setLonginConfig", config,callback); 
		}
	};

	return xuiService;
});