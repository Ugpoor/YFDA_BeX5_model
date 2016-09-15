
define(function(require){
	var $ = require("jquery");
	var Bind = require("bind");
	var CID_ATTR = "__cid";
	
	function hook(owner, name, fn){
		if (owner[name] && fn){
			// Save a reference to the original method
			var old = owner[name];

			// Create a new method
			owner[name] = function() {
				// Call the original method
				var r = old.apply(this, arguments);
				fn.apply(this, arguments);
				// Return the original methods result
				return r;
			};				
		}
	}
	
	function processCid(node, cid){
		if ((node.nodeType === 1) && !node.getAttribute(CID_ATTR)){
			node.setAttribute(CID_ATTR, cid);
    		var c = node.getAttribute("class");
    		if (c){
    			c = c + " " + cid;
    		}else{
    			c = cid;
    		}
    		node.setAttribute("class", c);
			
			for (var i=0; i<node.childNodes.length; i++){
				processCid(node.childNodes[i], cid);
			}
		}
	}
	
	hook($.fn, "domNodeInserting", function(){
		if (arguments.length > 0){
			var parentNode = arguments[0];
			if (parentNode){
				if (parentNode.length)
					parentNode = parentNode[0];
				//if (!parentNode.getAttribute) //在ie11中parentNode.getAttribute会报错
				if (parentNode.nodeType != 1)
					return;
				var cid = parentNode.getAttribute(CID_ATTR);
				var isOutter = parentNode.getAttribute("__outter");
				if (!isOutter && cid){
					var node = arguments[1];
					if (node.nodeType == 1){
						processCid(node, cid);
					}else if (node.nodeType == 11 || node.nodeType == 9){
						var children = $(node).children();
						for (var i=0; i<children.length; i++){
							processCid(children[i], cid);
						}
					}
				}
			}
		}
	});
});