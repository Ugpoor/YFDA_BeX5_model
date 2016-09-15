define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
		/*
		 *计算出分组人数及在线人数
		 */
		var groupData=this.comp("groupData");
		groupData.refreshData();
		var contactData=this.comp("contactData");
		groupData.each(function(obj){
			var o=contactData.find(["groupID"],[obj.row.val("id")]);
			var lineCount=0;
			groupData.setValue("count",o.length,obj.row);			
			for( var i=0; i<o.length; i++){
				if(o[i].val("state")=="在线"){
					lineCount++;
				}
			}
			groupData.setValue("lineCount",lineCount,obj.row);
		});
	};
	
	Model.prototype.modelLoad = function(event){
		/*
		 *分组展开
		 */
		$(".o-group", this.getRootNode()).on("click",function(){
			var src=$(this).find(".o-groupTitle i").attr("class");
			if(src.indexOf("right")>=0){
				$(this).find(".o-groupTitle i").attr("class",src.replace("right","down"));
			} else {
				$(this).find(".o-groupTitle i").attr("class",src.replace("down","right"));
			}
		});
		
	};
	
	return Model;
});