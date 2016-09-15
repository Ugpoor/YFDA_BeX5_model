define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var apkPath = '{{apkPath}}';
	var apkPlusPath = '{{apkPlusPath}}';
	var ipaPath = '{{ipaPath}}';
	var indexUrl = '{{indexUrl}}';
	
	var Model = function() {
		this.callParent();
		
	};
	
	Model.prototype.toUrl = function(url){
		return url ? require.toUrl(url) : "";
	};
	
	Model.prototype.modelModelConstructDone = function(event) {
		var type = this.getContext().getRequestParameter("type");
		
		if (justep.Browser.isWeChat) {
			if(type == "open"){
				location.href = indexUrl;
			}else{
				$(this.getElementByXid("weixin-tip-img")).show();
			}
		}else{
			if(justep.Browser.isAndroid){
				if(this.isBadAndroid()){
					location.href = apkPlusPath;
				}else{
					location.href = apkPath;
				}
			}else if(justep.Browser.isIOS){
				location.href = ipaPath;
			}else{
				location.href = indexUrl;
			}
		}
	};
	
	Model.prototype.isBadAndroid = function(){
		var bo = false;  
        var ua = navigator.userAgent.toLowerCase();  
        var version = ua.substr(ua.indexOf( 'android') + 8, 3);  
        if (ua.indexOf( "android" ))  
            if (parseFloat(version) < 4.4)  
                bo = true;  
        return bo;
	};

	return Model;
});