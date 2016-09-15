

/**
 * 扩展基本画布，添加了图形选择，移动，改变大小等功能.
 */
justep.graphics.Canvas = function(config) {
	justep.apply(this, config);
	if (this.id) {
		this.setViewPort(this.id);
	};
	this.figures = {}; // 存储图形对象
	this.scale = 1;
	this.concepts = {};
	this.selections = {}; // 存储选择的图形对象
	this.ghostFigures = {}; // 影图
	this.moveOffset = {
		x : 0,
		y : 0
	};
	this.lastPosition = {
		x : 0,
		y : 0
	};
	this.scrollLeft = 0;
	this.scrollTop = 0;
    this.concepts = {};
	// this.test();
    this.initPos = {x:10,y:10};
	this.installListener();
};

var createRawNode = function(nodeName, parent, style) {
	var rawNode = document.createElementNS("http://www.w3.org/2000/svg", nodeName);
	//	this.rawNode.setAttribute("style", style);		
	//不适用style,改用属性
	var styles = style.split(";")
	for ( var i = 0; i < styles.length; i++) {
		var ss = styles[i];
		if (ss.indexOf(":") != -1) {
			ss = ss.split(":");
			rawNode.setAttribute(ss[0], ss[1]);
		}
	}

	parent.appendChild(rawNode);
	return rawNode;
}

