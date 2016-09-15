<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:61px;top:13px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="replyData" idColumn="fID"> 
      <column label="id" name="fID" type="String" xid="xid10"/>  
      <column label="用户名" name="name" type="String" xid="xid1"/>  
      <column label="内容" name="content" type="String" xid="xid2"/>  
      <column label="时间" name="time" type="String" xid="xid4"/>  
      <column label="追加评论" name="addReply" type="String" xid="xid5"/>  
      <column label="用户头像" name="userPhoto" type="String" xid="xid6"/>  
      <data xid="default1">[{&quot;fID&quot;:&quot;1&quot;,&quot;name&quot;:&quot;回家的孩子&quot;,&quot;content&quot;:&quot;衣服质量很好，摸起来质感很好，很柔顺，穿起来很合身，贴身舒适，看起来很舒服，色泽感非常好，毛料不错，值得拥有！&quot;,&quot;time&quot;:&quot;2015年12月13日 11：02&quot;,&quot;addReply&quot;:&quot;【追加评论】 质量很好，性价比很高&quot;,&quot;userPhoto&quot;:&quot;./img/4.jpg&quot;},{&quot;fID&quot;:&quot;2&quot;,&quot;name&quot;:&quot;听妈妈的话&quot;,&quot;content&quot;:&quot;衣服质量很好，摸起来质感很好，很柔顺，穿起来很合身，贴身舒适，看起来很舒服，色泽感非常好，毛料不错，值得拥有！&quot;,&quot;time&quot;:&quot;2015年12月13日 10：55&quot;,&quot;addReply&quot;:&quot;&quot;,&quot;userPhoto&quot;:&quot;./img/4.jpg&quot;},{&quot;fID&quot;:&quot;3&quot;,&quot;name&quot;:&quot;陌陌&quot;,&quot;content&quot;:&quot;衣服质量很好，摸起来质感很好，很柔顺，穿起来很合身，贴身舒适，看起来很舒服，色泽感非常好，毛料不错，值得拥有！&quot;,&quot;time&quot;:&quot;2015年12月13日 10：45&quot;,&quot;addReply&quot;:&quot;【店家回复】谢谢&quot;,&quot;userPhoto&quot;:&quot;./img/4.jpg&quot;},{&quot;fID&quot;:&quot;4&quot;,&quot;name&quot;:&quot;龙翔天下&quot;,&quot;content&quot;:&quot;衣服质量很好，摸起来质感很好，很柔顺，穿起来很合身，贴身舒适，看起来很舒服，色泽感非常好，毛料不错，值得拥有！&quot;,&quot;time&quot;:&quot;2015年12月13日 10：23&quot;,&quot;addReply&quot;:&quot;【店家回复】谢谢，下次再来&quot;,&quot;userPhoto&quot;:&quot;./img/4.jpg&quot;}]</data></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="imgData" idColumn="ID"> 
      <column label="ID" name="ID" type="String" xid="xid7"/>  
      <column label="tupian" name="img" type="String" xid="xid8"/>  
      <column name="parentID" type="String" xid="xid9"/>  
      <!--       <master xid="default2" data="replyData" relation="parentID"/>  -->  
      <data xid="default2">[{&quot;ID&quot;:&quot;1&quot;,&quot;img&quot;:&quot;./img/1.jpg&quot;,&quot;parentID&quot;:&quot;1&quot;},{&quot;ID&quot;:&quot;2&quot;,&quot;img&quot;:&quot;./img/2.jpg&quot;,&quot;parentID&quot;:&quot;1&quot;},{&quot;ID&quot;:&quot;3&quot;,&quot;img&quot;:&quot;./img/1.jpg&quot;,&quot;parentID&quot;:&quot;3&quot;},{&quot;ID&quot;:&quot;4&quot;,&quot;img&quot;:&quot;./img/2.jpg&quot;,&quot;parentID&quot;:&quot;3&quot;},{&quot;ID&quot;:&quot;5&quot;,&quot;img&quot;:&quot;./img/3.jpg&quot;,&quot;parentID&quot;:&quot;3&quot;},{&quot;ID&quot;:&quot;6&quot;,&quot;img&quot;:&quot;./img/1.jpg&quot;,&quot;parentID&quot;:&quot;4&quot;}]</data></div> 
  </div>  
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
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2" height="58"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified center-block" tabbed="true" xid="buttonGroup2"
            style="width:80%;margin-top:10px;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="评价" xid="accessBtn" target="content2"> 
              <i xid="i1"/>  
              <span xid="span1">评价</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="产品参数" xid="proBtn" target="content6"> 
              <i xid="i2"/>  
              <span xid="span2">产品参数</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="同店推荐" xid="recomBtn" target="content5"> 
              <i xid="i3"/>  
              <span xid="span3">同店推荐</span> 
            </a> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3" style="background-color:#f2f2f2;"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
            active="0" xid="contents1"> 
            <div class="x-contents-content" xid="content2"> 
               
            <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView2" hScroll="false">
   <div class="x-content-center x-pull-down container" xid="div3">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"></i>
    <span class="x-pull-down-label" xid="span6">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div4"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col7">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="全部" xid="allBtn" style="color:#000000;background-color:#C0C0C0;border-color:#cccccc;">
     <i xid="i7"></i>
     <span xid="span14">全部</span></a> </div> 
   <div class="x-col" xid="col11">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="好评" xid="goodBtn" style="color:#000000;background-color:transparent;border-color: #cccccc">
     <i xid="i6"></i>
     <span xid="span15">好评</span></a> </div> 
   <div class="x-col" xid="col8">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="中评" xid="midBtn" style="color:#000000;background-color:transparent;border-color: #cccccc">
     <i xid="i12"></i>
     <span xid="span13">中评</span></a> </div> 
   <div class="x-col" xid="col6">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="差评" xid="badBtn" style="color:#000000;background-color:transparent;border-color: #cccccc">
     <i xid="i13"></i>
     <span xid="span12">差评</span></a> </div> </div>
  <div xid="div11" style="border-bottom:#ccc 1px solid;"></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="replyData">
   <ul class="x-list-template" xid="listTemplateUl4">
    <li xid="li3">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
      <div class="x-col x-col-20" xid="col5">
       <img src="" alt="" xid="image1" bind-attr-src=' $model.getImageUrl( val("userPhoto"))' style="width:60%;" class="center-block"></img></div> 
      <div class="x-col" xid="col12">
       <label xid="label1" bind-text='val("name")'></label>
       <div xid="div7" bind-text=' val("content")'></div>
       <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="imgData" filter='$row.val("parentID") === $object.val("fID")' disablePullToRefresh="true" disableInfiniteLoad="true">
        <ul class="x-list-template" xid="listTemplateUl3">
         <li xid="li4" class="pull-left">
          <img bind-attr-src='$model.toUrl( $object)' style="margin-left:20px;" xid="image2"></img></li> </ul> </div> 
       <div xid="div6" style="clear:both;margin-top:30px;margin-left:20px;" bind-text=' val("time")'></div>
       <label xid="label2" style="margin-top:10px;" bind-text='val("addReply")'></label></div> </div> 
     <div xid="div10" style="border-bottom:#ccc 1px solid;"></div></li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div5">
    <span class="x-pull-up-label" xid="span7">加载更多...</span></div> </div></div>  
            <div class="x-contents-content  x-scroll-view" xid="content6"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView3">
   <div class="x-content-center x-pull-down container" xid="div12">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i14"></i>
    <span class="x-pull-down-label" xid="span16">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div13"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
   <div class="x-col" xid="col16">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="全部" xid="button10" style="color:#000000;background-color:#C0C0C0;border-color:#cccccc;">
     <i xid="i15"></i>
     <span xid="span20">全部</span></a> </div> 
   <div class="x-col" xid="col14">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="好评" xid="button11" style="color:#000000;background-color:transparent;border-color: #cccccc">
     <i xid="i16"></i>
     <span xid="span19">好评</span></a> </div> 
   <div class="x-col" xid="col18">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="中评" xid="button8" style="color:#000000;background-color:transparent;border-color: #cccccc">
     <i xid="i17"></i>
     <span xid="span21">中评</span></a> </div> 
   <div class="x-col" xid="col17">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block" label="差评" xid="button9" style="color:#000000;background-color:transparent;border-color: #cccccc">
     <i xid="i18"></i>
     <span xid="span18">差评</span></a> </div> </div>
  <div xid="div17" style="border-bottom:#ccc 1px solid;"></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list5" data="replyData">
   <ul class="x-list-template" xid="listTemplateUl5">
    <li xid="li5">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
      <div class="x-col x-col-20" xid="col15">
       <img src="" alt="" xid="image4" bind-attr-src=' $model.getImageUrl( val("userPhoto"))' style="width:60%;" class="center-block"></img></div> 
      <div class="x-col" xid="col13">
       <label xid="label3" bind-text='val("name")'></label>
       <div xid="div15" bind-text=' val("content")'></div>
       <div component="$UI/system/components/justep/list/list" class="x-list" xid="list6" data="imgData" filter='$row.val("parentID") === $object.val("fID")' disablePullToRefresh="true" disableInfiniteLoad="true">
        <ul class="x-list-template" xid="listTemplateUl6">
         <li xid="li6" class="pull-left">
          <img bind-attr-src="$model.toUrl( $object)" style="margin-left:20px;" xid="image3"></img></li> </ul> </div> 
       <div xid="div16" style="clear:both;margin-top:30px;margin-left:20px;" bind-text=' val("time")'></div>
       <label xid="label4" style="margin-top:10px;" bind-text='val("addReply")'></label></div> </div> 
     <div xid="div18" style="border-bottom:#ccc 1px solid;"></div></li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div14">
    <span class="x-pull-up-label" xid="span17">加载更多...</span></div> </div></div>  
            <div class="x-contents-content  x-content-on-right" xid="content5"/> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup1" style="height:100%;background-color:#ccc;"> 
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
