<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:177px;top:568px;"><div component="$UI/system/components/justep/data/data" xid="formData" idColumn="name">
   <column label="序号" name="index" type="Integer" xid="index1"></column>
  <column label="关系名称" name="name" type="String" xid="default1"></column>
  <column label="关系类型" name="dataType" type="String" xid="default2"></column>
  <column label="关系标签" name="labelName" type="String" xid="default3"></column>
  <column label="编辑器(*)" name="colEditor" type="String" xid="default4"></column>
  <column label="对应ID" name="refID" type="String" xid="default7"></column>
  <column label="关联dataID" name="selectDataID" type="String" xid="default6"></column>
  <column label="关联列名" name="selectLabelName" type="String" xid="default8"></column>
  <column isCalculate="true" label="选择" name="check" type="Boolean" xid="xid1"></column>
 </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="editeTypeData" idColumn="type">
   <column label="type" name="type" type="String" xid="xid5"></column>
   <data xid="default5">[{&quot;type&quot;:&quot;&quot;},{&quot;type&quot;:&quot;input&quot;},{&quot;type&quot;:&quot;password&quot;},{&quot;type&quot;:&quot;range&quot;},{&quot;type&quot;:&quot;output&quot;},{&quot;type&quot;:&quot;textarea&quot;}]</data></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span>
  
 
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="全选" xid="button1" onClick="allCheckClick">
   <i xid="i1"></i>
   <span xid="span1">全选</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="全不选" xid="button2" onClick="allNotCheckClick">
   <i xid="i2"></i>
   <span xid="span2">全不选</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="完成" xid="okBtn" onClick="okBtnClick">
   <i xid="i3"></i>
   <span xid="span3">完成</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="关闭" xid="closeBtn" onClick="{operation:'windowReceiver.windowCancel'}">
   <i xid="i4"></i>
   <span xid="span4">关闭</span></a></div></div>
   <div class="x-panel-content" xid="content1"><div class="form-horizontal data-form  x-scroll-view" component="$UI/system/components/bootstrap/form/form" xid="form1">
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1">
   <div class="x-content-center x-pull-down container" xid="div2">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"></i>
    <span class="x-pull-down-label" xid="span5">下拉刷新...</span></div> 
   <div class="x-scroll-content" xid="div3"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
     	<div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col1">
   <label class="x-label" xid="label1" bind-text="formData.label('index')"></label></div>
   <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col1">
   	<label class="x-label" xid="label1" bind-text="formData.label('check')"></label></div>
      <div class="col col-xs-3 col-sm-3 col-md-3 col-lg-3" xid="col11">
       <label class="x-label" xid="label9" bind-text="formData.label('name')"></label></div> 
      <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2" xid="col12">
       <label class="x-label" xid="label8" bind-text="formData.label('dataType')"></label></div> 
      <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2" xid="col12">
       <label class="x-label" xid="label8" bind-text="formData.label('colEditor')"></label></div> 
      <div class="col col-xs-3 col-sm-3 col-md-3 col-lg-3" xid="col4">
       <label class="x-label" xid="label7" bind-text="formData.label('labelName')"></label></div> 
  </div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="formData" style="height:100%;">
      <ul class="x-list-template" xid="listTemplateUl1">
       <li xid="li1">
        <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3">
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col2"><label class="x-label" xid="label2" bind-text="ref('index')"></label></div>
  <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col3"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox1" bind-ref='ref("check")' name="checkbox"></span></div>
         <div class="col col-xs-3 col-sm-3 col-md-3 col-lg-3" xid="col8">
          <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="ref('name')"></input></div> 
         <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2" xid="col10">
          <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="ref('dataType')"></input></div> 
         <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2" xid="col10">
          <select component="$UI/system/components/justep/select/select" class="form-control" xid="select1" bind-ref="ref('colEditor')" bind-options="$model.editeTypeData" bind-optionsValue="type"></select></div> 
         <div class="col col-xs-3 col-sm-3 col-md-3 col-lg-3" xid="col9">
          <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="ref('labelName')"></input></div> 
  </div> </li> </ul> </div></div>
   <div class="x-content-center x-pull-up" xid="div4">
    <span class="x-pull-up-label" xid="span6">加载更多...</span></div> </div></div></div>
   </div></div>