<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:357px;top:564px;"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="bigData" idColumn="name" onCustomRefresh="bigDataCustomRefresh"><column label="姓名" name="name" type="String" xid="xid1"></column>
  <column label="性别" name="sex" type="String" xid="xid2"></column>
  <column label="部门" name="dept" type="String" xid="xid3"></column>
  <column label="学历" name="enducation" type="String" xid="xid4"></column></div></div> 
<h4 xid="h41"><![CDATA[大数据测试]]><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="js" onClick="jsClick">
   <i xid="i2"></i>
   <span xid="span2">JS</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i3"></i>
   <span xid="span3">源码</span></a></h4><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="点击加载数据" xid="load" onClick="loadClick">
   <i xid="i1"></i>
   <span xid="span1">点击加载数据</span></a><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class='x-grid-no-bordered ' xid="bigDataGrid" data="bigData" showRowNumber="true" width="100%" height="auto">
   <columns xid="columns1"><column name="name" xid="column1"></column>
  <column name="sex" xid="column2"></column>
  <column name="dept" xid="column3"></column>
  <column name="enducation" xid="column4"></column></columns></div>
  
  </div>