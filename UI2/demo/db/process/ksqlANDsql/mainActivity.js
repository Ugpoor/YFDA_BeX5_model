define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
	   debugger;
	    var dlg = this.comp("wdTestSQL");
		$("label").each(function() {
		if (this.title == "ksql" || this.title == "sql") {
				var self = $(this);
				self.textBak = self.text();
				self.html(self.textBak.replace(/\\n/g, "<br>").replace(/\\t/g, "&nbsp;&nbsp;&nbsp;&nbsp;"));
				self.click(function() {
					dlg.open({data : {
						"dataModel": "/demo/common/data",
						"type": self.attr("title"),
						"sql": $.trim(self.textBak.replace(/\\n/g, "\n").replace(/\\t/g, "    ")) 
					}});
				});
				self.mouseover(function() {
					self.addClass("sql-hover");
				});
				self.mouseout(function() {
					self.removeClass("sql-hover");
				});
			}
		});
	};

	return Model;
});