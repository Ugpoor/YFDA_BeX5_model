<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:360px;top:565px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="girlData" idColumn="id" onCustomRefresh="girlDataCustomRefresh">
   <column label="ID" name="id" type="String" xid="xid1"></column>
   <column label="标记" name="mark" type="String" xid="xid2"></column>
   <column label="图片" name="image" type="String" xid="xid3"></column>
   <data xid="default1">[]</data></div></div> 
<div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="返回" xid="return" icon="icon-chevron-left" onClick="returnClick">
     <i xid="i1" class="icon-chevron-left"></i>
     <span xid="span1">返回</span></a> </div> 
   <div class="x-titlebar-title" xid="title1">
    <span xid="span2">壁纸</span></div> 
   <div class="x-titlebar-right reverse" xid="right1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="菜单" xid="menuBtn" icon="glyphicon glyphicon-menu-hamburger">
     <i xid="i2" class="glyphicon glyphicon-menu-hamburger"></i>
     <span xid="span3">菜单</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="搜索" xid="searchBtn" icon="icon-android-search">
     <i xid="i7" class="icon-android-search"></i>
     <span xid="span4">搜索</span></a> </div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div class="x-col" xid="col9"></div>
   <div class="x-col x-col-75" xid="col8">
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="推荐" xid="recommendBtn" target="content2">
      <i xid="i5"></i>
      <span xid="span12">推荐</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="分类" xid="classifyBtn">
      <i xid="i5"></i>
      <span xid="span11">分类</span></a> </div> </div> 
   <div class="x-col" xid="col10"></div></div><div component="$UI/system/components/justep/contents/contents" class="x-contents" active="0" xid="contents1">
   <div class="x-contents-content" xid="content2"><div xid="div4"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   
   <div class="x-col" xid="col3"><span xid="span7" style="color:#000000;font-size:x-large;"><![CDATA[精美创意]]></span></div><div class="x-col x-col-33" xid="col2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="更多" xid="moreBtn" icon="icon-chevron-right">
      <i xid="i6" class="icon-chevron-right"></i>
      <span xid="span8">更多</span></a></div></div></div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="girlData" filter='$row.val("mark") ==1'>
   <ul class="list-group x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="list-group-item col-xs-6 ">
     <img alt="" xid="image2" bind-attr-src='$model.toURL("./main/img/" + $object.val("image"))' class="img-responsive" bind-click="image2Click"></img></li> </ul> </div><div xid="div6">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
    <div class="x-col" xid="col11">
     <span xid="span14" style="color:#000000;font-size:x-large;"><![CDATA[可爱动漫]]></span></div> 
    <div class="x-col x-col-33" xid="col12">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="更多" xid="button8" icon="icon-chevron-right">
      <i xid="i9" class="icon-chevron-right"></i>
      <span xid="span13">更多</span></a> </div> </div> </div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="girlData" filter='$row.val("mark") ==2'>
   <ul class="list-group x-list-template" xid="listTemplateUl4">
    <li xid="li4" class="list-group-item col-xs-6 ">
     <img alt="" xid="image4" bind-attr-src='$model.toURL("./main/img/" + $object.val("image"))' class="img-responsive" bind-click="image4Click"></img></li> </ul> </div><div xid="div9">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
    <div class="x-col" xid="col13">
     <span xid="span16" style="color:#000000;font-size:x-large;"><![CDATA[自然美景]]></span></div> 
    <div class="x-col x-col-33" xid="col14">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="更多" xid="button9" icon="icon-chevron-right">
      <i xid="i10" class="icon-chevron-right"></i>
      <span xid="span15">更多</span></a> </div> </div> </div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list5" data="girlData" filter='$row.val("mark") ==3'>
   <ul class="list-group x-list-template" xid="listTemplateUl5">
    <li xid="li5" class="list-group-item col-xs-6 ">
     <img alt="" xid="image5" bind-attr-src='$model.toURL("./main/img/" + $object.val("image"))' class="img-responsive" bind-click="image5Click"></img></li> </ul> </div></div>
  <div class="x-contents-content" xid="content3">
  
  
  </div></div></div>