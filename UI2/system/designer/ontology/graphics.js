justep.graphics = {};
var printDiv;
var msgArray = [];
function println(msg){
	if(!printDiv){
	   printDiv = document.getElementById("printDiv");
	}
	if(printDiv){
		if(msgArray.length == 6){
			printDiv.innerHTML = "";
			msgArray = [];
		} 
		msgArray.push(msg);
		printDiv.innerText = msgArray.join("\n");
	}
} 

function isBaseType(dataType){
	var types = ["String","Float","Integer","Boolean","DateTime","Date","Time","Decimal","Blob","Text"];
	for(var i = 0,l=types.length;i<l;i++){
		if(types[i] == dataType){
			return true;
		}
	}
	return false;
}

justep.svg.Path.prototype.updateArrowPos = function(arrow){
	if(!arrow){
		return;
	}
	var sl = this.shape.length;
	var x = this.shape[sl-1].x;
	var y = this.shape[sl-1].y;
	var x2 = this.shape[sl-2].x;
	var y2 = this.shape[sl-2].y;
	var pos = x==x2?(y2>y?"up":"down"):(x2>x?"left":"right");
	arrow.setAttribute("transform", "rotate(12,"+x+","+y+")");
	if(pos=="left"){
		arrow.setAttribute("d", "M"+x+" "+y+" L"+(x+10)+" "+(y-3)+" L"+(x+10)+" "+(y+3)+" Z");
		
	}else if(pos=="right"){
		arrow.setAttribute("d", "M"+x+" "+y+" L"+(x-10)+" "+(y-3)+" L"+(x-10)+" "+(y+3)+" Z");
	}else if(pos=="up"){
		arrow.setAttribute("d", "M"+x+" "+y+" L"+(x-3)+" "+(y+10)+" L"+(x+3)+" "+(y+10)+" Z");
	}else if(pos=="down"){
		arrow.setAttribute("d", "M"+x+" "+y+" L"+(x-3)+" "+(y-10)+" L"+(x+3)+" "+(y-10)+" Z");
	}

	var offsetY = y-y2;
	var offsetX = x-x2;

	if(offsetX<0){
		offsetX = -1*offsetX;
		offsetY = -1*offsetY;
	}
	var rotateAngle = Math.atan2(offsetY, offsetX)*180/Math.PI;
	arrow.setAttribute("transform", "rotate("+rotateAngle+","+x+","+y+")");
}

var global = window.document
global.fo_shadows = new Array
function makeRectangularDropShadow(el, color, size)
{
	var i;
	for (i=size; i>0; i--)
	{
		var rect = document.createElement('div');
		var rs = rect.style
		rs.position = 'absolute';
		rs.left = (el.style.posLeft + i) + 'px';
		rs.top = (el.style.posTop + i) + 'px';
		rs.width = el.offsetWidth + 'px';
		rs.height = el.offsetHeight + 'px';
		rs.zIndex = el.style.zIndex - i;
		rs.backgroundColor = color;
		var opacity = 1 - i / (i + 1);
		rs.filter = 'alpha(opacity=' + (100 * opacity) + ')';
		el.insertAdjacentElement('afterEnd', rect);
		global.fo_shadows[global.fo_shadows.length] = rect;
	}
	el.paintShdow = true;
}

/**
 * 
 * @param {} element
 * @param {} style
 */
function setStyle(element,style){
	for(var prop in style){
		if(prop == "bound"){
			var bound = style[prop]; 
			element.style.width = bound.w+"px";
			element.style.height = bound.h+"px";
			element.style.top = bound.y+"px";
			element.style.left = bound.x+"px";
		}else{ 
			element.style[prop] = style[prop];
		}
	}
}

/**
 * 计算坐标x,y是否在直线line上.
 */
function containInLine(x,y,line){
	var d1 = distance({x:line.x1,y:line.y1},{x:x,y:y});
	var d2 = distance({x:line.x2,y:line.y2},{x:x,y:y});
	var d = distance({x:line.x2,y:line.y2},{x:line.x1,y:line.y1});
	var offset = Math.abs(d-d1-d2);
	if(offset<= 2){ 
		return true;
	}else{
		return false;
	}  
}

/**
 * 计算坐标x,y是否在指定的范围内.
 */
function containInBound(point,bound){
	bound = rebuildBound(bound);
//	bound.x-=3;
//	bound.y-=3;
//	bound.w+=2;
//	bound.h+=2;
	if(point.x>bound.x && point.x<(bound.x+bound.w) && point.y>bound.y && point.y<(bound.y+bound.h)){
		return true;
	}
	return false;
}

/**
 * 重新构造bound
 */
function rebuildBound (bound){
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
}

