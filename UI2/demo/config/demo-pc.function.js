define(function(require) {
	require("w!$UI/system/components/justep/touch/demo/touchjs/mainActivity.w");
	require("w!$UI/system/components/justep/windowDialog/demo/demo.w");
	require("w!$UI/system/components/justep/messageDialog/demo/demo.w");
	require("w!$UI/system/components/justep/menu/demo/base.w");
	require("w!$UI/system/components/justep/controlGroup/demo/demo.w");
	require("w!$UI/system/components/justep/list/demo/news.w");
	require("w!$UI/system/components/justep/labelEdit/demo/demo.w");
	require("w!$UI/system/components/justep/select/demo/select.w");
	require("w!$UI/system/components/justep/button/demo/checkbox.w");
	require("w!$UI/system/components/justep/button/demo/radio.w");
	require("w!$UI/system/components/justep/button/demo/toggle.w");
	require("w!$UI/system/components/justep/button/demo/button.w");
	require("w!$UI/system/components/justep/textarea/demo/textarea.w");
	require("w!$UI/system/components/justep/output/demo/output.w");
	require("w!$UI/system/components/justep/input/demo/range.w");
	require("w!$UI/system/components/justep/input/demo/input.w");
	require("w!$UI/system/components/justep/windowContainer/demo/main.w");
	require("w!$UI/system/components/justep/wing/demo/wing.w");
	require("w!$UI/system/components/justep/attachment/demo/demoSimple.w");
	require("w!$UI/system/components/justep/popMenu/demo/popMenu.w");
	require("w!$UI/system/components/justep/popOver/demo/base.w");
	require("w!$UI/system/components/justep/row/demo/base.w");
	require("w!$UI/system/components/justep/scrollView/demo/list/demo.w");
	require("w!$UI/system/components/bootstrap/row/demo/grid.w");
	require("w!$UI/system/components/justep/panel/demo/panel.w");
	require("w!$UI/system/components/justep/contents/demo/contents.w");
	require("w!$UI/system/components/justep/model/demo/model.w");
	require("w!$UI/demo/misc/todoMVC/index.w");
	require("w!$UI/takeout/index.w");
	require("w!$UI/demo/baas/complexData/index.w");
	require("w!$UI/demo/baas/masterDetail/index.w");
	require("w!$UI/demo/baas/simpleData/index.w");
	require("w!$UI/demo/baas/treeData/index.w");
	require("w!$UI/demo/baas/treeDelayLoad/index.w");
	require("w!$UI/system/components/justep/data/demo/base.w");
	require("w!$UI/system/components/justep/barcode/demo/demoBarcodeImage.w");
	require("w!$UI/system/components/justep/distpicker/demo/demo.w");
	require("w!$UI/system/components/justep/locker/demo/demo.w");
	require("w!$UI/system/components/justep/timer/demo/demo.w");
	require("w!$UI/system/components/justep/grid/demo/demo.w");
	require("w!$UI/system/components/justep/gridSelect/demo/demo.w");
	
	require("w!$UI/demo/register/indexActivity.w");
	require("w!$UI/demo/tuniu/index.w");
	require("w!$UI/demo/account/list.w");
	require("w!$UI/demo/account/index.w");
	
	require("w!$UI/demo/takeoutAdmin/index.w");
	require("w!$UI/demo/pcSample/navigator.w");
	require("w!$UI/demo/waterfall/main.w");
	require("w!$UI/demo/dataByRestful/index.w");
	require("w!$UI/demo/picCut/index.w");
	
	return {
		"$children" : [{
			"$children" : [{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "仿途牛",
				"psmCount" : "1",
				"url" : "$UI/demo/tuniu/index_main.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "外卖",
				"psmCount" : "1",
				"url" : "$UI/takeout/index.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "外卖后台管理",
				"psmCount" : "1",
				"url" : "$UI/demo/takeoutAdmin/cuisineManage.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "记账本",
				"psmCount" : "1",
				"url" : "$UI/demo/account/list.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "记账本(data访问baas)",
				"psmCount" : "1",
				"url" : "$UI/demo/account/list.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "PC端常用UI示例",
				"psmCount" : "1",
				"url" : "$UI/demo/pcSample/navigator.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "图片瀑布流",
				"psmCount" : "1",
				"url" : "$UI/demo/waterfall/main.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "图片裁剪",
				"psmCount" : "1",
				"url" : "$UI/demo/picCut/mainActivity.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "RESTful(需要server)",
				"psmCount" : "1",
				"url" : "$UI/demo/dataByRestful/index.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "简单数据",
				"psmCount" : "1",
				"url" : "$UI/demo/baas/simpleData/index.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "复杂数据",
				"psmCount" : "1",
				"url" : "$UI/demo/baas/complexData/index.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "树形数据（一次加载）",
				"psmCount" : "1",
				"url" : "$UI/demo/baas/treeData/index.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "树形数据（逐级加载）",
				"psmCount" : "1",
				"url" : "$UI/demo/baas/treeDelayLoad/index.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "主从数据",
				"psmCount" : "1",
				"url" : "$UI/demo/baas/masterDetail/index.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "TodoMVC",
				"psmCount" : "1",
				"url" : "$UI/demo/misc/todoMVC/index.w"
			} ,{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "touchjs",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/touch/demo/touchjs/mainActivity.w"
			}],			
			"$name" : "item",
			"$text" : "",
			"display" : "solid",
			"label" : "演示案例"
		}, {
			"$children" : [{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "model",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/model/demo/model.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "contents",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/contents/demo/contents.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "panel",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/panel/demo/panel.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "grid 9",
				"psmCount" : "1",
				"url" : "$UI/system/components/bootstrap/row/demo/grid.w"
			/* scrollView在外卖等例子中已经体现
			}, {
				"$name" : "item",
				"$text" : "",
				"label" : "scrollView",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/scrollView/demo/list/demo.w"
			*/
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "row",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/row/demo/base.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "popOver",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/popOver/demo/base.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "popMenu",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/popMenu/demo/popMenu.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "wing",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/wing/demo/wing.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "attachmentSimple",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/attachment/demo/demoSimple.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "windowContainer",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/windowContainer/demo/main.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"label" : "input",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/input/demo/input.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "range",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/input/demo/range.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "output",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/output/demo/output.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "textarea",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/textarea/demo/textarea.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "button",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/button/demo/button.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "toggle",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/button/demo/toggle.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "radio",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/button/demo/radio.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "checkbox",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/button/demo/checkbox.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "select",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/select/demo/select.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "labelEdit",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/labelEdit/demo/demo.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"label" : "list",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/list/demo/news.w"
			},{
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "controlGroup",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/controlGroup/demo/demo.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"label" : "menu",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/menu/demo/base.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "messageDialog",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/messageDialog/demo/demo.w"
			}, {
				"$name" : "item",
				"$text" : "",
				"display" : "solid",
				"label" : "windowDialog",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/windowDialog/demo/demo.w"
			} ,{
				"$name" : "item",
				"$text" : "",
				"label" : "data",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/data/demo/base.w"
			},{
				"$name" : "item",
				"$text" : "",
				"label" : "grid",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/grid/demo/demo.w"
			},{
				"$name" : "item",
				"$text" : "",
				"label" : "gridSelect",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/gridSelect/demo/demo.w"
			},{
				"$name" : "item",
				"$text" : "",
				"label" : "distpicker",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/distpicker/demo/demo.w"
			},{
				"$name" : "item",
				"$text" : "",
				"label" : "locker",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/locker/demo/demo.w"
			},{
				"$name" : "item",
				"$text" : "",
				"label" : "timer",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/timer/demo/demo.w"
			},
			{
				"$name" : "item",
				"$text" : "",
				"label" : "barcodeImage",
				"psmCount" : "1",
				"url" : "$UI/system/components/justep/barcode/demo/demoBarcodeImage.w"
			}],
			"$name" : "item",
			"$text" : "",
			"label" : "组件"
		} ],
		"$name" : "root",
		"$text" : ""
	};
});