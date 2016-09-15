define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("./dist/echarts-all");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
		  
	};

	Model.prototype.windowReceiverReceive = function(event){
		var daySum = [];
		var time = [];
		
		var data = event.data;
		data.each(function(option){
			daySum.push(option.row.val('daySum'));
			time.push(option.row.val('times'));
		})
		
		var option = {
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['销售额']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : time
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    splitArea : {show : true}
                }
            ],
            series : [
                {
                    name:'销售额',
                    type:'bar',
                    data:daySum
                },
                           ]
        };
        var myChart = echarts.init(this.getElementByXid('main'));
        myChart.setOption(option);
		
	
	};

	Model.prototype.closeClick = function(event){
		this.comp('windowReceiver').windowCancel();
	};

	return Model;
});