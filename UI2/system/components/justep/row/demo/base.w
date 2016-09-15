<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="root">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:99px;top:26px;"
    onLoad="modelLoad"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:409px;top:268px;"
    status="normal"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="row"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button2" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">row</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="title" xid="controlGroup1"> 
        <h3>row
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="源码" xid="button1" onClick="showRowSource" bind-visible="isVisible"> 
            <i xid="i1"/>  
            <span xid="span1">源码</span> 
          </a> 
        </h3>  
        <p>容器组件：基于css3 flex实现，自适应分辨率，如电脑，手机，平板等</p> 
        <p>row的垂直对齐</p>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="demoRow"
        style="height:75px"> 
        <div class="x-col x-col-top" xid="col1" style="background-color:#CCCCCC;height:25px;">x-col-top</div>  
        <div class="x-col x-col-center" xid="col2" style="background-color:#FFFFCC;height:25px;">x-col-center</div>  
        <div class="x-col x-col-bottom" xid="col3" style="background-color:#6699CC;height:25px;">x-col-bottom</div>  
        <div class="x-col" xid="col4" style="background-color:#eee;">default</div> 
      </div>  
      <p>row的使用</p>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
        <div class="x-col x-col-fixed x-col-center" xid="col5" style="width:80px;"> 
          <label xid="label1"><![CDATA[信息提示]]></label> 
        </div>  
        <div class="x-col" xid="col6"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1" placeHolder="请输入相关信息"/> 
        </div>  
        <div class="x-col x-col-fixed" xid="col7" style="width:80px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="申请" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3">申请</span> 
          </a> 
        </div> 
      </div>  
      <p>row的嵌套使用</p>  
      <div component="$UI/system/components/justep/row/row" class="x-row clearpadding"
        xid="row2"> 
        <div class="x-col x-col-33 clearpadding" xid="col3" style="border-right: 1px solid #f3f3f3"> 
          <img src="./img/pic1.jpg" alt="" xid="image4" class="img-responsive"/> 
        </div>  
        <div class="x-col x-col-67 clearpadding" xid="col4"> 
          <div component="$UI/system/components/justep/row/row" class="x-row clearpadding"
            xid="row5"> 
            <div class="x-col clearpadding" xid="col7"> 
              <img src="./img/pic2.jpg" alt="" xid="image5" class="img-responsive"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row clearpadding"
            xid="row6"> 
            <div class="x-col clearpadding" xid="col12" style="border-right: 1px solid #f3f3f3"> 
              <img src="./img/pic3.jpg" alt="" xid="image6" class="img-responsive"/> 
            </div>  
            <div class="x-col clearpadding" xid="col13 clearpadding"> 
              <img src="./img/pic4.jpg" alt="" xid="image7" class="img-responsive"/> 
            </div> 
          </div> 
        </div> 
      </div>
      </div> 
    </div> 
  </div> 
</div>
