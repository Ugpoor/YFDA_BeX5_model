define(function(require) {
	var $ = require("jquery");
	
	require("./js/cropper");
	var Baas = require("$UI/system/lib/base/baas");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtnClick = function() {
		this.comp("windowReceiver1").windowCancel();
	};

	Model.prototype.modelLoad = function(event) {

		var options = {
			// data: {
			// x: 420,
			// y: 60,
			// width: 640,
			// height: 360
			// },
			// strict: false, //是否严格要求取景框必须在图片内, 默认是true
			// responsive: false,
			// checkImageOrigin: false

			modal : true, // 是否突出显示取景框，默认为true
			// guides: false, //取景框里是否有辅助线，默认是true
			// highlight: false, //这个没看明白，楼下解释
			// background: true, //是否设置背景，默认是 true

			// autoCrop: true, //是否到自动剪切模式,默认 true
			// autoCropArea: 1, //初始化完成后，取景框高度占预览图片的比例, 默认0.6
			dragCrop : false, // 是否允许用户生成取景框, 默认是true
			movable : true, // 图片是否可以移动
			// rotatable: false, //图片是否可以旋转
			zoomable : true, // 是否允许缩放图片
			touchDragZoom : true, // 是否支持手势缩放，默认为true
			// mouseWheelZoom: false, //是否支持鼠标的滚轮缩放，默认为true
			cropBoxMovable : false, // 取景框是否可以移动，默认是 true
			cropBoxResizable : true, // 用户是否能够调节取景框大小，默认为true
			// doubleClickToggle: true,

			// minCanvasWidth: 320,
			// minCanvasHeight: 180,
			// minCropBoxWidth: 160,
			// minCropBoxHeight: 90,
			// minContainerWidth: 320,
			// minContainerHeight: 180,

			// build: null,
			// built: null,
			// dragstart: null,
			// dragmove: null,
			// dragend: null,
			// zoomin: null,
			// zoomout: null,

			aspectRatio : 1 / 1, // 取景框的宽高比
			preview : '.img-preview', // 剪裁完成后，剪裁出来的图片存放地址
		/*
		 * crop: function (data) {
		 * //初始化剪切后的回调函数，可以拿到剪裁后图片在原图上的x,y,width,height,rotate
		 * $dataX.val(Math.round(data.x)); $dataY.val(Math.round(data.y));
		 * $dataHeight.val(Math.round(data.height));
		 * $dataWidth.val(Math.round(data.width));
		 * $dataRotate.val(Math.round(data.rotate)); }
		 */
		};
		$('.cropper-example-1 > img').cropper(options);

	};

	Model.prototype.button1Click = function(event) {
		this.comp("button2").set({
			"disabled" : false
		});
		$(this.getElementByXid('inputImage')).click();
	};

	Model.prototype.file1Change = function(event) {

		// 从选取文件对话框返回后，检查用户是否选择了文件，是否选择了图片文件
		if (!event.target.files) {
			return;
		}

		var $image = $('.cropper-example-1 > img');

		var $inputImage = $(this.getElementByXid('inputImage'));
		var file = event.target.files[0];

		if (/^image\/\w+$/.test(file.type)) {
			var blobURL = URL.createObjectURL(file);
			$image.one('built.cropper', function() {
				URL.revokeObjectURL(blobURL); // Revoke when load complete
			}).cropper('reset').cropper('replace', blobURL);
			$inputImage.val('');

		} else {
			this.comp("messageDialog1").show({
				"message" : '请选择图片文件！'
			});

		}

	};

	Model.prototype.button2Click = function(event) {
		this.comp("button2").set({
			"disabled" : true
		});
		var self = this;

		var result = $('.cropper-example-1 > img').cropper("getCroppedCanvas");

		var data = result.toDataURL();

		var params = {
			"image" : data,
			"PicName" : 'img.jpg'
		};
		Baas.sendRequest({
			"url" : "/justep/lawrance", // servlet请求地址
			"action" : "lawrance", // action
			"params" : params, // action对应的参数
			"success" : function(data) {// 请求成功后的回调方法
				if (data.success == "上传文件成功！") {
					self.comp("messageDialog1").show({
						"message" : data.success
					});
				} else {
					self.comp("messageDialog1").show({
						"message" : data.success
					});
				}
			}
		});

	};
	Model.prototype.messageDialog1OK = function(event) {
		var data = "./img.jpg";
		this.comp("windowDialog1").open({
			params : {
				url : data
			}
		});
	};
	return Model;
});