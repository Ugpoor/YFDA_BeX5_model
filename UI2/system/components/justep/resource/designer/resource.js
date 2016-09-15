define(function(require){
	var $ = require("jquery"),
	ViewComponent = require("$UI/system/lib/base/viewComponent");

	var loadCss = function(cssItems){
		var values = cssItems.split(",");
		for(var i = 0;i<values.length;i+=1){
			var item = values[i];
			require([item],function(a){
				a.load();
			});	
		}			
	}
	
	var Resource = ViewComponent.extend({
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			this.$domNode = $(this.domNode);
			this.$domNode.hide();
			
		}
		
	});
	
	var Require = ViewComponent.extend({
		init: function(value, bindingContext){
			this.callParent(value, bindingContext);
			this.$domNode = $(this.domNode);
			this.$domNode.hide(); 
			var url = this.$domNode.attr("url");
			this.set({url:url});
		},
        set: function(values){ 
        	if('url' in values){
        		var url = values['url'];
        		if(url && url.indexOf("css!") !=-1){
        			loadCss(url)
        		}
        	}
        }
		
	});
	
	return {'$/UI2/system/components/justep/resource':Resource,'$/UI2/system/components/justep/resource#require':Require};
});