<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:249px;top:58px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="content" name="content" type="String" xid="default2"/>  
      <column label="title" name="title" type="String" xid="default4"/>  
      <column label="wDate" name="wDate" type="String" xid="default5"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:40px;top:60px;" onReceive="windowReceiverReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="产品中心"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">产品中心</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents1"> 
          <div class="x-contents-content" xid="content1"> 
            <img class="image-wall x-imgBanner" bind-click="open" url="./contents/content1.w"
              xid="image2" bind-attr-src="$model.getImageUrl('../img/pic1.jpg')"/>
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img class="image-wall x-imgBanner" url="./contents/content2.w"
              xid="image2" bind-attr-src="$model.getImageUrl('../img/pic2.jpg')"/>
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img class="image-wall x-imgBanner" url="./contents/content3.w"
              xid="image3" bind-attr-src="$model.getImageUrl('../img/pic3.jpg')"/>
          </div>  
          <div class="x-contents-content" xid="content4"> 
            <img class="image-wall x-imgBanner" url="./contents/content4.w"
              xid="image4" bind-attr-src="$model.getImageUrl('../img/pic4.jpg')"/>
          </div> 
        </div> 
      </div>
      <div class="panel-body list-group-item" xid="div1">
   <h4 xid="h41" class="text-black" bind-text="data.val('title')"><![CDATA[]]></h4>
   <h4 xid="h51" class="text-red">￥ 238.00</h4></div><div bind-foreach="data.datas" class="panel-body"> 
          <span bind-text="data.val('wDate')" /><p bind-text="val('content')" /> 
        </div></div> 
  </div> 
</div>
