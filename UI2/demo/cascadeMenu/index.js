define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	    
	var Model = function() {
		this.callParent();
		this.novel = justep.Bind.observableArray()
    };
		
	Model.prototype.categoryChange = function(event){
		this.novel.removeAll();
		var categoryValue = this.comp("category").val();
		var categoryName = $(this.comp("category").domNode).find("option:selected").text();
		var me = this;
		this.comp('novelData').each(function(param){
			var novelName = param.row.val('name'),novelValue = param.row.val('value');
			if(novelValue==categoryValue){
				me.novel.push({name:novelName,value:novelValue});
			}
	    });
	    if(categoryName){
	    	this.getElementByXid("categorySpan").innerHTML = "你选择的小说类型："+categoryName;
	    	this.getElementByXid("novelSpan").innerHTML = "";
	    }
	};


	Model.prototype.novelChange = function(event){
		var novelName = $(this.comp("novel").domNode).find("option:selected").text();
		if(novelName) this.getElementByXid("novelSpan").innerHTML = "    小说名称："+novelName;
	};


	return Model;
});