function containInLine_4CClick(x,y,line){
	var d1 = distance({x:line.x1,y:line.y1},{x:x,y:y});
	var d2 = distance({x:line.x2,y:line.y2},{x:x,y:y});
	var d = distance({x:line.x2,y:line.y2},{x:line.x1,y:line.y1});
	var offset = Math.abs(d-d1-d2);
	if(offset<=3.0){ 
		return true;
	}else{
		return false;
	}  
}

/**
 * 计算两点的距离.
 */
function distance(a,b) {
	var offX = a.x - b.x;
	var offY = a.y - b.y;
	return Math.sqrt(offX * offX + offY * offY);
}

function getPtInLine(a, b, d1,d2) {
	var x = (d1 / (d1 + d2)) * a.x + (d2 / (d1 + d2)) * b.x;
	var y = (d1 / (d1 + d2)) * a.y + (d2 / (d1 + d2)) * b.y;
	return {x:x, y:y};
}


function containInRect(x,y,rect){
	if(x>=rect.x && x<=rect.x+rect.width && y>=rect.y && y<=rect.y+rect.height){
		return true;
	}
	return false;
}

/**
 * 基本图形.
 */
justep.graphics.Figure = function(config) {
	this.selectable = true;
	config = config || {};
    justep.apply(this,config);
    this.id = this.id || justep.genaGUID();
	justep.graphics.Figure.superclass.constructor.call(this);
	this.properties ={};
}

justep.extend(justep.graphics.Figure, justep.util.Observable, {
	/**
	 * 设置属性值.
	 */
	setProperty:function(k,v){
		this.properties[k]=v;
		this.setDirty(true);
	},
	
	/**
	 * 根据属性名获取属性值
	 */
	getProperty:function(k){
		return properties[k]
	},
	
	setDirty:function(isDirty){
		if(this.canvas){
			this.canvas.dirty = true;
		}
	}
});

/**
 * 矩形.
 */
justep.graphics.Rectangle = function(config) {
	justep.graphics.Rectangle.superclass.constructor.call(this,justep.apply(config,{type:config.type||'Rectangle'}));
	this.bound = this.bound || {};
	
	this.bound = {x:this.bound.x||10,y:this.bound.y||10,w:(this.bound.w||100),h:(this.bound.h||30)};
	this.visible = config.visible !=false?true:false; 
	this.selectable = config.selectable !=true?false:true;
	//this.bgColor = this.bgColor;
	this.boxes = [];
	this.ports = [];//端口
	this.isRebuild = false;
}

