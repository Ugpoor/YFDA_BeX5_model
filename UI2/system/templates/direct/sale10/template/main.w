<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main12" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default3"/>  
      <column label="title" name="title" type="String" xid="default4"/>  
      <column label="content" name="content" type="String" xid="default5"/>  
      <data xid="default5">[{&quot;id&quot;:&quot;1&quot;,&quot;imgSrc&quot;:&quot;./img/menu12Pic1.jpg&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic1.w&quot;,&quot;title&quot;:&quot;关于我们&quot;,&quot;content&quot;:&quot;北京起步科技有限公司（Justep）成立于2006年7月，...&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;imgSrc&quot;:&quot;./img/menu13Pic2.jpg&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic5.w&quot;,&quot;title&quot;:&quot;联系我们&quot;,&quot;content&quot;:&quot;北京起步科技有限公司地址：北京市朝阳...&quot;}]</data></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="navData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="icon" name="icon" type="String" xid="default7"/>  
      <column label="title" name="title" type="String" xid="default8"/>  
      <column label="imgUrl" name="imgUrl" type="String" xid="default9"/>  
      <data xid="default11">[{&quot;id&quot;:&quot;1&quot;,&quot;icon&quot;:&quot;icon-android-contacts&quot;,&quot;title&quot;:&quot;关于我们&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic1.w&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;icon&quot;:&quot;icon-filing&quot;,&quot;title&quot;:&quot;产品中心&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic2.w&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;icon&quot;:&quot;icon-card&quot;,&quot;title&quot;:&quot;成功案例&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic3.w&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;icon&quot;:&quot;icon-compose&quot;,&quot;title&quot;:&quot;促销活动&quot;,&quot;imgUrl&quot;:&quot;./channel/menu14Pic2.w&quot;},{&quot;id&quot;:&quot;5&quot;,&quot;icon&quot;:&quot;icon-ios7-telephone&quot;,&quot;title&quot;:&quot;最新动态&quot;,&quot;imgUrl&quot;:&quot;./channel/menu1Pic4.w&quot;}]</data></div> 
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
          <div class="x-contents-content" xid="content1"> 
            <img bind-attr-src="$model.toUrl('./img/carouselimg.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img bind-attr-src="$model.toUrl('./img/carouselBox181.jpg')" height="240px"/> 
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img bind-attr-src="$model.toUrl('./img/carouselimg.jpg')" height="240px"/> 
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
      <div component="$UI/system/components/bootstrap/row/row" class="row o-nomargin"
        xid="row1"> 
        <div class="col col-xs-6 text-right" xid="col1"> 
          <img src="./img/logoSloganPic1.jpg"/> 
        </div>  
        <div class="col col-xs-6 text-left" xid="col2"> 
          <img src="./img/logoSloganPic2.jpg"/> 
        </div> 
      </div>  
      <h3 class="text-center">test</h3>  
      <div component="$UI/system/components/justep/list/list" class="x-list o-navList"
        data="navData"> 
        <ul class="x-list-template" xid="listTemplateUl2"> 
          <li xid="li2" class="col-xs-4" bind-click="open">
            <div bind-click="open" xid="div2" class=" text-center"> 
              <i bind-css="val(&quot;icon&quot;)" xid="i2"/>  
              <h5 class="title" bind-text="ref('title')" xid="span6"/>
            </div>
          </li>
        </ul> 
      <div class="clearfix"></div></div>  
      <div component="$UI/system/components/justep/list/list" class="x-list" data="data" xid="list1"> 
        <ul class="x-list-template x-min-height" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1"> 
          <li xid="li1" bind-click="open" componentname="li(html)" id="undefined_li1" class="list-group-item"> 
            <div class="media-left"> 
              <img style="width:66px;height:66px" class="img-rounded" bind-attr-src="$model.toUrl($object.val('imgSrc'))" /> 
            </div>  
            <div class="media-body"> 
              <h4 bind-text="ref('title')" class="o-nomargin"><![CDATA[]]></h4>
              <span bind-text="ref('content')" />
            </div>  
            <div class="media-right media-middle"> 
              <i class="icon-chevron-right" />
            </div>
          </li> 
        </ul> 
      </div></div> 
  </div> 
</div>
