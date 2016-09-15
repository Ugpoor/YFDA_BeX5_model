<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="menuData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default10"/>  
      <column label="title" name="title" type="String" xid="default11"/>  
      <column label="menuUrl" name="menuUrl" type="String" xid="default12"/>  
      <data xid="default13">[{"id":"1","title":"关于我们","menuUrl":"./channel/menu1Pic1.w"},{"id":"2","title":"产品中心","menuUrl":"./channel/menu1Pic2.w"},{"id":"3","title":"热卖单品","menuUrl":"./channel/menu1Pic3.w"},{"id":"4","title":"促销活动","menuUrl":"./channel/menu14Pic2.w"},{"id":"5","title":"最新动态","menuUrl":"./channel/menu1Pic4.w"},{"id":"6","title":"联系我们","menuUrl":"./channel/menu1Pic5.w"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default14"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default15"/>  
      <column label="menuUrl" name="menuUrl" type="String" xid="default16"/>  
      <data xid="default17">[{"id":"1","imgSrc":"./img/menu182Pic1.jpg","menuUrl":"./contents/content1.w"},{"id":"2","imgSrc":"./img/menu12Pic1.jpg","menuUrl":"./channel/menu1Pic1.w"},{"id":"3","imgSrc":"./img/menu13Pic2.jpg","menuUrl":"./channel/menu1Pic5.w"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="首页"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          </div>  
        <div class="x-titlebar-title">首页</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel" xid="carousel1"> 
          <ol class="carousel-indicators" xid="ol1" />  
          <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents" active="0" slidable="true" wrap="true" swipe="true" xid="contents1"> 
            <div class="x-contents-content" xid="content1"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open" url="./contents/content1.w"/> 
            </div>  
            <div class="x-contents-content" xid="content2"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open" url="./contents/content2.w"/> 
            </div>  
            <div class="x-contents-content" xid="content3"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open" url="./contents/content3.w"/> 
            </div>  
            <div class="x-contents-content" xid="content4"> 
              <img class="image-wall" src="./img/carouselBox181.jpg" bind-click="open" url="./contents/content4.w"/> 
            </div> 
          </div> 
        </div><div component="$UI/system/components/bootstrap/row/row" class="row o-nomargin x-cards"> 
          <div class="col-xs-6 o-nopadding"> 
            <div component="$UI/system/components/justep/list/list" class="x-list o-menuList" data="menuData">
   <ul class="x-list-template x-min-height" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1">
    <li xid="li1" class="x-min-height" componentname="li(html)" id="undefined_li1"><div class="panel-body" bind-click="open"> 
                    <span bind-text="val('title')" />  
                    <i class="icon-chevron-right pull-right" /> 
                  </div></li></ul> </div></div>  
          <div class="col-xs-6 o-nopadding"> 
            <div component="$UI/system/components/justep/list/list" class="x-list o-imgList" data="imgData">
   <ul class="x-list-template x-min-height" xid="listTemplateUl2" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl2">
    <li xid="li2" class="x-min-height" componentname="li(html)" id="undefined_li2"><img bind-attr-src="$model.toUrl($object)" class="o-listimg" bind-click="open(event)"/></li></ul> </div></div> 
        </div></div> 
  </div> 
</div>
