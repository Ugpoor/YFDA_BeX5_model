define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/components/justep/common/common");
	require("./dist/echarts-all");
	var Model = function() {
		this.isVisible = util.flag;
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
        var option = {
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['蒸发量','降水量']
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
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
                    name:'蒸发量',
                    type:'line',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                },
                {
                    name:'降水量',
                    type:'line',
                    data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                }
            ]
        };
        var myChart = echarts.init(this.getElementByXid('main'));
        myChart.setOption(option);
	};

	Model.prototype.textDataCustomRefresh = function(event){
		var textData = event.source;
        $.ajax({
            type: "GET",
            url: require.toUrl('./json/cross_text.json'),
            dataType: 'json',
            async: false,
            cache: false,
            success: function(data){
            	textData.loadData(data);
            },
            error: function(){
              throw justep.Error.create("加载数据失败");
            }
        });
	};
	
	
	Model.prototype.sourceBtnClick = function(event){
		util.showSource({
			self : this,
			type : true,
			data : "demo/pcSample/layout/table_Echarts.w&xid=window"
		},true);
	};
	
	Model.prototype.jsBtnClick = function(event){
		util.showSource({
			self : this,
			data : "demo/pcSample/layout/table_Echarts.js"
		},true);
	};
	
	return Model;
});