<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:13px;top:202px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="美食馆"> 
        <div class="x-titlebar-left" xid="div1"/>  
        <div class="x-titlebar-title" xid="div2">美食馆</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bg-img"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents2"> 
        <div class="x-contents-content" xid="homeContent"> 
          <div component="$UI/system/components/bootstrap/carousel/carousel"
            class="x-carousel carousel" xid="carousel1"> 
            <ol class="carousel-indicators" xid="ol1"/>  
            <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
              active="0" slidable="true" wrap="true" swipe="true" xid="contents1"> 
              <div class="x-contents-content" xid="content1"> 
                <img class="image-wall x-imgBanner" bind-attr-src="$model.getImageUrl('./img/banner1.jpg')"/> 
              </div>  
              <div class="x-contents-content" xid="content2"> 
                <img class="image-wall x-imgBanner" bind-attr-src="$model.getImageUrl('./img/banner2.jpg')"/> 
              </div>  
              <div class="x-contents-content" xid="content3"> 
                <img class="image-wall x-imgBanner" bind-attr-src="$model.getImageUrl('./img/banner3.jpg')"/> 
              </div>  
              <div class="x-contents-content" xid="content4"> 
                <img class="image-wall x-imgBanner" bind-attr-src="$model.getImageUrl('./img/banner4.jpg')"/> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row x-menu"> 
            <div class="col col-xs-4" xid="col14"> 
              <div class="text-center bg-red" bind-click="openPageClick" pagename="promotion"> 
                <img src="" alt="" bind-attr-src="$model.getImageUrl('./img/menu1.png')"
                  class="x-img3"/>  
                <h5 class="text-white"><![CDATA[促销活动]]></h5> 
              </div> 
            </div>  
            <div class="col col-xs-4" xid="col15"> 
              <div class="text-center bg-red" xid="div5" bind-click="openPageClick" pagename="dynamic"> 
                <img src="" alt="" bind-attr-src="$model.getImageUrl('./img/menu2.png')"
                  xid="image2" class="x-img3"/>  
                <h5 class="text-white" xid="h511">最新动态</h5> 
              </div> 
            </div>  
            <div class="col col-xs-4" xid="col16"> 
              <div class="text-center bg-red" xid="div6" bind-click="openPageClick" pagename="contactUs"> 
                <img src="" alt="" bind-attr-src="$model.getImageUrl('./img/menu3.png')"
                  xid="image3" class="x-img3"/>  
                <h5 class="text-white" xid="h512">联系我们</h5> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row x-pic"> 
            <div class="col col-xs-6" xid="col17" bind-click="menuDetailedClick"> 
              <img src="" alt="" bind-attr-src="$model.getImageUrl('./img/1.jpg')"
                class="x-img2" xid="image6"/> 
            </div>  
            <div class="col col-xs-6" xid="col19" bind-click="menuDetailedClick"> 
              <img src="" alt="" bind-attr-src="$model.getImageUrl('./img/2.jpg')"
                class="x-img2" xid="image7"/> 
            </div>  
            <div class="col col-xs-6" xid="col18" bind-click="menuDetailedClick"> 
              <img src="" alt="" bind-attr-src="$model.getImageUrl('./img/3.jpg')"
                class="x-img2" xid="image8"/> 
            </div>  
            <div class="col col-xs-6" xid="col20" bind-click="menuDetailedClick"> 
              <img src="" alt="" bind-attr-src="$model.getImageUrl('./img/4.jpg')"
                class="x-img2" xid="image9"/> 
            </div> 
          </div>
          <div component="$UI/system/components/bootstrap/row/row" class="row x-recommended"> 
            <div class="col col-xs-12" bind-click="storeDetailedClick"> 
               <div> 
                  <span class="text-white x-flex pull-left"><![CDATA[推荐商品]]></span>  
                  <span class="x-flex pull-left"/>  
                  <span class="text-white x-flex pull-left">淘味轩</span> 
                </div>  
                <img class="x-img1" bind-attr-src="$model.getImageUrl('./img/rec1.jpg')"/>
            </div>  
            <div class="col col-xs-12" bind-click="storeDetailedClick"> 
               <div> 
                  <span class="text-white x-flex pull-left"><![CDATA[推荐商品]]></span>  
                  <span class="x-flex pull-left"/>  
                  <span class="text-white x-flex pull-left">舌尖上的湘味</span> 
                </div>  
                <img class="x-img1" bind-attr-src="$model.getImageUrl('./img/rec2.jpg')"/>
            </div>  
            <div class="col col-xs-12" bind-click="storeDetailedClick"> 
               <div> 
                  <span class="text-white x-flex pull-left"><![CDATA[推荐商品]]></span>  
                  <span class="x-flex pull-left"/>  
                  <span class="text-white x-flex pull-left">五子香辣蟹</span> 
                </div>  
                <img class="x-img1" bind-attr-src="$model.getImageUrl('./img/rec3.jpg')"/>
            </div> 
          </div>  
          
        </div>  
        <div class="x-contents-content" xid="menuContent" onActive="menuContentActive">
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="menuContainer" style="height:100%;width:100%;"/>
        </div>  
        <div class="x-contents-content" xid="storeContent" onActive="storeContentActive">
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="storeContainer" style="height:100%;width:100%;"/>
        </div>  
        <div class="x-contents-content" xid="aboutContent" onActive="aboutContentActive">
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="aboutContainer" style="height:100%;width:100%;"/>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-card"
        tabbed="true" xid="buttonGroup1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top active"
          label="首页" xid="homeBtn" icon="icon-home" target="homeContent"> 
          <i xid="i1" class="icon-home"/>  
          <span xid="span1">首页</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="菜单" xid="menuBtn" icon="icon-clipboard" target="menuContent"> 
          <i xid="i2" class="icon-clipboard"/>  
          <span xid="span2">菜单</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="商家" xid="storeBtn" icon="icon-bag" target="storeContent"> 
          <i xid="i3" class="icon-bag"/>  
          <span xid="span3">商家</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="关于" xid="aboutBtn" icon="icon-card" target="aboutContent"> 
          <i xid="i4" class="icon-card"/>  
          <span xid="span4">关于</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
