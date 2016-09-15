<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:381px;top:541px;"/>
<div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="popOver1" opacity="0.5" dismissible="false">
   <div class="x-popOver-overlay" xid="div8"></div>
   <div class="x-popOver-content" xid="div9"><div xid="div4" align="center" class="voicePicture"><img src="" alt="" xid="image1" class="img-responsive" bind-attr-src="$model.getImageUrl('./img/1.gif')" height="150px" style="width:150px;"></img></div></div></div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1"><span xid="span1"><![CDATA[我的书库]]></span></div>
   <div class="x-titlebar-right reverse" xid="right1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button1" icon="icon-compose">
   <i xid="i1" class="icon-compose"></i>
   <span xid="span2"></span></a>
  <i xid="i2"></i></div></div></div>
   <div class="x-panel-content" xid="content1"><div xid="div7" class="list-group-item" style="background-color:#E3E3E3;"><div xid="div1" class="has-feedback"><div xid="div6"><span xid="span11" class="form-control-feedback icon-android-search"></span><input component="$UI/system/components/justep/input/input" class="form-control" xid="search"></input></div></div></div><div xid="div2"><ul xid="ul1">
    <li class="list-group-item" xid="li1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="button12" icon="icon-ios7-arrow-right">
      <i xid="i18" class="icon-ios7-arrow-right text-muted"></i>
      <span xid="span17"></span></a> 
     <span xid="span16"><![CDATA[热门搜索]]></span></li> 
    <li class="list-group-item" xid="li1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="button14" icon="icon-ios7-arrow-right">
      <i xid="i27" class="icon-ios7-arrow-right text-muted"></i>
      <span xid="span20"></span></a> 
     <span xid="span19"><![CDATA[最近搜索]]></span></li> 
    <li class="list-group-item" xid="li1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="button16" icon="icon-ios7-arrow-right">
      <i xid="i29" class="icon-ios7-arrow-right text-muted"></i>
      <span xid="span23"></span></a> 
     <span xid="span22"><![CDATA[最近浏览]]></span></li>
     <li class="list-group-item" xid="li1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="button16" icon="icon-ios7-arrow-right">
      <i xid="i29" class="icon-ios7-arrow-right text-muted"></i>
      <span xid="span23"></span></a> 
     <span xid="span22"><![CDATA[最近流行]]></span></li>  
    <li class="list-group-item" xid="li4">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" xid="button2" icon="icon-ios7-arrow-right">
      <i xid="i3" class="icon-ios7-arrow-right"></i>
      <span xid="span4"></span></a> 
     <span xid="span3"><![CDATA[摇一摇]]></span></li> </ul></div>
  <div xid="div3" style="background-color:#E3E3E3;height:40px;"></div>
  
  <div xid="div5" align="center" class="list-group-item sayBtn">
  <a component="$UI/system/components/justep/button/button" class="btn x-orange btn-block" label="按住说话" xid="saying" bind-touchstart="sayingTouchstart" bind-touchend="sayingTouchend" style="margin-top:30px;">
   <i xid="i8"></i>
   <span xid="span10">按住说话</span></a></div>
  </div>
   <div class="x-panel-bottom" xid="bottom1" height="54"><div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row1">
   <div class="x-col" xid="col1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书架" xid="button4" icon="icon-android-book">
   <i xid="i5" class="icon-android-book"></i>
   <span xid="span7">书架</span></a></div>
   <div class="x-col" xid="col2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书城" xid="button5" icon="icon-stats-bars">
   <i xid="i6" class="icon-stats-bars"></i>
   <span xid="span8">书城</span></a></div>
   <div class="x-col" xid="col3"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="个人中心" xid="button6" icon="icon-android-contact">
   <i xid="i7" class="icon-android-contact"></i>
   <span xid="span9">个人中心</span></a></div></div></div></div></div>