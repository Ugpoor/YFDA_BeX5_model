<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:362px;top:529px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="specilTopic" idColumn="id" onCustomRefresh="specilTopicCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="图片" name="image" type="String" xid="xid2"></column>
  <column label="点赞数" name="count" type="String" xid="xid3"></column>
  <column label="标题" name="title" type="String" xid="xid4"></column>
  <data xid="default1">[]</data></div></div> 
<div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="返回" xid="return" icon="icon-chevron-left" onClick="returnClick">
     <i xid="i1" class="icon-chevron-left"></i>
     <span xid="span1">返回</span></a> </div> 
   <div class="x-titlebar-title" xid="title1">
    <span xid="span2"><![CDATA[精彩专题]]></span></div> 
   <div class="x-titlebar-right reverse" xid="right1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="菜单" xid="menuBtn" icon="glyphicon glyphicon-menu-hamburger">
     <i xid="i2" class="glyphicon glyphicon-menu-hamburger"></i>
     <span xid="span3">菜单</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="搜索" xid="searchBtn" icon="icon-android-search">
     <i xid="i3" class="icon-android-search"></i>
     <span xid="span4">搜索</span></a> </div> </div>
  
  <img alt="" xid="image1" class="img-responsive" bind-attr-src='$model.toURL("./main/img/a.jpg")'></img><div class="list-group " xid="listGroup2">
   <div xid="div5" class="list-group-item"><h4 xid="h41" style="color:#000000;"><![CDATA[抗高温！夏日防暑降温攻略！]]></h4></div><div xid="div1" class="list-group-item sTitle" style="background-color:#F2F2F2;">
  <span xid="span11" style="font-size:x-large;font-weight:bold;"><![CDATA[往期回顾]]></span>
  </div><div xid="div7" style="background-color:#F2F2F2;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm pull-left" label="全部" xid="allBtn">
   <i xid="i4"></i>
   <span xid="span5">全部</span></a></div>
   <div class="x-col" xid="col2"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm pull-left" label="体育" xid="sportsBtn">
   <i xid="i5"></i>
   <span xid="span6">体育</span></a></div>
   <div class="x-col" xid="col3"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm pull-left" label="游戏" xid="gamesBtn">
   <i xid="i6"></i>
   <span xid="span7">游戏</span></a></div>
  <div class="x-col" xid="col4"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm pull-left" label="影音" xid="videoBtn">
   <i xid="i7"></i>
   <span xid="span8">影音</span></a></div>
  <div class="x-col" xid="col6"></div></div></div></div><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="specilTopic">
   <ul class=" x-list-template" xid="listTemplateUl1">
    <li xid="li1"><div class="list-group" xid="listGroup1">
   <div xid="div2" class="list-group-item"><a xid="a1"><img src="" alt="" xid="image2" bind-attr-src='$model.toURL("./main/img/" + $object.val("image"))' class="img-responsive"></img></a>
  </div><div xid="div3" class="list-group-item">
  <i xid="i8" class="icon-heart"></i>
  <span xid="span10" bind-text="ref('count')"></span><span xid="span9" bind-text="ref('title')" class="pull-right"></span></div></div></li></ul> </div>
  </div>