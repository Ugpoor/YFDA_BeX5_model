<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <column label="title" name="title" type="String" xid="default3"/>  
      <data xid="default4">[{"id":"1","imgSrc":"./img/2648769934.jpg","title":"新旗舰即将发..."},{"id":"2","imgSrc":"./img/3061967874.jpg","title":"顶配版Galaxy..."},{"id":"3","imgSrc":"./img/1906520719.jpg","title":"WP8系统最强..."},{"id":"4","imgSrc":"./img/2147446779.jpg","title":"3G一样很快捷..."},{"id":"5","imgSrc":"./img/3612300741.jpg","title":"2014款HTC..."},{"id":"6","imgSrc":"./img/1152061419.jpg","title":"高性能防水..."},{"id":"7","imgSrc":"./img/3648705261.jpg","title":"双卡双待入门..."},{"id":"8","imgSrc":"./img/313083353.jpg","title":"iOS 7.1新增..."},{"id":"9","imgSrc":"./img/2798712298.jpg","title":"1299之争 小..."}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="热卖单品"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">热卖单品</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="col-xs-4"> 
            <div bind-click="open"> 
              <img bind-attr-src="$model.getImageUrl($object)" width="93" class="o-img"/>  
              <span bind-text="ref('title')"/> 
            </div> 
          </li> 
        </ul> 
      </div>  
      </div> 
  </div> 
</div>
