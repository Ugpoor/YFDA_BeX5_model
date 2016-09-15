<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-main" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:66px;"
    onLoad="modelLoad"/>  
  <link type="text/css" rel="stylesheet" href="./main.ext.css"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-portal"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar" title="WeX5基础原理"> 
        <div class="x-titlebar-left" xid="div1"></div>  
        <div class="x-titlebar-title" xid="div2">WeX5基础原理</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content xui-hignlight-selected x-scroll-view" xid="content1"
      style="bottom: 0px;"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1" bounce="false" autoPullUp="false"> 
        <div class="x-scroll-content" xid="div9">
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="carousel" onActiveChange="carouselActiveChange" slidable="true"
            routable="false"> 
            <div class="x-contents-content" xid="page1" style="height:100%;background-color:#009fde;"> 
              <div style="height:100%;background-repeat:no-repeat;background-position:center;background-image:url(./images/1.png);"/> 
            </div>  
            <div class="x-contents-content" xid="page2" style="height:100%;background-color:#0e1fcc;"> 
              <div style="height:100%;background-repeat:no-repeat;background-position:center;background-image:url(./images/2.png);"/> 
            </div>  
            <div class="x-contents-content" xid="page3" style="height:100%;background-color:#006700;"> 
              <div style="height:100%;background-repeat:no-repeat;background-position:center;background-image:url(./images/3.png);"/> 
            </div>  
            <ol class="carousel-indicators"> 
              <li index="0" class="active"/>  
              <li index="1" class=""/>  
              <li index="2" class=""/> 
            </ol> 
          </div>
          <div class="container"> 
            <div component="$UI/system/components/bootstrap/row/row" class="row grid9"
              xid="row1"> 
              <!-- 
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col1"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" onClick="open" label="WeX5页面模式"
                    xid="button7" icon="icon-social-windows"> 
                    <i xid="i8" class="icon-social-windows" style="color: rgb(202, 14, 222);"/>  
                    <span xid="span8">WeX5页面模式</span> 
                  </a>
                </div> 
              </div>  
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col2"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="WeX5第一个单页应用" xid="button2"
                    icon="glyphicon glyphicon-wrench" onClick="open"> 
                    <i xid="i3" class="glyphicon glyphicon-wrench" style="color: #2fa4e7;"/>  
                    <span xid="span53">WeX5第一个单页应用</span> 
                  </a> 
                </div> 
              </div>
               -->  
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col3"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="xid技术" xid="button5"
                    icon="glyphicon glyphicon-th-list" onClick="open" url="./core/xid/xid.w"> 
                    <i xid="i16" class="glyphicon glyphicon-th-list" style="color: rgb(252, 100, 0);"/>  
                    <span xid="span16">xid技术</span> 
                  </a>
                </div> 
              </div>  
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col31"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="css局部化" xid="button51"
                    icon="glyphicon glyphicon-th-list" onClick="open" url="./core/cssPart/cssPart.w"> 
                    <i xid="i161" class="glyphicon glyphicon-th-list" style="color: rgb(252, 100, 0);"/>  
                    <span xid="span161">css局部化</span> 
                  </a>
                </div> 
              </div>  
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col32"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="js模块化" xid="button52"
                    icon="glyphicon glyphicon-th-list" onClick="open" url="./core/jsModule/jsModule.w"> 
                    <i xid="i162" class="glyphicon glyphicon-th-list" style="color: rgb(252, 100, 0);"/>  
                    <span xid="span162">js模块化</span> 
                  </a>
                </div> 
              </div>  
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col4"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="WeX5页面结构与生命周期" xid="button3"
                    icon="icon-loop" onClick="open" url="./lifecycle/page1.w"> 
                    <i xid="i14" class="icon-loop"/>  
                    <span xid="span14">WeX5页面结构与生命周期</span> 
                  </a>
                </div> 
              </div>  
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col5"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="WeX5页面间交互" xid="button6"
                    icon="icon-ios7-browsers" onClick="open" url="./interactive/page.w"> 
                    <i xid="i7" class="icon-ios7-browsers" style="color: black;"/>  
                    <span xid="span7">WeX5页面间交互</span> 
                  </a>
                </div> 
              </div>  
              <!-- 
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3" xid="col6"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="WeX5页面路由" xid="button1" icon="icon-arrow-graph-up-right"
                    onClick="open"> 
                    <i xid="i2" class="icon-arrow-graph-up-right" style="color: rgb(153, 196, 18);"/>  
                    <span xid="span2">WeX5页面路由</span> 
                  </a>
                </div> 
              </div>  
              <div class="col cell col-xs-6 col-sm-4 col-md-4 col-lg-3"> 
                <div class="card"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" label="WeX5页面重用" xid="button4" icon="glyphicon glyphicon-file"
                    onClick="open"> 
                    <i xid="i15" class="glyphicon glyphicon-file" style="color: black;"/>  
                    <span xid="span15">WeX5页面重用</span> 
                  </a>
                </div> 
              </div>
               --> 
            </div> 
          </div>
                     
          
        </div> 
      </div>
    </div> 
  </div> 
</div>
