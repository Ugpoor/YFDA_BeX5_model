<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <data xid="default3">[{"id":"1","imgSrc":"./img/3227595611.jpg"},{"id":"2","imgSrc":"./img/3948512187.jpg"},{"id":"3","imgSrc":"./img/2060481804.jpg"},{"id":"4","imgSrc":"./img/892068505.jpg"},{"id":"5","imgSrc":"./img/3227595611.jpg"},{"id":"6","imgSrc":"./img/3948512187.jpg"},{"id":"7","imgSrc":"./img/2060481804.jpg"},{"id":"8","imgSrc":"./img/892068505.jpg"},{"id":"9","imgSrc":"./img/330033807.jpg"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="产品中心"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">产品中心</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="col-xs-4"> 
            <div> 
              <img bind-attr-src="$model.getImageUrl($object)" class="o-img"
                bind-click="open"/> 
            </div> 
          </li> 
        </ul> 
      </div>  
      </div> 
  </div> 
</div>
