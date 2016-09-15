<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:274px;top:286px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="textData" idColumn="fID" onCustomRefresh="textDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid2"></column>
  <column label="姓名" name="fName" type="String" xid="xid3"></column>
  <column label="性别" name="fSex" type="Integer" xid="xid4"></column>
  <column label="地址" name="fAddress" type="String" xid="xid5"></column>
  <column label="备注" name="fRemark" type="String" xid="xid6"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="sexData" idColumn="sex"><column label="性别：" name="sex" type="String" xid="xid7"></column>
  <data xid="default2">[{&quot;sex&quot;:&quot;男&quot;},{&quot;sex&quot;:&quot;女&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="searchKeyData"></div></div> 
<div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs">
   <ul class="nav nav-tabs" xid="ul1">
    <li class="active" xid="li1">
     <a content="tabContentOne" xid="tabItem1">选项1</a></li> 
    <li role="presentation" xid="li2">
     <a content="tabContentTwo" xid="tabItem2">选项2</a></li> </ul> 
   <div class="tab-content" xid="div2">
    <div class="tab-pane active" xid="tabContentOne">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick">
   <i xid="i4"></i>
   <span xid="span5">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="js" xid="jsBtn" onClick="jsClick">
   <i xid="i3"></i>
   <span xid="span4">js</span></a><div xid="div3" style="height:72px;width:200px;">
      <label xid="label2"><![CDATA[横向导航（基本选项卡）]]></label></div> 
     <div xid="div4" style="height:72px;width:200px;">
      <label xid="label4"><![CDATA[横向导航（基本选项卡）]]></label></div> 
     <div xid="div5" style="height:72px;width:200px;">
      <label xid="label5"><![CDATA[横向导航（基本选项卡）]]></label></div> 
  </div> 
    <div class="tab-pane" xid="tabContentTwo">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" style="width:80px;" bind-visible="isVisible" onClick="sourceClickTwo" xid="sourceBtnTwo">
   <i xid="i5"></i>
   <span xid="span6">源码</span></a><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="查询用户" xid="list">
      <div class="x-control-group-title" xid="controlGroupTitle1" style="background-color:#D8F7FA;">
       <span xid="span1">查询用户</span></div> 
       
       
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;"><label xid="label27" bind-text="sexData.label('sex')"></label></div>
   <div class="x-col x-col-fixed" xid="col2" style="width:auto;"><select component="$UI/system/components/justep/select/select" class="form-control " xid="select8" bind-options="sexData" bind-optionsValue="sex" bind-optionsLabel="sex" bind-optionsCaption="请选择"></select></div>
   <div class="x-col x-col-fixed x-col-center" xid="col3" style="width:auto;"><label xid="label28" bind-text="textData.label('fName')+&quot;：&quot;"></label></div>
  <div class="x-col x-col-fixed" xid="col7" style="width:auto;"><input component="$UI/system/components/justep/input/input" class="form-control" xid="keyInput"></input></div>
  <div class="x-col x-col-fixed" xid="col8" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="查询" xid="searchBtn" icon="icon-android-search" style="width:67px;background-color:#EEEEEE;">
       <i xid="i1" class="icon-android-search"></i>
       <span xid="span2">查询</span></a></div>
  <div class="x-col x-col-fixed" xid="col9" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="全部" xid="button2" icon="icon-loop" style="width:67px;background-color:#EEEEEE;">
       <i xid="i2" class="icon-loop"></i>
       <span xid="span3">全部</span></a></div></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="textData" ordering="false">
       <columns xid="columns1">
        <column name="fID" xid="column1"></column>
        <column name="fName" xid="column2"></column>
        <column name="fSex" xid="column6"></column>
        <column name="fAddress" xid="column4"></column>
        <column name="fRemark" xid="column5"></column></columns> </div> </div> </div> </div> </div>
  </div>