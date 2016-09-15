<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="imagepicker"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">



ID：com.synconset.imagepicker</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">图片选择插件的功能是：在图库选择一张或者多张图片，返回图片的路径。根据图片路径可以访问该图片。本例中将获取到的图片路径放到了img标签中，达到了在页面显示的效果。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">



Android、iOS</p>    <div style="height:50px;padding:40px" xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="选择图片" onClick="getPicturesClick" style="width:100%;" xid="getPictures" >
<i xid="i11_1" />
<span xid="span11_1" >








选择图片</span>
</a>
</div>
    <div id="imageOutput" xid="div1_1" xui:parent="demoContent" xui:update-mode="insert" />
   <p xid="accountP"  xui:update-mode="merge-and-replace">

选择图片并点击确定后，图片将显示在页面。</p>    <p xid="p1_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[选择图片]]>
</p>
    <div style="padding:10px" xid="getPicturesClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>