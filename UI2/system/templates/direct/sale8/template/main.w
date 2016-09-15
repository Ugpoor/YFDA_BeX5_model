<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default6"/>  
      <column label="img1Url" name="imgUrl" type="String" xid="default7"/>  
      <column label="img1Title" name="imgTitle" type="String" xid="default8"/>  
      <data xid="default9">[{"id":"1","imgUrl":"./channel/menu1Pic1.w","imgTitle":"关于我们"},{"id":"2","imgUrl":"./channel/menu1Pic2.w","imgTitle":"产品中心"},{"id":"3","imgUrl":"./channel/menu1Pic3.w","imgTitle":"成功案例"},{"id":"4","imgUrl":"./channel/menu14Pic2.w","imgTitle":"促销活动"},{"id":"5","imgUrl":"./channel/menu1Pic4.w","imgTitle":"最新动态"},{"id":"6","imgUrl":"./channel/menu1Pic5.w","imgTitle":"联系我们"}]</data> 
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
    <div class="x-panel-content x-carts"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel" xid="carousel1"> 
          <ol class="carousel-indicators" xid="ol1" />  
          <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents" active="0" slidable="true" wrap="true" swipe="true" xid="contents1" style="height:240px;"> 
            <div class="x-contents-content" xid="content1"> 
              <img class="image-wall" src="./img/carouselBox33Pic1.jpg" bind-click="open" url="./contents/content1.w" style="height:240px;" /> 
            </div>  
            <div class="x-contents-content" xid="content2"> 
              <img class="image-wall" src="./img/carouselBox33Pic1.jpg" bind-click="open" url="./contents/content2.w" style="height:240px;" /> 
            </div>  
            <div class="x-contents-content" xid="content3"> 
              <img class="image-wall" src="./img/carouselBox33Pic1.jpg" bind-click="open" url="./contents/content3.w" style="height:240px;" /> 
            </div>  
            <div class="x-contents-content" xid="content4"> 
              <img class="image-wall" src="./img/carouselBox33Pic1.jpg" bind-click="open" url="./contents/content4.w" style="height:240px;" /> 
            </div> 
          </div> 
        </div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="data">
   <ul class="x-list-template x-min-height" xid="ul1" componentname="ul(html)" id="undefined_ul1">
    <li xid="li1" class="x-min-height" componentname="li(html)" id="undefined_li1" bind-click="open"><span bind-text="ref('imgTitle')" xid="span1"></span></li></ul> </div>
  </div> 
  </div> 
</div>
