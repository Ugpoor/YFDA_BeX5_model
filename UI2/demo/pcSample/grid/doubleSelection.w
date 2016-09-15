<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:398px;top:578px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="leftEmployee" idColumn="name" onCustomRefresh="leftEmployeeCustomRefresh" confirmDelete="false"><column label="姓名" name="name" type="String" xid="xid1"></column>
  <column label="性别" name="sex" type="String" xid="xid2"></column>
  <column label="部门" name="dept" type="String" xid="xid3"></column>
  <column label="学历" name="enducation" type="String" xid="xid4"></column>
  <column label="选择" name="select" type="String" xid="xid9"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="rightEmployee" idColumn="name" onCustomRefresh="rightEmployeeCustomRefresh" confirmDelete="false"><column label="姓名" name="name" type="String" xid="xid5"></column>
  <column label="性别" name="sex" type="String" xid="xid6"></column>
  <column label="部门" name="dept" type="String" xid="xid7"></column>
  <column label="学历" name="enducation" type="String" xid="xid8"></column>
  <column label="选择" name="select" type="String" xid="xid10"></column></div></div> 
<h4 xid="h41"><![CDATA[文本选择器]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i4"></i>
   <span xid="span4">源码</span></a></h4>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu" anchor="source" direction="left-bottom">
   <div class="x-popMenu-overlay" xid="div1"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu1"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="左表源码" xid="leftSource" onClick="leftSourceClick">
    <i xid="i5"></i>
    <span xid="span5">左表源码</span></a> <li class="x-menu-divider divider" xid="divider1"></li></li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="右表源码" xid="rightSource" onClick="rightSourceClick">
    <i xid="i6"></i>
    <span xid="span6">右表源码</span></a> </li>
  </ul></div><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row4" style="margin-left:0;margin-right:0">
   <div class="col col-xs-5 col-sm-5 col-md-5 col-lg-5" xid="col4"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered pull-right" xid="leftGrid" data="leftEmployee" multiselect="true" onCellRender="grid1CellRender" onRowClick="leftGridRowClick" width="100%" height="auto">
   <columns xid="columns1"><column name="name" xid="column1"></column>
  <column name="sex" xid="column2"></column>
  <column name="dept" xid="column3"></column>
  <column name="enducation" xid="column4"></column>
  <column name="select" xid="column9"></column></columns></div>
  </div>
   <div class="col col-xs-2" xid="col6">
  
  <div xid="div2" class="div"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row5">
   <div class="col col-xs-12" xid="col10"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg btn-icon-right center-block" label="选择选中行" xid="advance" icon="icon-arrow-right-a" onClick="advanceClick">
   <i xid="i2" class="icon-arrow-right-a"></i>
   <span xid="span2">选择选中行</span></a></div>
   </div><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row6">
   <div class="col col-xs-12" xid="col14"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg center-block" label="返回选中行" icon="icon-arrow-left-a" xid="return" onClick="returnClick">
   <i xid="i3" class="icon-arrow-left-a"></i>
   <span xid="span3">返回选中行</span></a></div></div></div></div>
   <div class="col col-xs-5 col-sm-5 col-md-5 col-lg-5" xid="col8"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="rightGrid" data="rightEmployee" multiselect="true" onCellRender="grid2CellRender" height="auto" onRowClick="rightGridRowClick" width="100%">
   <columns xid="columns2"><column name="select" xid="column10"></column><column name="name" xid="column5"></column>
  <column name="sex" xid="column6"></column>
  <column name="dept" xid="column7"></column>
  <column name="enducation" xid="column8"></column>
  </columns></div></div></div></div>