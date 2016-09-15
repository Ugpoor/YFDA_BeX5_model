define(function(require){
	var $ = require("jquery");
	require("cordova!com.synconset.imagepicker");
	var utils = require("$UI/demo/plugin/utils");
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.getPicturesClick = function(event){
		document.addEventListener("deviceready", androidOnDeviceReady, false);
	function androidOnDeviceReady() {
		/*
		调用getPictures有三个参数，成功回调，失败回调和options。option参数仅限于android端使用。
		options有以下几个下参数(maximumImagesCount,width,height,quality,outputType)，说明如下
	    options = {			
			图片选择数量默认为15张，如果设置为1张，点选一张图片后即可返回该图片路径。
			最大图片选择数量，规定了每次最多选择几张图片。
            maximumImagesCount: int,
            
            图片的高度和宽度限定，举例说明:如果宽高都设定为800，图片最大为800像素*800像素，如果宽度为800，高度为0，则图片则会有800像素宽。
            如果都写成0，则按照图片大小显示	            
            width: int,
            height: int,
            
            图片质量，取值为0-100
            quality: int (0-100),
            
			导出图片的类型，默认为window.imagePicker.OutputType.FILE_URI(实际值为0)，可选window.imagePicker.OutputType.BASE64_STRING (实际值为1)
            outputType: int
	        };
	    */
		imagePicker.getPictures(androidSuccessCallback, errorCallback,
				{
					"maximumImagesCount":10,
					"width":800,
					"height":800,
					"quallity":100,
					"outputType":window.imagePicker.OutputType.FILE_URI
				}
		);
	}
	function androidSuccessCallback(result) {

      if (result.length > 0) {
        var content = '';
        var dfds = [];
        for (var i = 0; i < result.length; i++) {
          (function(){
              var dfd = $.Deferred();
              dfds.push(dfd);
             
              window.resolveLocalFileSystemURI(result[i],function(entry){
                  content += '<img src="'+ entry.toInternalURL() +'" style="max-width:200px"/>';
                  dfd.resolve();
              },function(){
                dfd.resolve();
              });
          })();
        }
        
        $.when.apply($,dfds).done(function(){
        	
          document.getElementById("imageOutput").innerHTML = content;
        });
      } else {
        // picker was cancelled
        console.log("没有选择图片");
      }
    
}
	function errorCallback(error) {
		alert("错误信息: " + JSON.stringify(error));
	}
}
	Model.prototype.modelModelConstructDone = function(event) {
		utils.showCode(this,"getPicturesClick").prettyPrint();
	};
	return Model;
});