define(function(require) {
	//var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Timer = require("$UI/system/components/justep/timer/timer");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.timerTimer = function(event) {
		this.comp('output').set('value','------执行了'+event.times+'次------');
	};

	Model.prototype.button1Click = function(event){
		this.comp('timer').start();
	};

	Model.prototype.button2Click = function(event){
		this.comp('timer').pause();
	};

	Model.prototype.button3Click = function(event){
		this.comp('timer').stop();
	};

	Model.prototype.dtimerTimer = function(event) {
		this.comp('output1').set('value','------执行了'+event.times+'次------');
	};

	Model.prototype.button4Click = function(event){
		if(!this.dtimer){
			var option = {model:this,onTimer:this.dtimerTimer.bind(this)};
			var interval = this.comp('inputInterval').val();
			if(interval){
				option.interval = justep.String.toInt(interval, 1000);
			} 
			var times = this.comp('inputTimes').val();
			if(times){
				option.times = justep.String.toInt(times, 0);
			} 
			this.dtimer = new Timer(option);
		}
	};

	Model.prototype.button8Click = function(event){
		if(this.dtimer){
		  this.dtimer.free();
		  this.dtimer = null;
		}
	};

	Model.prototype.button5Click = function(event){
		if(this.dtimer)this.dtimer.set('enabled',true);
	};

	Model.prototype.button6Click = function(event){
		if(this.dtimer)this.dtimer.pause();
	};

	Model.prototype.button7Click = function(event){
		if(this.dtimer)this.dtimer.set('enabled',false);
	};

	return Model;
});