justep.extend(justep.graphics.Rectangle, justep.graphics.Figure, {
	
	paint:function(){
		if(!this.element){
		   this.rebuildBoundByScale();
		   this.element = document.createElement("DIV");
		    this.bgColor = this.bgColor != 'NULL'?this.bgColor:null;
		   this.border = this.bgColor||"black";
		   if(this.border instanceof Array){
		   	  this.border = "black";
		   }
		   setStyle(this.element,{display:this.visible?"":"none",overflow:"hidden",position:"absolute",backgroundColor:this.bgColor,bound:this.bound,border:"1px solid "+this.border});
		   this.canvas.container.appendChild(this.element);
		   this.element.figure = this;
		   
		   this.updatePortPos();
		   for(var i =0 ,l=this.ports.length;i<l;i++){
		   	  this.canvas.add(this.ports[i]);
		   } 
		   if(this.text){
		   	  this.setText(this.text);
		   }
		}
	},
	getCenter : function(){
		return {x:this.bound.x+this.bound.w/2,y:this.bound.y+this.bound.h/2};
	},
	/**
	 * 根据当前比例重新构造bound.
	 */
	rebuildBoundByScale:function(){
		if(!this.isRebuild && !this.disenableRebuildBoundByScale){
			var scale = this.canvas.scale;
			this.bound.w = this.bound.w * scale;
			this.bound.h = this.bound.h * scale;
			this.isRebuild = true;
		}
	},
	

    /**
     * 设置文本.
     */
	setText:function(text){
		this.text = text;
		if(this.element){
			if(!this.textDiv){
				this.textDiv = document.createElement("div");
				var textBound = this._calcuTextBound(text);
				setStyle(this.textDiv ,{fontFamily:'宋体',fontSize:'9pt',wordBreak:'break-all',textAlign:'center',filter:"alpha(opacity=60)",overflow:"hidden",position:"absolute",bound:textBound});
				this.canvas.container.appendChild(this.textDiv);
				this.textDiv.figure = this;
			}else{
				this.updateTextPos();
			}
			this.textDiv.innerHTML = text;
			this.updateFlagTextPos(); 
		}
	},
	
	/**
	 * 设置标识文本.
	 */
	setFlagText:function(text){
		this.flagText = text;
		if(this.element){
			if(!this.flagTextSpan){
				this.flagTextSpan = document.createElement("span");
				var textBound = this._calcuFlagTextBound(text);
				setStyle(this.flagTextSpan ,{fontFamily:'宋体',fontSize:'9pt',textAlign:'center',filter:"alpha(opacity=60)",lineHeight:"16px",overflow:"hidden",position:"absolute",bound:textBound});
				this.canvas.container.appendChild(this.flagTextSpan);
				this.flagTextSpan.figure = this;
			}else{
				this.updateFlagTextPos(); 
			}
			this.flagTextSpan.innerHTML = text;
		}
	},
	
	/**
	 * 设置背景颜色.
	 */
	setBGColor:function(color){
		this.bgColor = color;
		if(!this.element.getEventSource){ // html div类型的图形
			this.element.style.backgroupColor = this.bgColor;
		}else{ //dojo 类型的图形
			this.element.setFill(this.bgColor);
		}
	},
	
   _calcuTextBound:function(text){
   		this.tempDiv = document.createElement("span");
   		this.canvas.container.appendChild(this.tempDiv);
   		//tempDiv.style.display="block";
   		
   		this.tempDiv.innerHTML=text;
   		var offsetW = this.tempDiv.offsetWidth +4;
   		var offsetH = this.tempDiv.offsetHeight+1;
		///document.getElementById("p1").innerHTML = text;
//		var offsetW = document.getElementById("p1").offsetWidth +4;
		offsetW = offsetW == 4?120:offsetW;
		offsetH = offsetH == 1?20:offsetH;
		var cx = this.bound.x + this.bound.w/2;
		var cy = this.bound.y + this.bound.h/2;
		this.canvas.container.removeChild(this.tempDiv);
		return {x:cx-offsetW/2+4,y:cy-(offsetH/3)+6,w:offsetW,h:offsetH}
	},
	updateTextPos:function(){
		if(this.textDiv){
			var textBound = this._calcuTextBound(this.text);
			setStyle(this.textDiv ,{bound:textBound});
			
		}
	},
   _calcuFlagTextBound:function(text){
		document.getElementById("p1").innerHTML = text;
		var offsetW = document.getElementById("p1").offsetWidth +4;
		var cx = this.bound.x + this.bound.w/2+3;
		var offset  = this.text?14:0;
		var cy = this.bound.y + this.bound.h/2-offset+2;
		
		return {x:cx-offsetW/2,y:cy-8,w:offsetW,h:20}
	},
	updateFlagTextPos:function(){
		if(this.flagTextSpan){
			var textBound = this._calcuFlagTextBound(this.flagText);
			setStyle(this.flagTextSpan ,{bound:textBound});
			
		}
	},
	
	dispose:function(autoDestroy){  
		this.canvas.remove(this);
		if(this.element){
			if(this.textDiv){
				this.canvas.container.removeChild(this.textDiv);
			}
			if(this.flagTextSpan){
				this.canvas.container.removeChild(this.flagTextSpan);
			}
			for(var i = 0,l=this.ports.length;i<l;i++){
				this.ports[i].dispose();
			}
			if(!this.element.getEventSource){ // html div类型的图形
				this.element.figure = null;
				this.canvas.container.removeChild(this.element);
			}else{ //dojo 类型的图形
//				alert("dispose dojo 类型的图形");
//				this.element.figure = null;
//				this.element.getEventSource().figure = null;
//				this.canvas.surface.remove(this.element);
				this.element.dispose();
			}
			this.element = null;
			this.textDiv = null;
			this.flagTextSpan = null;
            if(autoDestroy){
				for(var p in this){
					this[p]=null;
					delete this[p];
				}
            }
		}
	},
	setBound:function(bound){
		var offset = this.calcuOffset(bound);
		this.bound = justep.apply(this.bound,bound);
		if(this.element){
			if(!this.element.getEventSource){
				setStyle(this.element,{bound:this.bound});
			}else{
				var points = this.calcuPoints();
				this.element.setShape(points);
			}
		}
		if(this instanceof justep.graphics.Concept){
		 
		} 
		this.updateBoxPos(offset); 
		this.updateConnectionPos(offset);
		this.updateTextPos();
		this.updateFlagTextPos();
	},
	getBound:function(){
		return this.bound;
	},
	addPort:function(port){
		port.owner = this;
		this.ports.push(port);
		if(this.element){
			port.updatePos();
			this.canvas.add(port);
		}
	},
	getPortByPos:function(x,y,portType){
		for(var i =0,l=this.ports.length;i<l;i++){
			var bound = this.ports[i].bound;
			if(this.containInRect(x,y,bound)){
				if(this.ports[i].portType == portType || this.ports[i].portType == 'Port'){
				    return this.ports[i];
				} 
			}
		}
	},
	getPort:function(portType,dir){ 
		portType = portType == "InPort"?'OutPort':'Inport';
		var port = null;
		for(var i =0,l=this.ports.length;i<l;i++){
			if(this.ports[i].portType != portType){
				port = this.ports[i];
				if(this.ports[i].direction == dir){
				   return this.ports[i];
				}
			}
		}
		return port;
	},
	containInRect:function (x,y,rect){
		if(x>=rect.x && x<=rect.x+rect.w && y>=rect.y && y<=rect.y+rect.h){
			return true;
		}
		return false;
	},
	applyTransform:function(offset){
		this.bound.x += offset.dx;
		this.bound.y += offset.dy;
	    if(this.element){
			if(!this.element.getEventSource){
				setStyle(this.element,{bound:this.bound});
			}else{
				this.element.applyTransform(offset);
			}
			this.updateBoxPos(offset);
			this.updatePortPos();
			this.updateTextPos();
			this.updateFlagTextPos();
	    }
	},
	calcuOffset:function(bound){
		var offset = {dx:0,dy:0};
		if(bound.x){
			offset.dx = bound.x - this.bound.x;
		}
		if(bound.y){
			offset.dy = bound.y - this.bound.y;
		}
		return offset;
	},
	cloneFigure:function(config){
		var newFg = new justep.graphics[this.type](justep.apply({bound:this.bound,disenableRebuildBoundByScale:true},config));
		this.canvas.add(newFg);
		return newFg;
	},
	setSelect:function(){
		if(this.boxes.length>0){
			return;
		} 
		var offsetX = 5,offsetY =5;
		var x =this.bound.x,y=this.bound.y,w=this.bound.w,h=this.bound.h;
		this.createBox(x+(w/2)-offsetX,y-offsetY,"n-resize",'n');
		this.createBox(x-offsetX+w,y+(h/2)-offsetY,"e-resize",'e');
		this.createBox(x-offsetX,y+(h/2)-offsetY,"w-resize",'w');
		this.createBox(x-offsetX+(w/2),y+h-offsetY,"s-resize",'s');
		
		this.createBox(x-offsetX,y-offsetY,"nw-resize",'wn');
		this.createBox(x+w-offsetX,y-offsetY,"ne-resize",'ne');
		this.createBox(x-offsetX,y+h-offsetY,"ne-resize",'sw');                                
		this.createBox(x-offsetX+w,y+h-offsetY,"nw-resize",'es');
	},
	clearSelect:function(){
		for(var i = 0;i<this.boxes.length;i++){
			this.boxes[i].dispose();
		}
		this.boxes = [];
	},
	createBox:function(x,y,cursor,dir){
		var config = {owner:this,x:x,y:y,cursor:cursor,direction:dir};
		var box = new justep.graphics.Box(config);
		this.boxes.push(box);
		this.canvas.add(box);
	},
	updateBoxPos:function(offset){ 
		
		if(this.boxes && this.boxes.length>0){  
			var offsetX = 3,offsetY =3;
			var x =this.bound.x,y=this.bound.y,w=this.bound.w,h=this.bound.h;
		    for(var i = 0;i<this.boxes.length;i++){
		       var box = this.boxes[i];
		       switch(box.direction){
				  case 'e':
				     box.setBound({x:x+w-offsetX,y:y+(h/2)-offsetY});
				     break;
				  case 'w':
				     box.setBound({x:x-offsetX,y:y+(h/2)-offsetY});
				     break;
				  case 's':
				     box.setBound({x:x+(w/2)-offsetX,y:y+h-offsetY});
				     break;
				  case 'n':
				     box.setBound({x:x+(w/2)-offsetX,y:y-offsetY});
				     break;
		       	  case 'wn':  
		       	    box.setBound({x:x-offsetX,y:y-offsetY});
		       	    break;
		       	  case 'ne':
		       	    box.setBound({x:x+w-offsetX,y:y-offsetY});
		       	    break;
		       	  case 'sw':
		       	    box.setBound({x:x-offsetX,y:y+h-offsetY});
		       	    break;
		       	  case 'es':
		       	    box.setBound({x:x+w-offsetX,y:y+h-offsetY});
		       	    break;
		       }
		    }
		}
	},
	updateConnectionPos:function(offset){
	},
	updatePortPos:function(){
		if(this.ports){
			for(var i= 0,l=this.ports.length;i<l;i++){
				this.ports[i].updatePos(); 
			}
		}
	},
	setPortVisible:function(visible,portType){
		if(this.ports){
			for(var i= 0,l=this.ports.length;i<l;i++){
				if(portType){
					if(this.ports[i].portType == portType || this.ports[i].portType == 'Port'){
						this.ports[i].setVisible(visible);
					}
				}else{
				   this.ports[i].setVisible(visible);
				}
			}
		}
	},
	setVisible:function(visible){
		this.visible = visible;
		if(visible){  
		   this.element.style.display="";	
		}else{ 
		   this.element.style.display="none";	
		}
	},
	highLight:function(color){
		if(color){
			this.element.setFill(color);
		}else{
			this.element.setStroke("red");
			this.element.setFill("yellow");
		}
	}
});


