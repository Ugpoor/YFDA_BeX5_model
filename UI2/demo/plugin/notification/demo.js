define(function(require){
	var $ = require("jquery");
	require("cordova!de.appplant.cordova.plugin.local-notification");
	var utils = require("$UI/demo/plugin/utils");
	var notification=plugin.notification.local;
	var Model = function(){
		this.callParent();
	};
	Model.prototype.silentMsgClick = function(event){
		notification.schedule({
             id : 1,
          title : '我是标题!',
           text : '静音的通知!',
          sound : null,
             at : getNowPlus10Seconds()
        });
	}

	
	Model.prototype.MsgWithT_SClick = function(event){
        notification.schedule({
             id : '2', // you don't have to use an int by the way.. '1a' or just 'a' would be fine
          title : '有声的通知',
           text : '除非你手机是静音的',
             at : getNowPlus10Seconds()
        });
	};    
    function getNowPlus10Seconds() {
    	return new Date(new Date().getTime() + 10*1000);
    }	
	Model.prototype.MsgWithDataClick = function(event){
        notification.schedule({
	         id : 3,
	       text : '我是包含数据的通知，点击进入应用！',
	       json : JSON.stringify({ test: 123 }),
	         at : getNowPlus10Seconds()
        });
	};	
	Model.prototype.MsgWithBadgeClick = function(event){
        notification.schedule({
             id : 4,
          title : '更新角标(仅限iOS)',
           text : '点击取消所有通知能清除角标',
          badge : 1,
             at : getNowPlus10Seconds()
        });
	};	
	Model.prototype.MsgWithSoundEveryMinuteClick = function(event){
		notification.schedule({
             id : 5,
          title : '我会每分钟出现一次',
           text : '除非你取消了所有的通知',
          every : 'minute',
      autoClear : false,
             at : getNowPlus10Seconds()
        });
	};	

	Model.prototype.cancelAllNotificationClick = function(event){
		notification.cancelAll(function() {alert('取消所有通知')});
	};	
	Model.prototype.getNotificationIDsClick = function(event){
        cordova.plugins.notification.local.getScheduledIds(function (scheduledIds) {
            alert(scheduledIds.join(', '), null, '通知的ID是:', '关闭');
        })
	}; 
	cordova.plugins.notification.local.on("click", function (notification) {
	    alert(notification.data);
	});
	Model.prototype.modelModelConstructDone = function(event){
		utils.showCode(this, "silentMsgClick");
		utils.showCode(this, "MsgWithT_SClick");
		utils.showCode(this, "MsgWithDataClick");
		utils.showCode(this, "MsgWithBadgeClick");
		utils.showCode(this, "MsgWithSoundEveryMinuteClick");
		utils.showCode(this, "getNotificationIDsClick");
		utils.showCode(this, "cancelAllNotificationClick");	     
		utils.prettyPrint();
	};

	return Model;
});