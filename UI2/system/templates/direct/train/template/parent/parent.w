<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:146px;top:6px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="48" style="background-color:black;"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="教育培训" style="font-size:large;background-color:black;height:48px;"> 
        <div class="x-titlebar-left" xid="div2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="backBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span2">关闭</span>
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">教育培训</div>  
        <div class="x-titlebar-right reverse" xid="div3"/>
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
        style="background-color:#C0C0C0;height:50px;"> 
        <div class="x-col x-col-center" xid="col1"> 
          <div xid="div2" style="color:#FFFFFF;font-size:18px;">培训学校</div>
        </div>  
        <div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="login" icon="icon-ios7-person" style="font-size:28px;color:#FFFFFF;margin-right:-15px;"
            onClick="openDemo" urlMapping="login"> 
            <i xid="i3" class="icon-ios7-person"/>  
            <span xid="span4"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="homeBtn" icon="icon-home" style="font-size:25px;color:#FFFFFF;"> 
            <i xid="i3" class="icon-home"/>  
            <span xid="span4"/>
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1" height="48"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup2" style="color:#6E6E6E;background-color:#848484;height:100%;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="首页" xid="firstBtn" onClick="openDemo" urlMapping="main"> 
          <i xid="i10"/>  
          <span xid="span9">首页</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="课程列表" xid="couBtn" onClick="openDemo" urlMapping="course"> 
          <i xid="i9"/>  
          <span xid="span10">课程列表</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="师资力量" xid="teBtn" onClick="openDemo" urlMapping="teachers"> 
          <i xid="i8"/>  
          <span xid="span8">师资力量</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="学习论坛" xid="foBtn" onClick="openDemo" urlMapping="forum"> 
          <i xid="i5"/>  
          <span xid="span1">学习论坛</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="关于我们" xid="aboutBtn" onClick="openDemo" urlMapping="about"> 
          <i xid="i1"/>  
          <span xid="span5">关于我们</span>
        </a> 
      </div> 
    </div> 
  </div>
</div>
