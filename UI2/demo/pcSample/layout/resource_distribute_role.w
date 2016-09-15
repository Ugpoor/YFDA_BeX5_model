<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:32px;top:70px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="roleData" idColumn="fID" isTree="true" onCustomRefresh="roleDataCustomRefresh">
   <column label="ID" name="fID" type="String" xid="xid12"></column>
   <column label="组织机构" name="fName" type="String" xid="xid13"></column>
   <column label="父" name="fParentID" type="String" xid="xid14"></column>
   <column label="类型" name="fType" type="String" xid="xid15"></column>
   <treeOption delayLoad="false" parentRelation="fParentID" xid="default18"></treeOption></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="resourceData" idColumn="fID" isTree="true" onCustomRefresh="resoureDataCustomRefresh" confirmDelete="false">
   <column label="ID" name="fID" type="String" xid="column4"></column>
  <column label="组织机构" name="fName" type="String" xid="column5"></column>
  <column label="父" name="fParentID" type="String" xid="column2"></column>
  <column label="类型" name="fType" type="String" xid="column3"></column>
  <treeOption delayLoad="false" parentRelation="fParentID" xid="default1"></treeOption></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="selectData" idColumn="fName" confirmDelete="false"><column label="资源" name="fName" type="String" xid="xid1"></column></div></div> 

  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="height:100%;">
   <div class="x-col x-col-fixed" xid="col4" style="width:auto;"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="角色列表" xid="menu" style="width:155px;">
   <div class="x-control-group-title" xid="controlGroupTitle2" style="background-color:#CFE7F3;">
    <span xid="span6">title</span></div> <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="roleData" appearance="treeGrid" serverSort="true">
   <columns xid="columns1"><column name="fName" xid="column1" sortable="false" width="150"></column></columns></div></div></div>
   <div class="x-col" xid="col6"><div component="$UI/system/components/justep/contents/contents" class="x-contents " active="0" xid="contents1" style="width:100%;height:100%;">
   <div class="x-contents-content" xid="page"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="为角色分配权限" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1" style="background-color:#CFE7F3;">
    <span xid="span1">title</span><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="button6" onClick="showJsSource">
   <i xid="i8"></i>
   <span xid="span22">JS</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="button7" onClick="showSource" bind-visible="isVisible">
   <i xid="i9"></i>
   <span xid="span23">源码</span></a></div> 
  
  
  
  
  
  <div xid="div6" style="height:500px;width:auto;" class="div6"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-fixed" xid="col1" style="width:auto;"><div xid="div1" style="height:450px;width:230px;"><label xid="label1"><![CDATA[未分配资源]]></label>
  <div xid="div2" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;border-color:#DAF1F8 #DAF1F8 #DAF1F8 #DAF1F8;height:400px;"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="false" class="x-grid-no-bordered" xid="resource" data="resourceData" appearance="treeGrid" height="355" width="227" onRowDblClick="resourceRowDblClick">
   <columns xid="columns2"><column width="205" name="fName" xid="column6" sortable="false"></column></columns></div></div></div></div>
   <div class="x-col x-col-fixed x-col-center" xid="col2" style="width:80px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right" label="全部" xid="all" icon="icon-chevron-right" style="background-color:#EEEEEE;width:70px;" onClick="allClick">
   <i xid="i1" class="icon-chevron-right"></i>
   <span xid="span2">全部</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="清空" xid="clear" icon="icon-chevron-left" style="background-color:#EEEEEE;width:70px;" onClick="clearClick">
   <i xid="i2" class="icon-chevron-left"></i>
   <span xid="span3">清空</span></a>
  
  </div>
   <div class="x-col x-col-fixed" xid="col3" style="width:auto;"><div xid="div4" style="height:450px;width:230px;">
   <label xid="label2"><![CDATA[已分配资源]]></label>
   <div xid="div3" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;border-color:#DAF1F8 #DAF1F8 #DAF1F8 #DAF1F8;height:400px;" class="div3">
  <div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="selectData">
   <ul class="x-list-template x-min-height list-group" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1">
    <li xid="li1" class="x-min-height list-group-item" componentname="li(html)" id="undefined_li1" style="height:36px;">
     <div component="$UI/system/components/justep/output/output" class="x-output" xid="select" bind-ref="ref('fName')" bind-dblclick="selectDblclick"></div></li> </ul> </div></div></div></div></div><div xid="div5" style="width:160px;" class="center-block"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="确定" xid="button3" style="width:70px;background-color:#D9D9D9;" onClick="clearClick">
   <i xid="i3"></i>
   <span xid="span4">确定</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="重置" xid="button4" style="width:70px;background-color:#D9D9D9;" onClick="clearClick">
   <i xid="i4"></i>
   <span xid="span5">重置</span></a></div></div>
  </div>
  
  </div></div></div></div></div>