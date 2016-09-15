<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:2px;left:107px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="orderData" idColumn="name"><column label="名称" name="name" type="String" xid="xid15"></column>
  <column label="团购" name="gourp" type="String" xid="xid16"></column>
  <column label="评分" name="score" type="String" xid="xid17"></column>
  <column label="价格" name="price" type="String" xid="xid18"></column>
  <column label="地址" name="address" type="String" xid="xid19"></column>
  <column label="距离" name="distance" type="String" xid="xid20"></column>
  <column label="图片" name="photo" type="String" xid="xid21"></column>
  <data xid="default1">[{&quot;name&quot;:&quot;铁板烧自助餐&quot;,&quot;gourp&quot;:&quot;团购&quot;,&quot;score&quot;:&quot;86%&quot;,&quot;price&quot;:&quot;68元/人&quot;,&quot;address&quot;:&quot;昌平区回龙观&quot;,&quot;distance&quot;:&quot;&lt;0.5km&quot;,&quot;photo&quot;:&quot;./img/1.jpg&quot;},{&quot;name&quot;:&quot;麻辣香锅&quot;,&quot;gourp&quot;:&quot;团购&quot;,&quot;score&quot;:&quot;98%&quot;,&quot;price&quot;:&quot;98元/人&quot;,&quot;address&quot;:&quot;海淀区&quot;,&quot;distance&quot;:&quot;&lt;0.7km&quot;,&quot;photo&quot;:&quot;./img/2.jpg&quot;},{&quot;name&quot;:&quot;胖子火锅店&quot;,&quot;gourp&quot;:&quot;团购&quot;,&quot;score&quot;:&quot;90%&quot;,&quot;price&quot;:&quot;78元/人&quot;,&quot;address&quot;:&quot;丰台区&quot;,&quot;distance&quot;:&quot;&lt;0.9km&quot;,&quot;photo&quot;:&quot;./img/3.jpg&quot;},{&quot;name&quot;:&quot;铁板烧自助餐&quot;,&quot;gourp&quot;:&quot;团购&quot;,&quot;score&quot;:&quot;86%&quot;,&quot;price&quot;:&quot;68元/人&quot;,&quot;address&quot;:&quot;昌平区回龙观&quot;,&quot;distance&quot;:&quot;&lt;1.2km&quot;,&quot;photo&quot;:&quot;./img/1.jpg&quot;},{&quot;name&quot;:&quot;麻辣香锅&quot;,&quot;gourp&quot;:&quot;团购&quot;,&quot;score&quot;:&quot;98%&quot;,&quot;price&quot;:&quot;78元/人&quot;,&quot;address&quot;:&quot;海淀区&quot;,&quot;distance&quot;:&quot;&lt;1.5km&quot;,&quot;photo&quot;:&quot;./img/2.jpg&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="91"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="订餐网"> 
        <div class="x-titlebar-left" xid="left1"/>  
        <div class="x-titlebar-title" xid="title1">订餐网</div>  
        <div class="x-titlebar-right reverse" xid="right1"/> 
      </div>  
      <div xid="div1" style="background-color:#f2f2f2;height:43px;font-size:18px;padding-left:10px;padding-top:10px;">当前的位置：昌平区回龙观
        <i class="icon-refresh" style="float:right;margin-right:10px;font-size:20px;"
          xid="refresh"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1" _xid="C6F5FEE537D000018F551895BD4F12C4" style="top: 91px;"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView2">
   <div class="x-content-center x-pull-down container" xid="div17">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i3"></i>
    <span class="x-pull-down-label" xid="span42">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div18"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="orderData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row21">
   <div class="x-col x-col-fixed" xid="col39" style="width:auto;">
    <img src="" alt="" xid="image6" bind-attr-src=' $model.toUrl( val("photo"))' style="height:76px;width:102px;"></img></div> 
   <div class="x-col" xid="col41">
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row22" style="margin-top:-8px;">
     <div class="x-col" xid="col40">
      <span xid="span39" style="font-size:16px;font-weight:bold;" bind-text='val("name")'><![CDATA[]]></span>
      <span xid="span40" style="margin-left:5px;color:#2b8e30;border:1px #93a6eb solid;" bind-text='val("gourp")'><![CDATA[]]></span></div> </div> 
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row23" style="margin-top:-9px;">
     <div class="x-col x-col-50" xid="col9">
      <div class="star" xid="div16">
       <span class="vote-star" xid="span41">
        <i xid="i2" bind-style='{"width" : val("score")}'></i></span> </div> </div> 
     <div class="x-col" xid="col6">
      <span xid="span38" class="pull-right" bind-text='val("price")'><![CDATA[]]></span></div> </div> 
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row24">
     <div class="x-col x-col-67" xid="col10">
      <span xid="span2" bind-text='val("address")'><![CDATA[]]></span></div> 
     <div class="x-col" xid="col42">
      <span xid="span37" class="pull-right" bind-text='val("distance")'><![CDATA[]]></span></div> </div> </div> </div>
  <div xid="div15" style="border-bottom: 1px #ccc solid;"></div></li></ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div19">
    <span class="x-pull-up-label" xid="span43">加载更多...</span></div> </div></div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup1" style="height:100%;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="首页" xid="homeBtn" style="color:#000000;" icon="icon-home"> 
          <i xid="i22" class="icon-home"/>  
          <span xid="span23">首页</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="购物车" xid="cartBtn" style="color:#000000;" icon="icon-ios7-cart"> 
          <i xid="i23" class="icon-ios7-cart"/>  
          <span xid="span24">购物车</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="个人中心" xid="userBtn" style="color:#000000;" icon="icon-android-social-user"> 
          <i xid="i24" class="icon-android-social-user"/>  
          <span xid="span25">个人中心</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
