<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:14px;top:409px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userData" idColumn="fName"><column label="姓名" name="fName" type="String" xid="xid1"></column>
  <column label="地址" name="fAddress" type="String" xid="xid2"></column>
  <data xid="default5">[{&quot;fName&quot;:&quot;主页模板信息栏目1&quot;,&quot;fAddress&quot;:&quot;地址&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="informationData" idColumn="fID" onCustomRefresh="informationDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid3"></column>
  <column label="标题" name="fTitle" type="String" xid="xid4"></column>
  <column label="时间" name="fTime" type="Date" xid="xid5"></column>
  <data xid="default6">[]</data></div></div> 

  
  
  
  
  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1">
   <div class="x-contents-content" xid="content1"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group pull-left" xid="controlGroupOne" style="width:48%;height:250px;" title="个人信息">
   <div class="x-control-group-title" xid="controlGroupTitle1" style="height:40px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" icon="icon-android-contact">
   <i xid="i2" class="icon-android-contact"></i>
   <span xid="span14"></span></a><span xid="span1"><![CDATA[]]></span><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick">
   <i xid="i3"></i>
   <span xid="span2">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="js" xid="jsBtn" onClick="jsClick">
   <i xid="i3"></i>
   <span xid="span3">js</span></a></div> 
  <div xid="div8" style="height:138px;"><img src="$UI/demo/sample/layout/img/2.jpg" alt="" xid="image1" style="height:114px;width:80px;" class="pull-left image"></img>
  
  
  <div xid="div9" style="height:117px;width:auto;" class="pull-left div9"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelOutput1" style="width:173px;height:31px;">
   <label class="x-label" xid="label1" bind-text="userData.label('fName')+&quot;：&quot;"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="userData.ref('fName')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelOutput2" style="width:173px;height:31px;">
   <label class="x-label" xid="label2" bind-text="userData.label('fAddress')+&quot;：&quot;"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output2" bind-ref="userData.ref('fAddress')"></div></div>
  </div></div>
  
  </div><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group pull-right" title="信息接收" xid="controlGroupTwo" style="width:48%;height:250px;">
   <div class="x-control-group-title" xid="controlGroupTitle4" style="height:40px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="button1" icon="icon-android-mail" disabled="true">
   <i xid="i1" class="icon-android-mail"></i>
   <span xid="span7"></span></a><span xid="span4">title</span><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="源码" xid="sourceBtnTwo" onClick="sourceBtnTwoClick">
   <i xid="i12"></i>
   <span xid="span10">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="js" xid="jsBtnTwo" onClick="jsClick">
   <i xid="i13"></i>
   <span xid="span11">js</span></a></div> 
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="informationData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li3"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col1"><a xid="a4" bind-text="ref('fTitle')">link</a></div>
   <div class="x-col x-col-fixed" xid="col3" style="width:auto;"><label xid="label3" bind-text="ref('fTime')">label</label></div></div></li></ul> </div>
  </div><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group pull-left" title="工作日志" xid="controlGroupThree" style="height:250px;width:48%;">
   <div class="x-control-group-title" xid="controlGroupTitle8" style="height:40px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="button5" icon="icon-android-book">
   <i xid="i5" class="icon-android-book"></i>
   <span xid="span22"></span></a><span xid="span16">title</span><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="源码" xid="sourceBtnThree" onClick="sourceBtnThreeClick">
   <i xid="i15"></i>
   <span xid="span13">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="js" xid="jsBtnThree" onClick="jsClick">
   <i xid="i14"></i>
   <span xid="span12">js</span></a></div> 
  <div xid="div11" style="height:158px;">
   <img src="$UI/demo/sample/layout/img/information11.png" alt="" xid="image2" style="height:168px;width:144px;" class="pull-left image"></img>
   <div xid="div10" style="height:149px;width:auto;" class="pull-left div9">
    
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="informationData">
   <ul class="x-list-template" xid="listTemplateUl4">
    <li xid="li6">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
      <div class="x-col" xid="col9">
       <a xid="a7" bind-text="ref('fTitle')">link</a></div> 
      <div class="x-col x-col-fixed" xid="col8" style="width:auto;">
       <label xid="label8" bind-text="ref('fTime')">label</label></div> </div> </li> </ul> </div></div> </div></div><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group pull-right" title="通知公告" xid="controlGroupFour" style="height:250px;width:48%;">
   <div class="x-control-group-title" xid="controlGroupTitle10" style="height:40px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="源码" xid="sourceBtnFour" onClick="sourceBtnFour">
   <i xid="i17"></i>
   <span xid="span17">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="js" xid="jsBtnTour" onClick="jsClick">
   <i xid="i16"></i>
   <span xid="span15">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="button4" icon="icon-android-star" disabled="true">
    <i xid="i4" class="icon-android-star"></i>
    <span xid="span20"></span></a><span xid="span19">title</span></div> 
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="informationData">
   <ul class="x-list-template" xid="listTemplateUl3">
    <li xid="li5">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
      <div class="x-col" xid="col6">
       <a xid="a6" bind-text="ref('fTitle')">link</a></div> 
      <div class="x-col x-col-fixed" xid="col7" style="width:auto;">
       <label xid="label5" bind-text="ref('fTime')">label</label></div> </div> </li> </ul> </div></div><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group pull-left" title="标准规范" xid="controlGroupFive" style="height:250px;width:48%;">
   <div class="x-control-group-title" xid="controlGroupTitle12" style="height:40px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="源码" xid="sourceBtnFive" onClick="sourceBtnFive">
   <i xid="i18"></i>
   <span xid="span18">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="js" xid="jsBtnFive" onClick="jsClick">
   <i xid="i8"></i>
   <span xid="span5">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="button6" icon="icon-android-calendar" disabled="true">
     <i xid="i6" class="icon-android-calendar"></i>
     <span xid="span24"></span></a> 
    <span xid="span23">title</span></div> 
   <div component="$UI/system/components/justep/list/list" class="x-list" xid="list5" data="informationData">
    <ul class="x-list-template" xid="listTemplateUl5">
     <li xid="li7">
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
       <div class="x-col" xid="col11">
        <a xid="a8" bind-text="ref('fTitle')">link</a></div> 
       <div class="x-col x-col-fixed" xid="col10" style="width:auto;">
        <label xid="label9" bind-text="ref('fTime')">label</label></div> </div> </li> </ul> </div> </div><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group pull-right" title="内部审核" xid="controlGroupSixe" style="height:250px;width:48%;">
   <div class="x-control-group-title" xid="controlGroupTitle13" style="height:40px;">
    <a component="$UI/system/components/justep/button/button" label="源码" xid="sourcrBtnSixe" class="btn btn-link btn-sm pull-right" onClick="sourcrBtnSixe">
   <i xid="i10"></i>
   <span xid="span8">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right" label="js" xid="jsBtnSixe" onClick="jsClick">
   <i xid="i9"></i>
   <span xid="span6">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon" label="button" xid="button7" icon="icon-edit" disabled="true">
     <i xid="i7" class="icon-edit"></i>
     <span xid="span26"></span></a> 
    <span xid="span25">title</span></div> 
   <div component="$UI/system/components/justep/list/list" class="x-list" xid="list6" data="informationData">
    <ul class="x-list-template" xid="listTemplateUl6">
     <li xid="li8">
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
       <div class="x-col" xid="col13">
        <a xid="a9" bind-text="ref('fTitle')">link</a></div> 
       <div class="x-col x-col-fixed" xid="col12" style="width:auto;">
        <label xid="label10" bind-text="ref('fTime')">label</label></div> </div> </li> </ul> </div> </div></div></div>
  </div>