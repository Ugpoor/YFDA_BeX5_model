<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:29px;top:1px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="bookData" idColumn="name"><column label="书名" name="name" type="String" xid="xid1"></column>
  <column label="作者" name="author" type="String" xid="xid2"></column>
  <column label="分类" name="categrey" type="String" xid="xid3"></column>
  <column label="图片" name="photo" type="String" xid="xid4"></column>
  <data xid="default1">[{&quot;name&quot;:&quot;摆渡人&quot;,&quot;author&quot;:&quot;克莱儿·麦克福尔&quot;,&quot;categrey&quot;:&quot;文化&quot;,&quot;photo&quot;:&quot;./img/1.jpg&quot;},{&quot;name&quot;:&quot;岛上书店&quot;,&quot;author&quot;:&quot;加布瑞埃拉·泽文&quot;,&quot;categrey&quot;:&quot;文化&quot;,&quot;photo&quot;:&quot;./img/2.jpg&quot;},{&quot;name&quot;:&quot;一个人的朝圣&quot;,&quot;author&quot;:&quot;蕾秋·乔伊斯&quot;,&quot;categrey&quot;:&quot;文化&quot;,&quot;photo&quot;:&quot;./img/3.jpg&quot;},{&quot;name&quot;:&quot;世界上的另一个你&quot;,&quot;author&quot;:&quot;朗·霍尔，丹佛·摩尔&quot;,&quot;categrey&quot;:&quot;文化&quot;,&quot;photo&quot;:&quot;./img/4.jpg&quot;},{&quot;name&quot;:&quot;活着&quot;,&quot;author&quot;:&quot;余华&quot;,&quot;categrey&quot;:&quot;文化&quot;,&quot;photo&quot;:&quot;./img/5.jpg&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="我的淘宝"> 
        <div class="x-titlebar-left" xid="left1"/>  
        <div class="x-titlebar-title" xid="title1">我的淘宝</div>  
        <div class="x-titlebar-right reverse" xid="right1"/>
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1" style="background-color:#f2f2f2;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-top" xid="top2" height="58">
   <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified center-block" tabbed="true" xid="buttonGroup2" style="margin-top:10px;border:1px #ccc solid;border-radius:8px;width:80%;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="出版" xid="publishBtn" target="content3">
     <i xid="i1"></i>
     <span xid="span1">出版</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="原创" xid="originalBtn" target="content4">
     <i xid="i2"></i>
     <span xid="span2">原创</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="免费" xid="freeBtn" target="content5">
     <i xid="i3"></i>
     <span xid="span3">免费</span></a> </div> </div><div class="x-panel-content" xid="content2"><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1">
   <div class="x-contents-content  x-scroll-view" xid="content3">
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div1">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i4"></i>
    <span class="x-pull-down-label" xid="span4">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div2"><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list2" data="bookData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
      <div class="x-col x-col-fixed" xid="col3" style="width:auto;">
       <img src="" alt="" xid="image2" bind-attr-src=' $model.toUrl( val("photo"))' style="height:106px;width:107px;"></img></div> 
      <div class="x-col" xid="col4">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output6" bind-ref="ref('name')" style="font-size:16px;font-weight:bold;"></div>
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output5" bind-ref="ref('author')"></div>
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output4" bind-ref="ref('categrey')"></div></div> </div> 
     <div xid="div6" style="border-bottom: 1px #ccc solid;"></div></li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div3">
    <span class="x-pull-up-label" xid="span5">加载更多...</span></div> </div>
  </div>
  <div class="x-contents-content  x-scroll-view" xid="content4">
  
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView2">
   <div class="x-content-center x-pull-down container" xid="div4">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"></i>
    <span class="x-pull-down-label" xid="span6">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div5"><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="bookData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
      <div class="x-col x-col-fixed" xid="col2" style="width:auto;">
       <img src="" alt="" xid="image1" bind-attr-src=' $model.toUrl( val("photo"))' style="height:106px;width:107px;"></img></div> 
      <div class="x-col" xid="col1">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" bind-ref="ref('name')" style="font-size:16px;font-weight:bold;"></div>
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref="ref('author')"></div>
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output1" bind-ref="ref('categrey')"></div></div> </div> </li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div7">
    <span class="x-pull-up-label" xid="span7">加载更多...</span></div> </div></div>
  <div class="x-contents-content  x-scroll-view" xid="content5">
  
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView3">
   <div class="x-content-center x-pull-down container" xid="div8">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i6"></i>
    <span class="x-pull-down-label" xid="span8">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div9"><div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list3" data="bookData">
   <ul class="x-list-template" xid="listTemplateUl3">
    <li xid="li3">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
      <div class="x-col x-col-fixed" xid="col6" style="width:auto;">
       <img src="" alt="" xid="image3" bind-attr-src=' $model.toUrl( val("photo"))' style="height:106px;width:107px;"></img></div> 
      <div class="x-col" xid="col5">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output8" bind-ref="ref('name')" style="font-size:16px;font-weight:bold;"></div>
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output9" bind-ref="ref('author')"></div>
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output7" bind-ref="ref('categrey')"></div></div> </div> </li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div10">
    <span class="x-pull-up-label" xid="span9">加载更多...</span></div> </div></div></div></div>
   </div>
  </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup1" style="height:100%;background-color:#ccc;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="首页" xid="homeBtn" style="color:#000000;" icon="icon-home" target="content3"> 
          <i xid="i22" class="icon-home"/>  
          <span xid="span23">首页</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="书城" xid="bookBtn" style="color:#000000;" icon="icon-ios7-cart" target="content4"> 
          <i xid="i23" class="icon-ios7-cart"/>  
          <span xid="span24">书城</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="个人中心" xid="userBtn" style="color:#000000;" icon="icon-android-social-user" target="content5"> 
          <i xid="i24" class="icon-android-social-user"/>  
          <span xid="span25">个人中心</span>
        </a> 
      </div> 
    </div> 
  </div>
</div>
