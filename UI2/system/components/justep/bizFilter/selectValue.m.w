<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="receiver" style="left:197px;top:303px;" onReceive="receiverReceive"/>  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:266px;top:188px;"> 
    <div component="$UI/system/components/justep/data/data" xid="valueData"
      idColumn="value" autoLoad="false" onCustomRefresh="valueDataCustomRefresh"> 
      <column label="值" name="value" type="String" xid="default1"/>  
      </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="选择数据">
   <div class="x-titlebar-left" xid="div1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="返回" xid="cancelBtn" onClick='{"operation":"receiver.windowCancel"}'>
   <i xid="i2"></i>
   <span xid="span2">返回</span></a></div>
   <div class="x-titlebar-title" xid="div4">选择数据</div>
   <div class="x-titlebar-right reverse" xid="div5"></div></div></div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel" xid="panel2" style="height:100%;">
   <div class="x-panel-top" xid="top2"><div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="valueData" filterRelations="empty" onFilter="smartFilterFilter" style="margin: 5px;">
   <span class="input-group-addon" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))" xid="span3">
    <i class="icon-android-search" xid="i3"></i></span> 
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input>
   <span class="input-group-addon" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))" bind-visible="$model.comp($element.parentElement).searchText.get() != ''" xid="span5">
    <i class="icon-close-circled" xid="i4"></i></span> </div></div>
   <div class="x-panel-content x-scroll-view" xid="content2" style="top:48px;bottom: 0px;"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div2">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"></i>
    <span class="x-pull-down-label" xid="span1">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div3"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="valueData" style="margin: 5px;">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="listItem" style="padding: 10px;" bind-css="{'bg-info': $object.data.getCurrentRow() == $object}">
     <div component="$UI/system/components/justep/output/output" class="x-output" xid="output1" bind-ref="ref('value')" style="cursor: pointer;" bind-click="okBtnClick"></div></li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div6">
    <span class="x-pull-up-label" xid="span4">加载更多...</span></div> </div></div>
   </div></div>  
    </div> 
</div>
