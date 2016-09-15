<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="icon" name="icon" type="String" xid="default7"/>  
      <column label="title" name="title" type="String" xid="default8"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default9"/>  
      <data xid="default11">[{"id":"1","icon":"icon-android-contacts","title":"关于我们","imgUrl":"./channel/menu1Pic1.w"},{"id":"2","icon":"icon-filing","title":"产品中心","imgUrl":"./channel/menu1Pic2.w"},{"id":"3","icon":"icon-card","title":"成功案例","imgUrl":"./channel/menu1Pic3.w"},{"id":"4","icon":"icon-compose","title":"促销活动","imgUrl":"./channel/menu14Pic2.w"},{"id":"5","icon":"icon-compass","title":"最新动态","imgUrl":"./channel/menu1Pic4.w"},{"id":"6","icon":"icon-ios7-telephone","title":"联系我们","imgUrl":"./channel/menu1Pic5.w"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="标题"
        class="x-titlebar"> 
        <div class="x-titlebar-left"></div>  
        <div class="x-titlebar-title">标题</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents1" style="height:240px;"> 
          <div class="x-contents-content" xid="content1" style="background: #fff repeat-x"> 
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"
              xid="image1"/>
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"
              xid="image2"/>
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"
              xid="image3"/>
          </div> 
        </div>  
        <a class="left carousel-control" role="button" xid="a1"> 
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
            xid="span1"/>  
          <span class="sr-only" xid="span2">Previous</span>
        </a>  
        <a class="right carousel-control" role="button" xid="a2"> 
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
            xid="span3"/>  
          <span class="sr-only" xid="span4">Next</span>
        </a> 
      </div>
      <div component="$UI/system/components/justep/list/list" class="x-list o-navList"
        xid="list1" data="data"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="col-xs-6 text-center" bind-click="open"> 
            <i bind-css="val(&quot;icon&quot;)" xid="i1"/>  
            <h5 bind-text="ref('title')" xid="h51"/>
          </li> 
        </ul> 
      </div>
    </div> 
  </div> 
</div>
