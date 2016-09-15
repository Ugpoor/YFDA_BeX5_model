<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default2"/>  
      <column label="title" name="title" type="String" xid="default3"/>  
      <column label="价格" name="price" type="Float" xid="xid1"/>  
      <data xid="default5">[{"id":"1","imgSrc":"./img/pic1.jpg","title":"黑橄榄至尊披萨","price":85},{"id":"2","imgSrc":"./img/pic2.jpg","title":"法式奶油焗薯蓉","price":63},{"id":"3","imgSrc":"./img/pic3.jpg","title":"意大利培根芝士","price":52},{"id":"4","imgSrc":"./img/pic4.jpg","title":"英式提拉米苏","price":33},{"id":"5","imgSrc":"./img/pic5.jpg","title":"白灼芥兰","price":25},{"id":"6","imgSrc":"./img/pic6.jpg","title":"高性能防水...","price":36},{"id":"7","imgSrc":"./img/pic7.jpg","title":"双卡双待入门...","price":70},{"id":"8","imgSrc":"./img/pic8.jpg","title":"iOS 7.1新增...","price":55},{"id":"9","imgSrc":"./img/pic9.jpg","title":"1299之争 小...","price":100}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="col-xs-12" bind-click="open"> 
            <div class="thumbnail media"> 
              <div class="media-left"> 
                <img bind-attr-src="$model.getImageUrl($object)" width="93"
                  class="x-img1"/> 
              </div>  
              <div class="media-body"> 
                <h5 bind-text="ref('title')" class="x-title text-black"><![CDATA[]]></h5>  
                <span xid="span2" class="text-danger"><![CDATA[￥]]></span>  
                <span xid="span3" bind-text="ref('price')" class="text-danger"/> 
              </div>  
              <div class="media-right"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-icon" label="button" xid="button1"
                  icon="icon-android-add"> 
                  <i xid="i1" class="icon-android-add text-danger"/>  
                  <span xid="span1"/> 
                </a> 
              </div> 
            </div> 
          </li> 
        </ul> 
      </div>  
    </div> 
  </div> 
</div>
