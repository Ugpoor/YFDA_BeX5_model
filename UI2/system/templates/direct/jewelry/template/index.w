<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"/> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1" height="100"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" style="background-color:#FF34B3;">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1">
    <span xid="span2">起步科技</span></div> 
   <div class="x-titlebar-right reverse" xid="right1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="menu" icon="glyphicon glyphicon-menu-hamburger" onClick="menuClick">
     <i xid="i1" class="glyphicon glyphicon-menu-hamburger"></i>
     <span xid="span3"></span></a> </div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row1">
   <div class="x-col" xid="col1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-block" label="介绍" xid="introduce" onClick="openPage" urlMapping="introduce" style="color:#000000;">
    <i xid="i2"></i>
    <span xid="span4">介绍</span></a></div>
   <div class="x-col" xid="col2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-block" label="热卖" xid="onsale" onClick="openPage" urlMapping="onsale" style="color:#000000;">
    <i xid="i3"></i>
    <span xid="span5">热卖</span></a></div>
   <div class="x-col" xid="col3"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-block" label="新上架" xid="newArrival" onClick="openPage" urlMapping="newArrival" style="color:#000000;">
    <i xid="i4"></i>
    <span xid="span6">新上架</span></a></div>
  <div class="x-col" xid="col4"><a component="$UI/system/components/justep/button/button" class="customService btn btn-link btn-sm btn-block" label="客服" xid="customService" onClick="openPage" urlMapping="main" style="color:#FFFFFF;">
    <i xid="i5"></i>
    <span xid="span7">客服</span></a></div></div></div>
   <div class="x-panel-content" xid="content2"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="pages">
   <div class="x-contents-content" xid="main"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer" src="./main.w"></div></div></div></div>
   </div>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu1" dismissible="true" direction="right-bottom" opacity="0.1" anchor="menu">
   <div class="x-popMenu-overlay" xid="div3"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu1"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="戒指" xid="button2" onClick="openDemo" urlMapping="introduce">
    <i xid="i6"></i>
    <span xid="span1">戒指</span></a> </li>
  <li class="x-menu-divider divider" xid="divider1"></li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="耳环" xid="button3" onClick="openDemo" urlMapping="onsale">
    <i xid="i7"></i>
    <span xid="span8">耳环</span></a> </li>
  <li class="x-menu-divider divider" xid="divider2"></li>
  <li class="x-menu-item" xid="item3">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="项链" xid="button4" onClick="openDemo" urlMapping="introduce">
    <i xid="i8"></i>
    <span xid="span9">项链</span></a> </li>
  <li class="x-menu-divider divider" xid="divider3"></li>
  <li class="x-menu-item" xid="item4">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="手链" xid="button5" onClick="openDemo" urlMapping="onsale">
    <i xid="i9"></i>
    <span xid="span10">手链</span></a> </li>
  <li class="x-menu-divider divider" xid="divider4"></li>
  <li class="x-menu-item" xid="item5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="胸针" xid="button6" onClick="openDemo" urlMapping="introduce">
    <i xid="i10"></i>
    <span xid="span14">胸针</span></a> </li>
  <li class="x-menu-divider divider" xid="divider5"></li>
  <li class="x-menu-item" xid="item6">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="吊坠" xid="button7" onClick="openDemo" urlMapping="onsale">
    <i xid="i11"></i>
    <span xid="span15">吊坠</span></a> </li></ul></div></div>