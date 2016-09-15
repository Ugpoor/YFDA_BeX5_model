<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:10px;left:290px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="hotData" idColumn="photo"><column label="图片" name="photo" type="String" xid="xid1"></column>
  <column label="标题" name="title" type="String" xid="xid2"></column>
  <column label="内容" name="content" type="String" xid="xid3"></column>
  <column label="价格" name="price" type="String" xid="xid4"></column>
  <data xid="default1">[{&quot;photo&quot;:&quot;./img/1.jpg&quot;,&quot;title&quot;:&quot;老北京杂酱面&quot;,&quot;content&quot;:&quot;你饿了吗，电话订购吧&quot;,&quot;price&quot;:&quot;￥15&quot;},{&quot;photo&quot;:&quot;./img/2.jpg&quot;,&quot;title&quot;:&quot;宫保鸡丁&quot;,&quot;content&quot;:&quot;你饿了吗，电话订购吧&quot;,&quot;price&quot;:&quot;￥18&quot;},{&quot;photo&quot;:&quot;./img/4.jpg&quot;,&quot;title&quot;:&quot;北京鸭套餐&quot;,&quot;content&quot;:&quot;你饿了吗，电话订购吧&quot;,&quot;price&quot;:&quot;￥25&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="我的书库"> 
        <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="button1" icon="icon-chevron-left">
   <i xid="i1" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>  
        <div class="x-titlebar-title" xid="title1">我的书库</div>  
        <div class="x-titlebar-right reverse" xid="right1"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1" style="background-color:#f2f2f2;">
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
        <div class="x-col" xid="col1">
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="searchInput" placeHolder="请输入搜索内容"/>
        </div> 
      <div class="x-col x-col-fixed" xid="col2" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="搜索" xid="button14">
   <i xid="i14"></i>
   <span xid="span2">搜索</span></a></div></div>  
      <div xid="div1" style="font-size:16px;margin-left:10px;">附近
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col" xid="col8"><a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="美食" xid="button2" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
   <i xid="i2"></i>
   <span xid="span3">美食</span></a>
  </div>
   <div class="x-col" xid="col9"><a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="景点" xid="button3" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
   <i xid="i3"></i>
   <span xid="span4">景点</span></a></div>
   <div class="x-col" xid="col10"><a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="休闲娱乐" xid="button4" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
   <i xid="i4"></i>
   <span xid="span5">休闲娱乐</span></a></div>
  <div class="x-col" xid="col14"><a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="购物" xid="button5" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
   <i xid="i5"></i>
   <span xid="span6">购物</span></a></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
   <div class="x-col" xid="col17">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="酒店" xid="button8" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
     <i xid="i9"></i>
     <span xid="span10">酒店</span></a> </div> 
   <div class="x-col" xid="col16">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="健身" xid="button9" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
     <i xid="i8"></i>
     <span xid="span8">健身</span></a> </div> 
   <div class="x-col" xid="col18">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="生活服务" xid="button6" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
     <i xid="i7"></i>
     <span xid="span9">生活服务</span></a> </div> 
   <div class="x-col" xid="col15">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="更多" xid="button7" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
     <i xid="i6"></i>
     <span xid="span7">更多</span></a> </div> </div>
  <div xid="div3" style="border-bottom: #b9b8b8 1px solid;margin-bottom: 10px;"></div></div>
    <div xid="div2" style="font-size:16px;margin-left:10px;">区域搜索
   
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
    <div class="x-col" xid="col24">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="海淀区" xid="button10" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
   <i xid="i10"></i>
   <span xid="span11">海淀区</span></a></div> 
    <div class="x-col" xid="col25">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="昌平区" xid="button11" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
   <i xid="i11"></i>
   <span xid="span12">昌平区</span></a></div> 
    
    <div class="x-col" xid="col23">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="丰台区" xid="button12" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
    <i xid="i12"></i>
    <span xid="span13">丰台区</span></a> </div><div class="x-col" xid="col26">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="更多" xid="button13" style="color:#1f1f1f;background-color:transparent;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;">
    <i xid="i13"></i>
    <span xid="span15">更多</span></a> </div></div> 
  <div xid="div4" style="border-bottom: #b9b8b8 1px solid;margin-bottom: 10px;"></div></div>
  <div xid="div6" style="font-size:16px;margin-left:10px;">热门搜索
   
   <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="hotData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row9">
   <div class="x-col x-col-fixed x-col-center" xid="col31" style="width:auto;"><img src="" alt="" xid="image1" bind-attr-src=' $model.toUrl( val("photo"))'></img></div>
   <div class="x-col" xid="col32"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output1" bind-ref="ref('title')" style="font-size:16px;font-weight:bold;"></div>
  <div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" bind-ref="ref('content')"></div>
  <div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref='ref("price")'></div>
  </div>
   </div></li></ul> 
  </div></div></div>  
    <div class="x-panel-bottom" xid="bottom1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1" style="background-color:transparent;height:100%;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="书架" xid="bookBtn" style="color:#000000;" icon="icon-android-note">
   <i xid="i22" class="icon-android-note"></i>
   <span xid="span23">书架</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="书城" xid="bookstoreBtn" style="color:#000000;" icon="icon-android-storage">
   <i xid="i23" class="icon-android-storage"></i>
   <span xid="span24">书城</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" label="个人中心" xid="userBtn" style="color:#000000;" icon="icon-android-social-user">
   <i xid="i24" class="icon-android-social-user"></i>
   <span xid="span25">个人中心</span></a></div></div>
  </div>
</div>