/**
 * 小正方形
 */
justep.graphics.Box = function(config){
	config = {bound:{x:config.x+2,y:config.y+2,w:6,h:6},owner:config.owner,bgColor:'green',border:'green',cursor:config.cursor,direction:config.direction};
	justep.graphics.Box.superclass.constructor.call(this,justep.apply(config,{type:'Box'}));
}

justep.extend(justep.graphics.Box, justep.graphics.Rectangle, {
  rebuildBoundByScale:function(){}
});


/**
 * 概念
 */
justep.graphics.Concept = function(canvas,config){
	this.canvas = canvas; 
	this.objectHasRelations = []; //只记录了对象类型
	this.refMeHasRelations = [];//引用当前概念作为数据类型的关系列表
	justep.graphics.Concept.superclass.constructor.call(this,justep.apply(config,{type:config.type||'Concept'}));
	this.hasRelations = [];//一定要放后面
	this.oldConnectionPosition={};
	if(this.isExtConcept){
		this.bound.w = 140;
		this.bound.h = 18;
	}
}

justep.extend(justep.graphics.Concept, justep.graphics.Rectangle, {
	initData:function(){
		
	},
	
	/**
	 * 绘制概念本身.
	 */
	paint:function(){
		justep.graphics.Concept.superclass.paint.call(this); 
		if(this.isExtConcept){
			this.element.style.background = "#C8C8C8";
		}else{
			this.element.style.background = "#B4EEB4";
		}
		this.element.style.border = "1px solid #999999";
		var html =  "<div style='border-bottom:1px dotted #999999;height:18px;font:bold;'>"
			
//		if(this.isExtConcept){
//			html +="<label style='color:#656565'>"+(this.name||"&nbsp;")+" (ext)";
//		}else{
			html +="<label>"+(this.name||"&nbsp;");
//		}
		html += "</label><input style='left:0;top:0;position:absolute;width:100%;height:18px;border:none;border-bottom:1px solid #999999;display:none' value='"+(this.name||"&nbsp;")+"'></div><table cellspacing='0' cellpadding='0' border='0'/>";
		this.element.innerHTML=html;
		var nameLabel = this.element.firstChild.firstChild;
		var nameInput = this.element.firstChild.childNodes[1];
		
		if(!this.isExtConcept){
			this.element.firstChild.ondblclick = function(){
				document.body.onselectstart="";
				designer.notAllowMoving = true;
				nameInput.value = nameLabel.innerText;
			nameInput.style.display="";
			nameInput.focus();
		}
			
			nameInput.onkeydown = function(event){
				 if(event.keyCode == 13){
					 nameInput.onblur();
				 }
			}
		var concept = this;
		nameInput.onblur = function(){
			document.body.onselectstart=function(){return false};
			nameInput.style.display="none";
			designer.notAllowMoving = false;
			var newName = nameInput.value.replace(/(\s*)/g, "");
			if(newName==""){
				return;
			}
			if(concept.name!=newName){
				var params = {eventType: "updateconcept",name:concept.name,newName:newName};
				designer.dispatchEvent(params);
			}
		}
		}
	},
	
	setSelect : function(){
		justep.graphics.Concept.superclass.setSelect.call(this)
		this.element.style.border = "1px solid red";
	},
	
	clearSelect:function(){
		justep.graphics.Concept.superclass.clearSelect.call(this)
		this.element.style.border = "1px solid #999999";
	},
	
	/**
	 * 设置位置以及区域大小.
	 */
//	setBound:function(bound){ 
//		justep.graphics.Concept.superclass.setBound(bound);
//	},
	updateConnectionPos:function(offset){
		 for(var i=0,l=this.objectHasRelations.length;i<l;i++){  
		 	if(this.objectHasRelations[i] instanceof justep.graphics.HasRelationConnection){
		 		this.objectHasRelations[i].movePoint(0,offset); 
			 	if(!containInBound(this.objectHasRelations[i].getPoint(0),this.getBound())){
			 		this.objectHasRelations[i].setPoint(0,justep.apply(this.objectHasRelations[i].getPoint(0),this.getCenter()));
			 	}
		 	}
		 }
		 for(var i=0,l=this.refMeHasRelations.length;i<l;i++){ 
		 	var pIdx = this.refMeHasRelations[i].points.length-1;
		 	this.refMeHasRelations[i].movePoint(pIdx,offset);
		 	if(!containInBound(this.refMeHasRelations[i].getPoint(pIdx),this.getBound())){ 
		 		this.refMeHasRelations[i].setPoint(pIdx,justep.apply(this.refMeHasRelations[i].getPoint(pIdx),this.getCenter()));
		 	}
		 }
	},
	
	/**
	 * 添加hasRelation.
	 */
	addHasRelation:function(hasRelationJSON,drawConnection,refreshCalled){

		var hasRelaction = new justep.graphics.HasRelation(this,hasRelationJSON);
		if(this.element){
			hasRelaction.paint(); 
		}
		this.hasRelations.push(hasRelaction);
		
		var dataType = hasRelationJSON.dataType;
		
		if (!isBaseType(dataType) && drawConnection!=false) {
			if (dataType != this.name) {
				for(var i = 0; i<this.objectHasRelations.length;i++){
					var objectHasRelation = this.objectHasRelations[i];
					if(objectHasRelation.dataType==dataType){
						objectHasRelation.drawArrow1();
						return;
					}
				}

		        var targetConcept = designer.concepts[dataType];
		        if(targetConcept){
		        	var targetHasRelationConnections = targetConcept.objectHasRelations;
		        	for(var i = 0; i< targetHasRelationConnections.length;i++){
		        		if(targetHasRelationConnections[i].dataType==this.name){
		        			targetHasRelationConnections[i].drawArrow2();
		        			return;
		        		}
		        	}
		        }else{
		        	//TODO 添加外部概念
		        	return;
		        }
		        
//		        TODO test
//		        return;
		        
				hasRelationJSON.concept = this;
				
				var json ={concept:this,dataType:dataType};
		        var style = designer.styleData[this.name+"|"+dataType] || {};
		        json.points = style.points;
				var objectHasRelation = new justep.graphics.HasRelationConnection(
						this.canvas, json);// concept:this,relationName:relationName,dataType:dataType
				
				
				this.objectHasRelations.push(objectHasRelation);
				if (this.element) {
					objectHasRelation.paint();
					var oldPoints = this.oldConnectionPosition[objectHasRelation.dataType];
				
					if(oldPoints){
						objectHasRelation.setShape(oldPoints);
					}
				}
				
			    var targetHasRelations = designer.concepts[dataType].hasRelations;
			    for(var i = 0; i< targetHasRelations.length;i++){
			    	if(targetHasRelations[i].dataType==this.name){
			    		objectHasRelation.drawArrow2();
			        	return;
			    	}
			    }
			} else {
				hasRelationJSON.refSelf = true;
			}
		}
	},
	
	addRefMeHasRelation:function(refMeHasRelation){
		this.refMeHasRelations.push(refMeHasRelation);
	},
	
	removeObjectHasRelation:function(objectasRelation){
		for (var i = 0; i < this.objectHasRelations.length; i++) {
			if(objectasRelation == this.objectHasRelations[i]){
				this.objectHasRelations.splice(i,1);
				return;
			}
		}
	},
	
	removeRefMeHasRelation:function(refMeHasRelation){
		for (var i = 0; i < this.refMeHasRelations.length; i++) {
			if(refMeHasRelation == this.refMeHasRelations[i]){
				this.refMeHasRelations.splice(i,1);
				return;
			}
		}
	},

	
	cloneFigure:function(config){
		var newFg = new justep.graphics.Rectangle(justep.apply({bound:this.bound,disenableRebuildBoundByScale:true},config));
		this.canvas.add(newFg);
		return newFg;
	},
	
	setName:function(name){
		this.name = name;
		this.element.firstChild.firstChild.innerText = name;
	},
	
	removeAllHasRelations:function(){
		//this.element.childNodes[1].innerText ="";
		for(var i = this.objectHasRelations.length-1; i >=0; i--) {
			this.oldConnectionPosition[this.objectHasRelations[i].dataType] = this.objectHasRelations[i].points;
			
			//如果是双向，只删除一个箭头
			if(this.objectHasRelations[i].arrow2){
				var targetConcept = designer.concepts[this.objectHasRelations[i].type];
				if(this.objectHasRelations[i].arrow1){
					this.objectHasRelations[i].removeArrow1();
				}
			}else{
				this.objectHasRelations[i].dispose();
//				this.objectHasRelations.splice(i,1);
			}
		}
		

		for(var i = 0; i<this.hasRelations.length; i++) {
			var dataType = this.hasRelations[i].dataType;
			if(!isBaseType(dataType) && dataType!=this.name){
				var targetConcept = designer.concepts[dataType];
				if(targetConcept){
					for(var j = 0;j<targetConcept.objectHasRelations.length;j++){
						var objectHasRelation = targetConcept.objectHasRelations[j];
						if(objectHasRelation.dataType==this.name){
							if(objectHasRelation.arrow2){
								objectHasRelation.removeArrow2();
							}
							break;
						}
					}
				}
				
			}
		}
//		for(var i = 0; i < this.refMeHasRelations.length; i++) {
//		this.refMeHasRelations[i].dispose();
//	}
		this.hasRelations = [];
//		this.objectHasRelations = []; 
//		this.refMeHasRelations = [];
		
	},
	
	dispose:function(){
		justep.graphics.Concept.superclass.dispose.call(this);
		for(var i = this.objectHasRelations.length-1; i>=0 ; i--) {
			this.objectHasRelations[i].dispose();
		}

		for(var i = this.refMeHasRelations.length-1; i >=0; i--) {
			this.refMeHasRelations[i].dispose();
		}
		
		delete designer.concepts[this.name];
	}
});

