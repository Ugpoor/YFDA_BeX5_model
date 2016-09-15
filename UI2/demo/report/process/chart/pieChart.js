define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.tabItem2Select = function(event){
		var comp = this.comp("pie3d1");
		if(!comp.loaded){
			setTimeout(function(){
				comp.refresh();
			},30);
			comp.loaded = true;
		}
	};

	return Model;
});
