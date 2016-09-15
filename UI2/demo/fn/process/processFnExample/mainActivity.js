define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
	    var dlg = this.comp("wdTestProcessFn");
	    var mdata = this.comp("dataMain")
	    var cxt = this.getContext();
		$("label").each(function() {
			if (this.title == "process") {
				var self = $(this);
				self.click(function() {
					if (!mdata.saveData()) return;
				 
					dlg.open({data:{
						"fnModel": "/demo/fn/logic/fn",
						"type": self.attr("title"),
						"fn": $.trim(self.text()),
						"task": cxt.getTask()
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

	Model.prototype.dataMainAfterNew = function(event){
		var data = this.comp("dataMain");
		
		data.setValue("fFreght", Math.round(Math.random() * 10000) / 100);
		
		data.setValue("fStatus", "编辑中");
	};

	return Model;
});