/*! 
 * WeX5 v3 (http://www.justep.com) 
 * Copyright 2015 Justep, Inc.
 * Licensed under Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0) 
 */
define(function(require) {
	var $ = require("jquery");

	//引入bootstrap
	require("css!$UI/system/components/bootstrap/lib/css/bootstrap").load();
	require("$UI/system/components/bootstrap/lib/js/bootstrap");
	
	// https://github.com/seiyria/bootstrap-slider
	// 引入bootstrap-slider
	require("css!../css/bootstrap-slider").load();
	require("../js/bootstrap-slider");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.initSlider = function() {
		//初始化bootstrap-slider组件
		//代码和演示案例来自于原组件index.html
		var root = this.getRootNode();
    		/* Example 1 */
	    	$('#ex1',root).slider({
	          	formatter: function(value) {
	            	return 'Current value: ' + value;
	          	}
	        });

	    	/* Example 2 */
	        $("#ex2",root).slider({});

	        /* Example 3 */
	        var RGBChange = function() {
	          $('#RGB',root).css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	        };

	        var r = $('#R',root).slider()
	                	.on('slide', RGBChange)
	                	.data('slider');
	        var g = $('#G',root).slider()
	                	.on('slide', RGBChange)
	                	.data('slider');
	        var b = $('#B',root).slider()
	                	.on('slide', RGBChange)
	                	.data('slider');

	        /* Example 4 */
	        $("#ex4",root).slider({
	        	reversed : true
	        });

	        /* Example 5 */
	        $("#ex5",root).slider();
			$("#destroyEx5Slider",root).click(function() {
				$("#ex5",root).slider('destroy');
			});

			/* Example 6 */
			$("#ex6",root).slider();
			$("#ex6",root).on('slide', function(slideEvt) {
				$("#ex6SliderVal",root).text(slideEvt.value);
			});

			/* Example 7 */
			$("#ex7",root).slider();
			$("#ex7-enabled",root).click(function() {
				if(this.checked) {
					$("#ex7",root).slider("enable");
				}
				else {
					$("#ex7",root).slider("disable");
				}
			});

			/* Example 8 */
			$("#ex8",root).slider({
				tooltip: 'always'
			});

			/* Example 9 */
			$("#ex9",root).slider({
				precision: 2,
				value: 8.115
			});

	      	/* Example 10 */
	      	$("#ex10",root).slider({});

	      	/* Example 11 */
	      	$("#ex11",root).slider({
		        step: 20000,
		        min: 0,
		        max: 200000
	      	});

			/* Example 12 */
			$("#ex12a",root).slider({
				id: "slider12a",
				min: 0,
				max: 10,
				value: 5
            });
			$("#ex12b",root).slider({
				id: "slider12b",
				min: 0,
				max: 10,
				range: true,
				value: [ 3, 7 ]
			});
			$("#ex12c",root).slider({
				id: "slider12c",
				min: 0,
				max: 10,
				range: true,
				value: [ 3, 7 ]
			});

			/* Example 13 */
			$("#ex13",root).slider({
				ticks: [0, 100, 200, 300, 400],
				ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
				ticks_snap_bounds: 30,
				value: 200
			});

			/* Example 14 */
			$("#ex14",root).slider({
				ticks: [0, 100, 200, 300, 400],
				ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
				ticks_positions: [0, 30, 70, 90, 100],
				ticks_snap_bounds: 20,
				value: 200,
				reversed: true
			});

			/* Example 15 */
			$("#ex15",root).slider({
				min: 10,
				max: 1000,
				scale: 'logarithmic',
				step: 10
			});

			/* Example 16 */
			$("#ex16a",root).slider({
				min  : 0,
				max  : 10,
				value: 0,
				focus: true
			});
			$("#ex16b",root).slider({
				min  : 0,
				max  : 10,
				value: [ 0, 10 ],
				focus: true
			});

			/* Example 17 */
			$("#ex17a",root).slider({
				min  : 0,
				max  : 10,
				value: 0,
				tooltip_position:'bottom'
			});
			$("#ex17b",root).slider({
				min  : 0,
				max  : 10,
				value: 0,
				orientation: 'vertical',
				tooltip_position:'left'
			});
	};
	
	Model.prototype.modelLoad = function(event) {
		this.initSlider();
	};

	return Model;
});