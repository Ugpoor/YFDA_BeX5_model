<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main11" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="navData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="icon" name="icon" type="String" xid="default7"/>  
      <column label="title" name="title" type="String" xid="default8"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default9"/>  
      <data xid="default11">[{&quot;id&quot;:&quot;1&quot;,&quot;icon&quot;:&quot;icon-android-contacts&quot;,&quot;title&quot;:&quot;关于我们&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic1.w&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;icon&quot;:&quot;icon-filing&quot;,&quot;title&quot;:&quot;产品中心&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic2.w&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;icon&quot;:&quot;icon-card&quot;,&quot;title&quot;:&quot;成功案例&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic3.w&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;icon&quot;:&quot;icon-compose&quot;,&quot;title&quot;:&quot;促销活动&quot;,&quot;imgUrl&quot;:&quot;./channel/menu14Pic2.w&quot;},{&quot;id&quot;:&quot;5&quot;,&quot;icon&quot;:&quot;icon-compass&quot;,&quot;title&quot;:&quot;最新动态&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic4.w&quot;},{&quot;id&quot;:&quot;6&quot;,&quot;icon&quot;:&quot;icon-ios7-telephone&quot;,&quot;title&quot;:&quot;联系我们&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic5.w&quot;}]</data></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default10"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default11"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default12"/>  
      <column label="title" name="title" type="String" xid="default13"/>  
      <data xid="default14">[{&quot;id&quot;:&quot;1&quot;,&quot;imgSrc&quot;:&quot;./img/menu362Pic1.jpg&quot;,&quot;imgUrl&quot;:&quot;./contents/template.w&quot;,&quot;title&quot;:&quot;推荐&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;imgSrc&quot;:&quot;./img/menu362Pic6.jpg&quot;,&quot;imgUrl&quot;:&quot;./contents/template.w&quot;,&quot;title&quot;:&quot;推荐&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;imgSrc&quot;:&quot;./img/menu362Pic3.jpg&quot;,&quot;imgUrl&quot;:&quot;./contents/template.w&quot;,&quot;title&quot;:&quot;推荐&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;imgSrc&quot;:&quot;./img/menu362Pic4.jpg&quot;,&quot;imgUrl&quot;:&quot;./contents/template.w&quot;,&quot;title&quot;:&quot;推荐&quot;},{&quot;id&quot;:&quot;5&quot;,&quot;imgSrc&quot;:&quot;./img/menu362Pic5.jpg&quot;,&quot;imgUrl&quot;:&quot;./contents/template.w&quot;,&quot;title&quot;:&quot;推荐&quot;},{&quot;id&quot;:&quot;6&quot;,&quot;imgSrc&quot;:&quot;./img/menu362Pic2.jpg&quot;,&quot;imgUrl&quot;:&quot;./contents/template.w&quot;,&quot;title&quot;:&quot;推荐&quot;}]</data></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="标题"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          </div>  
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
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img bind-attr-src="$model.toUrl('./img/carouselImg.jpg')" height="240px"/> 
          </div> 
        </div>  
        <a class="left carousel-control" role="button"
          xid="a1"> 
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
            xid="span1"/>  
          <span class="sr-only" xid="span2">Previous</span> 
        </a>  
        <a class="right carousel-control" role="button"
          xid="a2"> 
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
            xid="span3"/>  
          <span class="sr-only" xid="span4">Next</span> 
        </a> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list o-navList" data="navData" disablePullToRefresh="false" disableInfiniteLoad="false">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="col-xs-2 o-nopadding text-center" bind-click="open"><i bind-css="val(&quot;icon&quot;)" /><span bind-text="ref('title')" class="x-flex"/>
  </li></ul> 
  <div class="clearfix"></div></div><div component="$UI/system/components/justep/list/list" class="x-list o-imgList" xid="list2" data="imgData">
   <ul class="x-list-template x-min-height" xid="listTemplateUl2" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl2">
    <li xid="li2" class="col-xs-6 text-center" componentname="li(html)" id="undefined_li2" bind-click="open"><img bind-attr-src="$model.toUrl($object.val('imgSrc'))" class="img-responsive"></img><span class="title" bind-text="ref('title')" xid="span6"></span></li></ul> </div></div> 
  </div> 
</div>
