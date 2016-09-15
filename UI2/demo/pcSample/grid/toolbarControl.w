<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:418px;top:586px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="employeeData" idColumn="name" onCustomRefresh="employeeDataCustomRefresh"><column label="姓名" name="name" type="String" xid="xid1"></column>
  <column label="性别" name="sex" type="String" xid="xid2"></column>
  <column label="部门" name="dept" type="String" xid="xid3"></column>
  <column label="学历" name="enducation" type="String" xid="xid4"></column></div></div> 
<h4 xid="h41" class="center-block"><![CDATA[工具栏控制]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick">
   <i xid="i18"></i>
   <span xid="span18">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i19"></i>
   <span xid="span19">源码</span></a></h4>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu" anchor="source" direction="left-bottom">
   <div class="x-popMenu-overlay" xid="div1"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menu1"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="第一个工具栏源码" xid="firstSource" onClick="firstSourceClick">
    <i xid="i20"></i>
    <span xid="span20">第一个工具栏源码</span></a> </li>
  <li class="x-menu-divider divider" xid="divider1"></li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="第二个工具栏源码" xid="secondSource" onClick="secondSourceClick">
    <i xid="i21"></i>
    <span xid="span21">第二个工具栏源码</span></a> </li>
  <li class="x-menu-divider divider" xid="divider2"></li>
  <li class="x-menu-item" xid="item3">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="第三个工具栏源码" xid="thirdSource" onClick="thirdSourceClick">
    <i xid="i22"></i>
    <span xid="span22">第三个工具栏源码</span></a> </li></ul></div><h4 xid="h51"><![CDATA[这里禁用了批量删除按钮，并隐藏了导入按钮。实际开发中，通过权限机制来控制输出相关的属性值即可。 ]]></h4><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="firstToolBar"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="button1" icon="icon-android-add">
   <i xid="i1" class="icon-android-add"></i>
   <span xid="span1">新增</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="批量删除" xid="button2" icon="icon-android-close" disabled="true">
   <i xid="i2" class="icon-android-close"></i>
   <span xid="span2">批量删除</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导入" xid="button3" icon="icon-arrow-graph-down-right" bind-visible="false">
   <i xid="i3" class="icon-arrow-graph-down-right"></i>
   <span xid="span3">导入</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导出当前页" xid="button4" icon="icon-arrow-graph-up-right">
   <i xid="i4" class="icon-arrow-graph-up-right"></i>
   <span xid="span4">导出当前页</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导出全部" icon="icon-arrow-graph-up-right" xid="exportAll">
   <i xid="i5" class="icon-arrow-graph-up-right"></i>
   <span xid="span5">导出全部</span></a></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="employeeGrid" data="employeeData" multiselect="true" showRowNumber="true" width="100%" height="auto">
   <columns xid="columns1"><column name="name" xid="column1"></column>
  <column name="sex" xid="column2"></column>
  <column name="dept" xid="column3"></column>
  <column name="enducation" xid="column4"></column></columns></div><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="动态禁用按钮" xid="dynamicForbidden" onClick="dynamicForbiddenClick">
   <i xid="i6"></i>
   <span xid="span6">动态禁用按钮</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="动态启用按钮" xid="dynamicEnable" onClick="dynamicEnableClick">
   <i xid="i7"></i>
   <span xid="span7">动态启用按钮</span></a><h4 xid="h42" class="center-block"><![CDATA[这里控制工具栏靠右排列。]]>
  
  </h4>
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="secondToolBar" style="height:53px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="导出全部" xid="button5" icon="icon-arrow-graph-up-right">
   <i xid="i8" class="icon-arrow-graph-up-right"></i>
   <span xid="span8">导出全部</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="导出当前页" xid="button6" icon="icon-arrow-graph-up-right">
   <i xid="i9" class="icon-arrow-graph-up-right"></i>
   <span xid="span9">导出当前页</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="导入" xid="button7" icon="icon-arrow-graph-down-right">
   <i xid="i10" class="icon-arrow-graph-down-right"></i>
   <span xid="span10">导入</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="批量删除" xid="button8" icon="icon-android-close">
   <i xid="i11" class="icon-android-close"></i>
   <span xid="span11">批量删除</span></a>
  </div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="employeeData" multiselect="true" showRowNumber="true" width="100%" height="auto">
   <columns xid="columns2"><column name="name" xid="column5"></column>
  <column name="sex" xid="column6"></column>
  <column name="dept" xid="column7"></column>
  <column name="enducation" xid="column8"></column></columns></div><h4 xid="h43" class="center-block"><![CDATA[这里控制工具栏左右都有按钮]]>
  </h4><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="thirdToolBar"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="button9" icon="icon-android-add">
   <i xid="i12" class="icon-android-add"></i>
   <span xid="span12">新增</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="button10" icon="icon-android-close">
   <i xid="i13" class="icon-android-close"></i>
   <span xid="span13">删除</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导出当前页" xid="button11" icon="icon-arrow-graph-up-right">
   <i xid="i14" class="icon-arrow-graph-up-right"></i>
   <span xid="span14">导出当前页</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导出全部" xid="button12" icon="icon-arrow-graph-up-right">
   <i xid="i15" class="icon-arrow-graph-up-right"></i>
   <span xid="span15">导出全部</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="导入" xid="button13" icon="icon-arrow-graph-down-right">
   <i xid="i16" class="icon-arrow-graph-down-right"></i>
   <span xid="span16">导入</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="查询" xid="button14" icon="icon-android-search">
   <i xid="i17" class="icon-android-search"></i>
   <span xid="span17">查询</span></a></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid2" data="employeeData" width="100%" showRowNumber="true" multiselect="true" height="auto">
   <columns xid="columns3"><column name="name" xid="column9"></column>
  <column name="sex" xid="column10"></column>
  <column name="dept" xid="column11"></column>
  <column name="enducation" xid="column12"></column></columns></div></div>