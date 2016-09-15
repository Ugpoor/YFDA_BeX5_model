<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:220px;top:112px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-top" xid="top2" height="48" style="background-color:black;"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="预览" style="font-size:large;background-color:black;height:48px;"> 
        <div class="x-titlebar-left" xid="div2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="regsBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span2"/>
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">预览</div>  
        <div class="x-titlebar-right reverse" xid="div3"/>
      </div> 
    </div>
    <div class="x-panel-content" xid="content2"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"
        style="background-color:#CDCDCD;height:55px;"> 
        <div class="x-col x-col-fixed x-col-15" xid="col16" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon center-block"
            xid="backBtn" icon="icon-chevron-left" style="color:#FFFFFF;font-size:18px;"> 
            <i xid="i11" class="icon-chevron-left"/>  
            <span xid="span12"></span> 
          </a> 
        </div>  
        <div class="x-col" xid="col17"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="searchInput" placeHolder="请输入搜索内容"/> 
        </div>  
        <div class="x-col x-col-fixed" xid="col18" style="width:auto;font-size:20px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="搜索" xid="searchBtn" style="color:#FFFFFF;font-size:18px;"> 
            <i xid="i11"/>  
            <span xid="span11">搜索</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom2" height="48"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup2" style="color:#6E6E6E;background-color:#848484;height:100%;width:100%;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="首页" xid="firstBtn" onClick="firstBtnClick"> 
          <i xid="i10"/>  
          <span xid="span9">首页</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="课程列表" xid="couBtn" onClick="couBtnClick"> 
          <i xid="i9"/>  
          <span xid="span10">课程列表</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="师资力量" xid="teBtn" onClick="teBtnClick"> 
          <i xid="i8"/>  
          <span xid="span8">师资力量</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="学习论坛" xid="foBtn" onClick="foBtnClick"> 
          <i xid="i5"/>  
          <span xid="span1">学习论坛</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="关于我们" xid="aboutBtn" onClick="aboutBtnClick"> 
          <i xid="i1"/>  
          <span xid="span5">关于我们</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
