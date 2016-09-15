define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
	    debugger;
	    var dlg = this.comp("wdTestFn");
		$("label").each(function() {
		if (this.title == "fn") {
			var self = $(this);
			self.click(function() {
			    debugger;
				dlg.open({data:{
					"fnModel": "/demo/fn/logic/fn",
					"type": self.attr("title"),
					"fn": $.trim(self.text())
				}});
			});
			self.mouseover(function() {
				self.addClass("fn-hover");
			});
			self.mouseout(function() {
				self.removeClass("fn-hover");
			});
		}
	});
	};

	return Model;
});