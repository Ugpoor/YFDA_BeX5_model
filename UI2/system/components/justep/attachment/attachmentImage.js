/*! 
* BeX5 v3 (http://www.justep.com) 
* Copyright 2015 Justep, Inc.
*/ 
define(function(require) {
	var $ = require("jquery"), 
		Component = require("$UI/system/lib/base/component"),
		Attachment = require("$UI/system/components/justep/attachment/attachment"),
		DocUtils = require('$UI/system/components/justep/docCommon/docUtil'),
		url = require.normalizeName("./attachmentImage");
	
	var ComponentConfig = require("./attachmentImage.config");
	
	require('css!./css/attachment').load();
	
	var AttachmentImage = Attachment.extend({
		showInfullScreen:function($object){
			var url = this.getPictureUrl($object);
			var bgImg = $('<div class="x-center-bg-warpper"><div class="x-center-bg-img"></div></div>');
			bgImg.find('.x-center-bg-img').css({'background-image':'url('+url+')'});
			bgImg.on('click',function(){
				bgImg.fadeOut(200,function(){
					bgImg.remove();
				});
			});
			bgImg.appendTo('body').fadeIn(200);
		}
	});	
		
	Component.register(url, AttachmentImage);
	return AttachmentImage;
});
