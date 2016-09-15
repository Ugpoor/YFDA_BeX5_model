<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-main" component="$UI/system/components/justep/window/window">  
  <link type="text/css" rel="stylesheet" href="./main.ext.css"/>  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:66px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full  x-portal"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar" title="WeX5 demo"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="menuBtn" onClick="menuBtnClick" icon="icon-navicon-round"> 
            <i xid="i1" class="icon-navicon-round"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">WeX5 demo</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel1" style="height:288px;" interval="4" auto="false"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" routable="false" xid="contents1"
          class="x-contents carousel-inner" style="height:100%;"> 
          <div class="x-contents-content" xid="page1" style="height:100%;background-color:#009fde;"> 
            <div style="height:100%;background-repeat:no-repeat;background-position:center;background-image:url(./images/1.png);"/> 
          </div>  
          <div class="x-contents-content" xid="page2" style="height:100%;background-color:#0e1fcc;"> 
            <div style="height:100%;background-repeat:no-repeat;background-position:center;background-image:url(./images/2.png);"/> 
          </div>  
          <div class="x-contents-content" xid="page3" style="height:100%;background-color:#006700;"> 
            <div style="height:100%;background-repeat:no-repeat;background-position:center;background-image:url(./images/3.png);"/> 
          </div> 
        </div> 
      </div>  
      <div class="container"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row grid9"
          xid="row1"> 
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col1"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="加速度" xid="button5" icon="icon-game-controller-b" onClick="openPage" url="/demo/native/accelerometer/mainActivity.w"> 
                <i xid="i16" class="icon-game-controller-b" style="color: rgb(252, 100, 0);"/>  
                <span xid="span16"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col2"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="地图定位" xid="button2" icon="icon-android-earth" onClick="openPage"
                url="/demo/native/geolocation/mainActivity.w"> 
                <i xid="i3" class="icon-android-earth" style="color: #2fa4e7;"/>  
                <span xid="span53"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col3"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                onClick="openPage" label="外卖" xid="button7" icon="icon-bag" url="/takeout/index.w"> 
                <i xid="i8" class="icon-bag" style="color: rgb(202, 14, 222);"/>  
                <span xid="span8"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col4"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="扫一扫" xid="button3" icon="icon-android-hand" onClick="openPage"
                url="/demo/native/barcode/mainActivity.w"> 
                <i xid="i14" class="icon-android-hand"/>  
                <span xid="span14"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col5"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="摄像头" xid="button6" icon="icon-android-camera" onClick="openPage"
                url="/demo/native/camera/mainActivity.w"> 
                <i xid="i7" class="icon-android-camera" style="color: black;"/>  
                <span xid="span7"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col6"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="List" xid="button1" icon="icon-android-sort" onClick="openPage"
                url="/system/components/justep/list/demo/news.w"> 
                <i xid="i2" class="icon-android-sort" style="color: rgb(153, 196, 18);"/>  
                <span xid="span2"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="音频录播" xid="button4" icon="icon-android-microphone" onClick="openPage"
                url="/demo/native/audio/mainActivity.w"> 
                <i xid="i15" class="icon-android-microphone" style="color: black;"/>  
                <span xid="span15"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1"> 
            <div class="card"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="输入框" xid="button11" icon="icon-edit" onClick="openPage" url="/system/components/justep/input/demo/input.w"> 
                <i xid="i5" class="icon-edit" style="color:#0080FF;"/>  
                <span xid="span5">输入框</span> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col10"> 
            <div class="card" xid="div4"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="九宫格" xid="button10" icon="icon-grid" onClick="openPage" url="/system/components/bootstrap/row/demo/grid.w"> 
                <i xid="i84" class="icon-grid" style="color: rgb(153, 196, 18);"/>  
                <span xid="span4">九宫格</span> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col11"> 
            <div class="card" xid="div5"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="消息框" xid="button9" icon="icon-android-forums" onClick="openPage"
                url="/system/components/justep/messageDialog/demo/demo.w"> 
                <i xid="i64" class="icon-android-forums" style="color:#FF80C0;"/>  
                <span xid="span73">消息框</span> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col12"> 
            <div class="card" xid="div6"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="TodoMVC" xid="button8" icon="icon-android-checkmark" onClick="openPage"
                url="/demo/misc/todoMVC/index.w"> 
                <i xid="i9" class="icon-android-checkmark" style="color: rgb(153, 196, 18);"/>  
                <span xid="span9"/> 
              </a> 
            </div> 
          </div>  
          <div class="col cell col-xs-3 col-sm-2 col-md-2 col-lg-1" xid="col13"> 
            <div class="card" xid="div7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
                label="仿途牛" xid="button12" icon="icon-plane" onClick="openPage" url="/demo/tuniu/index_main.w"> 
                <i xid="i6" class="icon-plane" style="color:#FF8000;"/>  
                <span xid="span6">仿途牛</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <!--       <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1" bounce="false" autoPullUp="false"> 
        <div class="x-scroll-content" xid="div9">
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="carousel" onActiveChange="carouselActiveChange" slidable="true"
            routable="false"> 
            <ol class="carousel-indicators"> 
              <li index="0" class="active"/>  
              <li index="1" class=""/>  
              <li index="2" class=""/> 
            </ol> 
          </div>
        </div> 
      </div>  --> 
    </div> 
  </div> 
</div>
