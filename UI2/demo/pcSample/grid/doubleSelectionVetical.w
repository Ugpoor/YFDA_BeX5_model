<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:358px;top:578px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="aboveData" idColumn="name" onCustomRefresh="aboveDataCustomRefresh" confirmDelete="false"><column label="姓名" name="name" type="String" xid="xid1"></column>
  <column label="性别" name="sex" type="String" xid="xid2"></column>
  <column label="部门" name="dept" type="String" xid="xid3"></column>
  <column label="选择" name="select" type="String" xid="xid4"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="bottomData" idColumn="name" onCustomRefresh="bottomDataCustomRefresh" confirmDelete="false"><column label="姓名" name="name" type="String" xid="xid5"></column>
  <column label="性别" name="sex" type="String" xid="xid6"></column>
  <column label="部门" name="dept" type="String" xid="xid7"></column>
  <column label="选择" name="select" type="String" xid="xid8"></column></div></div> 
<h4 xid="h41"><![CDATA[双向选择器(纵向铺满)]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu" direction="left-bottom" anchor="source">
   <div class="x-popMenu-overlay" xid="div2"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu2"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="上表源码" xid="topSource" onClick="topSourceClick">
    <i xid="i3"></i>
    <span xid="span3">上表源码</span></a> </li>
  <li class="x-menu-divider divider" xid="divider1"></li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="下表源码" xid="bottomSource" onClick="bottomSourceClick">
    <i xid="i4"></i>
    <span xid="span4">下表源码</span></a> </li></ul></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" xid="aboveGrid" data="aboveData" width="100%" onRowClick="aboveGridRowClick" onCellRender="aboveGridCellRender" height="auto" showRowNumber="true" class="x-grid-no-bordered aboveGrid">
   <columns xid="columns1"><column name="name" xid="column1"></column>
  <column name="sex" xid="column2"></column>
  <column name="dept" xid="column3"></column>
  <column name="select" xid="column4"></column></columns></div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" xid="bottomGrid" data="bottomData" width="100%" onRowClick="bottomGridRowClick" onCellRender="bottomGridCellRender" height="auto" showRowNumber="true" class="x-grid-no-bordered">
   <columns xid="columns2"><column name="name" xid="column5"></column>
  <column name="sex" xid="column6"></column>
  <column name="dept" xid="column7"></column>
  <column name="select" xid="column8"></column></columns></div></div>