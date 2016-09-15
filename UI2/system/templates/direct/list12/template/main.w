<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:351px;top:119px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id" onCustomRefresh="imgDataCustomRefresh"> 
      <column name="id" type="String" xid="xid6"></column>
  <column label="小图" name="fSmallImg" type="String" xid="xid7"></column>
  <column label="大图" name="fBigImg" type="String" xid="xid1"></column></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="瀑布流布局"> 
        <div class="x-titlebar-left" xid="left1"/>  
        <div class="x-titlebar-title" xid="title1">瀑布流布局</div>  
        <div class="x-titlebar-right reverse" xid="right1"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      
      <ul id="freewall demo-test-gallery" component="$UI/system/components/justep/list/list"
        class="free-wall demo-gallery x-list x-list-template" data="imgData" xid="list1"> 
        <li class="brick"> 
          <a href='' data-size="" data-med='' data-med-size="">
          	<img src="" bind-attr-src='$model.toUrl(val("fSmallImg"))'/> 
          </a>
        </li> 
      </ul>  
       
       
       
      <div id="gallery" class="pswp" tabindex="-1" role="dialog" aria-hidden="true"> 
        <div class="pswp__bg"/>  
        <div class="pswp__scroll-wrap"> 
          <div class="pswp__container"> 
            <div class="pswp__item"/>  
            <div class="pswp__item"/>  
            <div class="pswp__item"/> 
          </div>  
          <div class="pswp__ui pswp__ui--hidden"> 
            <div class="pswp__top-bar"> 
              <div class="pswp__counter"/>  
              <button class="pswp__button pswp__button--close" title="Close (Esc)"/>  
              <button class="pswp__button pswp__button--share" title="Share"/>  
              <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"/>  
              <button class="pswp__button pswp__button--zoom" title="Zoom in/out"/>  
              <div class="pswp__preloader"> 
                <div class="pswp__preloader__icn"> 
                  <div class="pswp__preloader__cut"> 
                    <div class="pswp__preloader__donut"/> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap"> 
              <div class="pswp__share-tooltip"></div> 
            </div>  
            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"/>  
            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"/>  
            <div class="pswp__caption"> 
              <div class="pswp__caption__center"></div> 
            </div> 
          </div> 
        </div> 
      </div> 
      
    </div>  
    </div>
  <resource xid="resource2"> 
    <!--<require xid="require4" url="$UI/system/templates/direct/list12/template/js/jquery-1.10.2.min"/>   -->
    <require xid="require2" url="$UI/system/templates/direct/list12/template/freewall/freewall"/>  
    <require xid="require3" url="$UI/system/templates/direct/list12/template/freewall/index"/>
     
    <require xid="require1" url="css!$UI/system/templates/direct/list12/template/photoswipe/photoswipe"/>  
    <require xid="require5" url="css!$UI/system/templates/direct/list12/template/photoswipe/default-skin"/>  
  </resource> 
</div>
