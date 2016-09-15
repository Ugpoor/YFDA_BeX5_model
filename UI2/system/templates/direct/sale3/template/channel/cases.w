<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"></column>
  <column label="imgSrc" name="imgSrc" type="String" xid="default2"></column>
  <column label="title" name="title" type="String" xid="default3"></column>
  <column label="价格" name="price" type="Float" xid="xid1"></column>
  <data xid="default5">[{&quot;id&quot;:&quot;1&quot;,&quot;imgSrc&quot;:&quot;./img/pic1.jpg&quot;,&quot;title&quot;:&quot;黑橄榄至尊披萨&quot;,&quot;price&quot;:85},{&quot;id&quot;:&quot;2&quot;,&quot;imgSrc&quot;:&quot;./img/pic2.jpg&quot;,&quot;title&quot;:&quot;法式奶油焗薯蓉&quot;,&quot;price&quot;:63},{&quot;id&quot;:&quot;3&quot;,&quot;imgSrc&quot;:&quot;./img/pic3.jpg&quot;,&quot;title&quot;:&quot;意大利培根芝士&quot;,&quot;price&quot;:52},{&quot;id&quot;:&quot;4&quot;,&quot;imgSrc&quot;:&quot;./img/pic4.jpg&quot;,&quot;title&quot;:&quot;英式提拉米苏&quot;,&quot;price&quot;:33},{&quot;id&quot;:&quot;5&quot;,&quot;imgSrc&quot;:&quot;./img/pic5.jpg&quot;,&quot;title&quot;:&quot;白灼芥兰&quot;,&quot;price&quot;:25},{&quot;id&quot;:&quot;6&quot;,&quot;imgSrc&quot;:&quot;./img/pic6.jpg&quot;,&quot;title&quot;:&quot;高性能防水...&quot;,&quot;price&quot;:36},{&quot;id&quot;:&quot;7&quot;,&quot;imgSrc&quot;:&quot;./img/pic7.jpg&quot;,&quot;title&quot;:&quot;双卡双待入门...&quot;,&quot;price&quot;:70},{&quot;id&quot;:&quot;8&quot;,&quot;imgSrc&quot;:&quot;./img/pic8.jpg&quot;,&quot;title&quot;:&quot;iOS 7.1新增...&quot;,&quot;price&quot;:55},{&quot;id&quot;:&quot;9&quot;,&quot;imgSrc&quot;:&quot;./img/pic9.jpg&quot;,&quot;title&quot;:&quot;1299之争 小...&quot;,&quot;price&quot;:100}]</data></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="美食推荐"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">美食推荐</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="col-xs-12" bind-click="open"> 
            <div class="thumbnail media"><div class="media-left"><img bind-attr-src="$model.getImageUrl($object)" width="93" class="x-img1" /></div>
  
  <div class="media-body"><h5 bind-text="ref('title')" class="x-title text-black"><![CDATA[]]></h5>
  <span xid="span2" class="text-danger"><![CDATA[￥]]></span>
  <span xid="span3" bind-text="ref('price')" class="text-danger"></span></div>
  <div class="media-right"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button1" icon="icon-android-add">
   <i xid="i1" class="icon-android-add text-danger"></i>
   <span xid="span1"></span></a></div></div>  
             
          </li> 
        </ul> 
      </div>  
      <div xid="parent"/>
    </div> 
  </div> 
</div>