/**
 * 对象类型的关系 
 */
justep.graphics.HasRelation = function(concept,config){
	this.cannotMove = true;
	this.concept = concept;
	justep.graphics.HasRelation.superclass.constructor.call(this,justep.apply(config,{type:config.type||'HasRelation'}));	 
}

justep.extend(justep.graphics.HasRelation, justep.graphics.Figure, {
	paint:function(){
		var tr = this.concept.element.childNodes[1].insertRow();
		tr.height=12;
		var td = tr.insertCell();
		this.element = document.createElement("SPAN");
		this.element.style.whiteSpace="nowrap";
		this.element.style.background = "#B4EEB4";
		this.element.style.height ="12px";
		this.element.style.fontSize="12px";
		td.appendChild(this.element);
		this.element.title = this.label;
		
		this.element.figure = this;

		this.element.innerHTML = this.localName+" : "+this.dataType;
	},	
	dispose:function(autoDestroy){
	
	},
	
	setSelect:function(){
		this.element.style.border ="1px solid red";
	},
	clearSelect:function(){
		this.element.style.border="";
	}
});



/**
 * 概念之间的关系.
 * @param {} config
 */
justep.graphics.HasRelationConnection = function(canvas,config) {
	this.canvas = canvas;
	config = config||{};
	config.points = config.points || [{x : 0,y : 0}, {x : 1,y : 1}];
	justep.graphics.HasRelationConnection.superclass.constructor.call(this,justep.apply(config,{type:config.type||'HasRelationConnection'}));
	this.boxes = []
	this.sn = (justep.graphics._connCount++);
	this.type = "Connection";
}

