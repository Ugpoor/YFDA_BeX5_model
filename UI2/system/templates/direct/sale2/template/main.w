<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="title" name="title" type="String" xid="xid2"/>  
      <column label="imageName" name="imageName" type="String" xid="xid3"/>  
      <column label="pagename" name="pagename" type="String" xid="xid4"/>  
      <column label="bgColor" name="bgColor" type="String" xid="xid5"/>  
      <data xid="default1">[{"id":"1","title":"关于我们","imageName":"menu11Pic1.png","pagename":"aboutUs","bgColor":"bg-blue"},{"id":"2","title":"产品中心","imageName":"menu11Pic2.png","pagename":"product","bgColor":"bg-orange"},{"id":"3","title":"成功案例","imageName":"menu11Pic3.png","pagename":"cases","bgColor":"bg-purple"},{"id":"4","title":"促销活动","imageName":"menu12Pic2.png","pagename":"promotion","bgColor":"bg-cyan"},{"id":"5","title":"最新动态","imageName":"menu13Pic1.png","pagename":"dynamic","bgColor":"bg-green"},{"id":"6","title":"联系我们","imageName":"menu13Pic3.png","pagename":"contactUs","bgColor":"bg-meired"},{"id":"7","title":"售后服务","imageName":"menu14Pic1.png","pagename":"afterSales","bgColor":"bg-orange"},{"id":"8","title":"服务项目","imageName":"menu14Pic2.png","pagename":"service","bgColor":"bg-blue"},{"id":"9","title":"企业文化","imageName":"menu2Pic9.png","pagename":"enterprise","bgColor":"bg-cyan"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="popMenu" anchor="menuBtn" direction="left-bottom" opacity="0.7"> 
    <div class="x-popMenu-overlay" xid="div14"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu2"> 
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="在线客服" xid="button2"> 
          <i xid="i2"/>  
          <span xid="span2">在线客服</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="退出" xid="button3"> 
          <i xid="i3"/>  
          <span xid="span3">退出</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="IT首页"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-navicon" xid="menuBtn" onClick="{operation:'popMenu.show'}"> 
            <i class="icon-navicon"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">IT首页</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="imgcontents" bind-click="contentstoClick"> 
          <div class="x-contents-content" xid="content1" url="./contents/content1.w"> 
            <img class="img-responsive x-img1" 
              bind-attr-src="$model.transUrl('./img/carouselBox21.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content2" url="./contents/content2.w"> 
            <img class="img-responsive x-img1"
              bind-attr-src="$model.transUrl('./img/carouselBox21.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content3" url="./contents/content3.w"> 
            <img class="img-responsive x-img1"
              bind-attr-src="$model.transUrl('./img/carouselBox21.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content4" url="./contents/content4.w"> 
            <img class="img-responsive x-img1"
              bind-attr-src="$model.transUrl('./img/carouselBox21.jpg')"/> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row panel-body x-list-template"> 
          <div class="col col-xs-4" xid="col7" bind-click="openPageClick"> 
            <div xid="div1" class="text-center" bind-css='val("bgColor")'> 
              <img xid="image1" class="x-img3" bind-attr-src="$model.transUrl($object)"/>  
              <h5 class="text-white" bind-text='val("title")'><![CDATA[]]></h5> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
