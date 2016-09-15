<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default7"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default8"/>  
      <column label="title" name="title" type="String" xid="default10"/>  
      <column label="price" name="price" type="Float" xid="default9"/>  
      <column label="number" name="number" type="Integer" xid="xid1"/>  
      <data xid="default11">[{"id":"1","imgSrc":"./img/pic1.jpg","title":"高梵2015韩版新款冬装时尚立领羽绒服","price":199,"number":3332},{"id":"2","imgSrc":"./img/pic2.jpg","title":"EIN言A型修身显瘦连帽羽绒服","price":1945,"number":292},{"id":"3","imgSrc":"./img/pic3.jpg","title":"皇冠绒级进口水貂皮草外套中长款整貂裘皮大衣","price":6000,"number":71},{"id":"4","imgSrc":"./img/pic4.jpg","title":"明星设计师高品质羽绒服","price":269,"number":1001},{"id":"5","imgSrc":"./img/pic5.jpg","title":"2015秋冬新款中长款宽松毛呢外套韩版时尚大码茧型毛呢大衣女","price":99,"number":3251},{"id":"6","imgSrc":"./img/pic6.jpg","title":"2015秋装新款一粒扣长袖小西装女外套修身中长款大码休闲女装西服","price":109,"number":127}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="popMenu" anchor="menuBtn"> 
    <div class="x-popMenu-overlay" xid="div1"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="关于我们" xid="button1" onClick="aboutUsClick"> 
          <i xid="i6"/>  
          <span xid="span5">关于我们</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="联系我们" xid="button2" onClick="contactUsClick"> 
          <i xid="i7"/>  
          <span xid="span6">联系我们</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="服饰"
        class="x-titlebar"> 
        <div class="x-titlebar-left"></div>  
        <div class="x-titlebar-title">服饰</div>  
        <div class="x-titlebar-right reverse">
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-navicon-round" xid="menuBtn"
            onClick="{operation:'popMenu.show'}"> 
            <i class="icon-navicon-round"/>  
            <span/> 
          </a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents1"> 
          <div class="x-contents-content" xid="content1"> 
            <img class="image-wall x-imgBanner" bind-click="open" url="./contents/content1.w"
              xid="image1" bind-attr-src="$model.getImageUrl('./img/banner1.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content2"> 
            <img class="image-wall x-imgBanner" url="./contents/content2.w"
              xid="image2" bind-attr-src="$model.getImageUrl('./img/banner2.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <img class="image-wall x-imgBanner" url="./contents/content3.w"
              xid="image3" bind-attr-src="$model.getImageUrl('./img/banner1.jpg')"/> 
          </div>  
          <div class="x-contents-content" xid="content4"> 
            <img class="image-wall x-imgBanner" url="./contents/content4.w"
              xid="image4" bind-attr-src="$model.getImageUrl('./img/banner2.jpg')"/> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row x-menu"
        xid="row4"> 
        <div class="col col-xs-3" xid="col14"> 
          <div class="text-center" bind-click="productClick" xid="div7"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top text-black"
              label="产品中心" xid="button3" icon="icon-android-storage"> 
              <i xid="i1" class="icon-android-storage"/>  
              <span xid="span1">产品中心</span>
            </a>
          </div> 
        </div>  
        <div class="col col-xs-3" xid="col2"> 
          <div class="text-center" bind-click="promotionClick" xid="div3"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top text-black"
              label="促销活动" xid="button4" icon="icon-pricetags"> 
              <i xid="i2" class="icon-pricetags"/>  
              <span xid="span2">促销活动</span>
            </a>
          </div> 
        </div>  
        <div class="col col-xs-3" xid="col15"> 
          <div class="text-center" xid="div5" bind-click="newsClick"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top text-black"
              label="最新动态" xid="button5" icon="icon-android-note"> 
              <i xid="i3" class="icon-android-note"/>  
              <span xid="span3">最新动态</span>
            </a>
          </div> 
        </div>  
        <div class="col col-xs-3" xid="col16"> 
          <div class="text-center" xid="div6" bind-click="menuClick"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top text-black"
              label="分类" xid="button6" icon="icon-android-sort"> 
              <i xid="i4" class="icon-android-sort"/>  
              <span xid="span4">分类</span>
            </a>
          </div> 
        </div> 
      </div>  
      <div class="x-productTitle">
        <h4 xid="h41" class="text-black text-center"><![CDATA[今日推荐]]></h4> 
      </div>
      <div component="$UI/system/components/justep/list/list" class="x-list x-productList"
        xid="list1" data="data" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu6 x-list-template x-min-height"
          xid="row1" componentname="$UI/system/components/bootstrap/row/row(bootstrap)"
          id="undefined_row1"> 
          <div class="col col-xs-6 x-min-height" xid="col1" componentname="$UI/system/components/bootstrap/row/row(bootstrap)#col"
            id="undefined_col1"> 
            <div bind-click="open"> 
              <img bind-attr-src="$model.getImageUrl(val('imgSrc'))" class="x-img2"/>  
              <span bind-text="ref('title')" xid="span7" class="x-flex h5 text-black"/>  
              <div>
                <span bind-text="data.ref('number')" class="pull-right"><![CDATA[]]></span>
                <span><![CDATA[￥]]></span>  
                <span bind-text="data.ref('price')" class="text-yellow"><![CDATA[]]></span> 
              </div>
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
