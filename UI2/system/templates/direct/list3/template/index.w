<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:312px;top:368px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="data" idColumn="fId" onCustomRefresh="dataCustomRefresh"><column label="ID" name="fId" type="Integer" xid="xid1"></column>
  <column label="name" name="name" type="String" xid="xid2"></column>
  <column label="photo" name="photo" type="String" xid="xid9"></column>
  <column label="time" name="time" type="String" xid="xid10"></column>
  <column label="praise" name="praise" type="String" xid="xid11"></column>
  <column label="content" name="content" type="String" xid="xid12"></column>
  <column label="commentname" name="commentName" type="String" xid="xid13"></column>
  <column label="commentconyent" name="commentContent" type="String" xid="xid14"></column>
  <column label="state" name="state" type="String" xid="xid15"></column></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1">
    <span xid="span1">我的书库</span></div> 
   <div class="x-titlebar-right reverse" xid="right1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="目录" xid="menuBtn" icon="icon-compose">
     <i xid="i1" class="icon-compose"></i>
     <span xid="span2">目录</span></a> 
    <i xid="i2"></i></div> </div></div>
   <div class="x-panel-content  x-scroll-view" xid="content1" _xid="C6F5C7749DD00001559019B51AB0AE00" style="bottom: 54px;">
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div6">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i3"></i>
    <span class="x-pull-down-label" xid="span5">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div7"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="data">
   <ul class="x-list-template list-group" xid="listTemplateUl1">
    <li xid="li2" class="list-group-item"><div xid="div1" class="media"><div xid="div2" class="media-left"><img src="" alt="" xid="image1" bind-attr-src='$model.toURL( "./img/" + $object.val("photo"))' class="img-rounded" style="height:54px;width:54px;"></img></div>
  <div xid="div3" class="media-body"><h5 xid="h51" bind-text="ref('name')">h5</h5>
  <div xid="div4" class="pull-right">
  <span xid="span4" bind-text="ref('praise')" style="font-size:xx-small;"></span><i xid="i4" class="icon-heart"></i></div><span xid="span3" bind-text="ref('time')" style="font-size:xx-small;"></span>
  
  <p xid="p1" bind-text=' $object.val("content")' style="font-weight:bold;"></p>
  <div xid="div5" style="padding:8px 10px;background-color:#E0E0E0;" bind-visible='$object.val("commentName")  != undefined'><h5 xid="h52" bind-text="ref('commentName')" style="margin:0"><![CDATA[]]></h5><span xid="span6" bind-text="ref('commentContent')"></span>
  </div></div></div></li></ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div8">
    <span class="x-pull-up-label" xid="span10">加载更多...</span></div> </div></div>
   <div class="x-panel-bottom" xid="bottom1" height="54"><div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row1">
   <div class="x-col" xid="col1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书架" xid="bookshelvesBtn" icon="icon-android-book">
     <i xid="i5" class="icon-android-book"></i>
     <span xid="span7">书架</span></a> </div> 
   <div class="x-col" xid="col2">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书城" xid="bookCityBtn" icon="icon-stats-bars">
     <i xid="i6" class="icon-stats-bars"></i>
     <span xid="span8">书城</span></a> </div> 
   <div class="x-col" xid="col3">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="个人中心" xid="personalCenterBtn" icon="icon-android-contact">
     <i xid="i7" class="icon-android-contact"></i>
     <span xid="span9">个人中心</span></a> </div> </div></div></div></div>