justep.extend(justep.graphics.HasRelationConnection, justep.graphics.Figure, {
	/**
	 * 设置所属的概念对象.
	 */
	setConcept:function(concept){
		this.concept = concept;
	},
	
	paint:function(){
		if(!this.element){
			if(this.dataType){
				this.targetConcept = this.canvas.getConcept(this.dataType);
			} 
			if(this.concept && this.targetConcept){
				this.targetConcept.addRefMeHasRelation(this);
				
				this.border =  this.border || "blue";
				var points = this.calcuPoints();
				
//				this.element = this.canvas.surface.createShape({type: "path"}).setStroke({color:this.border,width:1});
//				this.element.moveTo(points[0].x,points[0].y);
//				for(var i = 1;i<this.points.length;i++){
//					this.element.lineTo(this.points[i].x,this.points[i].y);
//				} 
//			    this.element.getEventSource().figure = this;
			    
			    this.element = new justep.svg.Path({parent:this.canvas.canvasElement,shape:points});
			    this.element.setStroke({color:"blue"});
			    this.element.rawNode.figure = this;
			    this.drawArrow1();
			}
		}
	},
	
	drawArrow1:function(points){
		this.arrow1 = true;
		this.element.paintEndArrow();
	},
	
	drawArrow2:function(points){
		this.arrow2 = true;
		//this.element.paintStartArrow();
	},
	
	removeArrow1:function(){
		this.arrow1= false;
		debugger;
		this.element.removeEndArrow();
	},
	
	removeArrow2:function(){
		this.arrow2= false;
		this.element.removeStartArrow();
	},
	
	updateArrow : function(points){
		if(this.arrow1){

		}
		if(this.arrow2){

		}
	}, 

	dispose:function(){  
		this.canvas.remove(this);
		if(this.element){
			this.concept.removeObjectHasRelation(this);
			this.targetConcept.removeRefMeHasRelation(this);
			this.element.dispose();
			for(var p in this){
				this[p]=null;
			} 
		}
	},
	
	
	setPoint:function(idx,newPoint){
		this.points[idx] = newPoint;
		this.setShape(this.points);
	},
	
	/**
	 * 移动折线上连接点的坐标.
	 * @param {} idx
	 * @param {} offset
	 */
	movePoint:function(idx,offset){  
		if(!this.element){
			return;
		}
		var newP = {x:this.points[idx].x +offset.dx,y:this.points[idx].y +offset.dy};
		
		//判断起点和终点是否在超出指定的范围，如果超出则不在进行移动
		if(idx == 0 && !containInBound(newP,this.concept.getBound())){
			return;
		}else if(idx  == this.points.length-1 && !containInBound(newP,this.targetConcept.getBound())){
			return;
		}
		this.points[idx].x = this.points[idx].x +offset.dx;
		this.points[idx].y = this.points[idx].y +offset.dy;
		this.setShape(this.points);
		this.updateBoxPos();
	},
	
	moveFixedPoint:function(offset){
		for(var i = 0,l=this.points.length;i<l;i++){
			if(this.points[i].fixed){
				//移动时不超出客户区，left&top
				if(this.points[i].x+offset.dx<6){
					offset.dx = 0;
				}
				if(this.points[i].y+offset.dy<25){
					offset.dy = 0;
				}
				this.movePoint(i,offset);
			}
		}
	},
	
	calcuPoints:function(){ 
		if(!this.element){ 
			//当开始坐标不在所属概念里面则取所属概念的中心作为开始坐标.
			var bound = this.concept.getBound();
			if(this.concept && !containInBound(this.points[0],{x:bound.x-3,y:bound.y-3,w:bound.w+6,h:bound.h+6})){ 
				justep.apply(this.points[0], this.concept.getCenter());
			}
			//当结束坐标不在数据类型所对应的概念里面则取概念的中心作为结束坐标.
			var bound = this.targetConcept.getBound();
			if(this.targetConcept && !containInBound(this.points[this.points.length-1],{x:bound.x-3,y:bound.y-3,w:bound.w+6,h:bound.h+6})){
				justep.apply(this.points[this.points.length-1], this.targetConcept.getCenter());
			}

		} 

		
		return this.points;
	},
	
	setSelect:function(){
		if(this.boxes.length>0){
			return;
		} 
		for(var i = 0,l=this.points.length;i<l;i++){
			if(this.points[i].fixed){
				this.boxes.push(null);
			}else{
			   this.createBox(this.points[i].x-2,this.points[i].y-2,"default");
			}
		}
		this.element.setStroke({color:'red',width:1.6});
	},
	clearSelect:function(){
		for(var i = 0;i<this.boxes.length;i++){
			if(this.boxes[i]){
			  this.boxes[i].dispose();
			}
		}
		this.boxes = [];
		this.element.setStroke({color:this.border,width:1});
	},
	createBox:function(x,y,cursor){
		var config = {owner:this,x:x,y:y,cursor:cursor};
		var box = new justep.graphics.Box(config);
		this.boxes.push(box);
		this.canvas.add(box);
	},
	
	setShape:function(shape){
		if( this.element){
		   this.element.setShape(shape);
		}
		this.updateArrow(shape);
	},
	getPoint:function(idx){
		return this.points[idx];
	},
	addPoint:function(idx,newPoint){
 
	//	this.justPoint(idx,newPoint);
		this.points.splice(idx,0,newPoint);
		if(this.element){
		  this.element.setShape(this.points);
		  this.clearSelect();
		  this.setSelect();
		}
 
	},
	getPointIndex:function(point){
		var index = -1;
		for(var i=0;i<this.points.length;i++){
			if((i+1)<this.points.length){
			  var flag = containInLine(point.x,point.y,{x1:this.points[i].x,y1:this.points[i].y,x2:this.points[i+1].x,y2:this.points[i+1].y});		 
			  if(flag == true){
	             index = i;
	             break;
			  }
			}
		}
		return index ;
	},
	justPoint:function(idx,newPoint){
		var p1 = this.points[idx-1];
		var p2 = this.points[idx];
		if(p1.x == p2.x){
			newPoint.x = p1.x;
		}else if(p1.y == p2.y){
			newPoint.y = p1.y;
		}
	},
	indexOfBox:function(box){ 
		for (var i = 0,l=this.boxes.length;i<l;i++) {
			if (this.boxes[i] == box) {
				return i;
			}
		}
		return -1;
	},
	
	/**
	 * 移除一个连接点.
	 * @param {} idx 连接点的
	 */
	removePoint:function(idx){  
		if(idx>0 && idx < (this.points.length -1)){
			if(this.points[idx].fixed != true){
				this.points.splice(idx,1);
				this.clearSelect();
				this.setShape(this.points);
				this.setSelect();
			}
	  }
	},
	updateBoxPos:function(){
		if(this.boxes.length>0){
			for(var i = 0,l=this.points.length;i<l;i++){
				if(this.boxes[i]){
			    	var bound = this.boxes[i].bound;
			    	bound.x = this.points[i].x;
			    	bound.y = this.points[i].y;
			    	this.boxes[i].setBound(bound);
				}
			}
		}
	}
});
