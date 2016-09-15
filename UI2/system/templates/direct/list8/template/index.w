<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:78px;top:-4px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="listData" idColumn="photo"><column label="图片" name="photo" type="String" xid="xid1"></column>
  <column label="标题" name="title" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;photo&quot;:&quot;./img/3.jpg&quot;,&quot;title&quot;:&quot;男士秋冬卫衣&quot;},{&quot;photo&quot;:&quot;./img/2.jpg&quot;,&quot;title&quot;:&quot;男士秋冬卫衣&quot;},{&quot;photo&quot;:&quot;./img/5.jpg&quot;,&quot;title&quot;:&quot;男士秋冬卫衣&quot;},{&quot;photo&quot;:&quot;./img/4.jpg&quot;,&quot;title&quot;:&quot;男士秋冬卫衣&quot;},{&quot;photo&quot;:&quot;./img/1.jpg&quot;,&quot;title&quot;:&quot;男士秋冬卫衣&quot;},{&quot;photo&quot;:&quot;./img/6.jpg&quot;,&quot;title&quot;:&quot;男士秋冬卫衣&quot;}]</data></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1">
    <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="我的淘宝">
     <div class="x-titlebar-left" xid="left1"></div>
     <div class="x-titlebar-title" xid="title1">我的淘宝</div>
     <div class="x-titlebar-right reverse" xid="right1"></div></div> </div> 
   <div class="x-panel-content  x-scroll-view" xid="content1" style="background-color:#f2f2f2;" _xid="C6F614D086A00001983C106C1C97EE70">
    
    
    
    
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div4">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i2"></i>
    <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div5"><img src="" alt="" xid="image2" bind-attr-src='$model.toUrl("./img/7.jpg")' style="width:100%;"></img>
  <img src="" alt="" xid="image3" bind-attr-src='$model.toUrl("./img/8.jpg")' style="margin-top:-50px;height:86px;width:79px;position:absolute;"></img>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="background-color:white;">
   <div class="x-col x-col-20" xid="col3"></div>
   <div class="x-col" xid="col2">
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="color:#C0C0C0;">
     <div class="x-col" xid="col5">
      <span xid="span3" class="center-block">458</span></div> 
     <div class="x-col" xid="col6">
      <span xid="span4">0</span></div> 
     <div class="x-col" xid="col7">
      <i class="glyphicon glyphicon-share" xid="i1"></i></div> 
     <div class="x-col" xid="col8">
      <i class="glyphicon glyphicon-star-empty" xid="i3"></i></div> </div> 
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="margin-top:-15px;font-size:16px;">
     <div class="x-col" xid="col9">
      <span xid="span7">全部</span></div> 
     <div class="x-col" xid="col10">
      <span xid="span8">上传</span></div> 
     <div class="x-col" xid="col11">
      <span xid="span9">更新</span></div> 
     <div class="x-col" xid="col12">
      <span xid="span10">收藏</span></div> </div> </div> </div>
  <div xid="div1" class="media" style="background-color:white;">
   <div xid="div2" class="media-left">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="热销" xid="hotBtn" style="color:#000000;font-size:16px;font-weight:bold;">
     <i xid="i6"></i>
     <span xid="span6">热销</span></a> </div> 
   <div xid="div3" class="media-body">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="更多" xid="moreBtn" style="color:#C0C0C0;font-size:16px;font-weight:bold;">
     <i xid="i5"></i>
     <span xid="span5">更多</span></a> </div> </div>
  <div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="listData" style="height:59px;margin-top:-5px;">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="width:50%;" class="pull-left">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
      <div class="x-col" xid="col1">
       <img src="" alt="" xid="image1" bind-attr-src=' $model.toUrl( val("photo"))' style="width:100%;"></img>
       <div component="$UI/system/components/justep/output/output" class="x-output center-block" xid="output1" bind-ref="ref('title')" style="width:70%;"></div></div> </div> </li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div6">
    <span class="x-pull-up-label" xid="span2">加载更多...</span></div> </div></div> 
   <div class="x-panel-bottom" xid="bottom1">
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1" style="height:100%;">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="首页" xid="homeBtn" style="color:#000000;" icon="icon-home">
      <i xid="i22" class="icon-home"></i>
      <span xid="span23">首页</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="购物车" xid="cartBtn" style="color:#000000;" icon="icon-ios7-cart">
      <i xid="i23" class="icon-ios7-cart"></i>
      <span xid="span24">购物车</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="个人中心" xid="userBtn" style="color:#000000;" icon="icon-android-social-user">
      <i xid="i24" class="icon-android-social-user"></i>
      <span xid="span25">个人中心</span></a> </div> </div> </div></div>