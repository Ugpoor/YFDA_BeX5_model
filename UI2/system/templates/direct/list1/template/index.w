<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:292px;top:433px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="commentData" idColumn="name" onCustomRefresh="commentDataCustomRefresh"><column label="1" name="name" type="String" xid="xid1"></column>
  <column label="2" name="time" type="String" xid="xid2"></column>
  <column label="3" name="content" type="String" xid="xid3"></column>
  <column label="4" name="photo" type="String" xid="xid4"></column>
  <column label="5" name="useful" type="String" xid="xid5"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1">
    <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
     <div class="x-titlebar-left" xid="left1"></div>
     <div class="x-titlebar-title" xid="title1">
      <span xid="span10">我的书库</span></div> 
     <div class="x-titlebar-right reverse" xid="right1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="目录" xid="menuBtn" icon="icon-compose">
       <i xid="i7" class="icon-compose"></i>
       <span xid="span9">目录</span></a> 
      <i xid="i6"></i></div> </div> </div> 
   <div class="x-panel-content x-scroll-view" xid="content1" _xid="C6F856832D700001E13B1CFF16D0C110">
    <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
     <div class="x-content-center x-pull-down container" xid="div3">
      <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
      <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div> 
     <div class="x-scroll-content" xid="div5">
      <div component="$UI/system/components/justep/list/list" class="x-list x-list-padding" xid="list1" data="commentData">
       <ul class="x-list-template" xid="listTemplateUl1">
        <li xid="li1">
         <div xid="div2" class="timeline-block">
          <img src="" alt="" xid="image1" bind-attr-src='$model.toURL("./img/"+ $object.val("photo"))' class="timeline-image img-circle"></img>
          <div xid="div4" class="timeline-content">
           <h5 xid="h51" bind-text="ref('name')"></h5>
           <span class="badge pull-right" xid="badge1" style="background-color:#2fa4e7;">有用</span>
           <span xid="span14" style="font-size:xx-small;" bind-text="ref('time')"></span>
           <br xid="default2"></br>
           <span xid="span15" bind-text="ref('content')"></span></div> </div> </li> </ul> </div> </div> 
     <div class="x-content-center x-pull-up" xid="div6">
      <span class="x-pull-up-label" xid="span2">加载更多...</span></div> </div> </div> 
   <div class="x-panel-bottom" xid="bottom1" height="54">
    <div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row5">
     <div class="x-col" xid="col3">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书架" xid="bookshelvesBtn" icon="icon-android-book">
       <i xid="i5" class="icon-android-book"></i>
       <span xid="span13">书架</span></a> </div> 
     <div class="x-col" xid="col10">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书城" xid="bookCityBtn" icon="icon-stats-bars">
       <i xid="i9" class="icon-stats-bars"></i>
       <span xid="span11">书城</span></a> </div> 
     <div class="x-col" xid="col3">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="个人中心" xid="personalCenterBtn" icon="icon-android-contact">
       <i xid="i8" class="icon-android-contact"></i>
       <span xid="span12">个人中心</span></a> </div> </div> </div> </div></div>
