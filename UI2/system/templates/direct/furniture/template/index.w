<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:358px;top:548px;" onLoad="modelLoad"/> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1"><span xid="span1"><![CDATA[起步科技]]></span></div>
   <div class="x-titlebar-right reverse" xid="right1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="菜单" xid="menu" icon="glyphicon glyphicon-menu-hamburger" onClick="menuClick">
   <i xid="i1" class="glyphicon glyphicon-menu-hamburger"></i>
   <span xid="span2">菜单</span></a></div></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="pages" slidable="true" wrap="true">
   <div class="x-contents-content" xid="main"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="windowContainer" src="./main.w"></div></div></div></div>
   </div>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu" anchor="menu">
   <div class="x-popMenu-overlay" xid="div1"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu1"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="首页" xid="button2" onClick="openDemo" urlMapping="main">
    <i xid="i2"></i>
    <span xid="span3">首页</span></a> </li>
  <li class="x-menu-divider divider" xid="divider1"></li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="产品推荐" xid="button3" onClick="openDemo" urlMapping="productRecomment">
    <i xid="i3"></i>
    <span xid="span4">产品推荐</span></a> </li>
  <li class="x-menu-divider divider" xid="divider2"></li>
  <li class="x-menu-item" xid="item3">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="公司简介" xid="button4" urlMapping="introduce" onClick="openDemo">
    <i xid="i4"></i>
    <span xid="span5">公司简介</span></a> </li>
  <li class="x-menu-divider divider" xid="divider3"></li>
  <li class="x-menu-item" xid="item4">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="联系我们" xid="button5" onClick="openDemo" urlMapping="contactUS">
    <i xid="i5"></i>
    <span xid="span6">联系我们</span></a> </li>
  <li class="x-menu-divider divider" xid="divider4"></li>
  <li class="x-menu-item" xid="item5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="社区" xid="button6" urlMapping="main" onClick="openDemo">
    <i xid="i6"></i>
    <span xid="span7">社区</span></a> </li></ul></div></div>