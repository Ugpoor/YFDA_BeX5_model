<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:101px;top:445px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="app" idColumn="id" onCustomRefresh="appCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="图片" name="image" type="String" xid="xid2"></column>
  <column label="名字" name="name" type="String" xid="xid3"></column>
  <column label="描述" name="desc" type="String" xid="xid4"></column>
  <data xid="default1">[]</data></div></div> 
<div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="return" icon="icon-chevron-left" onClick="returnClick">
   <i xid="i1" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>
   <div class="x-titlebar-title" xid="title1"><span xid="span2"><![CDATA[淘应用]]></span></div>
   <div class="x-titlebar-right reverse" xid="right1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="菜单" xid="menuBtn" icon="glyphicon glyphicon-menu-hamburger">
   <i xid="i2" class="glyphicon glyphicon-menu-hamburger"></i>
   <span xid="span3">菜单</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="搜索" xid="searchBtn" icon="icon-android-search">
   <i xid="i3" class="icon-android-search"></i>
   <span xid="span4">搜索</span></a></div></div><div xid="div1" class="topbtngroup"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-1" xid="col1"></div>
   <div class="col col-xs-10" xid="col2"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified bg-primary" tabbed="true" xid="buttonGroup1"><a component="$UI/system/components/justep/button/button" class="btn btn-primary" label="必备" xid="essentialBtn" target="content1">
   <i xid="i4"></i>
   <span xid="span5">必备</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary" label="分类" xid="classifyBtn" target="content2">
   <i xid="i5"></i>
   <span xid="span6">分类</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary" label="排行" xid="rankBtn" target="content3">
   <i xid="i6"></i>
   <span xid="span7">排行</span></a></div></div>
   <div class="col col-xs-1" xid="col3"></div></div></div><div component="$UI/system/components/justep/contents/contents" class="x-contents" active="0" xid="contents1">
   <div class="x-contents-content" xid="content1"><h3 xid="h31" style="text-indent:1em;color:#000000;"><![CDATA[互联网应用]]></h3><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="app">
   <ul class="x-list-template list-group" xid="listTemplateUl1">
    <li xid="li1" class="list-group-item"><div xid="div2" class="media"><div xid="div3" class="media-left"><a xid="a1"><img src="" alt="" xid="image1" bind-attr-src='$model.toURL("./main/img/"+ $object.val("image"))' class=" img-app"></img></a></div>
  <div xid="div4" class="media-body"><a component="$UI/system/components/justep/button/button" class="btn btn-default pull-right" label="下载" xid="button7">
   <i xid="i7"></i>
   <span xid="span8">下载</span></a><h4 xid="h44" bind-text="ref('name')">h4
  </h4>
  <p xid="p1" bind-text=' $object.val("desc")'></p>
  </div></div></li></ul> </div><h3 xid="h32" style="color:#000000;text-indent:1em;"><![CDATA[多媒体]]></h3><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list4" data="app">
   <ul class="x-list-template list-group" xid="listTemplateUl4">
    <li xid="li4" class="list-group-item">
     <div xid="div13" class="media">
      <div xid="div6" class="media-left">
       <a xid="a2">
        <img src="" alt="" xid="image6" bind-attr-src='$model.toURL("./main/img/"+  $object.val("image"))' class=" img-app"></img></a> </div> 
      <div xid="div5" class="media-body">
       <a component="$UI/system/components/justep/button/button" class="btn btn-default pull-right" label="下载" xid="button1">
        <i xid="i9"></i>
        <span xid="span10">下载</span></a> 
       <h4 xid="h41" bind-text="ref('name')">h4</h4>
       <p xid="p4" bind-text=' $object.val("desc")'></p></div> </div> </li> </ul> </div>
  </div>
  <div class="x-contents-content" xid="content2" style="background-color:#F2F2F2;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col4"><img alt="" xid="image2" class="img-rounded img-responsive" bind-attr-src='$model.toURL("./main/img/didi.jpg")'></img></div>
   <div class="x-col" xid="col6"><img alt="" xid="image3" class="img-rounded img-responsive" bind-attr-src='$model.toURL("./main/img/bao.jpg")'></img></div></div>
  <div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list2" data="app">
   <ul class="x-list-template list-group" xid="listTemplateUl2">
    <li xid="li2" class="list-group-item"><div xid="div7" class="media"><div xid="div8" class="media-left"><img src="" alt="" xid="image4" bind-attr-src='$model.toURL( "./main/img/"+ $object.val("image"))' class="img-app"></img></div><div xid="div9" class="media-body"><h5 xid="h51" bind-text="ref('name')">h5</h5>
  <p xid="p2" bind-text=' $object.val("desc")'></p></div></div></li></ul> </div></div>
  <div class="x-contents-content" xid="content3"><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list3" data="app">
   <ul class="x-list-template list-group" xid="listTemplateUl3">
    <li xid="li3" class="list-group-item">
     <div xid="div12" class="media">
      <div xid="div11" class="media-left">
       <img src="" alt="" xid="image5" bind-attr-src='$model.toURL( "./main/img/"+$object.val("image"))' class="img-app"></img></div> 
      <div xid="div10" class="media-body">
       <a component="$UI/system/components/justep/button/button" class="btn btn-default pull-right" label="下载" xid="button8">
        <i xid="i8"></i>
        <span xid="span9">下载</span></a> 
       <h4 xid="h45" bind-text="ref('name')">h4</h4>
       <p xid="p3" bind-text=' $object.val("desc")'></p></div> </div> </li> </ul> </div></div></div>
  
  </div>