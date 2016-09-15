var cordova = require('cordova'), exec = require('cordova/exec');
module.exports = {
	    videoquality:{
	      SUPER:"3",
	      HIGHT:"2",
	      STANDARD:"1",
	      P1080:"4",
	    },
	    go2Player:function(videoinfo,onSuccess,onError){
  		  var vid =videoinfo.vid;

            if (vid !== null|| variable1 !== undefined || variable1 !== '') {
                if(vid.indexOf(".html")>0&&vid.indexOf("id_")>0){
                    var vidsplit=vid.split("id_");
                    vid=vidsplit[1];
                    vidsplit=vid.split(".html");
                    vid=vidsplit[0];
                }
            }
            videoinfo.vid=vid;
            var vinfo=videoinfo;
			exec(onSuccess, onError, "youkuplayer", "go2Player", [vinfo]);
		},	
	    doLogin:function(onSuccess,onError){
			exec(onSuccess, onError, "youkuplayer", "doLogin");
		},
		doLogout:function(onSuccess,onError){
			exec(onSuccess, onError, "youkuplayer", "doLogout");
		},
		getLoginState:function(onSuccess,onError){
			exec(onSuccess, onError, "youkuplayer", "getLoginState");
		}
};
