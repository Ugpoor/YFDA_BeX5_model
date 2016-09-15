<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:362px;top:589px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="employeeData" idColumn="id" onCustomRefresh="employeeDataCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="姓名" name="name" type="String" xid="xid2"></column>
  <column label="性别" name="sex" type="String" xid="xid3"></column>
  <column label="学历" name="enducation" type="String" xid="xid4"></column>
  <column label="部门" name="dept" type="String" xid="xid5"></column></div></div> 
<h4 xid="h41"><![CDATA[表头过滤]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="employeeGrid" data="employeeData" multiselect="true" showRowNumber="true" width="100%" useFilterBar="true">
   <columns xid="columns1"><column name="id" xid="column1"></column>
  <column name="name" xid="column2"></column>
  <column name="sex" xid="column3"></column>
  <column name="enducation" xid="column4"></column>
  <column name="dept" xid="column5"></column></columns></div>
  </div>