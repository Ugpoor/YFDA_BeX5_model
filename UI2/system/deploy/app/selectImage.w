<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:282px;top:114px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col x-col-33 x-col-30" xid="iconCol"><label xid="label4" class="x-label" style="width:100%;"><![CDATA[应用图标（96x96）]]></label><img alt="" xid="iconImage" style="cursor:pointer;width:64px;" height="64px"></img>
  
  </div>
   <div class="x-col" xid="col5"><label xid="label2" class="x-label"><![CDATA[点击图片上传一个对应分辨率的图片到本地App目录。]]></label><label xid="label5" class="x-label"><![CDATA[上传的图片会根据ios和android系统的不同要求缩放为对应分辨率。]]></label><label xid="howUpdateImageLabel" class="x-label" style="cursor:pointer;" bind-click="howUpdateImageLabelClick"><![CDATA[可不选择，新建后在platforms对应目录放置。图标规范参考请点这里]]></label>
  </div>
   </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="splashPortCol">
  <label xid="label1" class="x-label" style="width:100%;"><![CDATA[纵向欢迎图片（720x1280）]]></label><img alt="" xid="splashPortImage" style="cursor:pointer;width:144px;" height="236px"></img></div>
   <div class="x-col" xid="splashLandCol"><label xid="label3" class="x-label" style="width:100%;"><![CDATA[横向欢迎图片（1280x720）]]></label><img alt="" xid="splashLandImage" style="cursor:pointer;width:320px;" height="180px"></img>
  </div>
   </div>
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelSelect1">
   <label class="x-label" xid="label6"><![CDATA[屏幕方向：]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select2" bind-optionsValue="value" bind-options="$model.getOrientationItems($object)" bind-optionsLabel="displayName" bind-ref="$model.orientation"></select></div></div>
   <div class="x-col" xid="col3"></div></div></div>
