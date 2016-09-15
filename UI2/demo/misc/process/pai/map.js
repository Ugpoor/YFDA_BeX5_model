define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	Model.prototype.closeWin = function(event){
		this.comp('windowReceiver1').windowCancel();
	};
	Model.prototype.windowReceiver1Receive = function(event){
		var url =  require.toUrl("./map.html");
		if(event.data){
			var coords = event.data.split('|');
			var latitude = coords[0]; 
			var longitude = coords[1];
			url = url +"?latitude=" + latitude  + "&longitude=" + longitude;
		}
	    $(this.getElementByXid('mapContent')).html('<iframe src="'+url+'" width="100%" height="100%" style="border:0;"></iframe>');
	};
	return Model;
});
