<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="title" name="title" type="String" xid="xid2"/>  
      <column label="imgName" name="imgName" type="String" xid="xid3"/>  
      <column label="pageName" name="pageName" type="String" xid="xid4"/>  
      <data xid="default1">[{"id":"1","title":"关于我们","imgName":"menu61Pic1.png","pageName":"aboutUs"},{"id":"2","title":"产品中心","imgName":"menu61Pic2.png","pageName":"product"},{"id":"3","title":"成功案例","imgName":"menu61Pic3.png","pageName":"cases"},{"id":"4","title":"促销活动","imgName":"menu61Pic4.png","pageName":"promotion"},{"id":"5","title":"最新动态","imgName":"menu61Pic5.png","pageName":"dynamic"},{"id":"6","title":"联系我们","imgName":"menu61Pic6.png","pageName":"contactUs"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents1"> 
          <div class="x-contents-content" xid="content1"> 
            <img class="x-imgs" url="./contents/content1.w" bind-attr-src="$model.transUrl('./img/banner1.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img class="x-imgs" url="./contents/content1.w" bind-attr-src="$model.transUrl('./img/banner2.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img class="x-imgs" url="./contents/content1.w" bind-attr-src="$model.transUrl('./img/banner3.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content4"> 
            <img class="x-imgs" url="./contents/content1.w" bind-attr-src="$model.transUrl('./img/banner4.jpg')"/> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card"
        xid="panel1"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="data"> 
          <!--           <ul class="" xid="listTemplateUl1">  -->  
          <!--             <li xid="li1"/> -->  
          <!--           </ul>  -->  
          <div component="$UI/system/components/bootstrap/row/row" class="row text-center x-list-template"> 
            <div class="col cell col-xs-4 list-group-item" xid="col1" bind-click="openPageClick" > 
              <div> 
                <img class="x-img3" bind-attr-src="$model.transUrl($object)"/>  
                <h5 class="text-black" bind-text="ref('title')"><![CDATA[关于我们]]></h5> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div id="container" class="text-center panel-body"> 
        <span class="text-black"><![CDATA[全国]]></span>  
        <span class="h3 text-purple"><![CDATA[2636]]></span>  
        <span class="text-black"><![CDATA[家 ]]></span>  
        <span class="h3 text-purple"><![CDATA[ 8]]></span>  
        <span class="text-black"><![CDATA[大品牌]]></span> 
      </div>  
      <ul class="x-hotel"> 
        <li bind-click="detailedClick"> 
          <div class="text-center"> 
            <h4 class="text-white"><![CDATA[全 季]]></h4>  
            <div/>  
            <h5 class="text-white">爱自己 住全季</h5> 
          </div>  
          <img class="x-img1" bind-attr-src="$model.transUrl('./img/1.jpg')"/> 
        </li>  
        <li bind-click="detailedClick"> 
          <div class="text-center"> 
            <h4 class="text-white"><![CDATA[漫 心]]></h4>  
            <div/>  
            <h5 class="text-white">漫度好时光</h5> 
          </div>  
          <img class="x-img1" bind-attr-src="$model.transUrl('./img/2.jpg')"/> 
        </li>  
        <li bind-click="detailedClick"> 
          <div class="text-center"> 
            <h4 class="text-white"><![CDATA[禧 玥]]></h4>  
            <div/>  
            <h5 class="text-white">满心禧悦</h5> 
          </div>  
          <img class="x-img1" bind-attr-src="$model.transUrl('./img/3.jpg')"/> 
        </li> 
      </ul> 
    </div> 
  </div> 
</div>
