<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:128px;top:115px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="生活服务" style="font-size:18px;background-color:#000000;"> 
        <div class="x-titlebar-left" xid="left1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="backBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="title1">生活服务</div>  
        <div class="x-titlebar-right reverse" xid="right1"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
        style="height:49px;background-color:#e63d3e;"> 
        <div class="x-col x-col-center" xid="col1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="微生活" xid="lifeBtn" style="color:#FFFFFF;font-size:18px;"> 
            <i xid="i2"/>  
            <span xid="span2">微生活</span> 
          </a> 
        </div>  
        <div class="x-col x-col-fixed" xid="col2" style="width:auto;"> 
           
        <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group" tabbed="true" xid="buttonGroup1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="loginBtn" icon="icon-person" style="font-size:20px;color:#FFFFFF;height:38px;margin-top:-8px;" onClick="loginBtnClick"> 
            <i xid="i3" class="icon-person" />  
            <span xid="span3" /> 
          </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" icon="icon-home" style="font-size:20px;color:#FFFFFF;height:38px;margin-top:-8px;" xid="menuBtn" onClick="menuBtnClick"> 
            <i xid="i4" class="icon-home" />  
            <span xid="span4" /> 
          </a></div></div>  
        </div> 
    </div> 
  </div> 
</div>
