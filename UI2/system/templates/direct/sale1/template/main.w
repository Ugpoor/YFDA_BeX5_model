<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:57px;top:201px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <span xid="span1" class="h3 text-white"><![CDATA[start]]></span> 
        </div>  
        <div class="x-titlebar-title"/>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/bootstrap/row/row" class="x-row x-menu x-menu1"> 
        <div class="col col-xs-6 text-center bg-blue" xid="col28" bind-click="openPageClick"
          pagename="aboutUs"> 
          <img xid="image14" class="x-img1" bind-attr-src="$model.transUrl('./img/menu11Pic1.png')"/>  
          <h4 class="text-white" xid="h42">关于我们</h4> 
        </div>  
        <div class="col col-xs-6" xid="col29"> 
          <div class="media bg-cyan" xid="div16" bind-click="openPageClick"
            pagename="product"> 
            <div class="media-left" xid="div17"> 
              <img xid="image15" class="x-img1" bind-attr-src="$model.transUrl('./img/menu11Pic2.png')"/> 
            </div>  
            <div class="media-body h5 text-white" bind-text="'产品中心'" xid="div18"/> 
          </div>  
          <div class="media bg-purple" xid="div19" bind-click="openPageClick"
            pagename="cases"> 
            <div class="media-left" xid="div20"> 
              <img xid="image16" class="x-img1" bind-attr-src="$model.transUrl('./img/menu11Pic3.png')"/> 
            </div>  
            <div class="media-body h5 text-white" bind-text="'成功案例'" xid="div21"/> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="x-row x-menu x-menu2"> 
        <div class="col col-xs-8" xid="col20"> 
          <img xid="image4" class="img-responsive" bind-attr-src="$model.transUrl('./img/menu12Pic1.jpg')"/> 
        </div>  
        <div class="col col-xs-4 text-center bg-green" xid="col21" bind-click="openPageClick"
          pagename="promotion"> 
          <img xid="image5" class="x-img1" bind-attr-src="$model.transUrl('./img/menu12Pic2.png')"/>  
          <h5 class="text-white"><![CDATA[促销活动]]></h5> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="x-row x-menu x-menu3"> 
        <div class="col col-xs-4 text-center bg-meired" pagename="dynamic"
          bind-click="openPageClick"> 
          <img xid="image8" class="x-img1" bind-attr-src="$model.transUrl('./img/menu13Pic1.png')"/>  
          <h5 xid="h51" class="text-white"><![CDATA[最新动态]]></h5> 
        </div>  
        <div class="col col-xs-4"> 
          <img xid="image6" class="img-responsive" bind-attr-src="$model.transUrl('./img/menu13Pic2.jpg')"/> 
        </div>  
        <div class="col col-xs-4 text-center bg-orange" pagename="afterSales"
          bind-click="openPageClick"> 
          <img xid="image7" class="x-img1" bind-attr-src="$model.transUrl('./img/menu13Pic3.png')"/>  
          <h5 xid="h52" class="text-white"><![CDATA[售后服务]]></h5> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="x-row x-menu x-menu4"> 
        <div class="col col-xs-4 text-center bg-purple" xid="col27" bind-click="openPageClick"
          pagename="contactUs"> 
          <img xid="image10" class="x-img1" bind-attr-src="$model.transUrl('./img/menu14Pic1.png')"/>  
          <h5 class="text-white"><![CDATA[联系我们]]></h5> 
        </div>  
        <div class="col col-xs-8 text-center" xid="col26" pagename="service"
          bind-click="openPageClick"> 
          <div xid="div13" class="bg-cyan" pagename="service"> 
            <img xid="image11" class="x-img1" bind-attr-src="$model.transUrl('./img/menu14Pic2.png')"/>  
            <h5 class="text-white"><![CDATA[服务项目]]></h5> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
