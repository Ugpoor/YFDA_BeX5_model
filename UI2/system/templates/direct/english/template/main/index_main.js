define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl("../img/"+url);
	};
	
	Model.prototype.studyClick = function(event){
		var num = event.bindingContext.$index();
		if(num==0){
			justep.Shell.showPage("writing");
		}else if(num==1){
			justep.Shell.showPage("word");
		}else if(num==2){
			justep.Shell.showPage("read");
		}else if(num==3){
			justep.Shell.showPage("listen");
		}
	};
	
	Model.prototype.footSelectClick = function(event){
		var num = event.bindingContext.$index();
		if(num==0){
			justep.Shell.showPage("composition");
		}else if(num==1){
			justep.Shell.showPage("means");
		}else if(num==2){
			justep.Shell.showPage("software");
		}
	};
	
	return Model;
});
;