<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:32px;top:353px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="resourceData" idColumn="fID" isTree="true" onCustomRefresh="resourceDataCustomRefresh" confirmDelete="false">
   <column label="ID" name="fID" type="String" xid="column4"></column>
   <column label="组织机构" name="fName" type="String" xid="column5"></column>
   <column label="父" name="fParentID" type="String" xid="column2"></column>
   <column label="类型" name="fType" type="String" xid="column3"></column>
   <treeOption delayLoad="false" parentRelation="fParentID" xid="default1"></treeOption></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="selectData" idColumn="fName" confirmDelete="false">
   <column label="资源" name="fName" type="String" xid="xid1"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userData" idColumn="fID"><column label="ID" name="fID" type="String" xid="xid2"></column>
  <column label="姓名" name="fName" type="String" xid="xid3"></column>
  <column label="年龄" name="fAge" type="Integer" xid="xid4"></column>
  <data xid="default2">[{&quot;fID&quot;:&quot;001&quot;,&quot;fName&quot;:&quot;用户1&quot;,&quot;fAge&quot;:22},{&quot;fID&quot;:&quot;002&quot;,&quot;fName&quot;:&quot;用户2&quot;,&quot;fAge&quot;:35},{&quot;fID&quot;:&quot;003&quot;,&quot;fName&quot;:&quot;用户3&quot;,&quot;fAge&quot;:19},{&quot;fID&quot;:&quot;004&quot;,&quot;fName&quot;:&quot;用户4&quot;,&quot;fAge&quot;:26},{&quot;fID&quot;:&quot;005&quot;,&quot;fName&quot;:&quot;用户5&quot;,&quot;fAge&quot;:28}]</data></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="分配权限展示" style="color:#FFFFFF;">
   <div class="x-titlebar-title" xid="title1">分配权限展示</div>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="jsBtn" onClick="showJsSource">
   <i xid="i8"></i>
   <span xid="span22">JS</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="showSource" bind-visible="isVisible">
   <i xid="i9"></i>
   <span xid="span23">源码</span></a></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="width:750px;">
   <div class="col1 x-col x-col-fixed x-col-center" xid="col1" style="width:auto;height:45px;"><label xid="label3" style="width:75px;"><![CDATA[选择用户1:]]></label></div>
   <div class="x-col col1" xid="col3" style="height:45px;"><input component="$UI/system/components/justep/input/input" class="form-control pull-left" xid="input1" style="width:150px;" placeHolder="请输入用户"></input>
  <span xid="span6" class="pull-left"><![CDATA[（用户数量大时使用这种方式）]]></span></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="width:750px;">
   <div class="col1 x-col x-col-fixed x-col-center" xid="col7" style="width:auto;height:45px;"><label xid="label4" style="width:75px;" class="label4"><![CDATA[选择用户2:]]></label></div>
   <div class="x-col col1" xid="col9" style="height:45px;"><select component="$UI/system/components/justep/select/select" class="form-control pull-left" xid="select1" style="width:150px;" bind-options="userData" bind-optionsValue="fName" bind-optionsLabel="fName" bind-optionsCaption="请选择"></select>
  <span xid="span1" class="pull-left"><![CDATA[（用户数量小时使用这种方式）]]></span></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="width:750px;">
   <div class="col1 x-col x-col-fixed x-col-center" xid="col10" style="width:auto;height:362px;"><label xid="label5" style="width:75px;" class="label5"><![CDATA[分配权限:]]></label>
  
  </div>
   <div class="x-col col1" xid="col12"><div xid="div6" style="width:auto;height:350px;" class="div6">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
    <div class="x-col x-col-fixed" xid="col16" style="width:auto;">
     <div xid="div1" style="width:230px;height:350px;">
      <label xid="label1">未分配资源</label>
      <div xid="div2" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;border-color:#DAF1F8 #DAF1F8 #DAF1F8 #DAF1F8;height:300px;">
       <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="false" class="x-grid-no-bordered" xid="resource" data="resourceData" appearance="treeGrid" height="296" width="227" onRowDblClick="resourceRowDblClick">
        <columns xid="columns2">
         <column width="205" name="fName" xid="column6" sortable="false"></column></columns> </div> 
  </div> </div> </div> 
    <div class="x-col x-col-fixed x-col-center" xid="col2" style="width:80px;">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right" label="全部" xid="all" icon="icon-chevron-right" style="background-color:#EEEEEE;width:70px;" onClick="allClick">
      <i xid="i1" class="icon-chevron-right"></i>
      <span xid="span2">全部</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="清空" xid="clear" icon="icon-chevron-left" style="background-color:#EEEEEE;width:70px;" onClick="clearClick">
      <i xid="i2" class="icon-chevron-left"></i>
      <span xid="span3">清空</span></a> </div> 
    <div class="x-col x-col-fixed" xid="col17" style="width:auto;">
     <div xid="div4" style="width:230px;height:350px;">
      <label xid="label2">已分配资源</label>
      <div xid="div3" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;border-color:#DAF1F8 #DAF1F8 #DAF1F8 #DAF1F8;height:300px;" class="div3">
       <div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="selectData">
        <ul class="x-list-template x-min-height list-group" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1">
         <li xid="li1" class="x-min-height list-group-item" componentname="li(html)" id="undefined_li1" style="height:36px;">
          <div component="$UI/system/components/justep/output/output" class="x-output" xid="select" bind-ref="ref('fName')" bind-dblclick="selectDblclick"></div></li> </ul> </div> </div> </div> </div> </div> 
   </div></div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row5" style="width:750px;">
   <div class="x-col col1" xid="col15"><div xid="div5" style="height:42px;width:180px;" class="center-block">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="确定" xid="button3" style="width:70px;background-color:#D9D9D9;" onClick="clearClick">
    <i xid="i3"></i>
    <span xid="span4">确定</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn2 btn btn-link" label="重置" xid="button4" style="width:70px;background-color:#D9D9D9;" onClick="clearClick">
    <i xid="i4"></i>
    <span xid="span5">重置</span></a> </div></div></div></div>
   </div>
  
  
  
  </div>