justep.graphics.Canvas.prototype = {
	fireEvent:function(){},
	/**
	 * 设置画图视图区.
	 */
	setViewPort : function(divId) {
		if (!this.canvasElement) { 
			this.container = document.getElementById(divId);
			// this.canvasElement = document.getElementById("svgc");
			var svg = document.getElementById("svg1");//.createElementNS("http://www.w3.org/2000/svg", "svg");
			svg.setAttribute("width", 4000);
			svg.setAttribute("height", 3000);
			svg.setAttribute("version", "1.1%");
			this.canvasElement = svg;
			this.container.appendChild(svg);
			 
//			$('<line style="marker-end:url(#markerEndArrow);stroke-width:5;stroke:brown;fill:none;" x1="325" x2="660" y1="535" y2="200"/>').appendTo(svg);
			/*
			document.namespaces.add("v","urn:schemas-microsoft-com:vml");
			this.canvasElement =document.createElement('<v:group style="WIDTH: 2000px; POSITION: absolute; HEIGHT: 3000px;border:0px solid green;" coordsize="2000,3000">');
			this.container.appendChild(this.canvasElement);
			
			this.container.style.width="100%";
			this.container.style.height="100%";*/
			
		};
	},

	/**
	 * 添加一个图形.
	 */
	add : function(figure) {
		figure.canvas = this;
		this.figures[figure.id] = figure;
		figure.paint();
	},
	/**
	 * 删除一个图形.
	 */
	remove : function(figure) {
		var id = figure.id;
		var type = figure.type;
		if (this.selections[figure.id]) {
			this.unSelection(figure);
		}
		delete this.figures[figure.id];
		if (type != 'Box' && type != 'Port' && type != 'InPort'
				&& type != 'OutPort') {
			//this.fireEvent('remove', figure);
		}
	},
	actionType : {
		READY_CREATE : 0,/* 创建 */
		CREATE : 1,/* 改变大小 */
		RESIZE : 2,/* 移动 */
		MOVE : 3,/* 选择 */
		SELECT : 4,
		READY_DRAG_SELECT : 5,
		DRAG_SELECT : 6,
		CHANGE_CONNECTION_SOURCE : 7,
		CHANGE_CONNECTION_TARGET : 8
	},// 对图形的操作类型
	dispatchEvent : function(eventData) {
		eventData.filePath = getUrlParam("filePath");
		this.eventData = eventData;
		if ($.browser.msie) {
		    document.fireEvent("onafterupdate")
	    } else {
	    	if(window.callJava){
	    		window.callJava(eventData);
	    	} 
	    }
	
		//document.fireEvent("onafterupdate");
	
	},
		/**
	 * 创建一个概念图形.
	 */
    addConcept:function(concept,lazyPaint){
    	concept.bound = concept.bound || {x:this.initPos.x,y:this.initPos.y,w:140,h:100};
    	this.initPos.x += 50;
    	this.initPos.y += 50;
    	var concept = new justep.graphics.Concept(this,concept);//{canvas:this,bound:{x:x,y:y,w:160,h:60},border:'black'}
    	this.concepts[concept.name] = concept;
    	if(lazyPaint != true){
    		concept.paint();
    	}
    	return concept;
    },
    
    addHasRelationToConcept : function(concept, hasRelationJSON) {
		var drawConnection = true;
		concept.addHasRelation(hasRelationJSON,drawConnection);
	},
    
    /**
	 * 根据名称获取一个概念图形对象.
	 */
    getConcept:function(conceptName){
    	return this.concepts[conceptName];
    },

    
    /**
     * 根据名称获取一个概念图形对象.
     */
    getConcept:function(conceptName){
    	return this.concepts[conceptName];
    },

    initData:function(data){
	    var data = (typeof data == 'string')?eval("(" + data + ")"):data;
	    var modelData = data.modelData; 
	    var styleData = data.styleData || {}; 
	    this.styleData = styleData;
 
	    for(p in this.concepts){
	    	this.concepts[p].clearSelect();
	    	this.concepts[p].dispose();	
	    }
	    
	    var concepts = [];
	    for(var i = 0,l=modelData.length;i<l;i++){
	      var style = styleData[modelData[i].name] || {};
	      modelData[i].bound = style.bound;
	      concepts.push(designer.addConcept(modelData[i]));
	    } 
	    for(var i = 0,l=concepts.length;i<l;i++){
	      var concept = concepts[i];
	      var hasRelations = modelData[i].hasRelations;
	      for(var j=0,ll=hasRelations.length;j<ll;j++){
	          var hasRelation = hasRelations[j];
	          var relation = hasRelation.relation;
	          var dataType = hasRelation.dataType;
	          var inverseOf = hasRelation.inverseOf;
	          var drawConnection = true;
	          concept.addHasRelation(hasRelation,drawConnection);
	      }
	    }
	    
	    for(p in this.concepts){
	    	var concept = this.concepts[p];
	    	for(var i = 0;i<concept.objectHasRelations.length;i++){
	    		this.fixedLine(concept.objectHasRelations[i]);
	    	}
	    } 
    },
    setSelections:function(sels){
    	var conceptNames = typeof sels=='string'?eval("(" + sels + ")"):sels;
    	this.clearSelections();
    	for(var i =0;i<conceptNames.length;i++){
    		this.addSelection(this.concepts[conceptNames[i]],false);
    	}
    },
	/**
	 * 重新选择一个图形.
	 */
	setSelection : function(figure) {
		this.clearSelections();
		this.addSelection(figure);
	},
	
	/**
	 * 添加选择一个图形.
	 */
	addSelection : function(figure,fireEvent) {
//		TODO test
//		return;
		
		
		if (!figure) {
			return;
		}
		if (!this.selections[figure.id]) {
			this.selections[figure.id] = figure;
			figure.setSelect();
		}
		if(figure.type=="Connection"){
			var concept = figure.concept;	
			for(var i=0;i<concept.hasRelations.length;i++){
				var hasRelation = concept.hasRelations[i];
				if(hasRelation.relation==figure.relation){
					this.addSelection(hasRelation,false);
					break;
				}
			}
		}
		if(fireEvent!=false){
		  this.dispatchEvent({eventType:'selectionchange'});
		}
	},

	/**
	 * 清除所有选择.
	 */
	clearSelections : function(fireEvent) {
		var flag = false;
		for (var p in this.selections) {
			flag = true;
			this.selections[p].clearSelect();
		}
		this.selections = {};
		if(fireEvent && flag){
			this.dispatchEvent({eventType:'selectionchange'});
		}
	},
	/**
	 * 取消选择一个图形.
	 */
	unSelection : function(figure) {
		var id = figure.id;
		figure.clearSelect();
		delete this.selections[figure.id];
	    this.dispatchEvent({eventType:'selectionchange'});
	},

	/**
	 * 执行选择.
	 */
	executeSelect : function(event, figure) {
		if (!figure) {
			return;
		}
		var count = this.getSelectionsCount();
		
	
		if (event.type == 'mousedown') {
			if (!event.ctrlKey ) {
				// *非Ctrl键的单选*/
				this.setSelection(figure);
			}
		} else {
			if (event.ctrlKey) {
				if (this.selections[figure.id]) {
					this.unSelection(figure);
				} else {
					// *按下Ctrl键进行多选*/
					this.addSelection(figure);
				}
			} else if (count > 1 && event.button != 2) {
				this.setSelection(figure);
			}
		}
	},
	
	getSelections:function(){
		var sels = [];
		for(var p in this.selections){ 
			var sel = this.selections[p];
			if(sel instanceof justep.graphics.Concept){
				sels.push({type:'Concept',name:sel.name,isExtConcept:sel.isExtConcept});
			}else if(sel instanceof justep.graphics.HasRelationConnection){ 
				sels.push({type:'HasRelationConnection',name:sel.concept.name+"|"+sel.relation});
			}else if(sel instanceof justep.graphics.HasRelation){ 
				sels.push({type:'HasRelation',name:sel.concept.name+"|"+sel.relation});
			}
		}
		sels = JSON.stringify(sels);
		return sels;
	},
	
	/**
	 * 计算框选的范围.
	 * @return {}
	 */
	_calcuSelectBound : function() {
		var minX = 15000, minY = 15000, maxX = 0, maxY = 0;
		for (var p in this.selections) {
			var figure = this.selections[p];
			if (figure instanceof justep.graphics.Rectangle) {
				var bound = figure.bound;
				minX = bound.x < minX ? bound.x : minX;
				minY = bound.y < minY ? bound.y : minY;
				maxX = (bound.x + bound.w) > maxX ? (bound.x + bound.w) : maxX;
				maxY = (bound.y + bound.h) > maxX ? (bound.y + bound.h) : maxX;
			} else {
				var points = figure.points;
				if(points){
					for (var i = 0, l = points.length; i < l; i++) {
						if (points[i].x < minX) {
							minX = points[i].x;
						} else if (points[i].x > maxX) {
							maxX = points[i].x;
						}
						if (points[i].y < minY) {
							minY = points[i].y;
						} else if (points[i].y > maxY) {
							maxY = points[i].y;
						}
					}
				}
			}
		}

		return {
			x : minX,
			y : minY,
			w : maxX - minX,
			h : maxY - minY
		};
	},

	
	/**
	 * 获得dom节点上的figure对象
	 */
	getFigureByDom : function(dom){
		var figure = null;
		while(!figure && dom!=null && dom!=document){
			figure = dom.figure;
			dom = dom.parentNode;
		}
		return figure;
	},
	
	/**
	 * java调用
	 * 添加一个图形节点
	 */
	addFigure : function (jsonStr){
		var jsons = typeof jsonStr=='string'?eval("(" + jsonStr + ")"):jsonStr;
		for(var i=0;i<jsons.length;i++){
			var json = jsons[i];
			var type = json.type;
			if(this.cursorPos && json.figureCloseToMouse){
				json.bound={x:this.cursorPos.x,y:this.cursorPos.y,w:140,h:100};
			}else if(json.x){
				json.bound={x:json.x,y:json.y,w:140,h:100};
			
			}else{
				json.bound={x:0,y:0,w:140,h:100};
			}
			
			
			if(type=="Concept"){
				var concept = this.addConcept(json);
				var hasRelationsJSON = json.hasRelations;
				for (var j = 0; j < hasRelationsJSON.length; j++) {
					this.addHasRelationToConcept(concept,hasRelationsJSON[j])
				}
			}
		}
	},
	
	/**
	 * 刷新概念
	 */
	repaintConcept :function(jsonStr){
		var jsons = typeof jsonStr == 'string'?eval("(" + jsonStr + ")"):jsonStr;
			for(var i=0;i<jsons.length;i++){
				var json = jsons[i];
				var concept = this.concepts[json.oldName];
				if(!concept){
					continue;
				}
				if(json.ooldName!=json.name){
					delete this.concepts[json.oldName];
					concept.setName(json.name);
					this.concepts[json.name] = concept;
				}
				concept.removeAllHasRelations();
//				alert("repaintConcept  "+concept.name);
				for (var j = 0; j < json.hasRelations.length; j++) {
//					alert(json.hasRelations[j].relation);
//					debugger;
					this.addHasRelationToConcept(concept,json.hasRelations[j]);
				}
		}
	},
	
	/**
	 * java调用
	 * 删除节点
	 */
	deleteFigures : function (jsonStr){
		var jsons = typeof jsonStr=='string'?eval("(" + jsonStr + ")"):jsonStr;
		for(var i=0;i<jsons.length;i++){
			var json = jsons[i];
			var type = json.type;
			var name = json.name;
			if(type=="Concept"){
				this.removeConcept(name,false);
			}
		}
	},
	
	/**
	 * 删除一个概念图形
	 */
	removeConcept : function(conceptName,fireEvent){
		var figure = this.concepts[conceptName];
		if(figure){
			var id = figure.id;
			var type = figure.type;
			if (this.selections[figure.id]) {
				this.unSelection(figure);
			}

			figure.dispose();
			
			delete this.concepts[figure.id];
		
		}
	},
	
	/**
	 * 反转选择的连接图形
	 */
	inverseSelectedRelationConnection : function(){
		for(var p in this.selections){
			var sel = this.selections[p];
			if(sel instanceof justep.graphics.HasRelationConnection){
				sel.inversePaint();
			}
		}
	},
	
	contextMenu : function(){
		var params = {eventType: "contextmenu"};
		this.dispatchEvent(params);
		this.cursorPos = {x:event.x,y:event.y};
		stopEvent(event);
	},
	
	/**
	 * 画布鼠标按下事件处理函数.
	 */
	mouseDown : function(event) { 
		  event = event || window.event;
		 if(event.button == 0){
			 this.dispatchEvent({eventType:"hidemenu"});
		 }
		if ((event.offsetX < this.container.clientWidth)
				&& (event.offsetY < (this.container.scrollTop + this.container.clientHeight))) {
			
			var figure = this.getFigureByDom(event.srcElement);
			
			//debugger;
			this.isRelationRect = event.srcElement.isRelationRect;
			            
			var x = event.clientX + this.container.scrollLeft;
			var y = event.clientY + this.container.scrollTop;

			this.mouseDownPos = { x : x, y : y }; //鼠标按下的位置
			
			this.lastPosition = { x : x, y : y };;


			/* 选择box时设置当前操作为改变图形的大小 */
			if (figure instanceof justep.graphics.Box) {
				this.currentBox = figure;
				this.currentFigure = figure.owner;
				this.currentAction = this.actionType.RESIZE;
				if (this.currentFigure.type == 'Connection') {
					this.currentAction = this.actionType.MOVE;
 					this.lineIndex = this.currentFigure.indexOfBox(figure);
 					this.currentFigure = figure;
				} else { 
					this.currentAction = this.actionType.RESIZE;
				}
				return;
			} 

			/* 如果图形存在则设置当前动作的选择图形 */
			if (figure) {
				if (this.dragLine && this.dragLine.id == figure) {
					this.currentAction = this.actionType.READY_DRAG_SELECT;
				} else {
					this.currentFigure = figure;
					this.executeSelect(event, figure);
					this.currentAction = this.actionType.SELECT;
					if (!event.ctrlKey && event.button != 2 && !this.currentFigure.cannotMove) {
						this.container.style.cursor = "move";
					}
					if (figure.type == "Connection") {
						this.lineIndex = figure.getPointIndex({ x : x, y : y });
					}
				}
				
			} else { 
				//var connection = this.getNearConnection(x, y);
//				if (connection) {
//					this.currentFigure = connection;
//					this.lineIndex = connection.getPointIndex({
//						x : x,
//						y : y
//					});
//					this.executeSelect(event, connection);
//					this.currentAction = this.actionType.SELECT;
//					if (!event.ctrlKey && event.button != 2) {
//						this.container.style.cursor = "move";
//					}
//				} else {
					/* 鼠标点在非图形元素上时清除所有选择 */
					this.clearSelections(true);
					this.currentAction = this.actionType.READY_DRAG_SELECT;
					this.fireEvent('containerFocused');
//				}
			}
		}
		stopEvent(event);
	},
	docMouseUp : function() { 
		this.mouseUp();
	},
	mouseUp : function() {  
//		document.body.unselectable = 'off';
//		document.body.onselectstart = function() {
//			return true;
//		};
		var event = window.event;
		var figure = this.getFigureByDom(event.srcElement);

		var x = event.clientX ;
		var y = event.clientY ;
		
		switch (this.currentAction) {
			case this.actionType.MOVE :
				this.endMove();
				this.fireEvent('movefigure', figure);
				break;
			case this.actionType.RESIZE :
				this.endRezie();
				this.fireEvent('resizefigure', figure);
				break;
			case this.actionType.SELECT :
				this.executeSelect(event, figure);
				break;
			case this.actionType.CREATE :
				if (event.shiftKey && this.currentType == 'Connection') {
					// XXX 当shift按下时鼠标弹起不停止线的拖动,意为用shift键来表示鼠标的按下状态.
					this.unFinishedConnection = figure;
	
				} else {
					this.endCreate(figure);
					this.fireEvent('createfigure', figure);
				}
				break;
			case this.actionType.DRAG_SELECT :
			case this.actionType.READY_DRAG_SELECT :
				this.endDragSelect();
				break;
			case this.actionType.CHANGE_CONNECTION_SOURCE : // 移动开始端点
			case this.actionType.CHANGE_CONNECTION_TARGET : // 移动结束端点
				//this.endChangeConnection(figure, x, y);
		}
		if (event.shiftKey && this.currentType == 'Connection') {
			// XXXXXX 当shift按下时鼠标弹起不停止线的拖动
		} else {

			this.currentFigure = null;
			this.isStartResize = null;
			this.currentAction = null;
			stopEvent(event);
		}

		//this.container.releaseCapture();
	},

	documentMouseUp : function() { 
		if (this.currentAction == this.actionType.MOVE) {
			this.container.style.cursor = 'default';
			this.clearGhostFigures();
			this.currentAction = null;
			this.lineIndex = -1;
		} else if (this.currentAction == this.actionType.DRAG_SELECT) {
			this.endDragSelect();
		}
	},
	mouseMove : function(event) {
		if(this.notAllowMoving){
			return;	
		}
		event = window.event;
			var dx = event.clientX - this.lastPosition.x + this.container.scrollLeft;
			var dy = event.clientY - this.lastPosition.y + this.container.scrollTop;
		if (this.currentFigure) {

			switch (this.currentAction) {
				case this.actionType.MOVE :
				    /* 移动图形 */
					this.moving(event, { dx : dx, dy : dy });
					break;
				
				case this.actionType.RESIZE :
				    /* 改变大小 */
					if (this.isStartResize) {
						this.resizing(event, { dx : dx, dy : dy });
					} else {
						this.startResize(event);// 开始改变大小
					}
					break;
				case this.actionType.SELECT :
				    /* 开始移动 */
					if ((Math.abs(event.clientX - this.mouseDownPos.x)) > 2
							|| (Math.abs(event.clientY - this.mouseDownPos.y)) > 2) {
						this.currentAction = this.actionType.MOVE;
						this.startMove(event);
					}
					break;
				case this.actionType.CHANGE_CONNECTION :

			}
			//println("clientX:"+event.clientX+"==clientY:"+event.clientY+"===y:"+this.lastPosition.y+"===dy:"+dy);
			if(dx != 0){
				this.lastPosition.x = event.clientX + this.container.scrollLeft;
			}
			if(dy != 0){
				 this.lastPosition.y = event.clientY + this.container.scrollTop;
			}
			 
		} else { 
			var figure = event.srcElement.figure;
			this.container.style.cursor = 'default';
			if (figure instanceof justep.graphics.Box) {
				this.container.style.cursor = figure.cursor;
			}
		}
		
	    // ============= 框选动作 start==========================
		if (this.currentAction == this.actionType.DRAG_SELECT) {
			//开始执行框选
			this.dragSelect(event);
		} else if (this.currentAction == this.actionType.READY_DRAG_SELECT) {
			//准备执行框选
			if ((Math.abs(event.clientX - this.mouseDownPos.x)) > 2
					|| (Math.abs(event.clientY - this.mouseDownPos.y)) > 2) {

			}
		}
		// ============= 框选动作 end==========================

		
		stopEvent(event);
	},

	/**
	 * 双击事件.
	 */
	dbclick : function() { 
		var event = window.event;
		var figure = event.srcElement.figure;
		if(figure){
			if (figure.type == "Connection") {
				var x = event.clientX ;
				var y = event.clientY;
				var p = {
					x : x,
					y : y
				};
				var idx = figure.getPointIndex(p);
	 
				figure.addPoint(idx + 1, p);
			} else if (figure instanceof justep.graphics.Box
					&& figure.owner.type == "Connection") {
				var connFigure = figure.owner; 
				var idx = connFigure.indexOfBox(figure);  
				
				connFigure.removePoint(idx);
			}
		}
		stopEvent(event);
	},

	/**
	 * 键盘按下事件.
	 */
	keyDown : function() {
		var event = window.event;
		var dx = 0, dy = 0;
		var count = this.getSelectionsCount();

		if (count > 0) {
			switch (event.keyCode) {
				case 37 :
					dx = -1;
					break;
				case 38 :
					dy = -1;
					break;
				case 39 :
					dx = 1;
					break;
				case 40 :
					dy = 1;
					break;
				case 46 : //删除
					if(this.getSelections().indexOf("\"isExtConcept\":true")==-1){
						var params = {eventType: "deleteselections"};
						this.dispatchEvent(params);
					} 
			}
			if (dx != 0 || dy != 0) {
				for (var p in this.selections) {
					var figure = this.selections[p];
					if (figure instanceof justep.graphics.Rectangle) {
						var bound = justep.apply({}, figure.bound);
						bound.x += dx;
						bound.y += dy;
						figure.setBound(bound);
					}
				}
				//this.transInterPointToArc();
				stopEvent(event);
			}
		}
//		if (event.ctrlKey && this.cancelRedoMng) {
//			if (event.keyCode == 90) { // cancel
//				this.cancelRedoMng.cancel();
//			} else if (event.keyCode == 89) { // redo
//				this.cancelRedoMng.redo();
//			}
//		}
	},

	getSelectionsCount : function() {
		var count = 0;
		for (var p in this.selections) {
			count++;
		}
		return count;
	},
	 
	/**
	 * 获得所有的连接线
	 */
	getAllConnections : function(sortBySN) {
		var conns = [];
		for (var p in this.figures) {
			if (this.figures[p] instanceof justep.graphics.Connection) {
				conns.push(this.figures[p]);
			}
		}
		if (sortBySN) {
			conns = conns.sort(function(f1, f2) {
				return (f1.sn > f2.sn) ? -1 : 1;
			});
		}
		return conns;
	},



	containerScroll : function() {

		var event = window.event;
		var target = event.srcElement;
		this.scrollLeft = target.scrollLeft;
		this.scrollTop = target.scrollTop;

	},
	dragSelect : function(event) {
		if (this.dragLine) {
			var x = event.clientX + this.container.scrollLeft;
			var y = event.clientY + this.container.scrollTop;
			var bound = this.dragLine.bound;
			bound.w = x - bound.x;
			bound.h = y - bound.y;
			this.dragLine.setBound(bound);
		}
	},
	endDragSelect : function() {
		this.currentAction = null;
		if (this.dragLine) {
			var dgBound = this.dragLine.bound;
			var array = [];
			for (var p in this.figures) {
				var figure = this.figures[p];
				if (figure instanceof justep.graphics.Rectangle
						&& !(figure instanceof justep.graphics.Box)
						&& !(figure instanceof justep.graphics.Port)) {
					if (figure.id != this.dragLine.id) {
						if (this.containInBound(dgBound, figure.bound)) {
							array.push(figure);
						}
					}
				}
			}
			for (var i = 0, l = array.length; i < l; i++) {
				this.addSelection(array[i]);
			}
			array = null;
			this.dragLine.dispose();
			this.dragLine = null;
		}
	},
	getRegularBound : function(bound) {
		var x1 = bound.x + bound.w;
		var y1 = bound.y + bound.h;
		var minX = Math.min(bound.x, x1);
		var minY = Math.min(bound.y, y1);
		return {
			x : minX,
			y : minY,
			w : Math.abs(bound.w),
			h : Math.abs(bound.h)
		};
	},
	
	
	containInBound : function(sBound, tBound) {
		sBound = this.getRegularBound(sBound);
		return Math.abs((sBound.x + sBound.x + sBound.w)
				- (tBound.x + tBound.x + tBound.w)) < (sBound.x + sBound.w
				+ tBound.x + tBound.w - sBound.x - tBound.x)
				&& Math.abs((sBound.y + sBound.y + sBound.h)
						- (tBound.y + tBound.y + tBound.h)) < (sBound.y
						+ sBound.h + tBound.y + tBound.h - sBound.y - tBound.y);
	}, 


	/**
	 * 准备绘制图形
	 */
	startReadyCreate : function(type) {
		if (type) {
			this.currentAction = this.actionType.READY_CREATE;
			this.currentType = type;
			this.container.style.cursor = "crosshair";
		} else {
			this.currentAction = null;
			this.currentType = null;
			this.container.style.cursor = 'default';
		}

	},
	/**
	 * 图形绘制结束.
	 */
	endCreate : function(figure) {
		if (this.currentType == 'Connection') {
			if (this.currentFigure && figure
					&& (figure instanceof justep.graphics.Port || this.toPort)
					&& figure.portType != 'OutPort') {// InPort
				this.currentFigure.setInPort(this.toPort);
			} else if (this.currentFigure) {
				this.currentFigure.dispose();
				this.currentFigure = null;
			}
		}
		if (this.moveOverFigure) {
			this.moveOverFigure.setPortVisible(false);
		}
		if (this.toPort) {
			this.toPort.setVisible(false);
			this.toPort.setHighLight(false);
			this.toPort = null;
		}
		if (this.fromPort) {
			this.fromPort.setVisible(false);
			this.fromPort.setHighLight(false);
			this.fromPort = null;
		}

		this.moveOverFigure = null;
		this.currentAction = null;
		this.container.style.cursor = 'default';
		if (this.currentFigure) {
			this.fireEvent('clickCreateFigure', this.currentFigure);
		}
	},
	startResize : function(event) {
		if ((Math.abs(event.clientX - this.mouseDownPos.x)) > 5
				|| (Math.abs(event.clientY - this.mouseDownPos.y)) > 5) {
			this.createGhostFigures();
			this.isStartResize = true;
		}
	},

	/**
	 * 拖动改变大小.
	 */
	resizing : function(event, offset) {
		for (var p in this.ghostFigures) {
			var figure = this.ghostFigures[p];
			var bound = figure.bound;
			switch (this.currentBox.direction) {
				case 'e' :
					bound.w += offset.dx;
					break;
				case 'w' :
					bound.x += offset.dx;
					bound.w -= offset.dx;
					break;
				case 's' :
					bound.h += offset.dy;
					break;
				case 'n' :
					bound.y += offset.dy;
					bound.h -= offset.dy;
					break;
				case 'wn' :
					bound.x += offset.dx;
					bound.y += offset.dy;
					bound.w -= offset.dx;
					bound.h -= offset.dy;
					break;
				case 'ne' :
					bound.y += offset.dy;
					bound.w += offset.dx;
					bound.h -= offset.dy;
					break;
				case 'es' :
					bound.w += offset.dx;
					bound.h += offset.dy;
					break;
				case 'sw' :
					bound.x += offset.dx;
					bound.h += offset.dy;
					bound.w -= offset.dx;
			}

			if (bound.w < 0) {
				bound.w = 0;
			}
			if (bound.h < 0) {
				bound.h = 0;
			}

			figure.setBound(bound);
		}
	},

	endRezie : function(event) {
		this.container.style.cursor = 'default';
		this.clearGhostFigures();
		this.fixedLines();
	},

	startMove : function(event) {
		if(this.currentFigure && this.currentFigure.cannotMove){
			return;	
		}
		this.container.style.cursor = "move";
		if (this.currentFigure.type == "Connection") {
			var x = event.clientX;
			var y = event.clientY ;

			if (this.lineIndex > 0
					&& this.lineIndex < this.currentFigure.points.length - 2) {
				var points = this.currentFigure.points;
			}
		} else {
			this.createGhostFigures();
		}
		this.selectBound = this._calcuSelectBound();
		document.body.unselectable = 'on';
		document.body.onselectstart = function() {
			return false;
		};
	},
	moving : function(event, offset) {
		if(this.currentFigure && this.currentFigure.cannotMove){
			return;	
		}
        if(this.isRelationRect){
        	 this.currentFigure.moveFixedPoint(offset);
        }else if (this.currentFigure.type == "Connection") {  
			//移动连接线
			var p1 = this.currentFigure.getPoint(this.lineIndex);
			var p2 = this.currentFigure.getPoint(this.lineIndex+1);
            if(p1 && p2 && p1.fixed && p2.fixed){//固定点不能移动
               this.currentFigure.movePoint(this.lineIndex,offset);	
               this.currentFigure.movePoint(this.lineIndex+1,offset);	
            }else{
	            if(p1 && p1.fixed != true){
	            	this.currentFigure.movePoint(this.lineIndex,offset);	
	            }
	            if(p2 && p2.fixed != true){
	            	this.currentFigure.movePoint(this.lineIndex+1,offset);
	            }
            }
		}else if(this.currentFigure instanceof justep.graphics.Box && this.currentFigure.owner.type == "Connection"){
		   var p = this.currentFigure.owner.getPoint(this.lineIndex);
		   if(!p.fixed){
		   	   this.currentFigure.owner.movePoint(this.lineIndex,offset);	
		   }
		} else {
			var newX = this.selectBound.x + offset.dx;
			var newY = this.selectBound.y + offset.dy;
			if (newX > 2) {
				this.selectBound.x = newX;
			} else {
				offset.dx = 0;
			}
			if (newY > 2) {
				this.selectBound.y = newY;
			} else {
				offset.dy = 0;
			}
			for (var p in this.ghostFigures) {
				var bound = justep.apply({}, this.ghostFigures[p].bound);
				bound.x = bound.x + offset.dx;
				bound.y = bound.y + offset.dy;
				// if(offset.dx && offset.dy){
				this.ghostFigures[p].setBound(bound);// .applyTransform(offset);//.setBound(bound);//
				// this.ghostFigures[p].owner.setBound(bound);
				// }
			}
		}
	},

	endMove : function(event) { 
		this.container.style.cursor = 'default';
		this.clearGhostFigures();
		this.fixedLines();
		this.currentAction = null;
		this.lineIndex = -1;
		this.currentFigure = null;
        this.dispatchEvent({eventType:'styleChanged'});
	},
	
	fixedLines : function(){
		var onlySelectConnection = null;
		for (var p in this.selections) {
			var figure = this.selections[p];
			if(figure.type=="Connection"){
				this.fixedLine(figure);
				onlySelectConnection = figure;
			}else if(figure.type=="Concept"){
				for(var i=0;i<figure.objectHasRelations.length;i++){
					this.fixedLine(figure.objectHasRelations[i]);
				}
				for(var i=0;i<figure.refMeHasRelations.length;i++){
					this.fixedLine(figure.refMeHasRelations[i]);
				}
			}
		}
	
		if(onlySelectConnection && this.getSelectionsCount()==1){
			this.setSelection(onlySelectConnection);
		}
		
	},
	
	fixedLine : function(line){
		var resultPoints1 = this.caculateInterPoint(line.points,line.targetConcept.bound);
		if(resultPoints1){
			var innerPoint = resultPoints1[0];
		    line.setPoint(line.points.length-1,{x:innerPoint.x,y:innerPoint.y});
		}
		
		var points2 = [];
		for ( var i = 0; i < line.points.length; i++) {
			points2[line.points.length-i-1]=line.points[i];
		}
		var resultPoints2 = this.caculateInterPoint(points2,line.concept.bound);
		if(resultPoints2){
			var innerPoint = resultPoints2[0];
		    line.setPoint(0,{x:innerPoint.x,y:innerPoint.y});
		}
	},
	
	/**
	 * 计算折线与方形边的交点。
	 */
	 caculateInterPoint : function(polyLinePoints,rectBound){
		rectBound = $.extend({},rectBound);
 
		var x1,y1,x2,y2;
		var resultP = {x:0,y:0};
		rectBound.width = rectBound.w;
		rectBound.height = rectBound.h;
		
		//计算折线中与交点最近的两点。
		for(var i = polyLinePoints.length-1;i>0;i--){
			if(containInRect(polyLinePoints[i].x,polyLinePoints[i].y,rectBound) == true &&
			   containInRect(polyLinePoints[i-1].x,polyLinePoints[i-1].y,rectBound) == false){
			   	 x1 = polyLinePoints[i].x;
			   	 y1 = polyLinePoints[i].y;
			   	 x2 = polyLinePoints[i-1].x;
			   	 y2 = polyLinePoints[i-1].y;
			   	 break;
			   }
		}
		if(!x1){
			return null;
		}
		
		var dx = x2-x1;
		if(dx == 0){
			dx = 1;
		}
	    var k=(y2-y1)/dx;//直线斜率
	    var b = y2 - k*x2;
	
	    var bound = rectBound;
	    var f = [];
	    f[0] = {x:bound.x,y:[bound.y,bound.y+bound.height]};
	    f[1] = {x:bound.x+bound.width,y:[bound.y,bound.y+bound.height]};
	    f[2] = {x:[bound.x,bound.x+bound.width],y:bound.y};
	    f[3] = {x:[bound.x,bound.x+bound.width],y:bound.y+bound.height};
	    
	    var minDistance = -1;
	    
	    for(var i=0;i<f.length;i++){
	    	var fx = f[i].x;
	    	var fy = f[i].y;
	    	
	    	if((typeof fx)=="number"){
	    		var tempY = k*fx+b;
	    		if(tempY>=fy[0] && tempY<=fy[1]){
	    			var dist = distance({x:fx,y:tempY},{x:x2,y:y2});
	    			if(minDistance == -1 || dist<minDistance){
	    				minDistance = dist;
		    			resultP.x = fx;
		    			resultP.y = tempY;
	    			}
	    		}
	    	}else{
	    		var tempX = (fy-b)/k;
	    		if(tempX>=fx[0] && tempX<=fx[1]){
	    			var dist = distance({x:tempX,y:fy},{x:x2,y:y2});
	    			if(minDistance == -1 || dist<minDistance){
	    				minDistance = dist;
		    			resultP.x = tempX;
		    			resultP.y = fy;
	    			}
	    		}	
	    	}
	    }
	    return [resultP,{x:x2,y:y2},{x:x1,y:y1}];
	},

	createGhostFigures : function() {
		for (var p in this.selections) {
			var figure = this.selections[p];
			if (figure instanceof justep.graphics.Rectangle) {
				var cloneFigure = figure.cloneFigure({
					border : 'NULL',
					bgColor : [0, 123, 255, 0.4]
				});
				cloneFigure.owner = figure;
				this.ghostFigures[cloneFigure.id] = cloneFigure;
			}
		}
	},
	
	getGraphicsStyle:function(){
		var style = {};
		for(var p in this.concepts){
			var concept = this.concepts[p];
			style[concept.name] = {bound:concept.getBound()};
			var objectHasRelations = concept.objectHasRelations;
			for(var i = 0,l=objectHasRelations.length;i<l;i++){
				if(objectHasRelations[i] instanceof justep.graphics.HasRelationConnection){
					style[concept.name+"|"+objectHasRelations[i].dataType] = {points:objectHasRelations[i].points,endArrow:objectHasRelations[i].arrow1,startArrow:objectHasRelations[i].arrow2};
				}
			}
		}
		return JSON.stringify(style);
	},
 
	
	/**
	 * 获取当前事件信息.
	 */
	getEventData : function() {
		return JSON.stringify(this.eventData|| {});
	},
	clearGhostFigures : function() {
		var contents = [];
		for (var p in this.ghostFigures) {
			var tempFg = this.ghostFigures[p];
			var owner = tempFg.owner;
			var bound = tempFg.bound;
			bound.w = Math.max(140,bound.w);
			bound.h = Math.max(18,bound.h);

			contents.push({
				figureId : owner.id,
				value : justep.apply({}, owner.bound)
			});
			owner.setBound(justep.apply({}, bound));
			tempFg.dispose();
			delete this.ghostFigures[p];
		}

		if (contents.length > 0 && this.cancelRedoMng) {
			this.cancelRedoMng.cacheOpt('changeShape', contents);
		}
		this.ghostFigures = {};
	},

	on : function(element, event, callback, owner) {
		function Listener(callback, owner, params) {
			if (owner && callback) {
				this.callback = function(e) {
					callback.call(owner, e, params);
				};
			} else {
				this.callback = callback;
			}
		}
		
		var linster = new Listener(callback, owner);
		element["on"+event] = linster.callback;
	},
	installListener : function() {
		this.on(this.container, 'mousedown', this.mouseDown, this);
		this.on(this.container, 'mouseup', this.mouseUp, this);
		//EventUtil.on(document,'mouseup',this.docMouseUp,this);
		this.on(this.container, "dblclick", this.dbclick, this);
		this.on(this.container, 'mousemove', this.mouseMove, this);
		this.on(this.container, 'keydown', this.keyDown, this);
		this.on(this.container, 'scroll', this.containerScroll, this);
		this.on(this.container,'contextmenu',this.contextMenu,this);
		this.container.ondragstart = function(){stopEvent(window.event);} ;
	}
}

function stopEvent(event){
	event.cancelBubble=true;
	event.returnValue=false;
}